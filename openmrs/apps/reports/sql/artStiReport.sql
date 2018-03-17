select
  piPrepOIIdentifier.identifier as "OI No.",
  CONCAT(
    pnNameSurnameofPatient.given_name,
    " ",
    COALESCE(
      pnNameSurnameofPatient.middle_name,
      ''
    )
  ) as "Name",
  pnNameSurnameofPatient.family_name as "Surname",
  case when perSexAge.gender = 'M' then 'Male' when perSexAge.gender = 'F' then 'Female' when perSexAge.gender = 'O' then 'Other' end as "Sex",
  TIMESTAMPDIFF(
    YEAR,
    perSexAge.birthdate,
    CURDATE()
  ) as Age,
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeTypeonRegistration.name = 'Population' then cv.concept_full_name else null end
    )
  ) as "Category",
  /*Wks on ART : If ART Stop date is present then ART stop date Else report end date for calculation*/
  ROUND(DATEDIFF(
  case when (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = pat.patient_id) is null then date('#endDate#')
  else
  (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = pat.patient_id)
  END, obsActiveArtProgram.value_datetime) / 7, 0) as "Wks on ART",
  piUIC.identifier as "UIC",
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Mother\'s name' Then personAttributesonRegistration.value else null end
    )
  ) as "Mother's name",
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'District of Birth' then cv.concept_full_name else null end
    )
  ) as "District of Birth",
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Telephone' then personAttributesonRegistration.value else null end
    )
  ) as "Telephone no",
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end
    )
  ) as "Referred from",
  patientWithSTIDiag.Diagnosis,
  date(patientWithSTIDiag.obs_datetime) as "Diagnosis Date"
from
  patient pat

  join obs obsActiveArtProgram ON pat.patient_id = obsActiveArtProgram.person_id
  join concept_name cnDateofARTProgram on obsActiveArtProgram.concept_id = cnDateofARTProgram.concept_id
  join (/*Query to return patients with STI in the reporting period*/
        Select person_id,
        Case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end as 'Diagnosis',
        o.obs_datetime
        from obs o
        inner join concept_view cv
        on cv.concept_id = o.value_coded
        where
        obs_datetime between date('#startDate#') and Date('#endDate#')
        and o.voided = 0
        and cv.retired = 0
        And o.concept_id = 15
        and value_coded in ( /* Patients for whom STI Diagnosis recorded between the reporting date range */
            select
              concept_name.concept_id
            from
              concept_name
              inner join concept on concept.concept_id=concept_name.concept_id
            where
            concept.class_id=4
            and
              concept_name.name IN (
                "Balanitis",
                "Candidiasis, vaginal",
                "Chancroid",
                "Chancroid contact",
                "Chlamydia",
                "Epididymo-orchotis",
                "Genital ulcer disease",
                "Genital warts",
                "Gonorrhea",
                "Gonorrhea Contact",
                "Granuloma inguinale",
                "Pelvic Inflammatory disease",
                "Syphilis STI",
                "Syphilis contact",
                "Trichomoniasis",
                "Trichomoniasis contact",
                "Urethral Discharge Syndrome",
                "Vaginal discharge syndrome",
                "Vaginosis, bacterial"
              )
              and concept_name_type = 'FULLY_SPECIFIED'
          )
) AS patientWithSTIDiag
on patientWithSTIDiag.person_id = pat.patient_id

  LEFT join patient_identifier piPrepOIIdentifier on pat.patient_id = piPrepOIIdentifier.patient_id
  and piPrepOIIdentifier.voided = 0
  and piPrepOIIdentifier.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'PREP/OI Identifier'
      and retired = 0
      and uniqueness_behavior = 'UNIQUE'
  )
  LEFT JOIN person_name pnNameSurnameofPatient on pat.patient_id = pnNameSurnameofPatient.person_id
  lEFT JOIN person perSexAge on pat.patient_id = perSexAge.person_id
  lEFT JOIN patient_identifier piUIC on pat.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'UIC'
      and retired = 0
  )
  LEFT JOIN person_attribute personAttributesonRegistration on pat.patient_id = personAttributesonRegistration.person_id
  LEFT JOIN person_attribute_type personAttributeTypeonRegistration on personAttributesonRegistration.person_attribute_type_id = personAttributeTypeonRegistration.person_attribute_type_id
  left jOIN concept_view cv on personAttributesonRegistration.value = cv.concept_id
  AND cv.retired = 0
where

   cnDateofARTProgram.name = 'PR, Start date of ART program'
  and cnDateofARTProgram.concept_name_type = 'FULLY_SPECIFIED'
  and cnDateofARTProgram.voided = 0
  and obsActiveArtProgram.voided = 0
  and obsActiveArtProgram.person_id not in
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where obs.value_datetime <= Date('#endDate#'))
group by
  pat.patient_id,patientWithSTIDiag.Diagnosis,patientWithSTIDiag.obs_datetime
order by patientWithSTIDiag.obs_datetime;

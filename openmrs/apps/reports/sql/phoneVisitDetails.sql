select patIdentifier.identifier as "Patient identifier",
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
  ) as "Telephone No.",
date(obsPhoneVisit.obs_datetime) as "Date of visit"
from patient pat
join obs obsPhoneVisit on pat.patient_id = obsPhoneVisit.person_id
join concept_name cnTypeOfVisit on obsPhoneVisit.concept_id = cnTypeOfVisit.concept_id
join concept_name cnPhoneVisit on obsPhoneVisit.value_coded = cnPhoneVisit.concept_id
LEFT join patient_identifier patIdentifier on pat.patient_id = patIdentifier.patient_id
  and patIdentifier.voided = 0
  and patIdentifier.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'Patient Identifier'
      and retired = 0
  )
LEFT JOIN person_name pnNameSurnameofPatient on pat.patient_id = pnNameSurnameofPatient.person_id
LEFT JOIN person_attribute personAttributesonRegistration on pat.patient_id = personAttributesonRegistration.person_id
LEFT JOIN person_attribute_type personAttributeTypeonRegistration on personAttributesonRegistration.person_attribute_type_id = personAttributeTypeonRegistration.person_attribute_type_id
LEFT JOIN person perSexAge on pat.patient_id = perSexAge.person_id
LEFT jOIN concept_view cv on personAttributesonRegistration.value = cv.concept_id AND cv.retired = 0
LEFT JOIN patient_identifier piUIC on pat.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'UIC'
      and retired = 0
  )
where cnTypeOfVisit.name = 'AP, Type of Visit' and cnTypeOfVisit.concept_name_type = "FULLY_SPECIFIED"
and obsPhoneVisit.value_coded = (select concept_id from concept_name where name = 'Phone Call' and concept_name_type = "FULLY_SPECIFIED") AND obsPhoneVisit.voided = 0
and date(obsPhoneVisit.obs_datetime) between date('#startDate#') and date('#endDate#')
group by pat.patient_id,obsPhoneVisit.obs_datetime;
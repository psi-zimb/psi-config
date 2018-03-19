select
  piOINo.identifier as "OI No.",
  CONCAT(
    personName.given_name,
    " ",
    COALESCE(personName.middle_name, '')
  ) as "Name",
  personName.family_name as "Surname",
  case when person.gender = 'M' then 'Male' when person.gender = 'F' then 'Female' when person.gender = 'O' then 'Other' end as "Sex",
  TIMESTAMPDIFF(
    YEAR,
    person.birthdate,
    CURDATE()
  ) as "Age",
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeType.name = 'Population' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "Category",
  ROUND(DATEDIFF(
  case when (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) is null then date('#endDate#') 
  else
  (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id)
  END, obsForArtProg.value_datetime) / 7, 0) as "Wks on ART",
  piUIC.identifier as "UIC",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Mother\'s name' Then personAttribute.value else null end
    )
  ) as "Mother's name",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'District of Birth' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "District of Birth",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Telephone' then personAttribute.value else null end
    )
  ) as "Telephone no",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Referral source' then case when cvForRefferedFrom.concept_short_name is null then cvForRefferedFrom.concept_full_name else cvForRefferedFrom.concept_short_name end else null end
    )
  ) as "Referred from",
  group_concat(distinct drug.name) as "Regime",
  (Select date(previousVisit.date_started) from visit previousVisit where previousVisit.patient_id = patient.patient_id  and date(previousVisit.date_started) < date(visit.date_started) order  by date(previousVisit.date_started) desc limit 1) as "Date last seen",
  GROUP_CONCAT(DISTINCT date(obsForActivityStatus.obs_datetime)) as "Date lost to follow up",
  users.username as "Clinician"
from
  patient
  INNER JOIN obs obsForArtProg on patient.patient_id = obsForArtProg.person_id
  INNER JOIN concept_name nameToGetArtProg on obsForArtProg.concept_id = nameToGetArtProg.concept_id
  and nameToGetArtProg.name = "PR, Start date of ART program"
  and nameToGetArtProg.concept_name_type = 'FULLY_SPECIFIED'
  AND obsForArtProg.voided = 0
  and obsForArtProg.person_id not in
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where obs.value_datetime <= Date('#endDate#'))
  /*Not to include patients which having stop date*/
  INNER JOIN obs obsForActivityStatus on patient.patient_id = obsForActivityStatus.person_id
  and obsForActivityStatus.voided = 0
  INNER JOIN encounter encounterForActivityStatus on obsForActivityStatus.encounter_id = encounterForActivityStatus.encounter_id
  and obsForActivityStatus.concept_id in (
    select
      distinct concept_id
    from
      concept_view
    where
      concept_full_name = 'AS, Activity status'
  )
  and obsForActivityStatus.value_coded in (
    select
      distinct concept_id
    from
      concept_view
    where
      concept_full_name = 'Lost to follow up'
  ) and obsForActivityStatus.voided =0
  and date(
    obsForActivityStatus.obs_datetime
  ) between date('#startDate#')
  and date('#endDate#')
  inner join visit visit on visit.visit_id = encounterForActivityStatus.visit_id

  LEFT JOIN orders ordersForRegime on patient.patient_id = ordersForRegime.patient_id
  and ordersForRegime.order_type_id = 2
  LEFT JOIN drug_order drugOrder on ordersForRegime.order_id = drugOrder.order_id
  LEFT JOIN drug on drug.drug_id = drugOrder.drug_inventory_id
  and drug.name in (
    "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
    "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 400mg",
    "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg + Nevirapine (NVP) 200mg",
    "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg + Nevirapine (NVP) 50mg",
    "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg",
    "Tenofovir (TDF) 300mg + Emtricitabine 200mg",
    "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg",
    "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg",
    "Abacavir 600mg / Lamivudine 300mg",
    "Abacavir 60mg / Lamivudine 30mg",
    "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml",
    "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg",
    "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml",
    "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg",
    "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg",
    "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml",
    "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg",
    "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml",
    "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg",
    "Didanosine (ddl) 200mg", "Didanosine (ddl) 250mg",
    "Didanosine (ddl) 25mg", "Didanosine (ddl) 400mg" "Emitricitabine 200mg",
    "Tenofovir 300mg", "Indinavir 400mg",
    "Saquinavir 200mg"
  )
  /*For getting only formulation drugs*/
  LEFT join patient_identifier piOINo on patient.patient_id = piOINo.patient_id
  and piOINo.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'PREP/OI Identifier'
      and retired = 0
      and uniqueness_behavior = 'UNIQUE'
  ) and piOINo.voided = 0
  LEFT JOIN patient_identifier piUIC on patient.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'UIC'
      and retired = 0
  )
  LEFT JOIN person on patient.patient_id = person.person_id
  LEFT JOIN person_name personName on patient.patient_id = personName.person_id
  LEFT JOIN person_attribute personAttribute on patient.patient_id = personAttribute.person_id
  LEFT JOIN person_attribute_type personAttributeType on personAttribute.person_attribute_type_id = personAttributeType.person_attribute_type_id
  LEFT jOIN concept_view cvForRefferedFrom on personAttribute.value = cvForRefferedFrom.concept_id
  inner join users on users.user_id = obsForActivityStatus.creator
group by
  patient.patient_id,
  DATE(
    obsForActivityStatus.obs_datetime
  );

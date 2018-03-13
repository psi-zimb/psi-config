select
   piOINo.identifier as "OI No.",
   CONCAT(personName.given_name, " ", COALESCE(personName.middle_name, '')) as "Name",
   personName.family_name as Surname,
   person.gender as Sex,
   TIMESTAMPDIFF(YEAR, person.birthdate, CURDATE()) as Age,
   GROUP_CONCAT(DISTINCT(
      case when personAttributeType.name = 'Population'
      then conceptNamePersonAttribute.name
      else null end)) as "Category",
   GROUP_CONCAT(distinct ROUND(DATEDIFF(CURDATE(), obsForArtProg.value_datetime) / 7, 0)) as "Wks on ART",
   piUIC.identifier as "UIC",
   GROUP_CONCAT(distinct(
      case when personAttributeType.name = 'Mother\'s name'
      Then personAttribute.value
      else null end)) as "Mother's name",
   GROUP_CONCAT(distinct(
      case when personAttributeType.name = 'District of Birth'
      then conceptNamePersonAttribute.name
      else null end)) as "District of Birth",
   GROUP_CONCAT(distinct(
      case when personAttributeType.name = 'Telephone'
      then personAttribute.value
      else null end)) as "Telephone no",
   GROUP_CONCAT(distinct(
      case when personAttributeType.name = 'Referral source'
      then conceptNamePersonAttribute.name
      else null end)) as "Referred from",

   group_concat(distinct drug.name) as "Regime",
   GROUP_CONCAT(DISTINCT date(obsForActivityStatus.obs_datetime)) as "Date Of Transfer In"

from
   patient
   INNER JOIN obs obsForArtProg on patient.patient_id = obsForArtProg.person_id
   INNER JOIN concept_name nameToGetArtProg on obsForArtProg.concept_id = nameToGetArtProg.concept_id AND nameToGetArtProg.name = "PR, Start date of ART program"
      AND nameToGetArtProg.concept_name_type = 'FULLY_SPECIFIED'
      AND obsForArtProg.voided = 0
      AND obsForArtProg.person_id NOT in
         (select obsForArtProg.person_id from obs obsForArtProg JOIN concept_name nameToGetArtProg on obsForArtProg.concept_id = nameToGetArtProg.concept_id AND nameToGetArtProg.name = "PR, ART Program Stop Date"
      AND nameToGetArtProg.concept_name_type = 'FULLY_SPECIFIED'
      AND obsForArtProg.voided = 0) /*Not to include patients which having stop date*/
   INNER JOIN obs obsForActivityStatus on patient.patient_id = obsForActivityStatus.person_id AND obsForActivityStatus.voided = 0
   INNER JOIN encounter encounterForActivityStatus on obsForActivityStatus.encounter_id = encounterForActivityStatus.encounter_id AND obsForActivityStatus.concept_id in
         (select distinct concept_id from concept_view where concept_full_name = 'AS, Activity status') AND obsForActivityStatus.value_coded in
         (select distinct concept_id from concept_view where concept_full_name = 'Transfer in') AND date(obsForActivityStatus.obs_datetime) between date('#startDate#') AND date('#endDate#')

   LEFT JOIN orders ordersForRegime on patient.patient_id = ordersForRegime.patient_id AND ordersForRegime.order_type_id = 2
   LEFT JOIN drug_order drugOrder on ordersForRegime.order_id = drugOrder.order_id
   LEFT JOIN drug on drug.drug_id = drugOrder.drug_inventory_id AND drug.name in ("Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg", "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 400mg", "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg + Nevirapine (NVP) 200mg", "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg + Nevirapine (NVP) 50mg", "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg", "Tenofovir (TDF) 300mg + Emtricitabine 200mg", "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg", "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg", "Abacavir 600mg / Lamivudine 300mg", "Abacavir 60mg / Lamivudine 30mg", "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml", "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg", "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml", "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg", "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg", "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml", "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg", "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml", "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg", "Didanosine (ddl) 200mg", "Tenofovir 300mg", "Indinavir 400mg", "Saquinavir 200mg") /*For getting only formulation drugs*/

   LEFT join patient_identifier piOINo on patient.patient_id = piOINo.patient_id AND piOINo.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier'
      AND retired = 0 AND uniqueness_behavior = 'UNIQUE')
   LEFT JOIN patient_identifier piUIC on patient.patient_id = piUIC.patient_id AND piUIC.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'UIC'
      AND retired = 0)
   LEFT JOIN person on patient.patient_id = person.person_id
   LEFT JOIN person_name personName on patient.patient_id = personName.person_id

   LEFT JOIN person_attribute personAttribute on patient.patient_id = personAttribute.person_id
   LEFT JOIN person_attribute_type personAttributeType on personAttribute.person_attribute_type_id = personAttributeType.person_attribute_type_id
   LEFT JOIN concept_name conceptNamePersonAttribute on personAttribute.value = conceptNamePersonAttribute.concept_id AND conceptNamePersonAttribute.voided = 0 AND conceptNamePersonAttribute.concept_name_type = 'FULLY_SPECIFIED'

group by
   patient.patient_id,
   DATE(obsForActivityStatus.obs_datetime);
   

select piUIC.identifier as "UIC",
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
obsPotentialSerumCandidates.value_numeric as "CD4 Count", 
date(ordPotentialSerumCandidates.date_activated) as "CD4 Count Order Date"
from obs obsPotentialSerumCandidates
join orders ordPotentialSerumCandidates on obsPotentialSerumCandidates.order_id = ordPotentialSerumCandidates.order_id
join patient patPotentialSerumCandidates on ordPotentialSerumCandidates.patient_id = patPotentialSerumCandidates.patient_id
LEFT JOIN person_name pnNameSurnameofPatient on patPotentialSerumCandidates.patient_id = pnNameSurnameofPatient.person_id
lEFT JOIN person perSexAge on patPotentialSerumCandidates.patient_id = perSexAge.person_id
LEFT JOIN person_attribute personAttributesonRegistration on patPotentialSerumCandidates.patient_id = personAttributesonRegistration.person_id 
LEFT JOIN person_attribute_type personAttributeTypeonRegistration on personAttributesonRegistration.person_attribute_type_id = personAttributeTypeonRegistration.person_attribute_type_id
left jOIN concept_view cv on personAttributesonRegistration.value = cv.concept_id AND cv.retired = 0
lEFT JOIN patient_identifier piUIC on patPotentialSerumCandidates.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select 
      patient_identifier_type_id 
    from 
      patient_identifier_type 
    where 
      name = 'UIC' 
      and retired = 0
  ) 
where obsPotentialSerumCandidates.concept_id IN (select concept_id from concept_name 
where name IN (
"CD4Count",
"CD4 Count (1st Visit)",
"CD4 Count (Yearly)",
"CD4 Count (Baseline)",
"CD4 Count (48 Weeks)",
"CD4 Count (16 Weeks)",
"CD4 Count (24 Weeks)") and concept_name_type = 'FULLY_SPECIFIED')
AND obsPotentialSerumCandidates.value_numeric < 100
And COALESCE(obsPotentialSerumCandidates.value_coded,obsPotentialSerumCandidates.value_text,obsPotentialSerumCandidates.value_numeric,obsPotentialSerumCandidates.value_datetime) is not null
and ordPotentialSerumCandidates.patient_id not IN (select patient_id from orders where concept_id IN (select concept_id from concept_name WHERE NAME = 'Serum Crag Test' and concept_name_type = 'FULLY_SPECIFIED') 
and orders.date_stopped is NULL and orders.order_action In ('NEW','REVISE') 
AND date(orders.date_activated) between date('#startDate#') and date('#endDate#'))
and obsPotentialSerumCandidates.voided = 0
and obsPotentialSerumCandidates.concept_id in (Select concept_id from concept where class_id = 26)
and date(obsPotentialSerumCandidates.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obsPotentialSerumCandidates.obs_id
order by ordPotentialSerumCandidates.date_activated desc;
select
Sum(CASE
WHEN obsForRegistrationFees.value_numeric > 0 then 1         /*Count of patient who paid for service*/
end) as "Count of patient who paid for service",
Sum(CASE 
WHEN obsForRegistrationFees.value_numeric = 0 then 1         /*Count of patient who availed free service*/
end) As "Count of patient who availed free service"
from visit v
join encounter enc on v.visit_id = enc.visit_id
join obs obsForRegistrationFees on enc.encounter_id = obsForRegistrationFees.encounter_id
where obsForRegistrationFees.concept_id = (select concept_id from concept_name where name = 'REGISTRATION FEES' and concept_name_type = 'FULLY_SPECIFIED')
and obsForRegistrationFees.voided = 0 and v.voided = 0
AND DATE(obsForRegistrationFees.obs_datetime) between DATE('#startDate#') and DATE('#endDate#')
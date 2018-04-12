select person_name.given_name as "Provider Name", 
count(1) as "Count" 
from obs obsLabCountPerNurse
join orders ordLabCountPerNurse on ordLabCountPerNurse.order_id = obsLabCountPerNurse.order_id
join provider on ordLabCountPerNurse.orderer = provider.provider_id
join person_name on provider.person_id = person_name.person_id
where ordLabCountPerNurse.order_type_id = 3
and obsLabCountPerNurse.voided = 0
and obsLabCountPerNurse.concept_id in (Select concept_id from concept where class_id = 26)
And COALESCE(obsLabCountPerNurse.value_coded,obsLabCountPerNurse.value_text,obsLabCountPerNurse.value_numeric,obsLabCountPerNurse.value_datetime) is not null
and ordLabCountPerNurse.date_stopped is NULL
and date(obsLabCountPerNurse.obs_datetime) between date('#startDate#') and date('#endDate#')
group by ordLabCountPerNurse.orderer
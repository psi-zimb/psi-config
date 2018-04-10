select cnLabTestName.name as "Lab Test",
avg(
	(TIMESTAMPDIFF(second,orderPlaced.date_activated,obsResultReceived.obs_datetime))/60)
	 as "Avg processing time (in mins)"
from orders orderPlaced
join obs obsResultReceived on orderPlaced.order_id = obsResultReceived.order_id
join concept_name cnLabTestName on obsResultReceived.concept_id = cnLabTestName.concept_id
and orderPlaced.order_type_id = 3 
AND obsResultReceived.concept_id not in 
(
	select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL") 
	and concept_name_type = 'FULLY_SPECIFIED'
)
and cnLabTestName.concept_name_type ="FULLY_SPECIFIED"
and cnLabTestName.voided = 0
and orderPlaced.voided = 0
and obsResultReceived.voided = 0
where date(orderPlaced.date_activated) between date('#startDate#') and date('#endDate#')
GROUP BY obsResultReceived.concept_id;
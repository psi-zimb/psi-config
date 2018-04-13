select AvgCnLabTestName.name as "Lab Test",
TRUNCATE(avg(
	(TIMESTAMPDIFF(second,AvgOrderPlaced.date_activated,AvgObsResultReceived.date_created))/60),2)
	 as "Avg processing time (in mins)"
from orders AvgOrderPlaced
join obs AvgObsResultReceived on AvgOrderPlaced.order_id = AvgObsResultReceived.order_id
join concept_name AvgCnLabTestName on AvgObsResultReceived.concept_id = AvgCnLabTestName.concept_id
and AvgOrderPlaced.order_type_id = 3 
AND AvgObsResultReceived.concept_id not in 
(
	select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL") 
	and concept_name_type = 'FULLY_SPECIFIED'
)
and AvgCnLabTestName.concept_name_type ="FULLY_SPECIFIED"
and AvgCnLabTestName.voided = 0
and AvgOrderPlaced.voided = 0
and AvgOrderPlaced.date_stopped is NULL
and AvgObsResultReceived.voided = 0
where date(AvgOrderPlaced.date_activated) between date('#startDate#') and date('#endDate#')
GROUP BY AvgObsResultReceived.concept_id
order by AvgCnLabTestName.name;
SELECT "Total Tests for Period with Priority" as "Report Name", 
COUNT(1) as "Count" 
FROM (
select PriorityObsResultReceived.concept_id from orders PriorityOrderPlaced
join obs PriorityObsResultReceived on PriorityOrderPlaced.order_id = PriorityObsResultReceived.order_id
join concept_name PriorityCnLabTestName on PriorityObsResultReceived.concept_id = PriorityCnLabTestName.concept_id
and PriorityOrderPlaced.order_type_id = 3 
AND PriorityObsResultReceived.concept_id not in 
(
	select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL") 
	and concept_name_type = 'FULLY_SPECIFIED'
)
and PriorityCnLabTestName.concept_name_type ="FULLY_SPECIFIED"
and PriorityCnLabTestName.voided = 0
and PriorityOrderPlaced.voided = 0
and PriorityObsResultReceived.voided = 0
and PriorityOrderPlaced.date_stopped is NULL
and PriorityOrderPlaced.urgency = 'STAT'
where date(PriorityObsResultReceived.obs_datetime) between date('#startDate#') and date('#endDate#')
GROUP BY PriorityObsResultReceived.order_id) as Priority_table_name;
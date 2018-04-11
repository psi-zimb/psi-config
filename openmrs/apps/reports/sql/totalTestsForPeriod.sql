select "Total Tests for Period" as "Report Name", count(1) as "Count" from
(
select obs.order_id from
obs
INNER JOIN orders on obs.order_id = orders.order_id and orders.order_type_id = 3 and obs.order_id is not null and obs.concept_id not in
    (select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL"))
INNER JOIN concept_name on obs.concept_id = concept_name.concept_id
where date(obs.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obs.order_id) as output;

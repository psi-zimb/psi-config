select "Positive" as "Rapid HIV Test", count(1) as "Count" from
(
select obs.value_coded from orders
JOIN obs on obs.order_id = orders.order_id AND orders.order_type_id = 3 AND orders.order_action != 'DISCONTINUE'
AND orders.date_stopped IS NULL AND  obs.order_id is NOT NULL
AND obs.concept_id not in
    (select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL"))
where obs.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' AND retired=0)
  AND obs.value_coded = (select concept_id from concept_view where concept_full_name = 'Positive' AND retired=0)
   AND date(obs.obs_datetime) between date('#startDate#') AND date('#endDate#')) as positiveOutput

union

select "Negetive" as "Report Name", count(1) as "Count" from
(
select obs.value_coded from orders
JOIN obs on obs.order_id = orders.order_id AND orders.order_type_id = 3 AND orders.order_action != 'DISCONTINUE'
AND orders.date_stopped IS NULL AND  obs.order_id is NOT NULL
AND obs.concept_id not in
    (select concept_id from concept_name where name IN ("LAB_NOTES","LAB_MINNORMAL","LAB_MAXNORMAL","LAB_ABNORMAL"))
where obs.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' AND retired=0)
  AND obs.value_coded = (select concept_id from concept_view where concept_full_name = 'Negative' AND retired=0)
  AND date(obs.obs_datetime) between date('#startDate#') AND date('#endDate#')) as negativeOutput;

select concept_name.name as "Rapid HIV Results",
count(1)  as "Count" from obs
join concept_name on obs.value_coded = concept_name.concept_id
where obs.concept_id IN (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
and obs.value_coded In (select concept_id from concept_view where concept_full_name IN ('Positive','Negative') and retired=0)
and obs.voided = 0
AND date(obs.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obs.value_coded
order by obs.value_coded desc;

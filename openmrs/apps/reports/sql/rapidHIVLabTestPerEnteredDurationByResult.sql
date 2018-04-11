select cnRapidTestCount.name as "Rapid HIV Results",
count(1)  as "Count" from obs obsRapidTestCount
JOIN concept_name cnRapidTestCount on obsRapidTestCount.value_coded = cnRapidTestCount.concept_id
where obsRapidTestCount.concept_id IN (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
and obsRapidTestCount.value_coded In (select concept_id from concept_view where concept_full_name IN ('Positive','Negative') and retired=0)
and obsRapidTestCount.voided = 0
AND date(obsRapidTestCount.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obsRapidTestCount.value_coded
order by obsRapidTestCount.value_coded desc;

select cnHivRapidTestbyGenderValue.name as "Rapid HIV Results",
case
when pnHivRapidTestbyGenderValue.gender = 'M' then 'Male'
when pnHivRapidTestbyGenderValue.gender = 'F' then 'Female'
when pnHivRapidTestbyGenderValue.gender = 'O' then 'Other' end as "Gender",
count(1)  as "Count" from obs obsHivRapidTestbyGenderValue
join concept_name cnHivRapidTestbyGenderValue on obsHivRapidTestbyGenderValue.value_coded = cnHivRapidTestbyGenderValue.concept_id
join person pnHivRapidTestbyGenderValue on obsHivRapidTestbyGenderValue.person_id = pnHivRapidTestbyGenderValue.person_id
where obsHivRapidTestbyGenderValue.concept_id IN (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
and obsHivRapidTestbyGenderValue.value_coded In (select concept_id from concept_view where concept_full_name IN ('Positive','Negative') and retired=0)
and obsHivRapidTestbyGenderValue.voided = 0
and date(obsHivRapidTestbyGenderValue.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obsHivRapidTestbyGenderValue.value_coded, pnHivRapidTestbyGenderValue.gender
order by obsHivRapidTestbyGenderValue.value_coded  , pnHivRapidTestbyGenderValue.gender  ;

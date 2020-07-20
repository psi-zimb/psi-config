update global_property set property_value = ("
select distinct encounter_id,
                sort_weight,
                concept_short_name as name,
                name as value,
                obs_datetime as datetime
from (select distinct encounter.encounter_id,
                      value_coded,
                      concept_short_name,
                      sort_weight,
                      obs_datetime
      from obs observations
               inner join concept_view concept
               inner join concept_set conceptSet
               inner join encounter encounter
                          on encounter.encounter_id = observations.encounter_id and
                             observations.concept_id = concept.concept_id and
                             conceptSet.concept_id = concept.concept_id

      where   person_id= (select person_id from person where person.uuid=${patientUuid})
        and   encounter.voided=0 and encounter_type=1 and
              observations.voided=0 and value_coded is not null and
              concept.concept_full_name like '%IPV Form%' and concept.retired=0)
         as IPV inner join
     concept_name conceptName
     on conceptName.concept_id=IPV.value_coded
where locale_preferred=1 and locale='en' and voided=0
order by encounter_id desc ,sort_weight asc
") where property = 'bahmni.sqlGet.getIPV20LatestVisits';
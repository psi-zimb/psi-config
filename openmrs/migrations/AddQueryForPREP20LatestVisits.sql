update global_property set property_value = ("
select RESULT.encounter_id,
       RESULT.concept_id,
       GROUP_CONCAT(REPLACE(value,'PrEP ST Form, ','') ORDER BY value SEPARATOR ', ' ) AS
       value,
       name,
       sort_weight,
       datetime,
       comments,
       username,
       visit_id
       from(
select encounter.encounter_id,
       concept.concept_id,
          (CASE
              WHEN value_coded is not null
                THEN (select name from concept_name cname where  cname.concept_id=value_coded and locale_preferred=1 and locale='en' and voided=0 limit 1)
              WHEN observations.value_datetime is not null
                THEN observations.value_datetime
              WHEN observations.value_numeric is not null
                THEN observations.value_numeric
              ELSE observations.value_text
              END)
              as 'value',
             concept_short_name as name,
             sort_weight,
             obs_datetime as datetime,
             observations.comments,
             username,
             visit_id
      from obs observations
               inner join concept_view concept
               inner join concept_set conceptSet
               inner join encounter encounter
               inner join users user
                          on encounter.encounter_id = observations.encounter_id and
                             observations.concept_id = concept.concept_id and
                             conceptSet.concept_id = concept.concept_id and
                             observations.creator = user.user_id

      where   observations.person_id= (select person_id from person where person.uuid=${patientUuid})
        and   encounter.voided=0 and encounter_type=1 and
              sort_weight is not null and
              observations.voided=0 and
              concept.concept_full_name like '%PrEP ST Form%' and concept.retired=0
order by encounter_id desc ,concept_set desc , sort_weight asc)AS RESULT
GROUP BY concept_id,sort_weight,encounter_id order by sort_weight asc
") where property= 'bahmni.sqlGet.getLatestPREP20visits';
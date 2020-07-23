update global_property set property_value = ("
select distinct encounter_id,
                concept_short_name as name,
                name as value,
                obs_datetime,
                comments,
                username
from (select distinct encounter.encounter_id,
                      value_coded,
                      concept_short_name,
                      sort_weight,
                      obs_datetime,
                      patient_id,
                      visit_id,
                      comments,
                      username
      from obs observations
               inner join concept_view concept
               inner join concept_set conceptSet
               inner join encounter encounter
               inner join users user
                          on encounter.encounter_id = observations.encounter_id and
                             observations.concept_id = concept.concept_id and
                             conceptSet.concept_id = concept.concept_id and
                             observations.creator = user.user_id
      where observations.person_id=(select person_id from person where person.uuid=${patientUuid})
        and   encounter.voided=0 and encounter_type=1 and
              observations.voided=0 and value_coded is not null and
              concept.concept_full_name like '%NCD Form%' and concept.retired=0 order by obs_datetime desc)
         as test inner join
     concept_name conceptName
     on conceptName.concept_id=value_coded
where locale_preferred=1 and locale='en' and voided=0
order by sort_weight

") where property= 'bahmni.sqlGet.getLatestNCDFormInformation';
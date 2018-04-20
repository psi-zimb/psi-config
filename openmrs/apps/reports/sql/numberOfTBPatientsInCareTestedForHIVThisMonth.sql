select
    "Number of TB patients in care tested for HIV this month" as '-',
    count(1) as "Count"
from obs obsRapidTestCount
Where
        obsRapidTestCount.concept_id IN
        (select concept_id from concept_view where concept_full_name = 'TB History, Are you currently being treated for TB?' and retired=0)
        and obsRapidTestCount.value_coded In (select concept_id from concept_view where concept_full_name IN ('Yes') and retired=0)
        and obsRapidTestCount.voided = 0
        AND obsRapidTestCount.person_id in
        (
            Select patient_id from orders where orders.date_activated > obsRapidTestCount.obs_datetime
                and orders.patient_id = obsRapidTestCount.person_id
                and orders.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
                And orders.date_stopped is NULL
                AND orders.order_action in ('NEW','REVISE')
         )
        and obsRapidTestCount.person_id NOT IN
        (
            Select patient_id from orders where orders.date_activated < obsRapidTestCount.obs_datetime
                and orders.patient_id = obsRapidTestCount.person_id
                and orders.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
                And orders.date_stopped is NULL
                AND orders.order_action in ('NEW','REVISE')

        )
        and DATE(obsRapidTestCount.obs_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#');

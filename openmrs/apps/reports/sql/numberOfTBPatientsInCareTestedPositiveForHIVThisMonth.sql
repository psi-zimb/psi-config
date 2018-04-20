select
    "Number of TB patients in care tested positive for HIV this month" as '-',
    count(1) as "Count"
from obs obsRapidTestPositive
Where
        obsRapidTestPositive.concept_id IN
        (select concept_id from concept_view where concept_full_name = 'TB History, Are you currently being treated for TB?' and retired=0)
        and obsRapidTestPositive.value_coded In (select concept_id from concept_view where concept_full_name IN ('Yes') and retired=0)
        and obsRapidTestPositive.voided = 0
        AND obsRapidTestPositive.person_id in
        (
            select patient_id from orders
                    join obs on obs.order_id = orders.order_id
                    where orders.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
                    and obs.value_coded = (select concept_id from concept_view where concept_full_name IN ('Positive') and retired=0)
                    and obs.voided = 0
                    And orders.date_stopped is NULL
                    AND orders.order_action in ('NEW','REVISE')
                    and orders.date_activated > obsRapidTestPositive.obs_datetime
         )
        and obsRapidTestPositive.person_id NOT IN
        (
            select patient_id from orders
                    join obs on obs.order_id = orders.order_id
                    where orders.concept_id = (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
                    and obs.value_coded = (select concept_id from concept_view where concept_full_name IN ('Positive') and retired=0)
                    and obs.voided = 0
                    And orders.date_stopped is NULL
                    AND orders.order_action in ('NEW','REVISE')
                    and orders.date_activated < obsRapidTestPositive.obs_datetime

        )
        and DATE(obsRapidTestPositive.obs_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#');

select
   "Number of TB patients in care tested for HIV this month" as '-',
   count(DISTINCT ordersRapidHIV.order_id)
from
   obs obsForTBForm
   join
      orders ordersRapidHIV
      on obsForTBForm.person_id = ordersRapidHIV.patient_id
      and obsForTBForm.concept_id =
      (
         select
            concept_id
         from
            concept_view
         where
            concept_full_name = 'TB History, Are you currently being treated for TB?'
            and retired = 0
      )
      and obsForTBForm.value_coded =
      (select concept_id from concept_view where concept_full_name = 'Yes'  and retired = 0)
      and obsForTBForm.voided = 0
      and ordersRapidHIV.concept_id =
      (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test'  and retired = 0)
      And ordersRapidHIV.date_stopped is NULL
      AND ordersRapidHIV.order_action in ('NEW','REVISE')
      AND ordersRapidHIV.date_activated > obsForTBForm.obs_datetime
      Inner join obs obsRapidHIVResults
      on obsRapidHIVResults.order_id = ordersRapidHIV.order_id
      and obsRapidHIVResults.value_coded = (select concept_id from concept_view where concept_full_name IN ('Positive') and retired=0)
      and DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#');

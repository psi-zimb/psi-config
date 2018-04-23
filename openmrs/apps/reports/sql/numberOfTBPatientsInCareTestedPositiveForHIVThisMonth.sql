SELECT
   "Number of TB patients in care tested for HIV this month" as '-',
   count(DISTINCT ordersRapidHIV.order_id) as 'Count'
FROM
   obs obsForTBForm
   JOIN
      orders ordersRapidHIV
      ON obsForTBForm.person_id = ordersRapidHIV.patient_id
      AND obsForTBForm.concept_id =
      (SELECT concept_id FROM concept_view where concept_full_name = 'TB History, Are you currently being treated for TB?' AND retired = 0)
      AND obsForTBForm.value_coded =
      (SELECT concept_id FROM concept_view where concept_full_name = 'Yes'  AND retired = 0)
      AND obsForTBForm.voided = 0
      AND ordersRapidHIV.concept_id =
      (SELECT concept_id FROM concept_view where concept_full_name = 'Rapid HIV Test'  AND retired = 0)
      And ordersRapidHIV.date_stopped is NULL
      AND ordersRapidHIV.order_action in ('NEW','REVISE')
      AND ordersRapidHIV.date_activated > obsForTBForm.obs_datetime
      INNER JOIN obs obsRapidHIVResults
      ON obsRapidHIVResults.order_id = ordersRapidHIV.order_id
      AND obsRapidHIVResults.value_coded = (SELECT concept_id FROM concept_view where concept_full_name IN ('Positive') AND retired=0)
      AND DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#');

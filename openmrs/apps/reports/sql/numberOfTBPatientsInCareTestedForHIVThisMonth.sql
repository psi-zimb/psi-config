SELECT
   "Number of TB patients in care tested for HIV this month" as '-',
   count(DISTINCT ordersRapidHIV.order_id)
FROM
   obs obsForTBForm
   JOIN
      orders ordersRapidHIV
      ON obsForTBForm.person_id = ordersRapidHIV.patient_id
      AND obsForTBForm.concept_id in
      (
         SELECT
            concept_id
         FROM
            concept_view
         WHERE
            concept_full_name = 'TB History, Are you currently being treated for TB?'
            AND retired = 0
      )
      AND obsForTBForm.value_coded In
      (
         SELECT
            concept_id
         FROM
            concept_view
         WHERE
            concept_full_name IN
            (
               'Yes'
            )
            AND retired = 0
      )
      AND obsForTBForm.voided = 0
      AND ordersRapidHIV.concept_id =
      (
         SELECT
            concept_id
         FROM
            concept_view
         WHERE
            concept_full_name = 'Rapid HIV Test'
            AND retired = 0
      )
      AND ordersRapidHIV.date_stopped is NULL
      AND ordersRapidHIV.order_action in
      (
         'NEW',
         'REVISE'
      )
      AND ordersRapidHIV.date_activated > obsForTBForm.obs_datetime
      AND DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#');

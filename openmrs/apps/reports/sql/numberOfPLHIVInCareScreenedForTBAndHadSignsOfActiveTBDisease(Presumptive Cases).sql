SELECT "Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)" as '-',
count(1) FROM
(
SELECT person_id,obsTBQuestion.obs_datetime,concept_id,obs_id,encounter_id

FROM obs obsTBQuestion
WHERE value_coded in (SELECT concept_id FROM concept_view WHERE concept_full_name IN ('Yes') AND retired=0)
   AND DATE(obsTBQuestion.obs_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
   AND obsTBQuestion.voided =0
   AND ( concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Have you had a cough?' AND retired=0)
       OR concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Have you had chest pain?' AND retired=0)
       OR concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Have you had shortness of breath?' AND retired=0)
       OR concept_id in  (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Did you have fever recently?' AND retired=0)
       OR concept_id in  (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Did you have night sweats?' AND retired=0)
       OR concept_id in  (SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB Screening, Do you have weight loss?' AND retired=0)
   )
   AND person_id in
(
   SELECT person_id FROM obs obsART WHERE concept_id  IN
        (SELECT concept_id FROM concept_view WHERE concept_full_name
            IN ('Art initial Visit compulsory Question 1 of 2','Art initial Visit compulsory Question 2 of 2')
            AND retired=0)
   AND voided=0
   AND obsTBQuestion.obs_datetime > obsART.obs_datetime
   AND obsTBQuestion.person_id = obsART.person_id
   AND DATE(obsART.obs_datetime) <= DATE('#endDate#')
)
GROUP BY person_id,DATE(obs_datetime)

) AS MOH229;

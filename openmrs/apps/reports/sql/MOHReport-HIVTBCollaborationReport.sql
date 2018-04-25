/*Number of TB patients in care tested for HIV this month*/
SELECT
   "C1. Number of TB patients in care tested for HIV this month" as '-',
   count(DISTINCT ordersRapidHIV.order_id) as 'Count'
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
      AND DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#')

UNION ALL

/*Number of TB patients in care tested positive for HIV this month*/
SELECT
   "C2. Number of TB patients in care tested positive for HIV this month" as '-',
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
      AND obsRapidHIVResults.voided = 0
      AND DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#')

UNION ALL
/*Number of PLHIV in care screened for TB during their last visit this month*/
select "C3. Number of PLHIV in care screened for TB during their last visit this month" as "-", count(1) as "Count"
from (select o.person_id
            from person per
                join obs o on per.person_id = o.person_id
                join concept_name cn on o.concept_id = cn.concept_id
                where cn.name = 'TB Screening'
                and o.voided = 0 and cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided = 0
                and o.person_id IN (select person_id from obs where concept_id IN (select concept_id from concept_name
                where name IN ('Art initial Visit compulsory Question 1 of 2','Art initial Visit compulsory Question 2 of 2')
                and concept_name_type = 'FULLY_SPECIFIED' and concept_name.voided = 0
                AND voided = 0) and voided = 0
                and date(obs.obs_datetime) < date(o.obs_datetime)
                )
                and date(o.obs_datetime) between date('#startDate#') and date('#endDate#')
                group by o.obs_id) as personPLSHIVScreenedforTB

UNION ALL
/*Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)*/
SELECT "C4. Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)" as '-',
count(1) as 'Count'
 FROM
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

) AS MOH229

UNION ALL
/*Number of PLHIV in care investigated for TB disease this month*/
select
    "C5. Number of PLHIV in care investigated for TB disease this month" as '-' ,
    count(distinct patient_id) as 'Count'
    from
    orders
    where concept_id IN
    (
        select concept_id from concept_name where name IN
        (
            'Sputum Comments (TB)','MTB PCR (TB)','RIF Resistance (TB)'
        )
        and concept_name_type = 'FULLY_SPECIFIED'
        AND voided = 0
    )
    and date(orders.date_activated) between date('#startDate#') and date('#endDate#')
    and voided = 0
    and date_stopped is NULL and order_action != 'DISCONTINUE'

UNION ALL

/*Number of PLHIV in care tested positive TB disease this month*/
select
'C6. Number of PLHIV in care tested positive TB disease this month' as '-' ,
count(distinct person_id) as 'Count'
from obs
where concept_id IN
(	select concept_id from concept_name where name IN
		(
			'MTB PCR (TB)','RIF Resistance (TB)'
		)
)
and obs.value_coded IN
(
			select concept_id from concept_name where name IN
		(
			"MTB Detected, Very Low",
			"MTB Detected, Low",
			"MTB Detected, High",
			"MTB Detected, Very High",
			"RIF Resistance Indeterminate",
			"RIF Resistance Detected"
		)
		and concept_name.voided = 0
)
and obs.voided = 0
and date(obs.obs_datetime) between date('#startDate#') and date('#endDate#')

UNION ALL
/*Number of PLHIV newly enrolled in HIV care with active TB disease*/
select
"C7. Number of PLHIV newly enrolled in HIV care with active TB disease" as "-",
count(distinct obsActiveARTProgram.person_id) as "Count"
from patient pat
        join obs obsActiveARTProgram on pat.patient_id = obsActiveARTProgram.person_id
        join concept_name cnARTProgramStartDate on obsActiveARTProgram.concept_id = cnARTProgramStartDate.concept_id
        join obs obsActiveDiagnosis on pat.patient_id = obsActiveDiagnosis.person_id
        join concept_name cnDiagnosisName on obsActiveDiagnosis.value_coded = cnDiagnosisName.concept_id
        join concept on concept.concept_id=cnDiagnosisName.concept_id
where cnARTProgramStartDate.name = 'PR, Start date of ART program'
        and cnARTProgramStartDate.concept_name_type = 'FULLY_SPECIFIED'
        AND cnARTProgramStartDate.voided = 0
        and obsActiveARTProgram.voided = 0
and obsActiveARTProgram.person_id not in
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
         and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where date(obs.value_datetime) <= Date('#endDate#')
         )
    and concept.class_id=4
    and
cnDiagnosisName.name IN (

            "TB exposure",
            "TB MDR",
            "TB MDR, presumptive",
            "TB, pulmonary (WHO 3)",
            "TB meningitis",
            "TB peritonitis",
            "TB pericarditis",
            "TB lymphadenitis",
            "TB of bones and joints",
            "Gastrointestinal TB",
            "TB of the liver"
              )
and date(obsActiveDiagnosis.obs_datetime) < date(obsActiveARTProgram.value_datetime)
ANd obsActiveDiagnosis.obs_group_id not in
(/*Removing diagnosis group if there are any revisions*/
    Select obs_group_id from obs where concept_id = 51 and  value_coded = 1 and voided=0 and obs_group_id is not null
    AND obs.person_id = obsActiveDiagnosis.person_id
    and date(obs.obs_datetime) <= date('#endDate#')
)
AND obsActiveDiagnosis.obs_group_id not in (/*Removing ruled out diagnosis*/
    Select obs_group_id from obs where concept_id = 49 and  value_coded = 48 and voided=0 and obs_group_id is not null
    AND obs.person_id = obsActiveDiagnosis.person_id
    AND obs.obs_group_id = obsActiveDiagnosis.obs_group_id
    and date(obs.obs_datetime) <= date('#endDate#')
)
and cnDiagnosisName.concept_name_type = 'FULLY_SPECIFIED'
AND cnDiagnosisName.voided = 0
and obsActiveDiagnosis.voided = 0
and date(obsActiveDiagnosis.obs_datetime) <= date('#endDate#')
and date(obsActiveARTProgram.value_datetime) between date('#startDate#') and date('#endDate#')

UNION ALL

/*Number of PLHIV in care newly diagnosed with TB before ART initiation*/
select
"C8. Number of PLHIV in care newly diagnosed with TB before ART initiation" as "-",
count(distinct obsActiveARTProgram.person_id) as "Count"
from patient pat
        join obs obsActiveARTProgram on pat.patient_id = obsActiveARTProgram.person_id
        join concept_name cnARTProgramStartDate on obsActiveARTProgram.concept_id = cnARTProgramStartDate.concept_id
        join obs obsActiveDiagnosis on pat.patient_id = obsActiveDiagnosis.person_id
        join concept_name cnDiagnosisName on obsActiveDiagnosis.value_coded = cnDiagnosisName.concept_id
        join concept on concept.concept_id=cnDiagnosisName.concept_id
where cnARTProgramStartDate.name = 'PR, Start date of ART program'
        and cnARTProgramStartDate.concept_name_type = 'FULLY_SPECIFIED'
        AND cnARTProgramStartDate.voided = 0
        and obsActiveARTProgram.voided = 0
and obsActiveARTProgram.person_id not in
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
         and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where date(obs.value_datetime) <= Date('#endDate#')
         )
    and concept.class_id=4
    and
cnDiagnosisName.name IN (

            "TB exposure",
            "TB MDR",
            "TB MDR, presumptive",
            "TB, pulmonary (WHO 3)",
            "TB meningitis",
            "TB peritonitis",
            "TB pericarditis",
            "TB lymphadenitis",
            "TB of bones and joints",
            "Gastrointestinal TB",
            "TB of the liver"
              )
and date(obsActiveDiagnosis.obs_datetime) > date(obsActiveARTProgram.value_datetime)
ANd obsActiveDiagnosis.obs_group_id not in
(/*Removing diagnosis group if there are any revisions*/
    Select obs_group_id from obs where concept_id = 51 and  value_coded = 1 and voided=0 and obs_group_id is not null
    AND obs.person_id = obsActiveDiagnosis.person_id
    and date(obs.obs_datetime) <= date('#endDate#')
)
AND obsActiveDiagnosis.obs_group_id not in (/*Removing ruled out diagnosis*/
    Select obs_group_id from obs where concept_id = 49 and  value_coded = 48 and voided=0 and obs_group_id is not null
    AND obs.person_id = obsActiveDiagnosis.person_id
    AND obs.obs_group_id = obsActiveDiagnosis.obs_group_id
    and date(obs.obs_datetime) <= date('#endDate#')
)
and cnDiagnosisName.concept_name_type = 'FULLY_SPECIFIED'
AND cnDiagnosisName.voided = 0
and obsActiveDiagnosis.voided = 0
and date(obsActiveDiagnosis.obs_datetime) <= date('#endDate#')
and date(obsActiveARTProgram.value_datetime) between date('#startDate#') and date('#endDate#')
;

select 
"Number of PLHIV newly enrolled in HIV care with active TB disease" as "-", 
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
)
AND obsActiveDiagnosis.obs_group_id not in (/*Removing ruled out diagnosis*/
    Select obs_group_id from obs where concept_id = 49 and  value_coded = 48 and voided=0 and obs_group_id is not null
    AND obs.person_id = obsActiveDiagnosis.person_id
    AND obs.obs_group_id = obsActiveDiagnosis.obs_group_id
)
and cnDiagnosisName.concept_name_type = 'FULLY_SPECIFIED' 
AND cnDiagnosisName.voided = 0
and obsActiveDiagnosis.voided = 0
and date(obsActiveDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
and date(obsActiveARTProgram.value_datetime) between date('#startDate#') and date('#endDate#')
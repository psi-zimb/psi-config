select 
 fpSection.Activity,
    SUM(fpSection.lessThan14yrs) AS '14 Yrs and below',
    SUM(fpSection.15To19yrs) AS '15-19 Yrs',
    SUM(fpSection.20To24yrs) AS '20-24 Yrs',
    SUM(fpSection.25To49yrs) AS '25-49 Yrs',
    SUM(fpSection.GrtThan50Yrs) AS '50 Yrs +'
    from(
    SELECT
         fpMethod.cname as Activity,
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
         THEN COUNT(1)  END AS 'lessThan14yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
         THEN COUNT(1)  END AS '15To19yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
         THEN COUNT(1)  END AS '20To24yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
         THEN COUNT(1)  END AS '25To49yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
         THEN COUNT(1)  END AS 'GrtThan50Yrs'
    FROM ( /*  Classification as first time user*/
                select distinct obsForFirsttimeUser.encounter_id,obsForFirsttimeUser.person_id,
                cvMethodIssuedAnswer.concept_short_name as cname
                from obs obsForFirsttimeUser
                join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id
                join obs obsMethodIssued on obsForFirsttimeUser.encounter_id = obsMethodIssued.encounter_id
                join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                where 
                cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvforQuestionAnswer.concept_full_name NOT IN (
                                            "None"
                                             )
                and obsForFirsttimeUser.voided = 0
                and cvforQuestion.retired = 0
                and cvforQuestionAnswer.retired = 0                            
                and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                and cvMethodIssuedAnswer.concept_full_name In (
                                              "FPS FORM,Projesterone only pill (POP)", 
                                              "FPS FORM,Combined oral contaceptive (COC)", 
                                              "FPS FORM,Injectable (Petogen)",
                                              "FPS FORM,Vasectomy",
                                              "FPS FORM,Tuberligation",
                                              "FPS FORM, Other Methods"     
                                             )
                and obsMethodIssued.voided = 0
                and cvMethodIssued.retired = 0
                and cvMethodIssuedAnswer.retired = 0
                and date(obsForFirsttimeUser.obs_datetime) between date('#startDate#') and date('#endDate#')
) AS fpMethod
           INNER JOIN person p ON p.person_id = fpMethod.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
               THEN '14 Yrs and below'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
               THEN '15-19 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
               THEN '20-24 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
               THEN '25-49 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
               THEN '50 Yrs +'
            END,
            fpMethod.cname)
 as fpSection
 group by fpSection.Activity
            union all
            /* Condoms given */
/* Condoms given */
Select cdmSection.Activity,
    SUM(cdmSection.lessThan14yrs) AS '14 Yrs and below',
    SUM(cdmSection.15To19yrs) AS '15-19 Yrs',
    SUM(cdmSection.20To24yrs) AS '20-24 Yrs',
    SUM(cdmSection.25To49yrs) AS '25-49 Yrs',
    SUM(cdmSection.GrtThan50Yrs) AS '50 Yrs +'
    from
(SELECT
         CDMMethod.cname as Activity,
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
         THEN COUNT(1)  END AS 'lessThan14yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
         THEN COUNT(1)  END AS '15To19yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
         THEN COUNT(1)  END AS '20To24yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
         THEN COUNT(1)  END AS '25To49yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
         THEN COUNT(1)  END AS 'GrtThan50Yrs'
    FROM (select distinct obsForCDM.encounter_id,obsForCDM.person_id,
                    concat ('Condoms',' ',cvForQuestionAnswercdm.concept_full_name) AS cname
                    from
                    obs obsForFirsttimeUser
                    join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                    join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id
                    Join person p on obsForFirsttimeUser.person_id = p.person_id
                    JOIN obs obsForCDM on obsForCDM.encounter_id=obsForFirsttimeUser.encounter_id
                    join concept_view cvForQuestioncdm on obsForCDM.concept_id = cvForQuestioncdm.concept_id
                    join concept_view cvForQuestionAnswercdm on obsForCDM.value_coded = cvForQuestionAnswercdm.concept_id
                    where 
                    
                cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvforQuestionAnswer.concept_full_name NOT IN (
                                            "None"
                                             )
                                             AND 
                    cvForQuestioncdm.concept_full_name = "FPS FORM,Condoms given"
                    and cvForQuestionAnswercdm.concept_full_name In (
                                                  "Male",
                                                  "Female"
                                                 )
                    and obsForCDM.voided =   0
                    and obsForFirsttimeUser.voided=0
                    and cvForQuestioncdm.retired = 0
                    and cvForQuestionAnswercdm.retired = 0   
                    and cvforQuestion.retired =0  
                    and cvForQuestionAnswercdm.retired =0                       
                    and date(obsForCDM.obs_datetime) between date('#startDate#') and date('#endDate#')   
          )AS CDMMethod
           INNER JOIN person p ON p.person_id = CDMMethod.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
               THEN '14 Yrs and below'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
               THEN '15-19 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
               THEN '20-24 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
               THEN '25-49 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
               THEN '50 Yrs +'
            END,
            CDMMethod.cname
     ) AS cdmSection
    group by cdmSection.Activity
   
    union all
    /* STI Screening Section */
Select totalSTI.Activity,
    SUM(totalSTI.lessThan14yrs) AS '14 Yrs and below',
    SUM(totalSTI.15To19yrs) AS '15-19 Yrs',
    SUM(totalSTI.20To24yrs) AS '20-24 Yrs',
    SUM(totalSTI.25To49yrs) AS '25-49 Yrs',
    SUM(totalSTI.GrtThan50Yrs) AS '50 Yrs +'
    from
(SELECT
         STIMethod.cname as Activity,
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
         THEN COUNT(1)  END AS 'lessThan14yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
         THEN COUNT(1)  END AS '15To19yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
         THEN COUNT(1)  END AS '20To24yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
         THEN COUNT(1)  END AS '25To49yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
         THEN COUNT(1)  END AS 'GrtThan50Yrs'
    FROM (
select distinct obsForSti.encounter_id,obsForSti.person_id,
                    concat ('STI Screening',' ',case when p.gender = 'M' then 'Male' when p.gender = 'F' Then 'Female' else 'Other'  End) as cname
                    from obs obsForFirsttimeUser
                    join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                    join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id
                    Join person p on obsForFirsttimeUser.person_id = p.person_id
                    join obs obsForSti on obsForSti.encounter_id=obsForFirsttimeUser.encounter_id
                    join concept_view cvSTI on obsForSti.concept_id = cvSTI.concept_id
                    where 
                      cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                       and cvforQuestionAnswer.concept_full_name NOT IN (
                                            "None"
                                             )
                       AND 
                    cvSTI.concept_full_name = "FPS FORM,Genital examination: Does the client have any of the following conditions?"
                    and obsForSti.voided =   0
                    and obsForFirsttimeUser.voided=0
                    and cvforQuestion.retired = 0
                    and cvforQuestionAnswer.retired = 0 
                    and cvSTI.retired = 0
                    and date(obsForFirsttimeUser.obs_datetime) between date('#startDate#') and date('#endDate#')
                         )AS STIMethod
           INNER JOIN person p ON p.person_id = STIMethod.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
               THEN '14 Yrs and below'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
               THEN '15-19 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
               THEN '20-24 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
               THEN '25-49 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
               THEN '50 Yrs +'
            END,
            STIMethod.cname
     ) AS totalSTI
    group by totalSTI.Activity
    union all
    /* HIV Testing and Councelling Section */
/* HIV Testing and Councelling Section */
Select hivSection.Activity,
    SUM(hivSection.lessThan14yrs) AS '14 Yrs and below',
    SUM(hivSection.15To19yrs) AS '15-19 Yrs',
    SUM(hivSection.20To24yrs) AS '20-24 Yrs',
    SUM(hivSection.25To49yrs) AS '25-49 Yrs',
    SUM(hivSection.GrtThan50Yrs) AS '50 Yrs +'
    from
(SELECT
         HIVMethod.cname as Activity,
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
         THEN COUNT(1)  END AS 'lessThan14yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
         THEN COUNT(1)  END AS '15To19yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
         THEN COUNT(1)  END AS '20To24yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
         THEN COUNT(1)  END AS '25To49yrs',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
         THEN COUNT(1)  END AS 'GrtThan50Yrs'
    FROM (
select distinct obsForHIV.encounter_id,obsForHIV.person_id,
                    concat ('HIV Testing and Counseling',' ',case when p.gender = 'M' then 'Male' when p.gender = 'F' Then 'Female' ELSE 'Other' End) as cname
                    from obs obsForFirsttimeUser
                    join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                    join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id                    
                    Join person p on obsForFirsttimeUser.person_id = p.person_id
                    join obs obsForHIV on obsForHIV.encounter_id=obsForFirsttimeUser.encounter_id
                    join concept_view cvforQuestionHIV on obsForHIV.concept_id = cvforQuestionHIV.concept_id
                    join concept_view cvforQuestionAnswerHIV on obsForHIV.value_coded = cvforQuestionAnswerHIV.concept_id
                    where 
                     cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvforQuestionAnswer.concept_full_name NOT IN (
                                            "None"
                                             )
                                             and 
                    cvforQuestionHIV.concept_full_name = "FPS FORM,HIV infection?"
                    and cvforQuestionAnswerHIV.concept_full_name In (
                                                  "Positive",
                                                  "Negative"
                                                 )
                    and obsForHIV.voided =   0
                    and obsForFirsttimeUser.voided = 0
                    and cvforQuestion.retired = 0
                    and cvforQuestionAnswer.retired = 0   
                    and cvforQuestionHIV.retired = 0
                    and cvforQuestionAnswerHIV.retired = 0                          
                    and date(obsForHIV.obs_datetime) between date('#startDate#') and date('#endDate#')
                    )AS HIVMethod
           INNER JOIN person p ON p.person_id = HIVMethod.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') <= 14
               THEN '14 Yrs and below'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
               THEN '15-19 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
               THEN '20-24 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 49
               THEN '25-49 Yrs'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
               THEN '50 Yrs +'
            END,
            HIVMethod.cname
     ) AS hivSection
    group by hivSection.Activity

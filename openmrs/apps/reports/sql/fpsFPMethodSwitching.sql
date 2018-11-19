SELECT/*Pivoting the table*/
    'Client switching to short term method' AS '-',
    SUM(lessThan14yrs) AS '14 Yrs and below',
    SUM(15To19yrs) AS '15-19 Yrs',
    SUM(20To24yrs) AS '20-24 Yrs',
    SUM(25To49yrs) AS '25-49 Yrs',
    SUM(GrtThan50Yrs) AS '50 Yrs +'
    FROM
    (
    SELECT
         'Client switching to short term method',
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
    FROM ( /*Client switching to short term method*/
                select distinct obsClientsSwitchingtoShortTermMethod.encounter_id,obsClientsSwitchingtoShortTermMethod.person_id
                from obs obsClientsSwitchingtoShortTermMethod
                join concept_view cvEverUsedContraceptionBefore on obsClientsSwitchingtoShortTermMethod.concept_id = cvEverUsedContraceptionBefore.concept_id
                join concept_view cvEverUsedContraceptionBeforeAnswer on obsClientsSwitchingtoShortTermMethod.value_coded = cvEverUsedContraceptionBeforeAnswer.concept_id
                join obs obsMethodIssued on obsClientsSwitchingtoShortTermMethod.encounter_id = obsMethodIssued.encounter_id
                join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                where 
                cvEverUsedContraceptionBefore.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvEverUsedContraceptionBeforeAnswer.concept_full_name In (
                                              "FPS FORM,Implanon Implants",
                                              "FPS FORM,Jadelle Implants",
                                              "FPS FORM,Copper T IUCD",
                                              "FPS FORM,LNG-IUS IUCD"
                                             )
                and obsClientsSwitchingtoShortTermMethod.voided = 0
                and cvEverUsedContraceptionBefore.retired = 0
                and cvEverUsedContraceptionBeforeAnswer.retired = 0                            
                and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                and cvMethodIssuedAnswer.concept_full_name In (
                                              "FPS FORM,Projesterone only pill (POP)", 
                                              "FPS FORM,Combined oral contaceptive (COC)", 
                                              "FPS FORM,Injectable (Petogen)"
                                             )
                and obsMethodIssued.voided = 0
                and cvMethodIssued.retired = 0
                and cvMethodIssuedAnswer.retired = 0
                and date(obsClientsSwitchingtoShortTermMethod.obs_datetime) between date('#startDate#') and date('#endDate#')
) AS clientswitchingtoshorttermmethod
           INNER JOIN person p ON p.person_id = clientswitchingtoshorttermmethod.person_id
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
            END
    ) AS clientswitchingtoshorttermmethod
    
    UNION ALL
    
SELECT/*Pivoting the table*/
    'Client switching to LARC' AS '-',
    SUM(lessThan14yrs) AS '14 Yrs and below',
    SUM(15To19yrs) AS '15-19 Yrs',
    SUM(20To24yrs) AS '20-24 Yrs',
    SUM(25To49yrs) AS '25-49 Yrs',
    SUM(GrtThan50Yrs) AS '50 Yrs +'
    FROM
    (
    SELECT
         'Client switching to LARC',
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
    FROM (          /*Client switching to LARC*/
                    select distinct obsClientsSwitchingtoLARC.encounter_id,obsClientsSwitchingtoLARC.person_id
                    from obs obsClientsSwitchingtoLARC
                    join concept_view cvEverUsedContraceptionBefore on obsClientsSwitchingtoLARC.concept_id = cvEverUsedContraceptionBefore.concept_id
                    join concept_view cvEverUsedContraceptionBeforeAnswer on obsClientsSwitchingtoLARC.value_coded = cvEverUsedContraceptionBeforeAnswer.concept_id
                    join obs obsMethodIssued on obsClientsSwitchingtoLARC.encounter_id = obsMethodIssued.encounter_id
                    join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                    join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                    where 
                    cvEverUsedContraceptionBefore.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                    and cvEverUsedContraceptionBeforeAnswer.concept_full_name In (
                                                  "FPS FORM,Projesterone only pill (POP)",
                                                  "FPS FORM,Combined oral contaceptive (COC)",
                                                  "FPS FORM,Injectable (Petogen)"
                                                 )
                    and obsClientsSwitchingtoLARC.voided = 0
                    and cvEverUsedContraceptionBefore.retired = 0
                    and cvEverUsedContraceptionBeforeAnswer.retired = 0                            
                    and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                    and cvMethodIssuedAnswer.concept_full_name In (
                                                  "FPS FORM,Implanon Implants", 
                                                  "FPS FORM,Jadelle Implants", 
                                                  "FPS FORM,Copper T IUCD",
                                                  "FPS FORM,LNG-IUS IUCD"
                                                 )
                    and obsMethodIssued.voided = 0
                    and cvMethodIssued.retired = 0
                    and cvMethodIssuedAnswer.retired = 0
                    and date(obsClientsSwitchingtoLARC.obs_datetime) between date('#startDate#') and date('#endDate#')
) AS ClientswitchingtoLARC
           INNER JOIN person p ON p.person_id = ClientswitchingtoLARC.person_id
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
            END
    ) AS ClientswitchingtoLARC
    
UNION ALL

SELECT/*Pivoting the table*/
    'Client switching to PM' AS '-',
    SUM(lessThan14yrs) AS '14 Yrs and below',
    SUM(15To19yrs) AS '15-19 Yrs',
    SUM(20To24yrs) AS '20-24 Yrs',
    SUM(25To49yrs) AS '25-49 Yrs',
    SUM(GrtThan50Yrs) AS '50 Yrs +'
    FROM
    (
    SELECT
         'Client switching to PM',
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
    FROM (          /*Client switching to PM*/
                    select distinct obsClientsSwitchingtoPM.encounter_id,obsClientsSwitchingtoPM.person_id  
                    from obs obsClientsSwitchingtoPM
                    join concept_view cvEverUsedContraceptionBefore on obsClientsSwitchingtoPM.concept_id = cvEverUsedContraceptionBefore.concept_id
                    join concept_view cvEverUsedContraceptionBeforeAnswer on obsClientsSwitchingtoPM.value_coded = cvEverUsedContraceptionBeforeAnswer.concept_id
                    join obs obsMethodIssued on obsClientsSwitchingtoPM.encounter_id = obsMethodIssued.encounter_id
                    join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                    join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                    where 
                    cvEverUsedContraceptionBefore.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                    and cvEverUsedContraceptionBeforeAnswer.concept_full_name In (
                                                  "FPS FORM,Projesterone only pill (POP)",  
                                                  "FPS FORM,Combined oral contaceptive (COC)",
                                                  "FPS FORM,Injectable (Petogen)"
                                                 )
                    and obsClientsSwitchingtoPM.voided = 0
                    and cvEverUsedContraceptionBefore.retired = 0
                    and cvEverUsedContraceptionBeforeAnswer.retired = 0                            
                    and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                    and cvMethodIssuedAnswer.concept_full_name In (
                                                  "FPS FORM,Vasectomy", 
                                                  "FPS FORM,Tuberligation"
                                                 )
                    and obsMethodIssued.voided = 0
                    and cvMethodIssued.retired = 0
                    and cvMethodIssuedAnswer.retired = 0
                    and date(obsClientsSwitchingtoPM.obs_datetime) between date('#startDate#') and date('#endDate#')
) AS clientswitchingtoPM
           INNER JOIN person p ON p.person_id = clientswitchingtoPM.person_id
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
            END
    ) AS clientswitchingtoPM
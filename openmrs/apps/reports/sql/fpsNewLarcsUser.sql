SELECT/*Pivoting the table*/
    newLarcsUser.concept_short_name as 'Activity',
    SUM(lessThan14yrs) AS '14 Yrs and below',
    SUM(15To19yrs) AS '15-19 Yrs',
    SUM(20To24yrs) AS '20-24 Yrs',
    SUM(25To49yrs) AS '25-49 Yrs',
    SUM(GrtThan50Yrs) AS '50 Yrs +'
    FROM
    (
    SELECT
         newLarcsUser.concept_short_name, 
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
    FROM (          /*NEW LARCs FP User*/
                        select distinct obsNewLarcUser.encounter_id,
                                        obsNewLarcUser.person_id,
                                        cvMethodIssuedAnswer.concept_short_name
                        from obs obsNewLarcUser
                        join concept_view cvMethodIssued on obsNewLarcUser.concept_id = cvMethodIssued.concept_id
                        join concept_view cvMethodIssuedAnswer on obsNewLarcUser.value_coded = cvMethodIssuedAnswer.concept_id
                        where cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered" 
                                and cvMethodIssuedAnswer.concept_full_name IN (
                                                                                       "FPS FORM,Implanon Implants", 
                                                                                       "FPS FORM,Jadelle Implants", 
                                                                                       "FPS FORM,Copper T IUCD",
                                                                                       "FPS FORM,LNG-IUS IUCD"
                                                                              ) 
                        and obsNewLarcUser.voided = 0
                        and cvMethodIssued.retired = 0
                        and cvMethodIssuedAnswer.retired = 0
                        and date(obsNewLarcUser.obs_datetime) between date('#startDate#') and date('#endDate#')
) AS newLarcsUser
           INNER JOIN person p ON p.person_id = newLarcsUser.person_id
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
            newLarcsUser.concept_short_name
    ) AS newLarcsUser
    group by newLarcsUser.concept_short_name
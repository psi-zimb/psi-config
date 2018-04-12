Select /*Pivoting the table*/
RapidHIVResults AS 'Rapid HIV Results',
SUM(lessThan1yr) AS '<1',
SUM(1To9yr) AS '1-9',
SUM(10To14yr) AS '10-14',
SUM(15To19yr) AS '15-19',
SUM(20To24yr) AS '20-24',
SUM(25To29yr) AS '25-29',
SUM(30To34yr) AS '30-34',
SUM(35To39yr) AS '35-39',
SUM(40To49Yrs) AS '40-49',
SUM(GrtThan50Yrs) AS '>50'
FROM
(
SELECT concept_name.name AS "RapidHIVResults",
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#')  < 1
     THEN COUNT(1)  END AS 'lessThan1yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9
     then COUNT(1)  END AS '1To9yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14
     then COUNT(1)  END AS '10To14yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
     then COUNT(1)  END AS '15To19yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
     then COUNT(1)  END AS '20To24yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29
     then COUNT(1)  END AS '25To29yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34
     then COUNT(1)  END AS '30To34yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39
     then COUNT(1)  END AS '35To39yr',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49
     THEN COUNT(1)  END AS '40To49Yrs',
CASe WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
     THEN  COUNT(1) END AS 'GrtThan50Yrs'
FROM obs
JOIN concept_name on obs.value_coded = concept_name.concept_id
JOIN person p on p.person_id = obs.person_id
where obs.concept_id IN (select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' and retired=0)
AND obs.value_coded In (select concept_id from concept_view where concept_full_name IN ('Positive','Negative') and retired=0)
AND obs.voided = 0
GROUP BY obs.value_coded,
CASE
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#')  < 1
               THEN '< 1 Yr'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9
               THEN '1-9 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14
               THEN '10-14 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19
               THEN '15-19 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24
               THEN '20-24 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29
               THEN '25-29 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34
               THEN '30-34 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39
               THEN '35-39 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49
               THEN '40-49 Yrs'
             WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50
               THEN '> 50 Yrs'
               END
) AS rapidHIVLAbTestPerAgeGroup
GROUP BY RapidHIVResults

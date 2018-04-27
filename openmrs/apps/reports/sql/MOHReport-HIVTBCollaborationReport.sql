/*C1. Number of TB patients in care tested for HIV this month*/
SELECT/*Pivoting the table*/
    "C1. Number of TB patients in care tested for HIV this month" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C1. Number of TB patients in care tested for HIV this month",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
SELECT
    distinct ordersRapidHIV.order_id,ordersRapidHIV.patient_id
FROM
obs obsForTBForm
JOIN orders ordersRapidHIV ON obsForTBForm.person_id = ordersRapidHIV.patient_id AND obsForTBForm.concept_id in
      ( SELECT concept_id FROM concept_view WHERE concept_full_name = 'TB History, Are you currently being treated for TB?' AND retired = 0 )
      AND obsForTBForm.value_coded In
      ( SELECT concept_id FROM concept_view WHERE concept_full_name IN ('Yes') AND retired = 0 )
      AND obsForTBForm.voided = 0
      AND ordersRapidHIV.concept_id =
      ( select concept_id from concept_view where concept_full_name = 'Rapid HIV Test' AND retired = 0 )
      AND ordersRapidHIV.date_stopped is NULL
      AND ordersRapidHIV.order_action in ('NEW','REVISE' )
      AND ordersRapidHIV.date_activated > obsForTBForm.obs_datetime
      AND DATE(ordersRapidHIV.date_activated) BETWEEN DATE('#startDate#') AND DATE('#endDate#')

) as numberOfTBPatientsInCareTestedforHIVThisMonth
INNER JOIN person p ON p.person_id = numberOfTBPatientsInCareTestedforHIVThisMonth.patient_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC1NumberOfTBPatientsInCareTestedforHIVThisMonth


UNION ALL

/*C2. Number of TB patients in care tested positive for HIV this month*/
SELECT/*Pivoting the table*/
    "C2. Number of TB patients in care tested positive for HIV this month" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C2. Number of TB patients in care tested positive for HIV this month",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
  SELECT
    DISTINCT ordersRapidHIV.order_id,ordersRapidHIV.patient_id
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

) as numberOfTBPatientsInCareTestedPositiveForHIVThisMonth
INNER JOIN person p ON p.person_id = numberOfTBPatientsInCareTestedPositiveForHIVThisMonth.patient_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC2NumberOfTBPatientsInCareTestedPositiveForHIVThisMonth

UNION ALL

/*C3. Number of PLHIV in care screened for TB during their last visit this month*/
SELECT/*Pivoting the table*/
  "C3. Number of PLHIV in care screened for TB during their last visit this month" AS '-',
        SUM(lessThan1yrMale) AS '<1 M',
        SUM(lessThan1yrFemale) AS '<1 F',
        SUM(1To9yrMale) AS '1-9 M',
        SUM(1To9yrFemale) AS '1-9 F',
        SUM(10To14yrMale) AS '10-14 M',
        SUM(10To14yrFemale) AS '10-14 F',
        SUM(15To19yrMale) AS '15-19 M',
        SUM(15To19yrFemale) AS '15-19 F',
        SUM(20To24yrMale) AS '20-24 M',
        SUM(20To24yrFemale) AS '20-24 F',
        SUM(25To29yrMale) AS '25-29 M',
        SUM(25To29yrFemale) AS '25-29 F',
        SUM(30To34yrMale) AS '30-34 M',
        SUM(30To34yrFemale) AS '30-34 F',
        SUM(35To39yrMale) AS '35-39 M',
        SUM(35To39yrFemale) AS '35-39 F',
        SUM(40To49YrsMale) AS '40-49 M',
        SUM(40To49YrsFemale) AS '40-49 F',
        SUM(GrtThan50YrsMale) AS '>50 M',
        SUM(GrtThan50YrsFemale) AS '>50 F'
        FROM
        (
        SELECT
             "C3. Number of PLHIV in care screened for TB during their last visit this month",
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
             THEN COUNT(1)  END AS 'lessThan1yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
             THEN COUNT(1)  END AS 'lessThan1yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
             THEN COUNT(1)  END AS '1To9yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
             THEN COUNT(1)  END AS '1To9yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
             THEN COUNT(1)  END AS '10To14yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
             THEN COUNT(1)  END AS '10To14yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
             THEN COUNT(1)  END AS '15To19yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
             THEN COUNT(1)  END AS '15To19yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
             THEN COUNT(1)  END AS '20To24yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
             THEN COUNT(1)  END AS '20To24yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
             THEN COUNT(1)  END AS '25To29yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
             THEN COUNT(1)  END AS '25To29yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
             THEN COUNT(1)  END AS '30To34yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
             THEN COUNT(1)  END AS '30To34yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
             THEN COUNT(1)  END AS '35To39yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
             THEN COUNT(1)  END AS '35To39yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
             THEN COUNT(1)  END AS '40To49YrsMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
             THEN COUNT(1)  END AS '40To49YrsFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
             THEN COUNT(1)  END AS 'GrtThan50YrsMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
             THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
        FROM
    (
        select o.person_id
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
                    group by o.obs_id

    ) as numberOfPLHIVInCareScreenedForTBDuringTheirLastVisitThisMonth
    INNER JOIN person p ON p.person_id = numberOfPLHIVInCareScreenedForTBDuringTheirLastVisitThisMonth.person_id

    GROUP BY
               CASE
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
                   THEN '< 1 Yr M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
                   THEN '< 1 Yr F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
                   THEN '1-9 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
                   THEN '1-9 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
                   THEN '10-14 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
                   THEN '10-14 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
                   THEN '15-19 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
                   THEN '15-19 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
                   THEN '20-24 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
                   THEN '20-24 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
                   THEN '25-29 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
                   THEN '25-29 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
                   THEN '30-34 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
                   THEN '30-34 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
                   THEN '35-39 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
                   THEN '35-39 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
                   THEN '40-49 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
                   THEN '40-49 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
                   THEN '> 50 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
                   THEN '> 50 Yrs F'
                END
        ) AS MOHReportC3NumberOfPLHIVInCareScreenedForTBDuringTheirLastVisitThisMonth

UNION ALL

/*C4. Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)*/
SELECT/*Pivoting the table*/
    "C4. Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C4. Number of PLHIV in care screened for TB and had signs of active TB disease (Presumptive Cases)",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
  SELECT  Distinct person_id,obsTBQuestion.obs_datetime,concept_id,obs_id,encounter_id
  FROM obs obsTBQuestion
  WHERE value_coded in (SELECT concept_id FROM concept_view WHERE concept_full_name IN ('Yes') AND retired=0)
     AND DATE(obsTBQuestion.obs_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
     AND obsTBQuestion.voided =0
     AND ( concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'GQRRH, Did you have fever recently?' AND retired=0)
         OR concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'GQRRH, Did you have night sweats?' AND retired=0)
         OR concept_id in (SELECT concept_id FROM concept_view WHERE concept_full_name = 'GQRRH, Do you have weight loss?' AND retired=0)
         OR concept_id in  (SELECT concept_id FROM concept_view WHERE concept_full_name = 'GQRRH, Do you have shortness of breath?' AND retired=0)
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

) as numberOfPLHIVInCareScreenedForTBAndHadSignsOfActiveTBDiseasePresumptiveCases
INNER JOIN person p ON p.person_id = numberOfPLHIVInCareScreenedForTBAndHadSignsOfActiveTBDiseasePresumptiveCases.person_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC4NumberOfPLHIVInCareScreenedForTBAndHadSignsOfActiveTBDiseasePresumptiveCases

UNION ALL

/*C5. Number of PLHIV in care investigated for TB disease this month*/
SELECT/*Pivoting the table*/
    'C5. Number of PLHIV in care investigated for TB disease this month' AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         'C5. Number of PLHIV in care investigated for TB disease this month',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM (
        select
           distinct patient_id
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


         ) AS numberofPLHIVincareinvestigatedforTBdiseasethismonth
           INNER JOIN person p ON p.person_id = numberofPLHIVincareinvestigatedforTBdiseasethismonth.patient_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC5NumberOfPLHIVinCareInvestigatedForTBDiseaseThisMonth

UNION ALL

/*C6. Number of PLHIV in care tested positive TB disease this month*/
SELECT/*Pivoting the table*/
    'C6. Number of PLHIV in care tested positive TB disease this month' AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         'C6. Number of PLHIV in care tested positive TB disease this month',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM (
        select
              DISTINCT obs.person_id
        from obs
             where concept_id IN
                    ( select concept_id from concept_name where name IN
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


         ) AS numberOfPLHIVinCareTestedPositiveTBdiseaseThisMonth
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareTestedPositiveTBdiseaseThisMonth.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC6NumberOfPLHIVinCareTestedPositiveTBdiseaseThisMonth

UNION ALL

/*C7. Number of PLHIV newly enrolled in HIV care with active TB disease*/
SELECT/*Pivoting the table*/
        "C7. Number of PLHIV newly enrolled in HIV care with active TB disease" AS '-',
        SUM(lessThan1yrMale) AS '<1 M',
        SUM(lessThan1yrFemale) AS '<1 F',
        SUM(1To9yrMale) AS '1-9 M',
        SUM(1To9yrFemale) AS '1-9 F',
        SUM(10To14yrMale) AS '10-14 M',
        SUM(10To14yrFemale) AS '10-14 F',
        SUM(15To19yrMale) AS '15-19 M',
        SUM(15To19yrFemale) AS '15-19 F',
        SUM(20To24yrMale) AS '20-24 M',
        SUM(20To24yrFemale) AS '20-24 F',
        SUM(25To29yrMale) AS '25-29 M',
        SUM(25To29yrFemale) AS '25-29 F',
        SUM(30To34yrMale) AS '30-34 M',
        SUM(30To34yrFemale) AS '30-34 F',
        SUM(35To39yrMale) AS '35-39 M',
        SUM(35To39yrFemale) AS '35-39 F',
        SUM(40To49YrsMale) AS '40-49 M',
        SUM(40To49YrsFemale) AS '40-49 F',
        SUM(GrtThan50YrsMale) AS '>50 M',
        SUM(GrtThan50YrsFemale) AS '>50 F'
        FROM
        (
        SELECT
             "C7. Number of PLHIV newly enrolled in HIV care with active TB disease",
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
             THEN COUNT(1)  END AS 'lessThan1yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
             THEN COUNT(1)  END AS 'lessThan1yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
             THEN COUNT(1)  END AS '1To9yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
             THEN COUNT(1)  END AS '1To9yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
             THEN COUNT(1)  END AS '10To14yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
             THEN COUNT(1)  END AS '10To14yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
             THEN COUNT(1)  END AS '15To19yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
             THEN COUNT(1)  END AS '15To19yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
             THEN COUNT(1)  END AS '20To24yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
             THEN COUNT(1)  END AS '20To24yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
             THEN COUNT(1)  END AS '25To29yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
             THEN COUNT(1)  END AS '25To29yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
             THEN COUNT(1)  END AS '30To34yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
             THEN COUNT(1)  END AS '30To34yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
             THEN COUNT(1)  END AS '35To39yrMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
             THEN COUNT(1)  END AS '35To39yrFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
             THEN COUNT(1)  END AS '40To49YrsMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
             THEN COUNT(1)  END AS '40To49YrsFemale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
             THEN COUNT(1)  END AS 'GrtThan50YrsMale',
             CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
             THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
        FROM
    (
                    select
                    distinct obsActiveARTProgram.person_id
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
                        and date(obs.date_created) <= date('#endDate#')
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
    ) as numberOfTBPatientsInCareTestedforHIVThisMonth
    INNER JOIN person p ON p.person_id = numberOfTBPatientsInCareTestedforHIVThisMonth.person_id

    GROUP BY
               CASE
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
                   THEN '< 1 Yr M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
                   THEN '< 1 Yr F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
                   THEN '1-9 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
                   THEN '1-9 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
                   THEN '10-14 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
                   THEN '10-14 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
                   THEN '15-19 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
                   THEN '15-19 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
                   THEN '20-24 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
                   THEN '20-24 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
                   THEN '25-29 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
                   THEN '25-29 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
                   THEN '30-34 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
                   THEN '30-34 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
                   THEN '35-39 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
                   THEN '35-39 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
                   THEN '40-49 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
                   THEN '40-49 Yrs F'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
                   THEN '> 50 Yrs M'
                   WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
                   THEN '> 50 Yrs F'
                END
        ) AS MOHReportC7NumberofPLHIVnewlyenrolledinHIVcareWithActiveTBDisease

UNION ALL

/*C8. Number of PLHIV in care newly diagnosed with TB before ART initiation*/
SELECT/*Pivoting the table*/
    "C8. Number of PLHIV in care newly diagnosed with TB before ART initiation" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C8. Number of PLHIV in care newly diagnosed with TB before ART initiation",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
        select DISTINCT patient_id
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
            and date(obs.date_created) <= date('#endDate#')
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

) as numberOfPLHIVInCareNewlyDiagnosedWithTBBeforeARTInitiation
INNER JOIN person p ON p.person_id = numberOfPLHIVInCareNewlyDiagnosedWithTBBeforeARTInitiation.patient_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC8numberOfPLHIVInCareNewlyDiagnosedWithTBBeforeARTInitiation

UNION ALL

/*C9. Number of PLHIV in care newly initiated on TB treatment this month*/
SELECT/*Pivoting the table*/
'C9. Number of PLHIV in care newly initiated on TB treatment this month' AS '-',
SUM(lessThan1yrMale) AS '<1 M',
SUM(lessThan1yrFemale) AS '<1 F',
SUM(1To9yrMale) AS '1-9 M',
SUM(1To9yrFemale) AS '1-9 F',
SUM(10To14yrMale) AS '10-14 M',
SUM(10To14yrFemale) AS '10-14 F',
SUM(15To19yrMale) AS '15-19 M',
SUM(15To19yrFemale) AS '15-19 F',
SUM(20To24yrMale) AS '20-24 M',
SUM(20To24yrFemale) AS '20-24 F',
SUM(25To29yrMale) AS '25-29 M',
SUM(25To29yrFemale) AS '25-29 F',
SUM(30To34yrMale) AS '30-34 M',
SUM(30To34yrFemale) AS '30-34 F',
SUM(35To39yrMale) AS '35-39 M',
SUM(35To39yrFemale) AS '35-39 F',
SUM(40To49YrsMale) AS '40-49 M',
SUM(40To49YrsFemale) AS '40-49 F',
SUM(GrtThan50YrsMale) AS '>50 M',
SUM(GrtThan50YrsFemale) AS '>50 F'
FROM

(
select
'C9. Number of PLHIV in care newly initiated on TB treatment this month',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS 'lessThan1yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS 'lessThan1yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '1To9yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '1To9yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '10To14yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '10To14yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '15To19yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '15To19yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '20To24yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '20To24yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '25To29yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '25To29yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '30To34yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '30To34yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '35To39yrMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '35To39yrFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS '40To49YrsMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS '40To49YrsFemale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
then COUNT(distinct obsTBProgram.obs_id)  END AS 'GrtThan50YrsMale',
CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
then COUNT(distinct obsTBProgram.obs_id)  END AS 'GrtThan50YrsFemale'

             from patient pat
             join obs obsTBProgram on pat.patient_id = obsTBProgram.person_id
             join concept_name cnTBProgram on obsTBProgram.concept_id = cnTBProgram.concept_id
             join obs obsActiveARTProgram on pat.patient_id = obsActiveARTProgram.person_id
             join concept_name cnARTProgramStartDate on obsActiveARTProgram.concept_id = cnARTProgramStartDate.concept_id
             join person p on obsTBProgram.person_id = p.person_id
where
             cnTBProgram.name = 'PR, Start date of TB program'
                     and cnTBProgram.concept_name_type = 'FULLY_SPECIFIED'
                     AND cnTBProgram.voided = 0
                     and obsTBProgram.voided = 0
                     and date(obsTBProgram.value_datetime) between date('#startDate#') and date('#endDate#')
AND
             cnARTProgramStartDate.name = 'PR, Start date of ART program'
                     and cnARTProgramStartDate.concept_name_type = 'FULLY_SPECIFIED'
                     AND cnARTProgramStartDate.voided = 0
                     and obsActiveARTProgram.voided = 0
and obsActiveARTProgram.person_id not in
      (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
      select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
      and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
      Where date(obs.value_datetime) <= Date('#endDate#'))
and date(obsTBProgram.value_datetime) > date(obsActiveARTProgram.value_datetime)
GROUP BY
CASE
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
THEN '< 1 Yr M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
THEN '< 1 Yr F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
THEN '1-9 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
THEN '1-9 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
THEN '10-14 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
THEN '10-14 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
THEN '15-19 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
THEN '15-19 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
THEN '20-24 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
THEN '20-24 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
THEN '25-29 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
THEN '25-29 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
THEN '30-34 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
THEN '30-34 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
THEN '35-39 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
THEN '35-39 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
THEN '40-49 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
THEN '40-49 Yrs F'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
THEN '> 50 Yrs M'
WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
THEN '> 50 Yrs F'
END
)
AS MOHReportC9NumberPLHIVInCareNewlyInitiatedOnTBTreatmentThisMonth

UNION ALL

/*C10. Number of PLHIV in care with TB started on ART this month*/
SELECT/*Pivoting the table*/
    "C10. Number of PLHIV in care with TB started on ART this month" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C10. Number of PLHIV in care with TB started on ART this month",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
  select DISTINCT patient_id from patient
     join obs obsForARTProg on obsForARTProg.person_id = patient.patient_id
     where obsForARTProg.person_id in (
     SELECT person_id FROM obs obsHIVTest
     WHERE concept_id = (select concept_id from concept_view where concept_full_name = 'HIV test results' and voided =0)
     AND value_coded = (select concept_id from concept_view where concept_full_name = 'Positive' and voided =0)
     and obsHIVTest.obs_datetime < obsForARTProg.value_datetime
     and obsHIVTest.voided = 0
     )
     and obsForARTProg.person_id in
     (
     select
     person_id
     from
     obs obsForTBProg
     where concept_id = (
                            select
                            concept_id
                            from concept_view
                            where concept_full_name = "PR, Start date of TB program" and voided =0
                        )
              and obsForTBProg.value_datetime < obsForARTProg.value_datetime
              And obsForTBProg.voided = 0
              AND 1 =
               (/*Patient with TB stop date <= report end date then remove the patient else show the patient for the past period.*/
                     select case when Ifnull( max(obs.value_datetime),1) = 1 then 1 else 0 end
                     from obs
                     INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                     and concept_view.concept_full_name = "PR, TB Program Stop Date"
                     and obs.voided=0
                     Where date(obs.value_datetime) <= Date('#endDate#')
                     And  obs.person_id = obsForTBProg.person_id
                     AND date(obs.value_datetime) >= date(obsForTBProg.value_datetime)
                )
  )
     AND date(obsForARTProg.value_datetime)  between date('#startDate#') and date('#endDate#')
     AND obsForARTProg.person_id not in
           (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
           select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
           and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
           Where date(obs.value_datetime) <= Date('#endDate#'))
     AND obsForARTProg.voided = 0
) as numberOfPLHIVInCareWithTBStartedOnARTThisMonth
INNER JOIN person p ON p.person_id = numberOfPLHIVInCareWithTBStartedOnARTThisMonth.patient_id
GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC10numberOfPLHIVInCareWithTBStartedOnARTThisMonth

UNION ALL
/*C11. Number of PLHIV screened for TB and Eligible for IPT this month*/

SELECT/*Pivoting the table*/
    "C11. Number of PLHIV screened for TB and Eligible for IPT this month" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C11. Number of PLHIV screened for TB and Eligible for IPT this month",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
select distinct obsTBScreening.person_id
from patient pat
join obs obsTBScreening on pat.patient_id = obsTBScreening.person_id
join concept_name cnTBScreening on obsTBScreening.concept_id = cnTBScreening.concept_id
join obs obsARTProgramStartDate on pat.patient_id = obsARTProgramStartDate.person_id
join concept_name cnARTProgramStartDate on obsARTProgramStartDate.concept_id = cnARTProgramStartDate.concept_id
where
cnTBScreening.name = 'TB Screening' and cnTBScreening.concept_name_type = 'FULLY_SPECIFIED'
and obsTBScreening.voided = 0
and date(obsTBScreening.obs_datetime) <= date('#endDate#')
and cnARTProgramStartDate.name = 'PR, Start date of ART program' and cnARTProgramStartDate.concept_name_type = 'FULLY_SPECIFIED'
and obsARTProgramStartDate.voided = 0
and
datediff
      ( date('#endDate#'),
        (Select max(value_datetime) from obs where voided = 0 and person_id = obsARTProgramStartDate.person_id and concept_id =
      (
      select concept_id from concept_name where name = 'PR, Start date of ART program' and
      concept_name_type = 'FULLY_SPECIFIED' and voided = 0 )
      )
    ) > 120

and obsARTProgramStartDate.person_id NOT in
                    (
                         /*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
                         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                         and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
                         Where date(obs.value_datetime) <= Date('#endDate#')
                    )
and obsTBScreening.person_id NOT IN
                    (
                        select obs1.person_id from obs obs1 where obs1.concept_id IN (select cn1.concept_id from concept_name cn1 where cn1.name IN
                        (
                        'GQRRH, Did you have fever recently?',
                        'GQRRH, Did you have night sweats?',
                        'GQRRH, Do you have weight loss?',
                        'GQRRH, Do you have shortness of breath?'
                        )
                        and cn1.concept_name_type = 'FULLY_SPECIFIED'
                        AND cn1.voided = 0
                        )
                        and obs1.value_coded IN (select concept_id from concept_name where name = 'Yes' and concept_name_type = 'FULLY_SPECIFIED')
                        and obs1.voided  = 0
                        And obs1.person_id = obsTBScreening.person_id
                        and date(obs1.obs_datetime) <= date('#endDate#')
                    )
AND obsTBScreening.person_id NOT IN
                    (
                        select obs2.person_id from obs obs2 where obs2.concept_id in (select cn2.concept_id from concept_name cn2 where cn2.name
                        = 'PR, Start date of TB program'
                        and cn2.concept_name_type = 'FULLY_SPECIFIED'
                        AND cn2.voided = 0
                        )
                        and obs2.voided  = 0
                        And obs2.person_id = obsTBScreening.person_id
                        and date(obs2.value_datetime) <= date('#endDate#')
                    )

) as C11NumberofPLHIVscreenedforTBandEligibleforIPTthismonth
INNER JOIN person p ON p.person_id = C11NumberofPLHIVscreenedforTBandEligibleforIPTthismonth.person_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC11NumberofPLHIVscreenedforTBandEligibleforIPTthismonth

UNION ALL

/*C12. Number of PLHIV newly enrolled in HIV care who were initiated on IPT this month*/
SELECT/*Pivoting the table*/
    'C12. Number of PLHIV newly enrolled in HIV care who were initiated on IPT this month' AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         'C12. Number of PLHIV newly enrolled in HIV care who were initiated on IPT this month',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM (

       select distinct obsTable.person_id
        from obs obsTable
        where obsTable.concept_id=
             (
              SELECT concept_id
              FROM concept_name
                   where concept_name.name='PR, Start date of IPT program'
                   and concept_name_type='fully_specified'
              )
        AND obsTable.voided = 0
        and person_id in (

                Select orders.patient_id from drug drugs
                inner join drug_order drugsOrder
                on drugs.drug_id = drugsOrder.drug_inventory_id
                Inner join orders
                on orders.order_id  = drugsOrder.order_id
                and orders.order_type_id = 2
                where drugs.name = 'Isoniazid'
                AND date(orders.date_activated) between DATE('#startDate#') AND date('#endDate#')

        )
        And date(obsTable.value_datetime) between DATE('#startDate#') AND date('#endDate#')


 ) AS formFilledForPersonFirstTime
           INNER JOIN person p ON p.person_id = formFilledForPersonFirstTime.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS C12NumberofPLHIVnewlyEnrolledInHIVcareWhoWereInitiatedOnIPTthisMonth

UNION ALL

/*C13. Number of PLHIV in care started on Isoniazid Preventive Therapy*/
SELECT/*Pivoting the table*/
    'C13. Number of PLHIV in care started on Isoniazid Preventive Therapy' AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         'C13. Number of PLHIV in care started on Isoniazid Preventive Therapy',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM (

        select distinct obsTable.person_id
        from obs obsTable
        where obsTable.concept_id=
             (
              SELECT concept_id
              FROM concept_name
                   where concept_name.name='PR, Start date of IPT program'
                   and concept_name_type='fully_specified'
              )
        AND obsTable.voided = 0
        and person_id in (

                Select orders.patient_id from drug drugs
                inner join drug_order drugsOrder
                on drugs.drug_id = drugsOrder.drug_inventory_id
                Inner join orders
                on orders.order_id  = drugsOrder.order_id
                and orders.order_type_id = 2
                where drugs.name = 'Isoniazid'
                AND date(orders.date_activated) between DATE('#startDate#') AND date('#endDate#')

        )
        And date(obsTable.value_datetime) between DATE('#startDate#') AND date('#endDate#')


 ) AS formFilledForPersonFirstTime
           INNER JOIN person p ON p.person_id = formFilledForPersonFirstTime.person_id
           GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS C13numberOfPLHIVinCareStartedOnIsoniazidPreventiveTherapy

UNION ALL
/*C14. Number of PLHIV in care known to have died whilst on IPT this month*/
SELECT/*Pivoting the table*/
    "C14. Number of PLHIV in care known to have died whilst on IPT this month" AS '-',
    SUM(lessThan1yrMale) AS '<1 M',
    SUM(lessThan1yrFemale) AS '<1 F',
    SUM(1To9yrMale) AS '1-9 M',
    SUM(1To9yrFemale) AS '1-9 F',
    SUM(10To14yrMale) AS '10-14 M',
    SUM(10To14yrFemale) AS '10-14 F',
    SUM(15To19yrMale) AS '15-19 M',
    SUM(15To19yrFemale) AS '15-19 F',
    SUM(20To24yrMale) AS '20-24 M',
    SUM(20To24yrFemale) AS '20-24 F',
    SUM(25To29yrMale) AS '25-29 M',
    SUM(25To29yrFemale) AS '25-29 F',
    SUM(30To34yrMale) AS '30-34 M',
    SUM(30To34yrFemale) AS '30-34 F',
    SUM(35To39yrMale) AS '35-39 M',
    SUM(35To39yrFemale) AS '35-39 F',
    SUM(40To49YrsMale) AS '40-49 M',
    SUM(40To49YrsFemale) AS '40-49 F',
    SUM(GrtThan50YrsMale) AS '>50 M',
    SUM(GrtThan50YrsFemale) AS '>50 F'
    FROM
    (
    SELECT
         "C14. Number of PLHIV in care known to have died whilst on IPT this month",
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(1)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(1)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(1)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(1)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(1)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(1)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(1)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(1)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(1)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(1)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(1)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(1)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(1)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(1)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(1)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(1)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(1)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(1)  END AS 'GrtThan50YrsFemale'
    FROM
(
  select
  person_id,
  value_datetime,
  obsForIPTProg.obs_datetime,
  obsForIPTProg.date_created
      from patient pat
      join obs obsForIPTProg on pat.patient_id = obsForIPTProg.person_id
      join concept_name cnForIPTProg on cnForIPTProg.concept_id = obsForIPTProg.concept_id
      where cnForIPTProg.name = 'PR, Start date of IPT program'
      and cnForIPTProg.concept_name_type = 'FULLY_SPECIFIED'
      and obsForIPTProg.voided = 0

      AND (
                  obsForIPTProg.person_id in
                          (
                          Select
                          person_id
                          from obs
                          where concept_id = (
                                                SELECT concept_id
                                                FROM concept_view
                                                WHERE concept_full_name = 'AS, Activity status'
                                                AND retired=0
                                              )
                          and value_coded = (
                                                SELECT concept_id
                                                FROM concept_view
                                                WHERE concept_full_name = 'Deceased'
                                                AND retired=0
                                             )
                          and voided = 0
                          AND DATE(obs.obs_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')

                          )


                          or


                          obsForIPTProg.person_id in
                          (
                                Select
                                obsForIPTStopDate.person_id
                                from obs obsForIPTStopDate
                                where
                                Date(obsForIPTStopDate.value_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
                                AND obsForIPTStopDate.voided = 0
                                AND obsForIPTStopDate.concept_id =  (
                                                                        SELECT
                                                                        concept_id
                                                                        FROM concept_view
                                                                        WHERE
                                                                        concept_full_name = 'PR, IPT Program Stop Date'
                                                                        AND retired=0
                                                                     )
                                AND obsForIPTStopDate.obs_group_id in (
                               /*Reason for stopping IPT program as Deceased*/
                                                   select obs_group_id
                                                   from obs reasonAsDeceasedForStoppingIPT
                                                   where reasonAsDeceasedForStoppingIPT.concept_id = (
                                                                                                        SELECT
                                                                                                        concept_id
                                                                                                        FROM concept_view
                                                                                                        WHERE
                                                                                                        concept_full_name = 'PR, Reason for Stopping IPT Program'
                                                                                                        AND retired=0
                                                                                                      )
                                                   AND reasonAsDeceasedForStoppingIPT.value_coded = (
                                                                                                        SELECT
                                                                                                        concept_id
                                                                                                        FROM concept_view
                                                                                                        WHERE
                                                                                                        concept_full_name = 'PR, Deceased'
                                                                                                        AND retired=0
                                                                                                     )
                                                   And obsForIPTStopDate.person_id = reasonAsDeceasedForStoppingIPT.person_id
                                                   AND reasonAsDeceasedForStoppingIPT.voided = 0
                               )
                           )
             )
) as numberOfPLHIVInCareKnownToHaveDiedWhilstOnIPTThisMonth
INNER JOIN person p ON p.person_id = numberOfPLHIVInCareKnownToHaveDiedWhilstOnIPTThisMonth.person_id

GROUP BY
           CASE
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
               THEN '< 1 Yr M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
               THEN '< 1 Yr F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
               THEN '1-9 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
               THEN '1-9 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
               THEN '10-14 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
               THEN '10-14 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
               THEN '15-19 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
               THEN '15-19 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
               THEN '20-24 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
               THEN '25-29 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
               THEN '25-29 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
               THEN '30-34 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
               THEN '30-34 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
               THEN '35-39 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
               THEN '35-39 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
               THEN '40-49 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
               THEN '40-49 Yrs F'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
               THEN '> 50 Yrs M'
               WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
               THEN '> 50 Yrs F'
            END
    ) AS MOHReportC14numberOfPLHIVInCareKnownToHaveDiedWhilstOnIPTThisMonth;

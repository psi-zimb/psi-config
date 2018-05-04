SELECT/*Pivoting the table*/
    "D6. Total number of PLHIV in care started on CTX prophylaxis (including TB patients) this month" AS '-',
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
         "D6. Total number of PLHIV in care started on CTX prophylaxis (including TB patients) this month",
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
      SELECT  DISTINCT o.patient_id
      FROM orders o
      JOIN drug_order dro on o.order_id = dro.order_id
      JOIN drug d on d.drug_id = dro.drug_inventory_id
      WHERE d.name = "Cotrimoxazole(prophylaxis)"
      AND DATE(o.date_activated)  BETWEEN DATE('#startDate#') AND DATE('#endDate#')
      AND d.retired = 0
      AND o.voided = 0
      AND o.date_stopped IS NULL
      AND o.patient_id NOT IN (/*To remove the patient which have the drug before starting date*/
                                SELECT  o.patient_id
                                FROM orders o
                                JOIN drug_order dro on o.order_id = dro.order_id
                                JOIN drug d on d.drug_id = dro.drug_inventory_id
                                WHERE d.name = "Cotrimoxazole(prophylaxis)"
                                AND DATE(o.date_activated)  < ('#startDate#')
                                AND d.retired = 0
                                AND o.voided = 0
                                AND o.date_stopped IS NULL
                             )
    ) AS totalNumberOfPLHIVInCareStartedOnCTXprophylaxisIncludingTBPatientsThisMonth
  INNER JOIN person p ON p.person_id = totalNumberOfPLHIVInCareStartedOnCTXprophylaxisIncludingTBPatientsThisMonth.patient_id

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
      ) AS MOHReportD6totalNumberOfPLHIVInCareStartedOnCTXprophylaxisIncludingTBPatientsThisMonth
      ;

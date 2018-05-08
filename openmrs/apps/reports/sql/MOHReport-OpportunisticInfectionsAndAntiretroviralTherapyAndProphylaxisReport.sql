/*D1. Number of newly diagnosed PLHIV registered into care this month*/
SELECT/*Pivoting the table*/
    'D1. Number of newly diagnosed PLHIV registered into care this month' AS '-',
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
         'D1. Number of newly diagnosed PLHIV registered into care this month',
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
            select distinct cnCodedDiagnosisVC.name, p.person_id
            from person p
            join obs obsCodedDiagnosis on p.person_id = obsCodedDiagnosis.person_id
            join concept_name cnCodedDiagnosis on obsCodedDiagnosis.concept_id = cnCodedDiagnosis.concept_id
            join concept_name cnCodedDiagnosisVC on obsCodedDiagnosis.value_coded = cnCodedDiagnosisVC.concept_id
            join obs obsARTProgram on p.person_id = obsARTProgram.person_id
            join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
            Left join obs obsARTProgramStop on p.person_id = obsARTProgramStop.person_id
        AND obsARTProgramStop.voided = 0
        AND obsARTProgramStop.concept_id = (
                                                Select concept_id
                                                from concept_name
                                                where
                                                name ='PR, ART Program Stop Date'
                                                AND concept_name_type = 'FULLY_SPECIFIED'
                                                and voided = 0
                                           )
            where
            cnCodedDiagnosis.name = 'Coded Diagnosis' and cnCodedDiagnosis.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosis.voided = 0
            and cnCodedDiagnosisVC.name IN
            (
                'WHO stage IV','P-WHO stage IV (Peads Stage IV)',
                'WHO stage III','P-WHO stage III (Peads Stage III)',
                'WHO stage II','P-WHO stage II (Peads Stage II)',
                'WHO stage I','P-WHO stage I (Peads Stage I)'
            )
            and cnCodedDiagnosisVC.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosisVC.voided = 0
            and obsCodedDiagnosis.voided = 0
            and obsARTProgram.voided = 0
            and cnARTProgram.name = 'PR, Start date of ART program'
            and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED'
            and cnARTProgram.voided = 0
            and date(obsCodedDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
            and date(obsARTProgram.value_datetime ) between date('#startDate#') and date('#endDate#')
            AND (   /*ART program stop date should not be there OR ART program stop date
                should be greater or equal to Diagnosis date*/
                date(obsARTProgramStop.value_datetime) >= date(obsCodedDiagnosis.obs_datetime)
                OR date(obsARTProgramStop.value_datetime) is null
            )
        )
        AS numberofnewlydiagnosedPLHIVregisteredintoCarethisMonth
           INNER JOIN person p ON p.person_id = numberofnewlydiagnosedPLHIVregisteredintoCarethisMonth.person_id
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
    ) AS MOHReportD1NumberofnewlydiagnosedPLHIVregisteredintoCarethisMonth

UNION ALL

/*D2. Number of new PLHIV in care in WHO Stage 1 at registration this month*/
SELECT * FROM
(
  SELECT/*Pivoting the table*/
    Diagnosis as '-',
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
Select "D2. Number of new PLHIV in care in WHO Stage 1 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
Union ALL
Select "D2. Number of new PLHIV in care in P WHO Stage 1 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
UNION ALL
select
         CASE
         when cnCodedDiagnosisVC.name = 'WHO stage I' then "D2. Number of new PLHIV in care in WHO Stage 1 at registration this month"
         when cnCodedDiagnosisVC.name = 'P-WHO stage I (Peads Stage I)' then "D2. Number of new PLHIV in care in P WHO Stage 1 at registration this month" end as 'Diagnosis',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsFemale'
        from person p
        join obs obsCodedDiagnosis on p.person_id = obsCodedDiagnosis.person_id
        join concept_name cnCodedDiagnosis on obsCodedDiagnosis.concept_id = cnCodedDiagnosis.concept_id
        join concept_name cnCodedDiagnosisVC on obsCodedDiagnosis.value_coded = cnCodedDiagnosisVC.concept_id
        join obs obsARTProgram on p.person_id = obsARTProgram.person_id
        join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
        Left join obs obsARTProgramStop on p.person_id = obsARTProgramStop.person_id
        AND obsARTProgramStop.voided = 0
        AND obsARTProgramStop.concept_id = (
                                                Select concept_id
                                                from concept_name
                                                where
                                                name ='PR, ART Program Stop Date'
                                                AND concept_name_type = 'FULLY_SPECIFIED'
                                                and voided = 0
                                           )
        where
        cnCodedDiagnosis.name = 'Coded Diagnosis' and cnCodedDiagnosis.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosis.voided = 0
        and cnCodedDiagnosisVC.name IN ('WHO stage I','P-WHO stage I (Peads Stage I)') and cnCodedDiagnosisVC.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosisVC.voided = 0
        and obsCodedDiagnosis.voided = 0
        and obsARTProgram.voided = 0
        and cnARTProgram.name = 'PR, Start date of ART program'
        and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED'
        and cnARTProgram.voided = 0
        and date(obsCodedDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
        and date(obsARTProgram.value_datetime ) between date('#startDate#') and date('#endDate#')
        AND (   /*ART program stop date should not be there OR ART program stop date
                should be greater or equal to Diagnosis date*/
                date(obsARTProgramStop.value_datetime) >= date(obsCodedDiagnosis.obs_datetime)
                OR date(obsARTProgramStop.value_datetime) is null
            )
        group by obsCodedDiagnosis.value_coded,
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
              AS D2NumberofNewPLHIVinCareinWHOStage1atRegistrationthisMonth
              group by Diagnosis
              order by Diagnosis desc
      ) AS D2


UNION ALL

/*D3. Number of new PLHIV in care in WHO Stage 2 at registration this month*/
SELECT * FROM
(
SELECT/*Pivoting the table*/
    Diagnosis as '-',
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
Select "D3. Number of new PLHIV in care in WHO Stage 2 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
Union ALL
Select "D3. Number of new PLHIV in care in P WHO Stage 2 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
UNION ALL
select
         CASE
         when cnCodedDiagnosisVC.name = 'WHO stage II' then "D3. Number of new PLHIV in care in WHO Stage 2 at registration this month"
         when cnCodedDiagnosisVC.name = 'P-WHO stage II (Peads Stage II)' then "D3. Number of new PLHIV in care in P WHO Stage 2 at registration this month" end as 'Diagnosis',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsFemale'
        from person p
        join obs obsCodedDiagnosis on p.person_id = obsCodedDiagnosis.person_id
        join concept_name cnCodedDiagnosis on obsCodedDiagnosis.concept_id = cnCodedDiagnosis.concept_id
        join concept_name cnCodedDiagnosisVC on obsCodedDiagnosis.value_coded = cnCodedDiagnosisVC.concept_id
        join obs obsARTProgram on p.person_id = obsARTProgram.person_id
        join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
        Left join obs obsARTProgramStop on p.person_id = obsARTProgramStop.person_id
        AND obsARTProgramStop.voided = 0
        AND obsARTProgramStop.concept_id = (
                                                Select concept_id
                                                from concept_name
                                                where
                                                name ='PR, ART Program Stop Date'
                                                AND concept_name_type = 'FULLY_SPECIFIED'
                                                and voided = 0
                                           )
        where
        cnCodedDiagnosis.name = 'Coded Diagnosis' and cnCodedDiagnosis.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosis.voided = 0
        and cnCodedDiagnosisVC.name IN ('WHO stage II','P-WHO stage II (Peads Stage II)') and cnCodedDiagnosisVC.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosisVC.voided = 0
        and obsCodedDiagnosis.voided = 0
        and obsARTProgram.voided = 0
        and cnARTProgram.name = 'PR, Start date of ART program'
        and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED'
        and cnARTProgram.voided = 0
        and date(obsCodedDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
        and date(obsARTProgram.value_datetime ) between date('#startDate#') and date('#endDate#')
        AND (   /*ART program stop date should not be there OR ART program stop date
                should be greater or equal to Diagnosis date*/
                date(obsARTProgramStop.value_datetime) >= date(obsCodedDiagnosis.obs_datetime)
                OR date(obsARTProgramStop.value_datetime) is null
            )
        group by obsCodedDiagnosis.value_coded,
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
              AS D3NumberofNewPLHIVinCareinWHOStage2atRegistrationthisMonth
              group by Diagnosis
              order by Diagnosis desc
) AS D3

UNION ALL

/*D4. Number of new PLHIV in care in WHO Stage 3 at registration this month*/
SELECT * From

(SELECT/*Pivoting the table*/
    Diagnosis as '-',
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
Select "D4. Number of new PLHIV in care in WHO Stage 3 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
Union ALL
Select "D4. Number of new PLHIV in care in P WHO Stage 3 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
UNION ALL
select
         CASE
         when cnCodedDiagnosisVC.name = 'WHO stage III' then "D4. Number of new PLHIV in care in WHO Stage 3 at registration this month"
         when cnCodedDiagnosisVC.name = 'P-WHO stage III (Peads Stage III)' then "D4. Number of new PLHIV in care in P WHO Stage 3 at registration this month" end as 'Diagnosis',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsFemale'
        from person p
        join obs obsCodedDiagnosis on p.person_id = obsCodedDiagnosis.person_id
        join concept_name cnCodedDiagnosis on obsCodedDiagnosis.concept_id = cnCodedDiagnosis.concept_id
        join concept_name cnCodedDiagnosisVC on obsCodedDiagnosis.value_coded = cnCodedDiagnosisVC.concept_id
        join obs obsARTProgram on p.person_id = obsARTProgram.person_id
        join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
        Left join obs obsARTProgramStop on p.person_id = obsARTProgramStop.person_id
        AND obsARTProgramStop.voided = 0
        AND obsARTProgramStop.concept_id = (
                                                Select concept_id
                                                from concept_name
                                                where
                                                name ='PR, ART Program Stop Date'
                                                AND concept_name_type = 'FULLY_SPECIFIED'
                                                and voided = 0
                                           )
        where
        cnCodedDiagnosis.name = 'Coded Diagnosis' and cnCodedDiagnosis.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosis.voided = 0
        and cnCodedDiagnosisVC.name IN ('WHO stage III','P-WHO stage III (Peads Stage III)') and cnCodedDiagnosisVC.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosisVC.voided = 0
        and obsCodedDiagnosis.voided = 0
        and obsARTProgram.voided = 0
        and cnARTProgram.name = 'PR, Start date of ART program'
        and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED'
        and cnARTProgram.voided = 0
        and date(obsCodedDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
        and date(obsARTProgram.value_datetime ) between date('#startDate#') and date('#endDate#')
        AND (   /*ART program stop date should not be there OR ART program stop date
                should be greater or equal to Diagnosis date*/
                date(obsARTProgramStop.value_datetime) >= date(obsCodedDiagnosis.obs_datetime)
                OR date(obsARTProgramStop.value_datetime) is null
            )
        group by obsCodedDiagnosis.value_coded,
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
              AS D4NumberofNewPLHIVinCareinWHOStage3atRegistrationthisMonth
              group by Diagnosis
              order by Diagnosis desc
  ) AS D4


UNION ALL

/*D5. Number of new PLHIV in care in WHO Stage 4 at registration this month*/
SELECT * FROM
(SELECT/*Pivoting the table*/
    Diagnosis as '-',
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
Select "D5. Number of new PLHIV in care in WHO Stage 4 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
Union ALL
Select "D5. Number of new PLHIV in care in P WHO Stage 4 at registration this month" as 'Diagnosis' ,null AS 'lessThan1yrMale',null as 'lessThan1yrFemale',
null as '1To9yrMale',null as '1To9yrFemale',null as '10To14yrMale',null as '10To14yrFemale',null as '15To19yrMale',null as '15To19yrFemale',null AS '20To24yrMale',
null AS '20To24yrFemale',null AS '25To29yrMale',null AS '25To29yrFemale',null AS '30To34yrMale',null AS '30To34yrFemale',null AS '35To39yrMale',null AS '35To39yrFemale',
null AS '40To49YrsMale',null AS '40To49YrsFemale',null AS 'GrtThan50YrsMale',null AS 'GrtThan50YrsFemale'
Union all
select
         CASE
         when cnCodedDiagnosisVC.name = 'WHO stage IV' then "D5. Number of new PLHIV in care in WHO Stage 4 at registration this month"
         when cnCodedDiagnosisVC.name = 'P-WHO stage IV (Peads Stage IV)' then "D5. Number of new PLHIV in care in P WHO Stage 4 at registration this month" end as 'Diagnosis',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') < 1 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'lessThan1yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 1 AND 9 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '1To9yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 10 AND 14 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '10To14yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 15 AND 19 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '15To19yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 20 AND 24 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '20To24yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 25 AND 29 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '25To29yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 30 AND 34 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '30To34yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 35 AND 39 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '35To39yrFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') BETWEEN 40 AND 49 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS '40To49YrsFemale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'M'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsMale',
         CASE WHEN timestampdiff(YEAR,p.birthdate,'#endDate#') >= 50 AND p.gender = 'F'
         THEN COUNT(distinct p.person_id)  END AS 'GrtThan50YrsFemale'
        from person p
        join obs obsCodedDiagnosis on p.person_id = obsCodedDiagnosis.person_id
        join concept_name cnCodedDiagnosis on obsCodedDiagnosis.concept_id = cnCodedDiagnosis.concept_id
        join concept_name cnCodedDiagnosisVC on obsCodedDiagnosis.value_coded = cnCodedDiagnosisVC.concept_id
        join obs obsARTProgram on p.person_id = obsARTProgram.person_id
        join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
        Left join obs obsARTProgramStop on p.person_id = obsARTProgramStop.person_id
        AND obsARTProgramStop.voided = 0
        AND obsARTProgramStop.concept_id = (
                                                Select concept_id
                                                from concept_name
                                                where
                                                name ='PR, ART Program Stop Date'
                                                AND concept_name_type = 'FULLY_SPECIFIED'
                                                and voided = 0
                                           )
        where
        cnCodedDiagnosis.name = 'Coded Diagnosis' and cnCodedDiagnosis.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosis.voided = 0
        and cnCodedDiagnosisVC.name IN ('WHO stage IV','P-WHO stage IV (Peads Stage IV)') and cnCodedDiagnosisVC.concept_name_type = 'FULLY_SPECIFIED' and cnCodedDiagnosisVC.voided = 0
        and obsCodedDiagnosis.voided = 0
        and obsARTProgram.voided = 0
        and cnARTProgram.name = 'PR, Start date of ART program'
        and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED'
        and cnARTProgram.voided = 0
        and date(obsCodedDiagnosis.obs_datetime) between date('#startDate#') and date('#endDate#')
        and date(obsARTProgram.value_datetime ) between date('#startDate#') and date('#endDate#')
        AND (   /*ART program stop date should not be there OR ART program stop date
                should be greater or equal to Diagnosis date*/
                date(obsARTProgramStop.value_datetime) >= date(obsCodedDiagnosis.obs_datetime)
                OR date(obsARTProgramStop.value_datetime) is null
            )
        group by obsCodedDiagnosis.value_coded,
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
              AS D5NumberofNewPLHIVinCareinWHOStage4atRegistrationthisMonth
              group by Diagnosis
              order by Diagnosis desc
) AS D5


UNION ALL

/*D6. Total number of PLHIV in care started on CTX prophylaxis (including TB patients) this month*/

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

UNION ALL

/*D7. Number of PLHIV in care on CTX developed adverse events this month*/

SELECT/*Pivoting the table*/
    "D7. Number of PLHIV in care on CTX developed adverse events this month." AS '-',
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
         "D7. Number of PLHIV in care on CTX developed adverse events this month.",
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
        select distinct
        person_id
        from obs
        where concept_id=
                        (select
                        concept_id
                        from concept_name
                        where concept_name.name='Coded Diagnosis'
                        and concept_name_type='FULLY_SPECIFIED' )
                        and value_coded in
                                      (select
                                       concept_id
                                       from concept_name
                                       where concept_name.name in ('SJS (cotrimoxazole)',
                                                                   'Skin (cotrimoxazole)',
                                                                   'Haematological (cotrimoxazole)',
                                                                   'Hypersensitivity (cotrimoxazole)')
                                      and concept_name_type='FULLY_SPECIFIED' )
        and voided = 0
        and date(obs_datetime) between date('#startDate#') and date('#endDate#')
    ) AS numberOfPLHIVInCareOnCTXDevelopedAdverseEventsThisMonth
  INNER JOIN person p ON p.person_id = numberOfPLHIVInCareOnCTXDevelopedAdverseEventsThisMonth.person_id
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
      ) AS MOHReportD7numberOfPLHIVInCareOnCTXDevelopedAdverseEventsThisMonth

UNION ALL

/*D8. Number of PLHIV in care stopping Cotrimoxazole prophylaxis due to adverse events this month*/

SELECT/*Pivoting the table*/
    "D8. Number of PLHIV in care stopping Cotrimoxazole prophylaxis due to adverse events this month" AS '-',
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
         "D8. Number of PLHIV in care stopping Cotrimoxazole prophylaxis due to adverse events this month",
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
            DISTINCT ordersForDrugname.patient_id
            FROM drug drugForDrugname
            JOIN drug_order drugOrder on drugOrder.drug_inventory_id = drugForDrugname.drug_id
            JOIN orders ordersForDrugname on drugOrder.order_id = ordersForDrugname.order_id
            Where drugForDrugname.name = 'Cotrimoxazole(prophylaxis)'
            AND ordersForDrugname.order_reason =
                                                (
                                                SELECT concept_id
                                                FROM concept_view
                                                WHERE concept_full_name = 'Adverse Effect'
                                                AND retired = 0
                                                )
            AND ordersForDrugname.order_action = ('DISCONTINUE')
            AND ordersForDrugname.voided = 0
            AND DATE(ordersForDrugname.date_activated)  BETWEEN ('#startDate#') AND ('#endDate#')

    ) AS numberOfPLHIVInCareStoppingCotrimoxazoleProphylaxisDueToAdverseEventsThisMonth
  INNER JOIN person p ON p.person_id = numberOfPLHIVInCareStoppingCotrimoxazoleProphylaxisDueToAdverseEventsThisMonth.patient_id
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
      ) AS MOHReportD8numberOfPLHIVInCareStoppingCotrimoxazoleProphylaxisDueToAdverseEventsThisMonth

UNION ALL

/*D9. Total number of PLHIV in care currently receiving CTX prophylaxis (including TB patients)*/
SELECT/*Pivoting the table*/
    'D9. Total number of PLHIV in care currently receiving CTX prophylaxis (including TB patients)' AS '-',
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
         'D9. Total number of PLHIV in care currently receiving CTX prophylaxis (including TB patients)',
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
        distinct ord.patient_id
        from orders ord
        join drug_order dro on ord.order_id = dro.order_id
        join drug on dro.drug_inventory_id = drug.drug_id
        where
        drug.name = 'Cotrimoxazole(prophylaxis)' and drug.retired = 0
        and date(ord.date_activated) <= date('#endDate#')
 ) AS totalnumberofPLHIVincarecurrentlyreceivingCTXprophylaxisincludingTBpatients
           INNER JOIN person p ON p.person_id = totalnumberofPLHIVincarecurrentlyreceivingCTXprophylaxisincludingTBpatients.patient_id
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
    ) AS D9TotalnumberofPLHIVincarecurrentlyreceivingCTXprophylaxisincludingTBpatients;

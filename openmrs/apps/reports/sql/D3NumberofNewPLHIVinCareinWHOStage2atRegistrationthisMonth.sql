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
              ;
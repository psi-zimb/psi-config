/*D23. Number of PLHIV in care newly enrolled eligible, and completed counseling sessions but not yet started on ART this month*/
SELECT/*Pivoting the table*/
    'D23. Number of PLHIV in care newly enrolled eligible, and completed counseling sessions but not yet started on ART this month' AS '-',
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
         'D23. Number of PLHIV in care newly enrolled eligible, and completed counseling sessions but not yet started on ART this month',
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
            Select 
            Distinct obsForInitialART.person_id
            from obs obsForInitialART
                  Inner Join obs obsForBasicOneAndArtOne
                                                      On obsForBasicOneAndArtOne.person_id = obsForInitialART.person_id
                  Inner join patient_identifier artNumber
                                                      on artNumber.patient_id = obsForBasicOneAndArtOne.person_id
                  where obsForInitialART.concept_id = (
                                                          SELECT concept_id
                                                          FROM concept_view
                                                          WHERE concept_full_name = 'Reason for visit'
                                                          AND retired=0  
                                                       )
                  and obsForInitialART.Value_coded = (
                                                          SELECT concept_id
                                                          FROM concept_view
                                                          WHERE concept_full_name = 'Initial ART service'
                                                          AND retired=0 
                                                          
                                                    ) 
                  AND obsForInitialART.voided = 0
                  AND obsForBasicOneAndArtOne.concept_id = (SELECT concept_id
                                                             FROM concept_view
                                                             WHERE concept_full_name = 'Reason for visit'
                                                             AND retired=0 
                                                                                      ) 
                  and obsForBasicOneAndArtOne.Value_coded =(
                                                            SELECT concept_id
                                                            FROM concept_view
                                                            WHERE concept_full_name = 'Basic 1 and ART 1 service'
                                                            AND retired=0 
                                                             )
                  AND obsForBasicOneAndArtOne.voided = 0
                  And artNumber.identifier_type = (
                                                  select
                                                  patient_identifier_type_id
                                                  from patient_identifier_type
                                                  where name = 'PREP/OI Identifier'
                                                  and retired = 0
                                                  and uniqueness_behavior = 'UNIQUE'
                                                  )
                  and artNumber.voided = 0
                  AND date(obsForBasicOneAndArtOne.obs_datetime) between date('#startDate#') AND date('#endDate#')
                  AND date(obsForInitialART.obs_datetime) between date('#startDate#') AND date('#endDate#')
                  And obsForInitialART.person_id not in (      Select patient_id
                                                               from orders
                                                               inner JOIN drug_order dord on dord.order_id = orders.order_id
                                                               inner JOIN drug drugRegime on dord.drug_inventory_id = drugRegime.drug_id
                                                               where drugRegime.name  IN ("Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
                                                                                          "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 400mg",
                                                                                          "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg + Nevirapine (NVP) 200mg",
                                                                                          "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg + Nevirapine (NVP) 50mg",
                                                                                          "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg",
                                                                                          "Tenofovir (TDF) 300mg + Emtricitabine 200mg",
                                                                                          "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg",
                                                                                          "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg",
                                                                                          "Abacavir 600mg / Lamivudine 300mg",
                                                                                          "Abacavir 60mg / Lamivudine 30mg",
                                                                                          "Atazanavir/Rtv 300/100 mg",
                                                                                          "Lopinavir/Rtv 80/20 mg/ml",
                                                                                          "Lopinavir/Rtv 100/25 mg",
                                                                                          "Lopinavir/Rtv 200/50 mg",
                                                                                          "Lamivudine (3TC) 150 mg", 
                                                                                          "Lamivudine (3TC) 50mg/5ml", 
                                                                                          "Efavirenz (EFV) 50 mg",
                                                                                          "Efavirenz (EFV) 200 mg",
                                                                                          "Efavirenz (EFV) 600 mg",
                                                                                          "Zidovudine (AZT) 300 mg", 
                                                                                          "Zidovudine (AZT) 100mg", 
                                                                                          "Zidovudine (AZT) 50mg/5ml",  
                                                                                          "Abacavir (ABC) 20mg/ml",
                                                                                          "Abacavir (ABC) 300 mg",
                                                                                          "Abacavir (ABC) 60mg",
                                                                                          "Nevirapine (NVP) 50mg/5ml",
                                                                                          "Nevirapine (NVP) 200mg",
                                                                                          "Didanosine (ddl) 125mg",
                                                                                          "Didanosine (ddl) 200mg",
                                                                                          "Didanosine (ddl) 250mg",
                                                                                          "Didanosine (ddl) 25mg",
                                                                                          "Didanosine (ddl) 400mg",
                                                                                          "Emitricitabine 200mg",
                                                                                          "Tenofovir 300mg",
                                                                                          "Indinavir 400mg", 
                                                                                          "Saquinavir 200mg")
                                                                and date(orders.date_activated) < date('#endDate#')
                                        )
                         
) AS numberOfPLHIVinCareNewlyEnrolled
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareNewlyEnrolled.person_id
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
    ) AS D23numberOfPLHIVinCareNewlyEnrolledEligibleAndCompletedCounselingSessionsButNotYetStartedOnARTthisMonth

UNION ALL

/*D24. Number of PLHIV in care retested for confirmation of HIV at ART initiation this month*/
SELECT/*Pivoting the table*/
    'D24. Number of PLHIV in care retested for confirmation of HIV at ART initiation this month' AS '-',
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
         'D24. Number of PLHIV in care retested for confirmation of HIV at ART initiation this month',
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
            select distinct person_id from obs where concept_id=
                                                   (
                                                    SELECT concept_id
                                                    FROM concept_view
                                                    wHERE concept_full_name = 'Reason for visit'
                                                    AND retired=0     
                                                   )  
                                          
                                   and value_coded=(
                                                     SELECT concept_id
                                                     FROM concept_view
                                                     WHERE concept_full_name = 'Initial ART service'
                                                     AND retired=0 
                                                   )
                                   
                             and date(obs_datetime) between date('#startDate#') and date('#endDate#')
                             and voided = 0
            
            ) AS numberOfPLHIVinCareNewlyEnrolled
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareNewlyEnrolled.person_id
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
    ) AS D24NumberOfPLHIVinCareRetestedForConfirmationOfHIVatARTinitiationThisMonth

UNION ALL

/*D25. Number of PLHIV in care newly starting on first line ART this month*/
SELECT/*Pivoting the table*/
    'D25. Number of PLHIV in care newly starting on first line ART this month' AS '-',
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
         'D25. Number of PLHIV in care newly starting on first line ART this month',
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
            select distinct firstLineStageStartDate.person_id
            from obs firstLineObs
                    Inner Join obs firstLineStageStartDate
                    On firstLineObs.obs_group_id = firstLineStageStartDate.obs_group_id
                    where firstLineObs.concept_id = 
                                                    (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Stage'
                                                        AND retired=0
                                                        ) 
                    and firstLineObs.value_coded = (
                                                    SELECT
                                                    concept_id
                                                    FROM concept_view
                                                    WHERE
                                                    concept_full_name = 'PR, 1st Line'
                                                    AND retired=0
                                                  )
                                                  
                    and firstLineObs.voided = 0
                    And firstLineStageStartDate.concept_id = (
                                                                SELECT
                                                                concept_id
                                                                FROM concept_view
                                                                WHERE
                                                                concept_full_name = 'PR, Start date of ART Stage'
                                                                AND retired=0
                                                                )
                    AND firstLineStageStartDate.voided = 0
                    and date(firstLineStageStartDate.value_datetime) between date('#startDate#') and date('#endDate#')

            
            ) AS numberOfPLHIVinCareNewlyEnrolled
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareNewlyEnrolled.person_id
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
    ) AS D25NumberOfPLHIVinCareNewlyStartingOnFirstLineARTthisMonth

UNION ALL

/*D26. Number of PLHIV in care who have died whilst on First line regimen this month*/
SELECT/*Pivoting the table*/
    'D26. Number of PLHIV in care who have died whilst on First line regimen this month' AS '-',
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
         'D26. Number of PLHIV in care who have died whilst on First line regimen this month',
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
            Select 
            distinct (obsToGetLastARTStageChangeDate.person_id)
            from obs obsToGetLastARTStageChangeDate

                                Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs
                                               where concept_id = (
                                                                 SELECT
                                                                 concept_id
                                                                 FROM concept_view
                                                                 WHERE
                                                                 concept_full_name = 'PR, Start date of ART Stage'
                                                                 AND retired=0
                                                                )
                                               and date(value_datetime) <= date('#endDate#')
                                               And voided = 0
                                               group by person_id
                                ) as lastARTStageDate
                                on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
                                ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
                                
                                Inner Join obs obsToCheckARTStageValue
                                on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                And obsToCheckARTStageValue.concept_id = 
                                                                        (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'PR, ART Stage'
                                                                            AND retired=0
                                                                        )
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsDeceased
                                on obsForCheckingIfPatientIsMarkedAsDeceased.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsDeceased.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Deceased'
                                                                                                AND retired=0
                                                                                            ) 
                                                                                              
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS numberOfPLHIVinCareWhoHaveDied 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareWhoHaveDied.person_id
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
    ) AS D26NumberOfPLHIVinCareWhoHaveDiedWhilstOnFirstLineRegimenThisMonth

    UNION ALL
    /*D27. Number of PLHIV in care lost to follow up whilst on First line regimen this month*/
SELECT/*Pivoting the table*/
    'D27. Number of PLHIV in care lost to follow up whilst on First line regimen this month' AS '-',
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
         'D27. Number of PLHIV in care lost to follow up whilst on First line regimen this month',
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
            Select 
distinct (obsToGetLastARTStageChangeDate.person_id)
from obs obsToGetLastARTStageChangeDate

                                Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs
                                               where concept_id = (
                                                                 SELECT
                                                                 concept_id
                                                                 FROM concept_view
                                                                 WHERE
                                                                 concept_full_name = 'PR, Start date of ART Stage'
                                                                 AND retired=0
                                                                )
                                               and date(value_datetime) <= date('#endDate#')
                                               And voided = 0
                                               group by person_id
                                ) as lastARTStageDate
                                on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
                                ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
                                Inner Join obs obsToCheckARTStageValue
                                on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                And obsToCheckARTStageValue.concept_id = 
                                                                        (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'PR, ART Stage'
                                                                            AND retired=0
                                                                        )                                         
                                Inner join obs obsForCheckingIfPatientIsMarkedAsDeceased
                                on obsForCheckingIfPatientIsMarkedAsDeceased.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsDeceased.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Lost to follow up'
                                                                                                AND retired=0
                                                                                            )      
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS numberOfPLHIVinCareWhoHaveDied 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareWhoHaveDied.person_id
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
    ) AS D27NumberOfPLHIVinCareLostToFollowUpWhilstOnFirstLineRegimenThisMonth

UNION ALL

/*D28. Number of PLHIV in care who have stopped treatment whilst on First line regimen this month*/
SELECT/*Pivoting the table*/
    'D28. Number of PLHIV in care who have stopped treatment whilst on First line regimen this month' AS '-',
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
         'D28. Number of PLHIV in care who have stopped treatment whilst on First line regimen this month',
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
               Select distinct (obsToGetLastARTStageChangeDate.person_id)
               from obs obsToGetLastARTStageChangeDate
               Inner Join 
                (/*Max ART program stage date per person before the end of reporting period*/
                              Select person_id, max(value_datetime) lastARTStageDateTime 
                              from obs 
                              where concept_id = (
                                                  SELECT
                                                  concept_id
                                                  FROM concept_view
                                                  WHERE
                                                  concept_full_name = 'PR, Start date of ART Stage'
                                                  AND retired=0
                                                 )
                              and date(value_datetime) <= date('#endDate#')
                              And voided = 0
                              group by person_id
              ) as lastARTStageDate
              on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
              ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
              Inner Join obs obsToCheckARTStageValue
              on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
              And obsToCheckARTStageValue.concept_id = (
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, ART Stage'
                                                            AND retired=0
                                                       )
              Inner join obs obsForARTStopDate
              on obsForARTStopDate.person_id = obsToCheckARTStageValue.person_id
              Where obsToCheckARTStageValue.value_coded = (
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, 1st Line'
                                                            AND retired=0
                                                          )
              And obsToCheckARTStageValue.voided = 0
              And obsToGetLastARTStageChangeDate.voided = 0
              AND obsForARTStopDate.concept_id =  (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Program Stop Date'
                                                        AND retired=0
                                                   )
               AND obsForARTStopDate.voided = 0
               AND obsForARTStopDate.obs_group_id in (
                                             /*Reason for stopping ART program as Treatment Failure*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsTreatmentFailureForStoppingART
                                                         WHERE reasonAsTreatmentFailureForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                            )
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Treatment failure'
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
) AS D28NumberofPLHIVincarewhohavestoppedTreatmentwhilstonFirstLineRegimenthismonth 
           INNER JOIN person p ON p.person_id = D28NumberofPLHIVincarewhohavestoppedTreatmentwhilstonFirstLineRegimenthismonth.person_id
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
    ) AS D28NumberofPLHIVincarewhohavestoppedTreatmentwhilstonFirstLineRegimenthismonth

UNION ALL
/*D29. Number of PLHIV in care who have transferred out whilst on First line regimen this month*/
SELECT/*Pivoting the table*/
    'D29. Number of PLHIV in care who have transferred out whilst on First line regimen this month' AS '-',
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
         'D29. Number of PLHIV in care who have transferred out whilst on First line regimen this month',
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
            Select 
distinct (obsToGetLastARTStageChangeDate.person_id)
from obs obsToGetLastARTStageChangeDate

                                Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs
                                               where concept_id = (
                                                                 SELECT
                                                                 concept_id
                                                                 FROM concept_view
                                                                 WHERE
                                                                 concept_full_name = 'PR, Start date of ART Stage'
                                                                 AND retired=0
                                                                )
                                               and date(value_datetime) <= '#endDate#'
                                               And voided = 0
                                               group by person_id
                                ) as lastARTStageDate
                                on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
                                ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
                                
                                Inner Join obs obsToCheckARTStageValue
                                on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                And obsToCheckARTStageValue.concept_id = 
                                                                        (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'PR, ART Stage'
                                                                            AND retired=0
                                                                        )
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsDeceased
                                on obsForCheckingIfPatientIsMarkedAsDeceased.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsDeceased.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            ) 
                                                                                              
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS numberOfPLHIVinCareWhoHaveDied 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareWhoHaveDied.person_id
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
    ) AS D29NumberOfPLHIVinCareWhoHaveTransferredOutWhilstOnFirstLineRegimenThisMonth
    
    UNION ALL
    /*D30. Number of PLHIV in care who have transferred in whilst on First line regimen this month*/
SELECT/*Pivoting the table*/
    'D30. Number of PLHIV in care who have transferred in whilst on First line regimen this month' AS '-',
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
         'D30. Number of PLHIV in care who have transferred in whilst on First line regimen this month',
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
                Select 
    distinct (obsToGetLastARTStageChangeDate.person_id)
    from obs obsToGetLastARTStageChangeDate
                                    Inner Join obs obsToCheckARTStageValue
                                    on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                    and obsToGetLastARTStageChangeDate.concept_id = (
                                                                                         SELECT
                                                                                         concept_id
                                                                                         FROM concept_view
                                                                                         WHERE
                                                                                         concept_full_name = 'PR, Start date of ART Stage'
                                                                                         AND retired=0
                                                                                    )
                                    and date(obsToGetLastARTStageChangeDate.value_datetime) <= date('#endDate#')
                                    And obsToCheckARTStageValue.concept_id = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, ART Stage'
                                                                                AND retired=0
                                                                            )    
                                    Inner join obs obsForCheckingTransferIn
                                    on obsForCheckingTransferIn.person_id = obsToCheckARTStageValue.person_id
                                    Where obsToCheckARTStageValue.value_coded = 
                                                                                (
                                                                                    SELECT
                                                                                    concept_id
                                                                                    FROM concept_view
                                                                                    WHERE
                                                                                    concept_full_name = 'PR, 1st Line'
                                                                                    AND retired=0
                                                                                )
                                    And obsForCheckingTransferIn.value_coded = (
                                                                                    SELECT
                                                                                    concept_id
                                                                                    FROM concept_view
                                                                                    WHERE
                                                                                    concept_full_name = 'Transfer in'
                                                                                    AND retired=0
                                                                               ) 
                                                                                                  
                                    And obsForCheckingTransferIn.voided = 0
                                    And obsToCheckARTStageValue.voided = 0
                                    And obsToGetLastARTStageChangeDate.voided = 0
                                    And date(obsForCheckingTransferIn.obs_datetime) = date(obsToGetLastARTStageChangeDate.value_datetime)
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
            ) AS numberOfPLHIVinCareWhoHaveTransferredIn 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareWhoHaveTransferredIn.person_id
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
    ) AS D30NumberOfPLHIVinCareWhoHaveTransferredInWhilstOnFirstLineRegimenThisMonth

    UNION ALL

/*D31. Number of PLHIV in care on First Line regimen who had adverse events this month*/
SELECT/*Pivoting the table*/
    'D31. Number of PLHIV in care on First Line regimen who had adverse events this month' AS '-',
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
         'D31. Number of PLHIV in care on First Line regimen who had adverse events this month',
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
          Select distinct(obsToGetLastARTStageChangeDate.person_id)
          from obs obsToGetLastARTStageChangeDate
               Inner Join (   /*Max ART program stage date per person before the end of reporting period*/
                               Select person_id, max(value_datetime) lastARTStageDateTime
                               from obs
                               where concept_id = (
                               SELECT
                               concept_id
                               FROM concept_view
                               WHERE
                               concept_full_name = 'PR, Start date of ART Stage'
                               AND retired=0
                               )
                               and date(value_datetime) <= date('#endDate#')
                               And voided = 0
                               group by person_id
                        ) as lastARTStageDate
        on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
        ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime                                
              Inner Join obs obsToCheckARTStageValue
       on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
      And obsToCheckARTStageValue.concept_id = 
                                                (
                                                    SELECT
                                                    concept_id
                                                    FROM concept_view
                                                    WHERE
                                                    concept_full_name = 'PR, ART Stage'
                                                    AND retired=0
                                                )                                         
        Inner join obs obsForCodedDiagnosis
        on obsForCodedDiagnosis.person_id = obsToCheckARTStageValue.person_id        
        inner join orders ordARVDrugOrderStopped on obsToCheckARTStageValue.person_id = ordARVDrugOrderStopped.patient_id
        and ordARVDrugOrderStopped.order_reason = (
                                                    SELECT
                                                    concept_id
                                                    FROM concept_view
                                                    WHERE
                                                    concept_full_name = 'Adverse Effect'
                                                    AND retired=0
                                                  )                              
        and ordARVDrugOrderStopped.previous_order_id IN ( Select orders1.order_id
                                                         from orders orders1
                                                         inner JOIN drug_order dord1 on dord1.order_id = orders1.order_id
                                                         inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
                                                          where ARVDrugs1.name  IN ( "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
                                                                      "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 400mg",
                                                                      "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg + Nevirapine (NVP) 200mg",
                                                                      "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg + Nevirapine (NVP) 50mg",
                                                                      "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg",
                                                                      "Tenofovir (TDF) 300mg + Emtricitabine 200mg",
                                                                      "Zidovudine (AZT) 300mg + Lamivudine (3TC) 150mg",
                                                                      "Zidovudine (AZT) 60mg + Lamivudine (3TC) 30mg",
                                                                      "Abacavir 600mg / Lamivudine 300mg",
                                                                      "Abacavir 60mg / Lamivudine 30mg",
                                                                      "Atazanavir/Rtv 300/100 mg",
                                                                      "Lopinavir/Rtv 80/20 mg/ml",
                                                                      "Lopinavir/Rtv 100/25 mg",
                                                                      "Lopinavir/Rtv 200/50 mg",
                                                                      "Lamivudine (3TC) 150 mg", 
                                                                      "Lamivudine (3TC) 50mg/5ml", 
                                                                      "Efavirenz (EFV) 50 mg",
                                                                      "Efavirenz (EFV) 200 mg",
                                                                      "Efavirenz (EFV) 600 mg",
                                                                      "Zidovudine (AZT) 300 mg", 
                                                                      "Zidovudine (AZT) 100mg", 
                                                                      "Zidovudine (AZT) 50mg/5ml",  
                                                                      "Abacavir (ABC) 20mg/ml",
                                                                      "Abacavir (ABC) 300 mg",
                                                                      "Abacavir (ABC) 60mg",
                                                                      "Nevirapine (NVP) 50mg/5ml",
                                                                      "Nevirapine (NVP) 200mg",
                                                                      "Didanosine (ddl) 125mg",
                                                                      "Didanosine (ddl) 200mg",
                                                                      "Didanosine (ddl) 250mg",
                                                                      "Didanosine (ddl) 25mg",
                                                                      "Didanosine (ddl) 400mg",
                                                                      "Emitricitabine 200mg",
                                                                      "Tenofovir 300mg",
                                                                      "Indinavir 400mg", 
                                                                      "Saquinavir 200mg") 
                                 and date(orders1.date_stopped) is not null
                                 and date(orders1.date_stopped) >= date(obsForCodedDiagnosis.obs_datetime)
                                                         )
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCodedDiagnosis.concept_id = (
                                                                          SELECT
                                                                          concept_id
                                                                          FROM concept_view
                                                                          WHERE
                                                                          concept_full_name = 'Coded Diagnosis'
                                                                          AND retired=0
                                                                       ) 
                                And obsForCodedDiagnosis.value_coded IN (
                                                                          SELECT
                                                                          concept_id
                                                                          FROM concept_view
                                                                          WHERE
                                                                          concept_full_name IN ( "Anemia (Zidovudine associated)",
                                                                                                "Cardiomyopathy (Zidovudine related)",
                                                                                                "Cardiovascular (Zidovudine)",
                                                                                                "Efavirenz drug reaction (to be reassigned)",
                                                                                                "Gastrointestinal (Lopinavir)",
                                                                                                "Haematological (zidovudine)",
                                                                                                "Hyperbilirubimia (Atazanavir)",
                                                                                                "Hypersensitivity (Abacavir)",
                                                                                                "Hypersensitivity (Efavirenz)",
                                                                                                "Hypersensitivity (Nevirapine)",
                                                                                                "Kidney (atazanavir)",
                                                                                                "Kidney (tenofovir)",
                                                                                                "Lipodystrophy (lopinavir)",
                                                                                                "Lipodystrophy (Zidovudine)",
                                                                                                "Liver (efavirenz)",
                                                                                                "Liver (Nevirapine)",
                                                                                                "Metabolic (atazanavir)",
                                                                                                "Metabolic (didanosine)",
                                                                                                "Metabolic (Lopinavir)",
                                                                                                "Metabolic (tenofovir)",
                                                                                                "Nervous System (Efavirenz)",
                                                                                                "Nervous System (stavudine)",
                                                                                                "Nevirapine drug reaction (to be reassigned)",
                                                                                                "Peripheral Sensory Polyneuropathy (d4T)",
                                                                                                "SJS (nevirapine)",
                                                                                                "Skin (efavirenz)",
                                                                                                "Skin (nevirapine)",
                                                                                                "Zidovudine Drug reaction (to be reassigned)"
                                                                                               )
                                                                                                AND retired=0
                                                                       )                                    
                                And obsForCodedDiagnosis.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                and ordARVDrugOrderStopped.order_type_id = 2
                                And date(obsForCodedDiagnosis.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCodedDiagnosis.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D31NumberofPLHIVincareonFirstLineregimenwhohadadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D31NumberofPLHIVincareonFirstLineregimenwhohadadverseeventsthismonth.person_id
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
    ) AS D31NumberofPLHIVincareonFirstLineregimenwhohadadverseeventsthismonth

    UNION ALL

    /*D36. Number of PLHIV in care who died whilst on second line ART regimen this month*/
SELECT/*Pivoting the table*/
    'D36. Number of PLHIV in care who died whilst on second line ART regimen this month' AS '-',
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
         'D36. Number of PLHIV in care who died whilst on second line ART regimen this month',
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
            Select 
distinct (obsToGetLastARTStageChangeDate.person_id)
from obs obsToGetLastARTStageChangeDate

                                Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs
                                               where concept_id = (
                                                                 SELECT
                                                                 concept_id
                                                                 FROM concept_view
                                                                 WHERE
                                                                 concept_full_name = 'PR, Start date of ART Stage'
                                                                 AND retired=0
                                                                )
                                               and date(value_datetime) <= '#startDate#'
                                               And voided = 0
                                               group by person_id
                                ) as lastARTStageDate
                                on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
                                ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
                                
                                Inner Join obs obsToCheckARTStageValue
                                on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                And obsToCheckARTStageValue.concept_id = 
                                                                        (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'PR, ART Stage'
                                                                            AND retired=0
                                                                        )
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsDeceased
                                on obsForCheckingIfPatientIsMarkedAsDeceased.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 2nd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsDeceased.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Deceased'
                                                                                                AND retired=0
                                                                                            ) 
                                                                                              
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
            ) AS numberOfPLHIVinCareWhoHaveDied 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareWhoHaveDied.person_id
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
    ) AS D36NumberOfPLHIVinCareWhoDiedWhilstOnSecondLineARTregimenThisMonth

UNION ALL
/*D37. Number of PLHIV in care lost to follow up whilst on second line regimen this month*/
SELECT/*Pivoting the table*/
    'D37. Number of PLHIV in care lost to follow up whilst on second line regimen this month' AS '-',
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
         'D37. Number of PLHIV in care lost to follow up whilst on second line regimen this month',
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
            Select 
distinct (obsToGetLastARTStageChangeDate.person_id)
from obs obsToGetLastARTStageChangeDate

                                Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs
                                               where concept_id = (
                                                                     SELECT
                                                                     concept_id
                                                                     FROM concept_view
                                                                     WHERE
                                                                     concept_full_name = 'PR, Start date of ART Stage'
                                                                     AND retired=0
                                                                    )
                                               and date(value_datetime) <= date('#endDate#')
                                               And voided = 0
                                               group by person_id
                                ) as lastARTStageDate
                                on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
                                ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
                                
                                Inner Join obs obsToCheckARTStageValue
                                on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
                                And obsToCheckARTStageValue.concept_id = 
                                                                        (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'PR, ART Stage'
                                                                            AND retired=0
                                                                        )
                                                                             
                                Inner join obs obsForLostToFollowUp
                                on obsForLostToFollowUp.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 2nd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForLostToFollowUp.concept_id = (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'AS, Activity status'
                                                                            AND retired=0
                                                                       ) 
                                And obsForLostToFollowUp.value_coded = (
                                                                            SELECT
                                                                            concept_id
                                                                            FROM concept_view
                                                                            WHERE
                                                                            concept_full_name = 'Lost to follow up'
                                                                            AND retired=0
                                                                        ) 
                                                                                              
                                And obsForLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
            ) AS numberOfPLHIVinCareLostToFollowUp 
           INNER JOIN person p ON p.person_id = numberOfPLHIVinCareLostToFollowUp.person_id
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
    ) AS D37NumberOfPLHIVinCareLostToFollowUpWhilstOnSecondLineRegimenThisMonth

UNION ALL

/*D38. Number of PLHIV in care who had stopped treatment whilst on second line regimen this month*/
SELECT/*Pivoting the table*/
    'D38. Number of PLHIV in care who had stopped treatment whilst on second line regimen this month' AS '-',
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
         'D38. Number of PLHIV in care who had stopped treatment whilst on second line regimen this month',
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
              Select distinct (obsToGetLastARTStageChangeDate.person_id)
               from obs obsToGetLastARTStageChangeDate
               Inner Join 
                (/*Max ART program stage date per person before the end of reporting period*/
                              Select person_id, max(value_datetime) lastARTStageDateTime 
                              from obs 
                              where concept_id = (
                                                  SELECT
                                                  concept_id
                                                  FROM concept_view
                                                  WHERE
                                                  concept_full_name = 'PR, Start date of ART Stage'
                                                  AND retired=0
                                                 )
                              and date(value_datetime) <= date('#endDate#')
                              And voided = 0
                              group by person_id
              ) as lastARTStageDate
              on obsToGetLastARTStageChangeDate.person_id = lastARTStageDate.person_id
              ANd obsToGetLastARTStageChangeDate.value_datetime = lastARTStageDate.lastARTStageDateTime
              Inner Join obs obsToCheckARTStageValue
              on obsToGetLastARTStageChangeDate.obs_group_id = obsToCheckARTStageValue.obs_group_id
              And obsToCheckARTStageValue.concept_id = (
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, ART Stage'
                                                            AND retired=0
                                                       )
              Inner join obs obsForARTStopDate
              on obsForARTStopDate.person_id = obsToCheckARTStageValue.person_id
              Where obsToCheckARTStageValue.value_coded = (
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, 2nd Line'
                                                            AND retired=0
                                                          )
              And obsToCheckARTStageValue.voided = 0
              And obsToGetLastARTStageChangeDate.voided = 0
              AND obsForARTStopDate.concept_id =  (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Program Stop Date'
                                                        AND retired=0
                                                   )
               AND obsForARTStopDate.voided = 0
               AND obsForARTStopDate.obs_group_id in (
                                             /*Reason for stopping ART program as Treatment Failure*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsTreatmentFailureForStoppingART
                                                         WHERE reasonAsTreatmentFailureForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                            )
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Treatment failure'
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D38NumberofPLHIVincarewhohadstoppedtreatmentwhilstonsecondlineregimenthismonth 
           INNER JOIN person p ON p.person_id = D38NumberofPLHIVincarewhohadstoppedtreatmentwhilstonsecondlineregimenthismonth.person_id
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
    ) AS D38NumberofPLHIVincarewhohadstoppedtreatmentwhilstonsecondlineregimenthismonth;
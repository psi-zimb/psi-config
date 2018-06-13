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
                                 AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
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
                                  AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
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
                                             /*Reason for stopping ART program as Hold / interrupt or PR, Patient's decision*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsHoldinterruptOrPatientsdecisionForStoppingART
                                                         WHERE reasonAsHoldinterruptOrPatientsdecisionForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                            )
                                                         AND  reasonAsHoldinterruptOrPatientsdecisionForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsHoldinterruptOrPatientsdecisionForStoppingART.person_id
                                                         AND reasonAsHoldinterruptOrPatientsdecisionForStoppingART.voided = 0
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
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)  
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
                                  AND obsForCodedDiagnosis.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                     Where date(obs.value_datetime) < (
                                      Select date(max(obs_datetime)) from obs WHERE voided = 0 and person_id = obsForCodedDiagnosis.person_id 
                                             and concept_id IN
                                                                       (
                                                                          SELECT
                                                                          concept_id
                                                                          FROM concept_view
                                                                          WHERE
                                                                          concept_full_name = 'Coded Diagnosis'
                                                                          AND retired=0
                                                                       )
                                            and value_coded IN         (
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
                                  )
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

    /*D32. Number of PLHIV in care on First Line regimen who stopped treatment due to severe adverse events this month*/
SELECT/*Pivoting the table*/
    'D32. Number of PLHIV in care on First Line regimen who stopped treatment due to severe adverse events this month' AS '-',
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
         'D32. Number of PLHIV in care on First Line regimen who stopped treatment due to severe adverse events this month',
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
              Inner join obs obsForCodedDiagnosis
              on obsForCodedDiagnosis.person_id = obsToCheckARTStageValue.person_id
              Inner join obs obsForARTStopDate
              on obsForARTStopDate.person_id = obsToCheckARTStageValue.person_id
              Where obsToCheckARTStageValue.value_coded = (/*Max ART program stage date per person to be 1st Line before the end of reporting period*/
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
            And obsForCodedDiagnosis.value_coded IN ( /*List of Coded Diagnosis*/
                                                          SELECT
                                                          concept_id
                                                          FROM concept_view
                                                          WHERE
                                                          concept_full_name IN ("Anemia (Zidovudine associated)",
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
                    ANd obsForCodedDiagnosis.obs_group_id not in
                                                    (/*Removing diagnosis group if there are any revisions*/
                                                                    
                                                        Select obs_group_id 
                                                        from obs WHERE concept_id = 51 
                                                        AND  value_coded = 1 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND date(obs.date_created) <= date('#endDate#')
                                                     )
                    AND obsForCodedDiagnosis.obs_group_id not in 
                                                     ( /*Removing ruled out diagnosis*/
                                                                      
                                                        Select obs_group_id 
                                                        from obs 
                                                        WHERE concept_id = 49 
                                                        AND  value_coded = 48 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND obs.obs_group_id = obsForCodedDiagnosis.obs_group_id
                                                        AND date(obs.obs_datetime) <= date('#endDate#')
                                                     )                                    
              And obsForCodedDiagnosis.voided = 0
              And obsToCheckARTStageValue.voided = 0
              And obsToGetLastARTStageChangeDate.voided = 0
              AND obsForARTStopDate.concept_id =  ( /*ART Program Stop Date*/
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Program Stop Date'
                                                        AND retired=0
                                                   )
               AND obsForARTStopDate.voided = 0
               AND obsForARTStopDate.obs_group_id in (/*Reason for stopping ART program as Adverse Effect-Event*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsAdverseEffectEventForStoppingART
                                                         WHERE reasonAsAdverseEffectEventForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                                )
                                                         AND reasonAsAdverseEffectEventForStoppingART.value_coded = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Adverse effect / event'
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsAdverseEffectEventForStoppingART.person_id
                                                         AND reasonAsAdverseEffectEventForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsForCodedDiagnosis.obs_datetime)
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D32NumberofPLHIVincareonFirstLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D32NumberofPLHIVincareonFirstLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth.person_id
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
    ) AS D32NumberofPLHIVincareonFirstLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth

    UNION ALL

/*D33. Number of PLHIV in care on first line Substituting due to toxicity this month*/
SELECT/*Pivoting the table*/
    'D33. Number of PLHIV in care on first line Substituting due to toxicity this month' AS '-',
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
         'D33. Number of PLHIV in care on first line Substituting due to toxicity this month',
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
    FROM (Select distinct obsToGetLastARTStageChangeDate.person_id,
          ordARVDrugOrderStopped.previous_order_id
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
          inner join orders ordARVDrugOrderStopped on obsToCheckARTStageValue.person_id = ordARVDrugOrderStopped.patient_id
          and ordARVDrugOrderStopped.order_reason = (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'Adverse Effect'
                                                        AND retired=0
                                                    )
          inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugOrderStopped.order_id
          inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
          Inner join      (
                            Select ordARVDrugNewlyPriscribed.order_id,
                            ordARVDrugNewlyPriscribed.patient_id,
                            ordARVDrugNewlyPriscribed.date_activated,
                            ARVDrugs1.drug_id                          
                            from 
                            orders ordARVDrugNewlyPriscribed 
                            inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugNewlyPriscribed.order_id
                            inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
                            where ARVDrugs1.name  IN (                "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                            And ordARVDrugNewlyPriscribed.order_action in('NEW','REVISE') /*Add other option too*/
                            AND date(ordARVDrugNewlyPriscribed.date_activated) between date('#startDate#') and date('#endDate#')
                          ) AS newlyPrescribedARVDrugsToPatient
              On newlyPrescribedARVDrugsToPatient.patient_id = obsToGetLastARTStageChangeDate.person_id
              inner join obs obsARTProgramStopDate on newlyPrescribedARVDrugsToPatient.patient_id = obsARTProgramStopDate.person_id
              where ARVDrugs1.name  IN      ( "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                                              "Saquinavir 200mg"
                                )                                                                  
                                 AND obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                        )
                                 AND obsARTProgramStopDate.person_id not in
                                 (/*Patient with ART stop date < new Drug prescription date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(newlyPrescribedARVDrugsToPatient.date_activated)
                                 )
                                And obsToCheckARTStageValue.voided = 0
                                AND ordARVDrugOrderStopped.order_action = 'DISCONTINUE'
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                AND newlyPrescribedARVDrugsToPatient.order_id != ordARVDrugOrderStopped.previous_order_id
                                AND DATE(newlyPrescribedARVDrugsToPatient.date_activated) >= DATE(ordARVDrugOrderStopped.date_activated)
                                AND newlyPrescribedARVDrugsToPatient.drug_id!= ARVDrugs1.drug_id
         ) AS D33NumberofPLHIVincareonfirstlineSubstitutingduetotoxicitythismonth 
           INNER JOIN person p ON p.person_id = D33NumberofPLHIVincareonfirstlineSubstitutingduetotoxicitythismonth.person_id
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
    ) AS D33NumberofPLHIVincareonfirstlineSubstitutingduetotoxicitythismonth

        UNION ALL

           /*D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)*/
    select setone.set as '-', /*setone - settwo : (D25 + D30 + D33) - (D26 + D27 + D28 + D29 + D35)*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as '<1 M',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as '<1 F',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as '1-9 M', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as '1-9 F',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as '10-14 M',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as '10-14 F',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as '15-19 M',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as '15-19 F',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as '20-24 M', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as '20-24 F',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as '25-29 M',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as '25-29 F',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as '30-34 M',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as '30-34 F',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 M',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 F',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as '40-49 M',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as '40-49 F',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as '>50 M',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as '>50 F'
         
   from
    (/*ADDITION OF REPORTS : D25 + D30 + D33*/
     SELECT/*Pivoting the table*/
    'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)',
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
    FROM (  /*D25. Number of PLHIV in care newly starting on first line ART this month*/
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
                
                UNION ALL
                /*D30. Number of PLHIV in care who have transferred in whilst on First line regimen this month*/
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)  
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
                             
                                   UNION ALL
                                   /*D33. Number of PLHIV in care on first line Substituting due to toxicity this month*/
                                   Select distinct obsToGetLastARTStageChangeDate.person_id
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
          inner join orders ordARVDrugOrderStopped on obsToCheckARTStageValue.person_id = ordARVDrugOrderStopped.patient_id
          and ordARVDrugOrderStopped.order_reason = (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'Adverse Effect'
                                                        AND retired=0
                                                    )
          inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugOrderStopped.order_id
          inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
          Inner join      (
                            Select ordARVDrugNewlyPriscribed.order_id,
                            ordARVDrugNewlyPriscribed.patient_id,
                            ordARVDrugNewlyPriscribed.date_activated,
                            ARVDrugs1.drug_id                          
                            from 
                            orders ordARVDrugNewlyPriscribed 
                            inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugNewlyPriscribed.order_id
                            inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
                            where ARVDrugs1.name  IN (                "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                            And ordARVDrugNewlyPriscribed.order_action in('NEW','REVISE') /*Add other option too*/
                            AND date(ordARVDrugNewlyPriscribed.date_activated) between date('#startDate#') and date('#endDate#')
                          ) AS newlyPrescribedARVDrugsToPatient
              On newlyPrescribedARVDrugsToPatient.patient_id = obsToGetLastARTStageChangeDate.person_id
              inner join obs obsARTProgramStopDate on newlyPrescribedARVDrugsToPatient.patient_id = obsARTProgramStopDate.person_id
              where ARVDrugs1.name  IN      ( "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                                              "Saquinavir 200mg"
                                )                                                                  
                                 AND obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                        )
                                 AND obsARTProgramStopDate.person_id not in
                                 (/*Patient with ART stop date < new Drug prescription date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(newlyPrescribedARVDrugsToPatient.date_activated)
                                 )
                                And obsToCheckARTStageValue.voided = 0
                                AND ordARVDrugOrderStopped.order_action = 'DISCONTINUE'
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                AND newlyPrescribedARVDrugsToPatient.order_id != ordARVDrugOrderStopped.previous_order_id
                                AND DATE(newlyPrescribedARVDrugsToPatient.date_activated) >= DATE(ordARVDrugOrderStopped.date_activated)
                                AND newlyPrescribedARVDrugsToPatient.drug_id!= ARVDrugs1.drug_id
        ) as D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth
        JOIN person p ON p.person_id = D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth.person_id
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
    ) AS D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth)
    as setone  
    
    INNER JOIN  
    
        (/*ADDITION OF REPORTS : D26 + D27 + D28 + D29 + D35*/
SELECT/*Pivoting the table*/
    'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)',
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
                                      /*D26. Number of PLHIV in care who have died whilst on First line regimen this month*/ 
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
                                                                     AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                                                     (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                                                     Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                                                     )                                                            
                                                                    And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                                                    And obsToCheckARTStageValue.voided = 0
                                                                    And obsToGetLastARTStageChangeDate.voided = 0
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')

                                           
              UNION ALL
                       /*D27. Number of PLHIV in care lost to follow up whilst on First line regimen this month*/            
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
                                                                                                               x                     FROM concept_view
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
                                                                      AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                                                     (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                                                     Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                                                     )      
                                                                    And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                                                    And obsToCheckARTStageValue.voided = 0
                                                                    And obsToGetLastARTStageChangeDate.voided = 0
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                                                    
                                                                    
            UNION ALL  
             /*D28. Number of PLHIV in care who have stopped treatment whilst on First line regimen this month*/
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
                                             /*Reason for stopping ART program as Hold / interrupt or PR, Patient's decision*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsHoldinterruptOrPatientsdecisionForStoppingART
                                                         WHERE reasonAsHoldinterruptOrPatientsdecisionForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                            )
                                                         AND reasonAsHoldinterruptOrPatientsdecisionForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsHoldinterruptOrPatientsdecisionForStoppingART.person_id
                                                         AND reasonAsHoldinterruptOrPatientsdecisionForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
                              
       UNION ALL
       /*D29. Number of PLHIV in care who have transferred out whilst on First line regimen this month*/
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
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                             
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                  union all 
                  /*D35. Number of PLHIV in care on First line switching to Second line this month*/
                  Select 
                            distinct obsToGetLastARTStageChangeDate.person_id
                                from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 2nd line */
                                                   Select max(obsART2ndLine.value_datetime)
                                                   from obs obsART2ndLine 
                                                   Where obsART2ndLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART2ndLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART2ndLine.voided = 0
                                                   
                                                   AND obsART2ndLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 2nd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART2ndLineStartDate
                                                                                      WHERE obsART2ndLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART2ndLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 2nd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART2ndLine.person_id = obsART2ndLineStartDate.person_id
                                                 AND obsART2ndLineStartDate.voided = 0
                                                  )
                                                 and date(obsART2ndLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART2ndLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 2nd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART2ndLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 1st Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
        ) as D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth
        JOIN person p ON p.person_id = D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth.person_id
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
    ) AS D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth)
    as settwo  
    on setone.set = settwo.set

    UNION ALL
    /*D35. Number of PLHIV in care on First line switching to Second line this month*/
SELECT/*Pivoting the table*/
    'D35. Number of PLHIV in care on First line switching to Second line this month' AS '-',
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
         'D35. Number of PLHIV in care on First line switching to Second line this month',
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
    FROM (Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 2nd line */
                                                   Select max(obsART2ndLine.value_datetime)
                                                   from obs obsART2ndLine 
                                                   Where obsART2ndLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART2ndLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART2ndLine.voided = 0
                                                   
                                                   AND obsART2ndLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 2nd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART2ndLineStartDate
                                                                                      WHERE obsART2ndLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART2ndLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 2nd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART2ndLine.person_id = obsART2ndLineStartDate.person_id
                                                 AND obsART2ndLineStartDate.voided = 0
                                                  )
                                                 and date(obsART2ndLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART2ndLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 2nd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART2ndLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 1st Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
   
            ) AS D35numberOfPLHIVinCareOnFirstLineSwitchingToSecondLineThisMonth 
           INNER JOIN person p ON p.person_id = D35numberOfPLHIVinCareOnFirstLineSwitchingToSecondLineThisMonth.person_id
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
    ) AS D35numberOfPLHIVinCareOnFirstLineSwitchingToSecondLineThisMonth
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
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
                                AND obsForLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForLostToFollowUp.obs_datetime)
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
                                             /*Reason for stopping ART program as Hold / Interrupt Or Patient’s Decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
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
    ) AS D38NumberofPLHIVincarewhohadstoppedtreatmentwhilstonsecondlineregimenthismonth

UNION ALL

/*D39. Number PLHIV in care transferred out whilst on second line regimen this month*/
SELECT/*Pivoting the table*/
    'D39. Number PLHIV in care transferred out whilst on second line regimen this month' AS '-',
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
         'D39. Number PLHIV in care transferred out whilst on second line regimen this month',
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferredOut
                                on obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 2nd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D39numberOfPLHIVinCareTransferredOutWhilstOnSecondLineRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D39numberOfPLHIVinCareTransferredOutWhilstOnSecondLineRegimenThisMonth.person_id
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
    ) AS D39numberOfPLHIVinCareTransferredOutWhilstOnSecondLineRegimenThisMonth

  UNION ALL
  /*D40. Number PLHIV in care transferred in on second line regimen this month*/
SELECT/*Pivoting the table*/
    'D40. Number PLHIV in care transferred in on second line regimen this month' AS '-',
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
         'D40. Number PLHIV in care transferred in on second line regimen this month',
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
                                                                                    concept_full_name = 'PR, 2nd Line'
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
 
            ) AS D40numberOfPLHIVinCareTransferredInOnSecondLineRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D40numberOfPLHIVinCareTransferredInOnSecondLineRegimenThisMonth.person_id
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
    ) AS D40numberOfPLHIVinCareTransferredInOnSecondLineRegimenThisMonth
UNION ALL

  /*D41. Number of PLHIV in care on second Line regimen who developed adverse events this month*/
SELECT/*Pivoting the table*/
    'D41. Number of PLHIV in care on second Line regimen who developed adverse events this month' AS '-',
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
         'D41. Number of PLHIV in care on second Line regimen who developed adverse events this month',
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
                                                                                concept_full_name = 'PR, 2nd Line'
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
                                  AND obsForCodedDiagnosis.person_id not in
                                 (/*Patient with ART stop date < Diagnosis given date will be excluded*/
                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                     Where date(obs.value_datetime) < (
                                      Select date(max(obs_datetime)) from obs WHERE voided = 0 and person_id = obsForCodedDiagnosis.person_id 
                                             and concept_id IN
                                                                       (
                                                                          SELECT
                                                                          concept_id
                                                                          FROM concept_view
                                                                          WHERE
                                                                          concept_full_name = 'Coded Diagnosis'
                                                                          AND retired=0
                                                                       )
                                            and value_coded IN         (
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
                                  )
                                 )                                     
                                And obsForCodedDiagnosis.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                and ordARVDrugOrderStopped.order_type_id = 2
                                And date(obsForCodedDiagnosis.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCodedDiagnosis.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D41NumberofPLHIVincareonsecondLineregimenwhodevelopedadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D41NumberofPLHIVincareonsecondLineregimenwhodevelopedadverseeventsthismonth.person_id
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
    ) AS D41NumberofPLHIVincareonsecondLineregimenwhodevelopedadverseeventsthismonth

UNION ALL

   /*D42. Number of PLHIV in care on second Line regimen who stopped treatment due to severe adverse events this month*/
SELECT/*Pivoting the table*/
    'D42. Number of PLHIV in care on second Line regimen who stopped treatment due to severe adverse events this month' AS '-',
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
         'D42. Number of PLHIV in care on second Line regimen who stopped treatment due to severe adverse events this month',
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
              Inner join obs obsForCodedDiagnosis
              on obsForCodedDiagnosis.person_id = obsToCheckARTStageValue.person_id
              Inner join obs obsForARTStopDate
              on obsForARTStopDate.person_id = obsToCheckARTStageValue.person_id
              Where obsToCheckARTStageValue.value_coded = (/*Max ART program stage date per person to be 2nd Line before the end of reporting period*/
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, 2nd Line'
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
            And obsForCodedDiagnosis.value_coded IN ( /*List of Coded Diagnosis*/
                                                          SELECT
                                                          concept_id
                                                          FROM concept_view
                                                          WHERE
                                                          concept_full_name IN ("Anemia (Zidovudine associated)",
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
                    ANd obsForCodedDiagnosis.obs_group_id not in
                                                    (/*Removing diagnosis group if there are any revisions*/
                                                                    
                                                        Select obs_group_id 
                                                        from obs WHERE concept_id = 51 
                                                        AND  value_coded = 1 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND date(obs.date_created) <= date('#endDate#')
                                                     )
                    AND obsForCodedDiagnosis.obs_group_id not in 
                                                     ( /*Removing ruled out diagnosis*/
                                                                      
                                                        Select obs_group_id 
                                                        from obs 
                                                        WHERE concept_id = 49 
                                                        AND  value_coded = 48 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND obs.obs_group_id = obsForCodedDiagnosis.obs_group_id
                                                        AND date(obs.obs_datetime) <= date('#endDate#')
                                                     )                                    
              And obsForCodedDiagnosis.voided = 0
              And obsToCheckARTStageValue.voided = 0
              And obsToGetLastARTStageChangeDate.voided = 0
              AND obsForARTStopDate.concept_id =  ( /*ART Program Stop Date*/
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Program Stop Date'
                                                        AND retired=0
                                                   )
               AND obsForARTStopDate.voided = 0
               AND obsForARTStopDate.obs_group_id in (/*Reason for stopping ART program as Adverse Effect-Event*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsAdverseEffectEventForStoppingART
                                                         WHERE reasonAsAdverseEffectEventForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                                )
                                                         AND reasonAsAdverseEffectEventForStoppingART.value_coded = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Adverse effect / event'
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsAdverseEffectEventForStoppingART.person_id
                                                         AND reasonAsAdverseEffectEventForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsForCodedDiagnosis.obs_datetime)
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D42NumberofPLHIVincareonsecondLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D42NumberofPLHIVincareonsecondLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth.person_id
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
    ) AS D42NumberofPLHIVincareonsecondLineregimenwhostoppedtreatmentduetosevereadverseeventsthismonth

UNION ALL

/*D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)*/
    select setone.set as '-', /*setone - settwo : (D35 + D40) - (D36 + D37 + D38 + D39 + D44)*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as '<1 M',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as '<1 F',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as '1-9 M', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as '1-9 F',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as '10-14 M',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as '10-14 F',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as '15-19 M',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as '15-19 F',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as '20-24 M', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as '20-24 F',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as '25-29 M',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as '25-29 F',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as '30-34 M',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as '30-34 F',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 M',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 F',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as '40-49 M',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as '40-49 F',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as '>50 M',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as '>50 F'
         
   from
    (/*ADDITION OF REPORTS : D35 + D40*/
     SELECT/*Pivoting the table*/
    'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)',
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
    (   /*D35. Number of PLHIV in care on First line switching to Second line this month*/
        Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 2nd line */
                                                   Select max(obsART2ndLine.value_datetime)
                                                   from obs obsART2ndLine 
                                                   Where obsART2ndLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART2ndLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART2ndLine.voided = 0
                                                   
                                                   AND obsART2ndLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 2nd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART2ndLineStartDate
                                                                                      WHERE obsART2ndLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART2ndLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 2nd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART2ndLine.person_id = obsART2ndLineStartDate.person_id
                                                 AND obsART2ndLineStartDate.voided = 0
                                                  )
                                                 and date(obsART2ndLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART2ndLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 2nd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART2ndLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 1st Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0

        UNION ALL
                /*D40. Number PLHIV in care transferred in on second line regimen this month*/
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
                                                                                    concept_full_name = 'PR, 2nd Line'
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
        ) as D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth
        JOIN person p ON p.person_id = D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth.person_id
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
    ) AS D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth)
    as setone  
    
    INNER JOIN  
    
        (/*ADDITION OF REPORTS : D36 + D37 + D38 + D39 + D44*/
SELECT/*Pivoting the table*/
    'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)',
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
    FROM (  /*D36. Number of PLHIV in care who died whilst on second line ART regimen this month*/
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')

                UNION ALL

                /*D37. Number of PLHIV in care lost to follow up whilst on second line regimen this month*/
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
                                AND obsForLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForLostToFollowUp.obs_datetime)
                                 )                                                             
                                And obsForLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')

                UNION ALL

                /*D38. Number of PLHIV in care who had stopped treatment whilst on second line regimen this month*/
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
                                             /*Reason for stopping ART program as Hold / Interrupt Or Patient’s Decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision") 
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')

             UNION ALL
             
             /*D39. Number PLHIV in care transferred out whilst on second line regimen this month*/
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferredOut
                                on obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 2nd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) between date('#startDate#') AND date('#endDate#')

            UNION ALL 

                /*D44. Number of PLHIV in care on Second line switching to Third line regimen this month*/
                Select 
                distinct obsToGetLastARTStageChangeDate.person_id
                from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 3rd line */
                                                   Select max(obsART3rdLine.value_datetime)
                                                   from obs obsART3rdLine 
                                                   Where obsART3rdLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART3rdLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART3rdLine.voided = 0
                                                   
                                                   AND obsART3rdLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 3rd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART3rdLineStartDate
                                                                                      WHERE obsART3rdLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART3rdLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 3rd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART3rdLine.person_id = obsART3rdLineStartDate.person_id
                                                 AND obsART3rdLineStartDate.voided = 0
                                                  )
                                                 and date(obsART3rdLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART3rdLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 3rd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART3rdLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 2nd Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0                

        ) as D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth
        JOIN person p ON p.person_id = D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth.person_id
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
    ) AS D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth)
    as settwo  
    on setone.set = settwo.set

    UNION ALL

     /*D44. Number of PLHIV in care on Second line switching to Third line regimen this month*/
SELECT/*Pivoting the table*/
    'D44. Number of PLHIV in care on Second line switching to Third line regimen this month' AS '-',
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
         'D44. Number of PLHIV in care on Second line switching to Third line regimen this month',
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
    FROM (Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 3rd line */
                                                   Select max(obsART3rdLine.value_datetime)
                                                   from obs obsART3rdLine 
                                                   Where obsART3rdLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART3rdLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART3rdLine.voided = 0
                                                   
                                                   AND obsART3rdLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 3rd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART3rdLineStartDate
                                                                                      WHERE obsART3rdLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART3rdLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 3rd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART3rdLine.person_id = obsART3rdLineStartDate.person_id
                                                 AND obsART3rdLineStartDate.voided = 0
                                                  )
                                                 and date(obsART3rdLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART3rdLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 3rd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART3rdLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 2nd Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
   
            ) AS D44NumberofPLHIVincareonSecondlineswitchingtoThirdlineregimenthismonth 
           INNER JOIN person p ON p.person_id = D44NumberofPLHIVincareonSecondlineswitchingtoThirdlineregimenthismonth.person_id
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
    ) AS D44NumberofPLHIVincareonSecondlineswitchingtoThirdlineregimenthismonth

UNION ALL
/*D45. Number of PLHIV in care who died whilst on Third line ART regimen this month*/
SELECT/*Pivoting the table*/
    'D45. Number of PLHIV in care who died whilst on Third line ART regimen this month' AS '-',
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
         'D45. Number of PLHIV in care who died whilst on Third line ART regimen this month',
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
                                                                                concept_full_name = 'PR, 3rd Line'
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer In date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D45numberOfPLHIVinCareWhoDiedWhilstOnThirdLineARTRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D45numberOfPLHIVinCareWhoDiedWhilstOnThirdLineARTRegimenThisMonth.person_id
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
    ) AS D45numberOfPLHIVinCareWhoDiedWhilstOnThirdLineARTRegimenThisMonth
UNION ALL
/*D46. Number of PLHIV lost to follow up whilst on Third line regimen this month*/
SELECT/*Pivoting the table*/
    'D46. Number of PLHIV lost to follow up whilst on Third line regimen this month' AS '-',
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
         'D46. Number of PLHIV lost to follow up whilst on Third line regimen this month',
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsLostToFollowUp
                                on obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Lost to follow up'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost To Follow Up date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D46numberOfPLHIVlostToFollowUpWhilstOnThirdLineRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D46numberOfPLHIVlostToFollowUpWhilstOnThirdLineRegimenThisMonth.person_id
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
    ) AS D46numberOfPLHIVlostToFollowUpWhilstOnThirdLineRegimenThisMonth

    UNION ALL

    /*D47. Number of PLHIV in care who stopped treatment whilst on Third line regimen this month*/
SELECT/*Pivoting the table*/
    'D47. Number of PLHIV in care who stopped treatment whilst on Third line regimen this month' AS '-',
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
         'D47. Number of PLHIV in care who stopped treatment whilst on Third line regimen this month',
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
                                                            concept_full_name = 'PR, 3rd Line'
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
                                             /*Reason for stopping ART program as Hold / Interrupt Or Patient’s Decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
) AS D47NumberofPLHIVincarewhostoppedtreatmentwhilstonThirdlineregimenthismonth 
           INNER JOIN person p ON p.person_id = D47NumberofPLHIVincarewhostoppedtreatmentwhilstonThirdlineregimenthismonth.person_id
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
    ) AS D47NumberofPLHIVincarewhostoppedtreatmentwhilstonThirdlineregimenthismonth

  UNION ALL

    /*D48. Number PLHIV in care transferred out whilst on Third line regimen this month*/
SELECT/*Pivoting the table*/
    'D48. Number PLHIV in care transferred out whilst on Third line regimen this month' AS '-',
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
         'D48. Number PLHIV in care transferred out whilst on Third line regimen this month',
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferOut
                                on obsForCheckingIfPatientIsMarkedAsTransferOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.concept_id = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'AS, Activity status'
                                                                                                    AND retired=0
                                                                                                  ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.value_coded = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'Transfer Out'
                                                                                                    AND retired=0
                                                                                                   )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D48numberOfPLHIVinCareTransferredOutWhilstOnThirdLineRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D48numberOfPLHIVinCareTransferredOutWhilstOnThirdLineRegimenThisMonth.person_id
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
    ) AS D48numberOfPLHIVinCareTransferredOutWhilstOnThirdLineRegimenThisMonth
UNION ALL

/*D49. Number PLHIV in care transferred in on Third line regimen this month*/
SELECT/*Pivoting the table*/
    'D49. Number PLHIV in care transferred in on Third line regimen this month' AS '-',
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
         'D49. Number PLHIV in care transferred in on Third line regimen this month',
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
                                                                                    concept_full_name = 'PR, 3rd Line'
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D49numberPLHIVinCareTransferredInOnThirdLineRegimenThisMonth 
           INNER JOIN person p ON p.person_id = D49numberPLHIVinCareTransferredInOnThirdLineRegimenThisMonth.person_id
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
    ) AS D49numberPLHIVinCareTransferredInOnThirdLineRegimenThisMonth

UNION ALL

  /*D50. Number of PLHIV in care on Third Line ART who developed adverse events this month*/
SELECT/*Pivoting the table*/
    'D50. Number of PLHIV in care on Third Line ART who developed adverse events this month' AS '-',
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
         'D50. Number of PLHIV in care on Third Line ART who developed adverse events this month',
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
                                                                                concept_full_name = 'PR, 3rd Line'
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
                                  AND obsForCodedDiagnosis.person_id not in
                                 (/*Patient with ART stop date < Diagnosis given date will be excluded*/
                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                     Where date(obs.value_datetime) < (
                                      Select date(max(obs_datetime)) from obs WHERE voided = 0 and person_id = obsForCodedDiagnosis.person_id 
                                             and concept_id IN
                                                                       (
                                                                          SELECT
                                                                          concept_id
                                                                          FROM concept_view
                                                                          WHERE
                                                                          concept_full_name = 'Coded Diagnosis'
                                                                          AND retired=0
                                                                       )
                                            and value_coded IN         (
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
                                  )
                                 )                                     
                                And obsForCodedDiagnosis.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                and ordARVDrugOrderStopped.order_type_id = 2
                                And date(obsForCodedDiagnosis.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCodedDiagnosis.obs_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D50NumberofPLHIVincareonThirdLineARTwhodevelopedadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D50NumberofPLHIVincareonThirdLineARTwhodevelopedadverseeventsthismonth.person_id
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
    ) AS D50NumberofPLHIVincareonThirdLineARTwhodevelopedadverseeventsthismonth

UNION ALL

    /*D51. Number of PLHIV in care on Third Line ART regimen who had stopped due to adverse events this month*/
SELECT/*Pivoting the table*/
    'D51. Number of PLHIV in care on Third Line ART regimen who had stopped due to adverse events this month' AS '-',
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
         'D51. Number of PLHIV in care on Third Line ART regimen who had stopped due to adverse events this month',
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
              Inner join obs obsForCodedDiagnosis
              on obsForCodedDiagnosis.person_id = obsToCheckARTStageValue.person_id
              Inner join obs obsForARTStopDate
              on obsForARTStopDate.person_id = obsToCheckARTStageValue.person_id
              Where obsToCheckARTStageValue.value_coded = (/*Max ART program stage date per person to be 3rd Line before the end of reporting period*/
                                                            SELECT
                                                            concept_id
                                                            FROM concept_view
                                                            WHERE
                                                            concept_full_name = 'PR, 3rd Line'
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
            And obsForCodedDiagnosis.value_coded IN ( /*List of Coded Diagnosis*/
                                                          SELECT
                                                          concept_id
                                                          FROM concept_view
                                                          WHERE
                                                          concept_full_name IN ("Anemia (Zidovudine associated)",
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
                    ANd obsForCodedDiagnosis.obs_group_id not in
                                                    (/*Removing diagnosis group if there are any revisions*/
                                                                    
                                                        Select obs_group_id 
                                                        from obs WHERE concept_id = 51 
                                                        AND  value_coded = 1 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND date(obs.date_created) <= date('#endDate#')
                                                     )
                    AND obsForCodedDiagnosis.obs_group_id not in 
                                                     ( /*Removing ruled out diagnosis*/
                                                                      
                                                        Select obs_group_id 
                                                        from obs 
                                                        WHERE concept_id = 49 
                                                        AND  value_coded = 48 
                                                        AND voided=0 
                                                        AND obs_group_id is not null
                                                        AND obs.person_id = obsForCodedDiagnosis.person_id
                                                        AND obs.obs_group_id = obsForCodedDiagnosis.obs_group_id
                                                        AND date(obs.obs_datetime) <= date('#endDate#')
                                                     )                                    
              And obsForCodedDiagnosis.voided = 0
              And obsToCheckARTStageValue.voided = 0
              And obsToGetLastARTStageChangeDate.voided = 0
              AND obsForARTStopDate.concept_id =  ( /*ART Program Stop Date*/
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'PR, ART Program Stop Date'
                                                        AND retired=0
                                                   )
               AND obsForARTStopDate.voided = 0
               AND obsForARTStopDate.obs_group_id in (/*Reason for stopping ART program as Adverse Effect-Event*/
                                                         SELECT obs_group_id
                                                         from obs reasonAsAdverseEffectEventForStoppingART
                                                         WHERE reasonAsAdverseEffectEventForStoppingART.concept_id = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Reason for Stopping ART Program'
                                                                                                              AND retired=0
                                                                                                                )
                                                         AND reasonAsAdverseEffectEventForStoppingART.value_coded = (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name = 'PR, Adverse effect / event'
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsAdverseEffectEventForStoppingART.person_id
                                                         AND reasonAsAdverseEffectEventForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsForCodedDiagnosis.obs_datetime)
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
            ) AS D51NumberofPLHIVincareonThirdLineARTregimenwhohadstoppedduetoadverseeventsthismonth 
           INNER JOIN person p ON p.person_id = D51NumberofPLHIVincareonThirdLineARTregimenwhohadstoppedduetoadverseeventsthismonth.person_id
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
    ) AS D51NumberofPLHIVincareonThirdLineARTregimenwhohadstoppedduetoadverseeventsthismonth

UNION ALL
/*D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month).*/
    select setone.set as '-', /*setone - settwo : (D44 + D49) - (D45 + D46 + D47 + D48 )*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as '<1 M',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as '<1 F',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as '1-9 M', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as '1-9 F',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as '10-14 M',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as '10-14 F',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as '15-19 M',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as '15-19 F',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as '20-24 M', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as '20-24 F',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as '25-29 M',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as '25-29 F',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as '30-34 M',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as '30-34 F',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 M',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as '35-39 F',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as '40-49 M',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as '40-49 F',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as '>50 M',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as '>50 F'
         
   from
    (/*ADDITION OF REPORTS : D44 + D49*/
    SELECT/*Pivoting the table*/
    'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)',
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
    /*D44. Number of PLHIV in care on Second line switching to Third line regimen this month*/
    Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 3rd line */
                                                   Select max(obsART3rdLine.value_datetime)
                                                   from obs obsART3rdLine 
                                                   Where obsART3rdLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART3rdLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART3rdLine.voided = 0
                                                   
                                                   AND obsART3rdLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 3rd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART3rdLineStartDate
                                                                                      WHERE obsART3rdLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART3rdLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 3rd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART3rdLine.person_id = obsART3rdLineStartDate.person_id
                                                 AND obsART3rdLineStartDate.voided = 0
                                                  )
                                                 and date(obsART3rdLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART3rdLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 3rd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART3rdLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 2nd Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
                               
             union all 
             /*D49. Number PLHIV in care transferred in on Third line regimen this month*/
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
                                                                                    concept_full_name = 'PR, 3rd Line'
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
   
            ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART 
           INNER JOIN person p ON p.person_id = D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART.person_id
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
    ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART)
    as setone
    inner join
    
   (/*ADDITION OF REPORTS : D45 + D46 + D47 + D48*/
SELECT/*Pivoting the table*/
    'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)',
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
    FROM (  /*D45. Number of PLHIV in care who died whilst on Third line ART regimen this month*/
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
                                                                                concept_full_name = 'PR, 3rd Line'
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer In date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
                                UNION ALL
                                
                                /*D46. Number of PLHIV lost to follow up whilst on Third line regimen this month*/
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsLostToFollowUp
                                on obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Lost to follow up'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost To Follow Up date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
                                UNION ALL 
                                /*D47. Number of PLHIV in care who stopped treatment whilst on Third line regimen this month*/
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
                                                            concept_full_name = 'PR, 3rd Line'
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
                                             /*Reason for stopping ART program as Hold / Interrupt Or Patient’s Decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
                              
                              UNION ALL
                              
                              /*D48. Number PLHIV in care transferred out whilst on Third line regimen this month*/
                              
                              Select
                              distinct obsToGetLastARTStageChangeDate.person_id
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferOut
                                on obsForCheckingIfPatientIsMarkedAsTransferOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.concept_id = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'AS, Activity status'
                                                                                                    AND retired=0
                                                                                                  ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.value_coded = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'Transfer Out'
                                                                                                    AND retired=0
                                                                                                   )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
        ) as D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART
        JOIN person p ON p.person_id = D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART.person_id
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
    ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART)
    as settwo  
    on setone.set = settwo.set

    UNION ALL

    /*D53. Total number of PLHIV care currently receiving ART this month*/
    SELECT/*Pivoting the table*/
    'D53. Total number of PLHIV care currently receiving ART this month' AS '-',
    SUM(lessthanOneMale) AS '<1 M',
    SUM(lessthanOneFemale) AS '<1 F',
    SUM(OnetoNineMale) AS '1-9 M',
    SUM(OnetoNineFemale) AS '1-9 F',
    SUM(TentoFourteenMale) AS '10-14 M',
    SUM(TentoFourteenFemale) AS '10-14 F',
    SUM(FifteentoNineteenMale) AS '15-19 M',
    SUM(FifteentoNineteenFemale) AS '15-19 F',
    SUM(TwentytoTwentyFourMale) AS '20-24 M',
    SUM(TwentytoTwentyFourFemale) AS '20-24 F',
    SUM(TwentyFivetoTwentyNineMale) AS '25-29 M',
    SUM(TwentyFivetoTwentyNineFemale) AS '25-29 F',
    SUM(ThirtytoThirtyFourMale) AS '30-34 M',
    SUM(ThirtytoThirtyFourFemale) AS '30-34 F',
    SUM(ThirtyFivetoThirtyNineMale) AS '35-39 M',
    SUM(ThirtyFivetoThirtyNineFemale) AS '35-39 F',
    SUM(FortytoFortyNineMale) AS '40-49 M',
    SUM(FortytoFortyNineFemale) AS '40-49 F',
    SUM(GreaterthanFiftyMale) AS '>50 M',
    SUM(GreaterthanFiftyFemale) AS '>50 F'
    FROM  
    (/*D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)*/
    select setone.set as '-', /*setone - settwo : (D25 + D30 + D33) - (D26 + D27 + D28 + D29 + D35)*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as 'lessthanOneMale',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as 'lessthanOneFemale',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as 'OnetoNineMale', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as 'OnetoNineFemale',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as 'TentoFourteenMale',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as 'TentoFourteenFemale',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as 'FifteentoNineteenMale',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as 'FifteentoNineteenFemale',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as 'TwentytoTwentyFourMale', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as 'TwentytoTwentyFourFemale',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as 'TwentyFivetoTwentyNineMale',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as 'TwentyFivetoTwentyNineFemale',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as 'ThirtytoThirtyFourMale',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as 'ThirtytoThirtyFourFemale',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineMale',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineFemale',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as 'FortytoFortyNineMale',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as 'FortytoFortyNineFemale',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as 'GreaterthanFiftyMale',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as 'GreaterthanFiftyFemale'
         
   from
    (/*ADDITION OF REPORTS : D25 + D30 + D33*/
     SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)',
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
    FROM (  /*D25. Number of PLHIV in care newly starting on first line ART this month*/
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
                
                UNION ALL
                /*D30. Number of PLHIV in care who have transferred in whilst on First line regimen this month*/
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)  
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
                             
                                   UNION ALL
                                   /*D33. Number of PLHIV in care on first line Substituting due to toxicity this month*/
                                   Select distinct obsToGetLastARTStageChangeDate.person_id
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
          inner join orders ordARVDrugOrderStopped on obsToCheckARTStageValue.person_id = ordARVDrugOrderStopped.patient_id
          and ordARVDrugOrderStopped.order_reason = (
                                                        SELECT
                                                        concept_id
                                                        FROM concept_view
                                                        WHERE
                                                        concept_full_name = 'Adverse Effect'
                                                        AND retired=0
                                                    )
          inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugOrderStopped.order_id
          inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
          Inner join      (
                            Select ordARVDrugNewlyPriscribed.order_id,
                            ordARVDrugNewlyPriscribed.patient_id,
                            ordARVDrugNewlyPriscribed.date_activated,
                            ARVDrugs1.drug_id                          
                            from 
                            orders ordARVDrugNewlyPriscribed 
                            inner JOIN drug_order dord1 on dord1.order_id = ordARVDrugNewlyPriscribed.order_id
                            inner JOIN drug ARVDrugs1 on dord1.drug_inventory_id = ARVDrugs1.drug_id
                            where ARVDrugs1.name  IN (                "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                            And ordARVDrugNewlyPriscribed.order_action in('NEW','REVISE') /*Add other option too*/
                            AND date(ordARVDrugNewlyPriscribed.date_activated) between date('#startDate#') and date('#endDate#')
                          ) AS newlyPrescribedARVDrugsToPatient
              On newlyPrescribedARVDrugsToPatient.patient_id = obsToGetLastARTStageChangeDate.person_id
              inner join obs obsARTProgramStopDate on newlyPrescribedARVDrugsToPatient.patient_id = obsARTProgramStopDate.person_id
              where ARVDrugs1.name  IN      ( "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                                              "Saquinavir 200mg"
                                )                                                                  
                                 AND obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 1st Line'
                                                                                AND retired=0
                                                                        )
                                 AND obsARTProgramStopDate.person_id not in
                                 (/*Patient with ART stop date < new Drug prescription date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(newlyPrescribedARVDrugsToPatient.date_activated)
                                 )
                                And obsToCheckARTStageValue.voided = 0
                                AND ordARVDrugOrderStopped.order_action = 'DISCONTINUE'
                                And obsToGetLastARTStageChangeDate.voided = 0
                                and ordARVDrugOrderStopped.voided = 0
                                AND newlyPrescribedARVDrugsToPatient.order_id != ordARVDrugOrderStopped.previous_order_id
                                AND DATE(newlyPrescribedARVDrugsToPatient.date_activated) >= DATE(ordARVDrugOrderStopped.date_activated)
                                AND newlyPrescribedARVDrugsToPatient.drug_id!= ARVDrugs1.drug_id
        ) as D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth
        JOIN person p ON p.person_id = D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth.person_id
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
    ) AS D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth)
    as setone  
    
    INNER JOIN  
    
        (/*ADDITION OF REPORTS : D26 + D27 + D28 + D29 + D35*/
SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D34. Total number of PLHIV in care currently  receiving first line ART This month (including those initiated during the current month)',
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
                                      /*D26. Number of PLHIV in care who have died whilst on First line regimen this month*/ 
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
                                                                     AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                                                     (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                                                     Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                                                     )                                                            
                                                                    And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                                                    And obsToCheckARTStageValue.voided = 0
                                                                    And obsToGetLastARTStageChangeDate.voided = 0
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')

                                           
              UNION ALL
                       /*D27. Number of PLHIV in care lost to follow up whilst on First line regimen this month*/            
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
                                                                                                               x                     FROM concept_view
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
                                                                      AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                                                     (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                                                     SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                                                     AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                                                     Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                                                     )      
                                                                    And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                                                    And obsToCheckARTStageValue.voided = 0
                                                                    And obsToGetLastARTStageChangeDate.voided = 0
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                                                    And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                                                    
                                                                    
            UNION ALL  
             /*D28. Number of PLHIV in care who have stopped treatment whilst on First line regimen this month*/
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
                                             /*Reason for stopping ART program as Hold / interrupt or PR, Patient's decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
                              
       UNION ALL
       /*D29. Number of PLHIV in care who have transferred out whilst on First line regimen this month*/
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
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                             
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                  union all 
                  /*D35. Number of PLHIV in care on First line switching to Second line this month*/
                  Select 
                            distinct obsToGetLastARTStageChangeDate.person_id
                                from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 2nd line */
                                                   Select max(obsART2ndLine.value_datetime)
                                                   from obs obsART2ndLine 
                                                   Where obsART2ndLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART2ndLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART2ndLine.voided = 0
                                                   
                                                   AND obsART2ndLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 2nd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART2ndLineStartDate
                                                                                      WHERE obsART2ndLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART2ndLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 2nd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART2ndLine.person_id = obsART2ndLineStartDate.person_id
                                                 AND obsART2ndLineStartDate.voided = 0
                                                  )
                                                 and date(obsART2ndLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART2ndLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 2nd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART2ndLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 1st Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
        ) as D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth
        JOIN person p ON p.person_id = D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth.person_id
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
    ) AS D34TotalnumberofPLHIVincarecurrentlyreceivingfirstlineARTThismonth)
    as settwo  
    on setone.set = settwo.set
    
    union all
    
    /*D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)*/
    select setone.set as '-', /*setone - settwo : (D35 + D40) - (D36 + D37 + D38 + D39 + D44)*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as 'lessthanOneMale',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as 'lessthanOneFemale',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as 'OnetoNineMale', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as 'OnetoNineFemale',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as 'TentoFourteenMale',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as 'TentoFourteenFemale',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as 'FifteentoNineteenMale',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as 'FifteentoNineteenFemale',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as 'TwentytoTwentyFourMale', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as 'TwentytoTwentyFourFemale',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as 'TwentyFivetoTwentyNineMale',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as 'TwentyFivetoTwentyNineFemale',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as 'ThirtytoThirtyFourMale',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as 'ThirtytoThirtyFourFemale',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineMale',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineFemale',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as 'FortytoFortyNineMale',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as 'FortytoFortyNineFemale',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as 'GreaterthanFiftyMale',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as 'GreaterthanFiftyFemale'
         
   from
    (/*ADDITION OF REPORTS : D35 + D40*/
     SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)',
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
    (   /*D35. Number of PLHIV in care on First line switching to Second line this month*/
        Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 2nd line */
                                                   Select max(obsART2ndLine.value_datetime)
                                                   from obs obsART2ndLine 
                                                   Where obsART2ndLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART2ndLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART2ndLine.voided = 0
                                                   
                                                   AND obsART2ndLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 2nd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART2ndLineStartDate
                                                                                      WHERE obsART2ndLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART2ndLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 2nd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART2ndLine.person_id = obsART2ndLineStartDate.person_id
                                                 AND obsART2ndLineStartDate.voided = 0
                                                  )
                                                 and date(obsART2ndLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART2ndLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 2nd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART2ndLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 1st Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0

        UNION ALL
                /*D40. Number PLHIV in care transferred in on second line regimen this month*/
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
                                                                                    concept_full_name = 'PR, 2nd Line'
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
        ) as D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth
        JOIN person p ON p.person_id = D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth.person_id
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
    ) AS D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth)
    as setone  
    
    INNER JOIN  
    
        (/*ADDITION OF REPORTS : D36 + D37 + D38 + D39 + D44*/
SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D43. Total number of PLHIV in care currently receiving Second line ART (including those switched during the current month)',
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
    FROM (  /*D36. Number of PLHIV in care who died whilst on second line ART regimen this month*/
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Deceased date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')

                UNION ALL

                /*D37. Number of PLHIV in care lost to follow up whilst on second line regimen this month*/
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
                                AND obsForLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost to follow up date will be excluded*/
                                 SELECT obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id
                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" AND obs.voided=0
                                 Where date(obs.value_datetime) < Date(obsForLostToFollowUp.obs_datetime)
                                 )                                                             
                                And obsForLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')

                UNION ALL

                /*D38. Number of PLHIV in care who had stopped treatment whilst on second line regimen this month*/
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
                                             /*Reason for stopping ART program as Hold / Interrupt Or Patient’s Decision*/
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')

             UNION ALL
             
             /*D39. Number PLHIV in care transferred out whilst on second line regimen this month*/
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferredOut
                                on obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 2nd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Transfer Out'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferredOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferredOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferredOut.obs_datetime) between date('#startDate#') AND date('#endDate#')

            UNION ALL 

                /*D44. Number of PLHIV in care on Second line switching to Third line regimen this month*/
                Select 
                distinct obsToGetLastARTStageChangeDate.person_id
                from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 3rd line */
                                                   Select max(obsART3rdLine.value_datetime)
                                                   from obs obsART3rdLine 
                                                   Where obsART3rdLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART3rdLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART3rdLine.voided = 0
                                                   
                                                   AND obsART3rdLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 3rd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART3rdLineStartDate
                                                                                      WHERE obsART3rdLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART3rdLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 3rd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART3rdLine.person_id = obsART3rdLineStartDate.person_id
                                                 AND obsART3rdLineStartDate.voided = 0
                                                  )
                                                 and date(obsART3rdLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART3rdLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 3rd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART3rdLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 2nd Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0                

        ) as D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth
        JOIN person p ON p.person_id = D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth.person_id
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
    ) AS D43TotalnumberofPLHIVincarecurrentlyreceivingSecondlineARTincludingthoseswitchedduringthecurrentmonth)
    as settwo  
    on setone.set = settwo.set
    
    union all
    
    /*D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month).*/
    select setone.set as '-', /*setone - settwo : (D44 + D49) - (D45 + D46 + D47 + D48 )*/
    case (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) when 0 then null else (ifnull(setone.lessThan1yrMale,0) - ifnull(settwo.lessThan1yrMale,0)) end as 'lessthanOneMale',
    case (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) when 0 then null else (ifnull(setone.lessThan1yrFemale,0) - ifnull(settwo.lessThan1yrFemale,0)) end as 'lessthanOneFemale',
    case (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) when 0 then null else (ifnull(setone.1To9yrMale,0) - ifnull(settwo.1To9yrMale,0)) end as 'OnetoNineMale', 
    case (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) when 0 then null else (ifnull(setone.1To9yrFemale,0) - ifnull(settwo.1To9yrFemale,0)) end as 'OnetoNineFemale',
    case (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) when 0 then null else (ifnull(setone.10To14yrMale,0) - ifnull(settwo.10To14yrMale,0)) end as 'TentoFourteenMale',
    case (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) when 0 then null else (ifnull(setone.10To14yrFemale,0) - ifnull(settwo.10To14yrFemale,0)) end as 'TentoFourteenFemale',
    case (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) when 0 then null else (ifnull(setone.15To19yrMale,0) - ifnull(settwo.15To19yrMale,0)) end as 'FifteentoNineteenMale',
    case (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) when 0 then null else (ifnull(setone.15To19yrFemale,0) - ifnull(settwo.15To19yrFemale,0)) end as 'FifteentoNineteenFemale',
    case (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) when 0 then null else (ifnull(setone.20To24yrMale,0) - ifnull(settwo.20To24yrMale,0)) end as 'TwentytoTwentyFourMale', 
    case (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) when 0 then null else (ifnull(setone.20To24yrFemale,0) - ifnull(settwo.20To24yrFemale,0)) end as 'TwentytoTwentyFourFemale',
    case (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) when 0 then null else (ifnull(setone.25To29yrMale,0) - ifnull(settwo.25To29yrMale,0)) end as 'TwentyFivetoTwentyNineMale',
    case (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) when 0 then null else (ifnull(setone.25To29yrFemale,0) - ifnull(settwo.25To29yrFemale,0)) end as 'TwentyFivetoTwentyNineFemale',
    case (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) when 0 then null else (ifnull(setone.30To34yrMale,0) - ifnull(settwo.30To34yrMale,0)) end as 'ThirtytoThirtyFourMale',
    case (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) when 0 then null else (ifnull(setone.30To34yrFemale,0) - ifnull(settwo.30To34yrFemale,0)) end as 'ThirtytoThirtyFourFemale',
    case (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrMale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineMale',
    case (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) when 0 then null else (ifnull(setone.35To39yrFemale,0) - ifnull(settwo.35To39yrFemale,0)) end as 'ThirtyFivetoThirtyNineFemale',
    case (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) when 0 then null else (ifnull(setone.40To49YrsMale,0) - ifnull(settwo.40To49YrsMale,0)) end as 'FortytoFortyNineMale',
    case (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) when 0 then null else (ifnull(setone.40To49YrsFemale,0) - ifnull(settwo.40To49YrsFemale,0)) end as 'FortytoFortyNineFemale',
    case (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsMale,0) - ifnull(settwo.GrtThan50YrsMale,0)) end as 'GreaterthanFiftyMale',
    case (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) when 0 then null else (ifnull(setone.GrtThan50YrsFemale,0) - ifnull(settwo.GrtThan50YrsFemale,0)) end as 'GreaterthanFiftyFemale'
         
   from
    (/*ADDITION OF REPORTS : D44 + D49*/
    SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)',
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
    /*D44. Number of PLHIV in care on Second line switching to Third line regimen this month*/
    Select 
      distinct obsToGetLastARTStageChangeDate.person_id
from obs obsToGetLastARTStageChangeDate
                                   Inner Join 
                                (/*Max ART program stage date per person before the end of reporting period*/
                                
                                               Select person_id, max(value_datetime) lastARTStageDateTime
                                               from obs obslastARTStageDateTime
                                               where obslastARTStageDateTime.concept_id = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, Start date of ART Stage'
                                                                                             AND retired=0
                                                                                          )
                                               and date(obslastARTStageDateTime.value_datetime) < 
                                               
                                               (   /* Maximum Start Date of ART Program's 3rd line */
                                                   Select max(obsART3rdLine.value_datetime)
                                                   from obs obsART3rdLine 
                                                   Where obsART3rdLine.person_id = obslastARTStageDateTime.person_id
                                                   AND obsART3rdLine.concept_id =  (
                                                                                       SELECT
                                                                                       concept_id
                                                                                       FROM concept_view
                                                                                       WHERE
                                                                                       concept_full_name = 'PR, Start date of ART Stage'
                                                                                       AND retired=0
                                                                                   )
                                                   AND obsART3rdLine.voided = 0
                                                   
                                                   AND obsART3rdLine.obs_group_id in 
                                                                                    (
                                                                                    /*ART Stage as 3rd Line*/
                                                                                      SELECT obs_group_id
                                                                                      from obs obsART3rdLineStartDate
                                                                                      WHERE obsART3rdLineStartDate.concept_id =(
                                                                                                                                 SELECT
                                                                                                                                 concept_id
                                                                                                                                 FROM concept_view
                                                                                                                                 WHERE
                                                                                                                                 concept_full_name = 'PR, ART Stage'
                                                                                                                                 AND retired=0
                                                                                                                                )
                                                  AND obsART3rdLineStartDate.value_coded = (
                                                                                             SELECT
                                                                                             concept_id
                                                                                             FROM concept_view
                                                                                             WHERE
                                                                                             concept_full_name = 'PR, 3rd Line'
                                                                                             AND retired=0
                                                                                           )
                                                 And obsART3rdLine.person_id = obsART3rdLineStartDate.person_id
                                                 AND obsART3rdLineStartDate.voided = 0
                                                  )
                                                 and date(obsART3rdLine.value_datetime) between date('#startDate#')  and date('#endDate#')
                                                 and obsART3rdLine.person_id not IN 
                                                   (/*Condition where patient excluded with Stop Date of ART Program less than Start Date of 3rd line ART Program*/
                                                                 SELECT obsARTStopDate.person_id
                                                                 from obs obsARTStopDate
                                                                 INNER JOIN concept_view 
                                                                 on obsARTStopDate.concept_id=concept_view.concept_id
                                                                 AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                                                 AND obsARTStopDate.voided=0
                                                                 where date(obsARTStopDate.value_datetime) < date(obsART3rdLine.value_datetime)
                                                                 )
                                                )
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
                                                                            concept_full_name = ('PR, ART Stage')
                                                                            AND retired=0
                                                                        )                               
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = ('PR, 2nd Line')
                                                                                AND retired=0
                                                                            )
                               ANd obsToGetLastARTStageChangeDate.voided = 0
                               and obsToCheckARTStageValue.voided = 0
                               
             union all 
             /*D49. Number PLHIV in care transferred in on Third line regimen this month*/
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
                                                                                    concept_full_name = 'PR, 3rd Line'
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
                                    And date(obsToGetLastARTStageChangeDate.value_datetime) <= date(obsForCheckingTransferIn.obs_datetime)
                                    And date(obsForCheckingTransferIn.obs_datetime) between date('#startDate#') AND date('#endDate#')
   
            ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART 
           INNER JOIN person p ON p.person_id = D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART.person_id
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
    ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART)
    as setone
    inner join
    
   (/*ADDITION OF REPORTS : D45 + D46 + D47 + D48*/
SELECT/*Pivoting the table*/
    'D53TotalnumberofPLHIVcarecurrentlyreceivingARTthismonth' AS 'set',
    SUM(lessThan1yrMale) AS 'lessThan1yrMale',
    SUM(lessThan1yrFemale) AS 'lessThan1yrFemale',
    SUM(1To9yrMale) AS '1To9yrMale',
    SUM(1To9yrFemale) AS '1To9yrFemale',
    SUM(10To14yrMale) AS '10To14yrMale',
    SUM(10To14yrFemale) AS '10To14yrFemale',
    SUM(15To19yrMale) AS '15To19yrMale',
    SUM(15To19yrFemale) AS '15To19yrFemale',
    SUM(20To24yrMale) AS '20To24yrMale',
    SUM(20To24yrFemale) AS '20To24yrFemale',
    SUM(25To29yrMale) AS '25To29yrMale',
    SUM(25To29yrFemale) AS '25To29yrFemale',
    SUM(30To34yrMale) AS '30To34yrMale',
    SUM(30To34yrFemale) AS '30To34yrFemale',
    SUM(35To39yrMale) AS '35To39yrMale',
    SUM(35To39yrFemale) AS '35To39yrFemale',
    SUM(40To49YrsMale) AS '40To49YrsMale',
    SUM(40To49YrsFemale) AS '40To49YrsFemale',
    SUM(GrtThan50YrsMale) AS 'GrtThan50YrsMale',
    SUM(GrtThan50YrsFemale) AS 'GrtThan50YrsFemale'
    FROM
    (
    SELECT
         'D52. Total number of PLHIV in care currently receiving Third line ART (including those switched during the current month)',
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
    FROM (  /*D45. Number of PLHIV in care who died whilst on Third line ART regimen this month*/
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
                                                                                concept_full_name = 'PR, 3rd Line'
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
                                AND obsForCheckingIfPatientIsMarkedAsDeceased.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer In date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsDeceased.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsDeceased.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
                                UNION ALL
                                
                                /*D46. Number of PLHIV lost to follow up whilst on Third line regimen this month*/
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsLostToFollowUp
                                on obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.concept_id = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'AS, Activity status'
                                                                                                AND retired=0
                                                                                           ) 
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.value_coded = (
                                                                                                SELECT
                                                                                                concept_id
                                                                                                FROM concept_view
                                                                                                WHERE
                                                                                                concept_full_name = 'Lost to follow up'
                                                                                                AND retired=0
                                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsLostToFollowUp.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Lost To Follow Up date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsLostToFollowUp.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsLostToFollowUp.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
                                UNION ALL 
                                /*D47. Number of PLHIV in care who stopped treatment whilst on Third line regimen this month*/
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
                                                            concept_full_name = 'PR, 3rd Line'
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
                                                         AND reasonAsTreatmentFailureForStoppingART.value_coded IN (
                                                                                                              SELECT
                                                                                                              concept_id
                                                                                                              FROM concept_view
                                                                                                              WHERE
                                                                                                              concept_full_name IN ("PR, Hold / interrupt","PR, Patient's decision")
                                                                                                              AND retired=0
                                                                                                           )
                                                         And obsForARTStopDate.person_id = reasonAsTreatmentFailureForStoppingART.person_id
                                                         AND reasonAsTreatmentFailureForStoppingART.voided = 0
                                                    )
                              And date(obsForARTStopDate.value_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                              And date(obsForARTStopDate.value_datetime) between date('#startDate#') AND date('#endDate#')
                              
                              UNION ALL
                              
                              /*D48. Number PLHIV in care transferred out whilst on Third line regimen this month*/
                              
                              Select
                              distinct obsToGetLastARTStageChangeDate.person_id
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
                                                                             
                                Inner join obs obsForCheckingIfPatientIsMarkedAsTransferOut
                                on obsForCheckingIfPatientIsMarkedAsTransferOut.person_id = obsToCheckARTStageValue.person_id
                                Where obsToCheckARTStageValue.value_coded = 
                                                                            (
                                                                                SELECT
                                                                                concept_id
                                                                                FROM concept_view
                                                                                WHERE
                                                                                concept_full_name = 'PR, 3rd Line'
                                                                                AND retired=0
                                                                            )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.concept_id = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'AS, Activity status'
                                                                                                    AND retired=0
                                                                                                  ) 
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.value_coded = (
                                                                                                    SELECT
                                                                                                    concept_id
                                                                                                    FROM concept_view
                                                                                                    WHERE
                                                                                                    concept_full_name = 'Transfer Out'
                                                                                                    AND retired=0
                                                                                                   )
                                AND obsForCheckingIfPatientIsMarkedAsTransferOut.person_id not in
                                 (/*Patient with ART stop date < Date of Marked as Transfer Out date will be excluded*/
                                     SELECT obs.person_id 
                                     from obs 
                                           INNER JOIN concept_view 
                                           on obs.concept_id=concept_view.concept_id
                                           AND concept_view.concept_full_name = "PR, ART Program Stop Date" 
                                           AND obs.voided=0
                                           Where date(obs.value_datetime) < Date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime)
                                 )                                                            
                                And obsForCheckingIfPatientIsMarkedAsTransferOut.voided = 0
                                And obsToCheckARTStageValue.voided = 0
                                And obsToGetLastARTStageChangeDate.voided = 0
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) >= date(obsToGetLastARTStageChangeDate.value_datetime)
                                And date(obsForCheckingIfPatientIsMarkedAsTransferOut.obs_datetime) between date('#startDate#') AND date('#endDate#')
                                
        ) as D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART
        JOIN person p ON p.person_id = D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART.person_id
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
    ) AS D52totalNumberOfPLHIVinCareCurrentlyReceivingThirdLineART)
    as settwo  
    on setone.set = settwo.set 
    ) as D53
    group by '-';
    

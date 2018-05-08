/*D18. Number of PLHIV in care on ART with Viral Load test done at 12 months after ART initiation this month*/
SELECT/*Pivoting the table*/
    'D18. Number of PLHIV in care on ART with Viral Load test done at 12 months after ART initiation this month' AS '-',
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
         'D18. Number of PLHIV in care on ART with Viral Load test done at 12 months after ART initiation this month',
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
                select distinct p.person_id
                from person p
                join obs obsARTProgram on p.person_id = obsARTProgram.person_id
                join concept_name cnARTProgram on obsARTProgram.concept_id = cnARTProgram.concept_id
                join obs obsHIVRNAPCR on p.person_id = obsHIVRNAPCR.person_id
                join concept_name cnHIVRNAPCR on obsHIVRNAPCR.concept_id = cnHIVRNAPCR.concept_id
                JOIN orders ord on p.person_id=ord.patient_id and ord.order_type_id = 2
                JOIN drug_order dord on dord.order_id = ord.order_id 
                JOIN drug d on dord.drug_inventory_id = d.drug_id
                and d.name in   (
                                            "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
                where 
                        cnARTProgram.name = 'PR, Start date of ART program' 
                        and cnARTProgram.concept_name_type = 'FULLY_SPECIFIED' 
                        and cnARTProgram.voided = 0
                and datediff /*Difference of reporting end and ART Program start date should be greater than or equal to 365*/
                            ( date('#endDate#'),
                              (
                                  Select date(max(value_datetime)) from obs WHERE voided = 0 and person_id = obsARTProgram.person_id and concept_id =
                                  (
                                      SELECT concept_id from concept_name WHERE name = 'PR, Start date of ART program' and
                                      concept_name_type = 'FULLY_SPECIFIED' and voided = 0 
                                  )
                              )
                            ) >= 365
                and cnHIVRNAPCR.name IN 
                        (
                            'HIV RNA PCR (48 Weeks)',
                            'HIV RNA PCR',
                            'HIV RNA PCR (Baseline)',
                            'HIV RNA PCR (Yearly)',
                            'HIV RNA PCR (24 Weeks)'
                        ) 
                        and cnHIVRNAPCR.concept_name_type = 'FULLY_SPECIFIED' 
                        and cnHIVRNAPCR.voided = 0
                and obsARTProgram.person_id Not in /*Excluding the patient if ART Program stop date is before the HIV RNA PCR lab test result*/
                        (
                        select person_id from obs where concept_id = (SELECT concept_id from concept_name WHERE name = 'PR, ART Program Stop Date' and
                        concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
                        and date(obs.value_datetime) < date(obsHIVRNAPCR.obs_datetime)
                        and obs.voided = 0
                        )
                and obsARTProgram.voided = 0
                and obsHIVRNAPCR.voided = 0
                and date(obsHIVRNAPCR.obs_datetime) between date('#startDate#') and date('#endDate#')
                and d.retired = 0
                and date(ord.date_activated) < date('#endDate#')
         ) AS numberofPLHIVincareonARTwithViralLoadtestdoneat12monthsafterARTinitiationthismonth
           INNER JOIN person p ON p.person_id = numberofPLHIVincareonARTwithViralLoadtestdoneat12monthsafterARTinitiationthismonth.person_id
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
    ) AS MOHReportD18NumberofPLHIVincareonARTwithViralLoadtestdoneat12monthsafterARTinitiationthismonth
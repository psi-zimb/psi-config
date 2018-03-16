select 
  piPrepOIIdentifier.identifier as "OI No.", 
  CONCAT(
    pnNameSurnameofPatient.given_name, 
    " ", 
    COALESCE(
      pnNameSurnameofPatient.middle_name, 
      ''
    )
  ) as "Name", 
  pnNameSurnameofPatient.family_name as "Surname", 
  case when perSexAge.gender = 'M' then 'Male' when perSexAge.gender = 'F' then 'Female' when perSexAge.gender = 'O' then 'Other' end as "Sex", 
  TIMESTAMPDIFF(
    YEAR, 
    perSexAge.birthdate, 
    CURDATE()
  ) as Age, 
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeTypeonRegistration.name = 'Population' then cv.concept_full_name else null end
    )
  ) as "Category", 
  /*Wks on ART : If ART Stop date is present then ART stop date Else report end date for calculation*/
  ROUND(DATEDIFF(
  case when (select obs.value_datetime from obs 
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0 
  where obs.person_id = pat.patient_id) is null then date('#endDate#') 
  else 
  (select obs.value_datetime from obs 
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0 
  where obs.person_id = pat.patient_id) 
  END, obsActiveArtProgram.value_datetime) / 7, 0) as "Wks on ART",
  piUIC.identifier as "UIC", 
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Mother\'s name' Then personAttributesonRegistration.value else null end
    )
  ) as "Mother's name", 
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'District of Birth' then cv.concept_full_name else null end
    )
  ) as "District of Birth", 
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Telephone' then personAttributesonRegistration.value else null end
    )
  ) as "Telephone no", 
  GROUP_CONCAT(
    distinct (
      case when personAttributeTypeonRegistration.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end
    )
  ) as "Referred from",
  GROUP_CONCAT(distinct d.name) as "Regime",
  GROUP_CONCAT(
    distinct cnNameOfDiagnosisRecorded.name
  ) as "adverse event",
  date(obsARTStopDate.value_datetime) as "date stopped art"
from 
  patient pat 
  join obs obsAdverseEventsDiagnosis on pat.patient_id = obsAdverseEventsDiagnosis.person_id 
  join concept_name cnNameofDiagnosis on obsAdverseEventsDiagnosis.concept_id = cnNameofDiagnosis.concept_id 
  join obs obsActiveArtProgram ON pat.patient_id = obsActiveArtProgram.person_id 
  join concept_name cnDateofARTProgram on obsActiveArtProgram.concept_id = cnDateofARTProgram.concept_id 
  JOIN concept_name cnNameOfDiagnosisRecorded on obsAdverseEventsDiagnosis.value_coded = cnNameOfDiagnosisRecorded.concept_id 
  LEFT join patient_identifier piPrepOIIdentifier on pat.patient_id = piPrepOIIdentifier.patient_id 
  and piPrepOIIdentifier.voided = 0 
  and piPrepOIIdentifier.identifier_type in (
    select 
      patient_identifier_type_id 
    from 
      patient_identifier_type 
    where 
      name = 'PREP/OI Identifier' 
      and retired = 0 
      and uniqueness_behavior = 'UNIQUE'
  ) 
  LEFT JOIN person_name pnNameSurnameofPatient on pat.patient_id = pnNameSurnameofPatient.person_id 
  lEFT JOIN person perSexAge on pat.patient_id = perSexAge.person_id 
  lEFT JOIN patient_identifier piUIC on pat.patient_id = piUIC.patient_id 
  and piUIC.identifier_type in (
    select 
      patient_identifier_type_id 
    from 
      patient_identifier_type 
    where 
      name = 'UIC' 
      and retired = 0
  ) 
  LEFT JOIN person_attribute personAttributesonRegistration on pat.patient_id = personAttributesonRegistration.person_id 
  LEFT JOIN person_attribute_type personAttributeTypeonRegistration on personAttributesonRegistration.person_attribute_type_id = personAttributeTypeonRegistration.person_attribute_type_id 
  left jOIN concept_view cv on personAttributesonRegistration.value = cv.concept_id AND cv.retired = 0
  LEFT JOIN orders ord on pat.patient_id=ord.patient_id and ord.order_type_id = 2
  LEFT JOIN drug_order dord on dord.order_id = ord.order_id 
  LEFT JOIN drug d on dord.drug_inventory_id = d.drug_id
        and d.name in ("Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Efavirenz (EFV) 600mg",
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
    left join obs obsARTStopDate on pat.patient_id = obsARTStopDate.person_id and obsARTStopDate.voided = 0
    and obsARTStopDate.concept_id IN (select concept_id from concept_name where name = 'PR, ART Program Stop Date' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
  
where 
  cnNameofDiagnosis.name = 'Coded Diagnosis' 
  and cnNameofDiagnosis.concept_name_type = 'FULLY_SPECIFIED' 
  and cnNameofDiagnosis.voided = 0 
  and obsAdverseEventsDiagnosis.value_coded IN ( /* Patients for whom Adverse Events Diagnosis recorded between the reporting date range */
    select 
      concept_id 
    from 
      concept_name 
    where 
      name IN (
            "Anemia (Zidovudine associated)",
            "Cardiomyopathy (Zidovudine related)",
            "Cardiovascular (Zidovudine)",
            "Dyslipidemia",
            "Efavirenz drug reaction (to be reassigned)",
            "Erythoderma",
            "Gastrointestinal (erythromycin)",
            "Gastrointestinal (Lopinavir)",
            "Gastrointestinal (non steroidal anti-inflammatory drugs)",
            "Haematological (cotrimoxazole)",
            "Haematological (rifampicin)",
            "Haematological (zidovudine)",
            "Hepatotoxicity",
            "Hyperbilirubimia (Atazanavir)",
            "Hypersensitivity (Abacavir)",
            "Hypersensitivity (cotrimoxazole)",
            "Hypersensitivity (Efavirenz)",
            "Hypersensitivity (Nevirapine)",
            "Kidney (atazanavir)",
            "Kidney (non-steroidal anti-inflammatory drugs)",
            "Kidney (rifampicin)",
            "Kidney (tenofovir)",
            "Lactic acidosis",
            "Lipoatrophy, define",
            "Lipodystrophy (define)",
            "Lipodystrophy (lopinavir)",
            "Lipodystrophy (Stavusine)",
            "Lipodystrophy (Zidovudine)",
            "Liver (efavirenz)",
            "Liver (Fluconazole - high dose)",
            "Liver (Griseofulvin)",
            "Liver (Isoniazid)",
            "Liver (Nevirapine)",
            "Liver (Pyrazinamide)",
            "Liver (rifampicin)",
            "Metabolic (atazanavir)",
            "Metabolic (didanosine)",
            "Metabolic (Lopinavir)",
            "Metabolic (tenofovir)",
            "Metabolic Syndrome",
            "Nervous System (Efavirenz)",
            "Nervous System (Ethambutol - optic Neuritis)",
            "Nervous System (Isoniazid)",
            "Nervous System (stavudine)",
            "Nervous System (streptomycin)",
            "Nevirapine drug reaction (to be reassigned)",
            "Pancytopenia",
            "Peripheral Neuropathy",
            "Peripheral Sensory Polyneuropathy (d4T)",
            "Peripheral Sensory Polyneuropathy (INH)",
            "Rash, macular, drug related",
            "Rash, maculo-papular, drug related",
            "Rash, papular, drug related",
            "SJS (cotrimoxazole)",
            "SJS (nevirapine)",
            "SJS (amoxicillin)",
            "Skin (amoxicillin)",
            "Skin (cotrimoxazole)",
            "Skin (efavirenz)",
            "Skin (nevirapine)",
            "Skin (pyrazinamide)",
            "Skin (rifampicin)",
            "Steven Johnson Syndrome, Drug related",
            "Toxicity, CNS",
            "Toxicity, Liver",
            "Toxicity, Renal",
            "Urticaria, drug related",
            "Zidovudine Drug reaction (to be reassigned)"

        ) 
      and concept_name_type = 'FULLY_SPECIFIED'
  ) 
  AND obsAdverseEventsDiagnosis.voided = 0 
  and cnDateofARTProgram.name = 'PR, Start date of ART program' 
  and cnDateofARTProgram.concept_name_type = 'FULLY_SPECIFIED' 
  and cnDateofARTProgram.voided = 0 
  and obsActiveArtProgram.voided = 0
  and date(obsAdverseEventsDiagnosis.obs_datetime) between date('#startDate#') 
  and date('#endDate#')
group by 
  pat.patient_id, 
  obsAdverseEventsDiagnosis.obs_datetime, 
  obsAdverseEventsDiagnosis.value_coded 
order by 
  obsAdverseEventsDiagnosis.obs_datetime;
select
    piPrepOIIdentifier.identifier as "OI No.",
    CONCAT(pnNameSurnameofPatient.given_name, " ", COALESCE(pnNameSurnameofPatient.middle_name, '')) as "Name",
    pnNameSurnameofPatient.family_name as "Surname",
           case 
              when perSexAge.gender = 'M' then 'Male'
              when perSexAge.gender = 'F' then 'Female'
              when perSexAge.gender = 'O' then 'Other'
              end as "Sex",
    TIMESTAMPDIFF(YEAR, perSexAge.birthdate, CURDATE()) as "Age",
    GROUP_CONCAT(DISTINCT (
    case
        when
            personAttributeTypeonRegistration.name = 'Population' 
        then
            cv.concept_full_name 
        else
            null 
    end
)) as "Category", 
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
    piUIC.identifier as "UIC", GROUP_CONCAT(distinct (
    case
        when
            personAttributeTypeonRegistration.name = 'Mother\'s name' 
        Then
            personAttributesonRegistration.value 
        else
            null 
    end
)) as "Mother's name",
    GROUP_CONCAT(distinct (
    case
        when
            personAttributeTypeonRegistration.name = 'District of Birth' 
        then
            cv.concept_full_name 
        else
            null 
    end
)) as "District of Birth", 
    GROUP_CONCAT(distinct (
    case
        when
            personAttributeTypeonRegistration.name = 'Telephone' 
        then
            personAttributesonRegistration.value 
        else
            null 
    end
)) as "Telephone no", 
    GROUP_CONCAT(distinct (
    case 
        when personAttributeTypeonRegistration.name = 'Referral source' 
    then 
    case 
        when cv.concept_short_name is null 
        then
            cv.concept_full_name 
        else 
            cv.concept_short_name end 
        else
            null end
)) as "Referred from",
    GROUP_CONCAT(distinct drugRegime.name) as "Regime", 
    date(MIN(obsTypeOfService.obs_datetime)) as "Date of Registration" 
from
    patient pat 
    join
        obs obsActiveArtProgram 
        on pat.patient_id = obsActiveArtProgram.person_id 
    join
        concept_name cnDateofARTProgram 
        on cnDateofARTProgram.concept_id = obsActiveArtProgram.concept_id 
        and cnDateofARTProgram.name = "PR, Start date of ART program" 
        and cnDateofARTProgram.concept_name_type = 'FULLY_SPECIFIED' 
        AND obsActiveArtProgram.voided = 0 
        and obsActiveArtProgram.person_id not in 
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where obs.value_datetime <= Date('#endDate#'))
            join
                obs obsTypeOfService 
                on pat.patient_id = obsTypeOfService.person_id 
            join
                concept_name cnNameOfService 
                on obsTypeOfService.concept_id = cnNameOfService.concept_id 
                and cnNameOfService.name = "Reason for visit" 
                and cnNameOfService.concept_name_type = 'FULLY_SPECIFIED' 
                AND obsTypeOfService.value_coded in 
                (
                    select
                        concept_id 
                    from
                        concept_name 
                    where
                        name IN 
                        (
                            'Initial ART service',
                            'PrEP Initial'
                        )
                        and concept_name_type = 'FULLY_SPECIFIED' 
                )
                and obsTypeOfService.voided = 0 
            LEFT join
                patient_identifier piPrepOIIdentifier 
                on pat.patient_id = piPrepOIIdentifier.patient_id 
                and piPrepOIIdentifier.voided=0
                and piPrepOIIdentifier.identifier_type in 
                (
                    select
                        patient_identifier_type_id 
                    from
                        patient_identifier_type 
                    where
                        name = 'PREP/OI Identifier' 
                        and retired = 0 
                        and uniqueness_behavior = 'UNIQUE'
                )
            LEFT JOIN
                patient_identifier piUIC 
                on pat.patient_id = piUIC.patient_id 
                and piUIC.identifier_type in 
                (
                    select
                        patient_identifier_type_id 
                    from
                        patient_identifier_type 
                    where
                        name = 'UIC' 
                        and retired = 0 
                )
            LEFT JOIN
                person_name pnNameSurnameofPatient 
                on pat.patient_id = pnNameSurnameofPatient.person_id 
            LEFT JOIN
                person perSexAge 
                on pat.patient_id = perSexAge.person_id 
            LEFT JOIN
                person_attribute personAttributesonRegistration 
                on pat.patient_id = personAttributesonRegistration.person_id 
            LEFT JOIN
                person_attribute_type personAttributeTypeonRegistration 
                on personAttributesonRegistration.person_attribute_type_id = personAttributeTypeonRegistration.person_attribute_type_id 
            Left jOIN
                concept_view cv 
                on personAttributesonRegistration.value = cv.concept_id 
                AND cv.retired = 0 
            LEFT JOIN
                orders ordDrugOrderType 
                on pat.patient_id = ordDrugOrderType.patient_id 
                and ordDrugOrderType.order_type_id = 2 
            LEFT JOIN
                drug_order dord 
                on dord.order_id = ordDrugOrderType.order_id 
            LEFT JOIN
                drug drugRegime 
                on dord.drug_inventory_id = drugRegime.drug_id 
                and drugRegime.name in 
                (
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
                    "Atazanavir / Rtv 300 / 100 mg",
                    "Lopinavir / Rtv 80 / 20 mg / ml",
                    "Lopinavir / Rtv 100 / 25 mg",
                    "Lopinavir / Rtv 200 / 50 mg",
                    "Lamivudine (3TC) 150 mg",
                    "Lamivudine (3TC) 50mg / 5ml",
                    "Efavirenz (EFV) 50 mg",
                    "Efavirenz (EFV) 200 mg",
                    "Efavirenz (EFV) 600 mg",
                    "Zidovudine (AZT) 300 mg",
                    "Zidovudine (AZT) 100mg",
                    "Zidovudine (AZT) 50mg / 5ml",
                    "Abacavir (ABC) 20mg / ml",
                    "Abacavir (ABC) 300 mg",
                    "Abacavir (ABC) 60mg",
                    "Nevirapine (NVP) 50mg / 5ml",
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
        WHERE
            date(obsTypeOfService.obs_datetime) between date ('#startDate#') and date ('#endDate#') 
            AND obsTypeOfService.person_id not in 
            (
                /* Patients having Type of Service selected for the first time in given reporting date range and not selected anytime before the reporting starte date range */
                Select
                    person_id 
                from
                    obs 
                    join
                        concept_name 
                        on obs.concept_id = concept_name.concept_id 
                        and concept_name.name = "Reason for visit" 
                        and concept_name.concept_name_type = 'FULLY_SPECIFIED' 
                        AND obs.value_coded in 
                        (
                            select
                                concept_id 
                            from
                                concept_name 
                            where
                                name IN 
                                (
                                    'Initial ART service',
                                    'PrEP Initial'
                                )
                                and concept_name_type = 'FULLY_SPECIFIED'
                        )
                        and obs.voided = 0 
                        and date(obs.obs_datetime) < date('#startDate#') 
            )
        group by
            pat.patient_id;
select  pi.identifier as "OI No.",
        CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, '')) as "Name",
        pn.family_name as Surname,
        case 
        when p.gender = 'M' then 'Male'
        when p.gender = 'F' then 'Female'
        when p.gender = 'O' then 'Other'
        end as "Sex",
        TIMESTAMPDIFF(YEAR, p.birthdate, CURDATE()) as "Age",
        GROUP_CONCAT(DISTINCT (case when pat.name = 'Population' then cv.concept_full_name else null end)) as "Category",
        ROUND(DATEDIFF(CURDATE(), o.value_datetime) / 7, 0) as "Wks on ART",
        piu.identifier as "UIC",
        GROUP_CONCAT(distinct (case when pat.name = 'Mother\'s name' Then pac.value else null end)) as "Mother's name",
        GROUP_CONCAT(distinct (case when pat.name = 'District of Birth' then cv.concept_full_name else null end)) as "District of Birth", 
        GROUP_CONCAT(distinct (case when pat.name = 'Telephone' then pac.value else null end)) as "Telephone no", 
        GROUP_CONCAT(distinct (case when pat.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end)) as "Referred from",
        group_concat(distinct d.name) as "Regime",
        date(pai.start_date_time) as "Date of missed appointment" 
        
from patient pa
         join patient_appointment pai on pa.patient_id=pai.patient_id 
         LEFT JOIN orders ord on pai.patient_id=ord.patient_id and ord.order_type_id = 2
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
         LEFT JOIN obs o on pai.patient_id = o.person_id and o.voided = 0
         LEFT JOIN concept_name cn on o.concept_id = cn.concept_id 
         LEFT JOIN person p on pai.patient_id = p.person_id
         LEFT JOIN person_name pn on pai.patient_id = pn.person_id
         LEFT JOIN person_attribute pac on pai.patient_id = pac.person_id 
         LEFT JOIN person_attribute_type pat on pac.person_attribute_type_id = pat.person_attribute_type_id
         LEFT JOIN concept_view cv on pac.value = cv.concept_id AND cv.retired = 0
         LEFT JOIN patient_identifier pi on pai.patient_id = pi.patient_id and pi.voided=0
         and pi.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier' and retired=0 and uniqueness_behavior = 'UNIQUE')
         LEFT JOIN patient_identifier piu on pai.patient_id = piu.patient_id 
         and piu.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0)
         WHERE pai.start_date_time BETWEEN date('#startDate#') and date('#endDate#')
         and pai.status='Missed' and pai.appointment_kind='Scheduled' 
         AND pai.appointment_service_id IN (select appointment_service_id from appointment_service where name = 'ART')
         and cn.name = 'PR, Start date of ART program' and cn.concept_name_type = 'FULLY_SPECIFIED' and cn.voided = 0
         and o.person_id not in 
        (select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0)
         group by pai.patient_appointment_id;
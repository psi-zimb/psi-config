select  pi.identifier as "OI No.",
        CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, '')) as "Name",
        pn.family_name as Surname,
        case
            when p.gender = 'M' then 'Male'
            when p.gender = 'F' then 'Female'
            when p.gender = 'O' then 'Other'
            end as "Sex",
        TIMESTAMPDIFF(YEAR, p.birthdate, CURDATE()) as Age,
        GROUP_CONCAT(DISTINCT (case when pat.name = 'Population' then cv.concept_full_name else null end)) as "Category",
        GROUP_CONCAT(distinct ROUND(DATEDIFF(CURDATE(), o3.value_datetime) / 7, 0)) as "Wks on ART",
        piu.identifier as "UIC",
        GROUP_CONCAT(distinct (case when pat.name = 'Mother\'s name' Then pac.value else null end)) as "Mother's name",
        GROUP_CONCAT(distinct (case when pat.name = 'District of Birth' then cv.concept_full_name else null end)) as "District of Birth",
        GROUP_CONCAT(distinct (case when pat.name = 'Telephone' then pac.value else null end)) as "Telephone no",
        GROUP_CONCAT(distinct (case when pat.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end)) as "Referred from",
        GROUP_CONCAT(distinct ROUND(DATEDIFF(CURDATE(), o3.value_datetime) / 7, 0)) as "Wks on ART",
        group_concat(distinct d.name) as "Regime" ,
        GROUP_CONCAT(DISTINCT DATE(o.obs_datetime)) as "Date of Transfer",
        o2.value_text as  "Name of facility transferred to"
from patient pa
          INNER JOIN obs o3 on pa.patient_id = o3.person_id
          INNER join concept_view cv2 on o3.concept_id=cv2.concept_id and cv2.concept_full_name = 'PR, Start date of ART program' and o3.voided=0 and o3.person_id not in
                     (select o3.person_id from obs o3 INNER JOIN concept_view cv2 on o3.concept_id=cv2.concept_id and cv2.concept_full_name = 'PR, ART Program Stop Date' and o3.voided=0)
          LEFT JOIN orders ord on pa.patient_id=ord.patient_id and ord.order_type_id = 2
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
                            "Didanosine (ddl) 400mg"
                            "Emitricitabine 200mg",
                            "Tenofovir 300mg",
                            "Indinavir 400mg",
                            "Saquinavir 200mg")
          JOIN obs o on pa.patient_id = o.person_id and o.voided = 0
          JOIN encounter e on o.encounter_id = e.encounter_id and o.concept_id in
            (select distinct concept_id from concept_view where concept_full_name = 'AS, Activity status') and o.value_coded in
            (select distinct concept_id from concept_view where concept_full_name = 'Transfer Out')
         LEFT JOIN obs o2 on o.obs_group_id = o2.obs_group_id and o2.concept_id in
            (select distinct concept_id from concept_view where concept_full_name = 'AS, Details of facility to where patient is transferred')
         LEFT join patient_identifier pi on pa.patient_id = pi.patient_id and pi.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier' and retired=0 and uniqueness_behavior = 'UNIQUE')
         LEFT JOIN patient_identifier piu on pa.patient_id = piu.patient_id and piu.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0 )
         LEFT JOIN person p on pa.patient_id = p.person_id
         LEFT JOIN person_name pn on pa.patient_id = pn.person_id
         LEFT JOIN person_attribute pac on pa.patient_id = pac.person_id
         LEFT JOIN person_attribute_type pat on pac.person_attribute_type_id = pat.person_attribute_type_id
         LEFT jOIN concept_view cv on pac.value = cv.concept_id AND cv.retired = 0
where o.obs_datetime is not null  and date(o3.value_datetime) BETWEEN '#startDate#' and '#endDate#'
group by pi.identifier,o.obs_datetime;

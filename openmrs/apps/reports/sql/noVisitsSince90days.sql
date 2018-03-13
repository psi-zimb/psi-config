select pi.identifier as "OI No.",
       CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, '')) as "Name",
       pn.family_name as "Surname",
       case 
              when p.gender = 'M' then 'Male'
              when p.gender = 'F' then 'Female'
              when p.gender = 'O' then 'Other'
              end as "Sex",
       TIMESTAMPDIFF(YEAR, per.birthdate, CURDATE()) as Age,
       GROUP_CONCAT(DISTINCT (case when peraty.name = 'Population' then cv.concept_full_name else null end)) as "Category",
       ROUND(DATEDIFF(CURDATE(), o.value_datetime) / 7, 0) as "Wks on ART",
       pi2.identifier as "UIC",
       GROUP_CONCAT(distinct (case when peraty.name = 'Mother\'s name' Then peratt.value else null end)) as "Mother's name",
       GROUP_CONCAT(distinct (case when peraty.name = 'District of Birth' then cv.concept_full_name else null end)) as "District of Birth", 
       GROUP_CONCAT(distinct (case when peraty.name = 'Telephone' then peratt.value else null end)) as "Telephone no", 
       GROUP_CONCAT(distinct (case when peraty.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end)) as "Referred from",
       GROUP_CONCAT(distinct d.name) as "Regime",
       date(MAX(v.date_started)) as "Date Last Seen"

from visit v 
join patient pat on v.patient_id = pat.patient_id
jOIN obs o on pat.patient_id = o.person_id
join concept_view cv2 on o.concept_id=cv2.concept_id and cv2.concept_full_name = "PR, Start date of ART program" and o.voided=0
LEFT join patient_identifier pi on pat.patient_id = pi.patient_id and pi.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier' and retired=0 and uniqueness_behavior = 'UNIQUE')
LEFT JOIN patient_identifier pi2 on pat.patient_id = pi2.patient_id and pi2.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0 )
LEFT JOIN person_name pn on pat.patient_id = pn.person_id
lEFT JOIN person per on pat.patient_id = per.person_id
LEFT JOIN person_attribute peratt on pat.patient_id = peratt.person_id 
LEFT JOIN person_attribute_type peraty on peratt.person_attribute_type_id = peraty.person_attribute_type_id
left jOIN concept_view cv on peratt.value = cv.concept_id AND cv.retired = 0
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
                
group by v.patient_id having datediff(date('#endDate#'), date(max(v.date_started))) > 89;

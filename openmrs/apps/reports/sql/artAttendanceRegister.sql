select
      pi.identifier as "OI No",
      CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, '')) as "Name",
      pn.family_name as "Surname",
      case
          when pr.gender = 'M' then 'Male'
          when pr.gender = 'F' then 'Female'
          when pr.gender = 'O' then 'Other'
          end as "Sex",
      TIMESTAMPDIFF(YEAR, pr.birthdate, CURDATE()) as "Age",
      GROUP_CONCAT(DISTINCT (case when pat.name = 'Population' then cv.concept_full_name else null end)) as "Category",
      GROUP_CONCAT(distinct ROUND(DATEDIFF(CURDATE(), o3.value_datetime) / 7, 0)) as "Wks on ART",
      piu.identifier as "UIC",
      GROUP_CONCAT(distinct (case when pat.name = 'Mother\'s name' Then pa.value else null end)) as "Mother's name",
      GROUP_CONCAT(distinct (case when pat.name = 'District of Birth' then cv.concept_full_name else null end)) as "District of Birth",
      GROUP_CONCAT(distinct (case when pat.name = 'Telephone' then pa.value else null end)) as "Telephone no",
      GROUP_CONCAT(distinct (case when pat.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end)) as "Referred from",
      GROUP_CONCAT(DISTINCT cv1.concept_full_name) as "Type of Visit",
      date(v.date_started) as "Visit Date"

from patient p
      INNER JOIN obs o3 on p.patient_id = o3.person_id
      INNER JOIN concept_view cv2 on o3.concept_id=cv2.concept_id and cv2.concept_full_name = 'PR, Start date of ART program' and o3.voided=0 and o3.person_id not in (select o3.person_id from obs o3 INNER JOIN concept_view cv2 on o3.concept_id=cv2.concept_id and cv2.concept_full_name = 'PR, ART Program Stop Date' and o3.voided=0)
      LEFT JOIN patient_identifier pi on p.patient_id = pi.patient_id and pi.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier' and retired=0 and uniqueness_behavior = 'UNIQUE') and pi.voided = 0
      LEFT JOIN patient_identifier piu on p.patient_id = piu.patient_id and piu.identifier_type in  (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0 )
      LEFT JOIN person_name pn on pn.person_id = p.patient_id
      LEFT JOIN person pr on pr.person_id = p.patient_id
      LEFT JOIN person_attribute pa on pr.person_id=pa.person_id and pa.voided=0
      LEFT JOIN person_attribute_type pat on  pa.person_attribute_type_id=pat.person_attribute_type_id
      LEFT JOIN concept_view cv on pa.value = cv.concept_id
      LEFT JOIN visit v on p.patient_id = v.patient_id
      LEFT JOIN encounter e on e.visit_id = v.visit_id
      LEFT JOIN obs o on o.encounter_id = e.encounter_id and o.voided = 0
      INNER JOIN concept_view cv1 on cv1.concept_id = o.value_coded and cv1.concept_full_name IN ('Initial ART service','ART Routine Service ','PrEP Initial','PrEP Continuation','Review by MD/Doctor','Review by Nurse','Lab test (only)','Pick up Drugs (only)','Adherence Counselling','Home visit','Phone Call','Unplanned or walk in visit','Urgent','Hospital Visit')

where date(v.date_started) BETWEEN date('#startDate#') and date('#endDate#')
group by v.date_started,o.value_coded;

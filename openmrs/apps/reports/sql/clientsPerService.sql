select
      pi.identifier as "Patient Identifier",
      CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, '')) as "Name",
      pn.family_name as "Surname",
      case
          when pr.gender = 'M' then 'Male'
          when pr.gender = 'F' then 'Female'
          when pr.gender = 'O' then 'Other'
          end as "Sex",
      TIMESTAMPDIFF(YEAR, pr.birthdate, CURDATE()) as "Age",
      GROUP_CONCAT(DISTINCT (case when pat.name = 'Population' then cv.concept_full_name else null end)) as "Category",
      piu.identifier as "UIC",
      GROUP_CONCAT(distinct (case when pat.name = 'Mother\'s name' Then pa.value else null end)) as "Mother's name",
      GROUP_CONCAT(distinct (case when pat.name = 'District of Birth' then cv.concept_full_name else null end)) as "District of Birth",
      GROUP_CONCAT(distinct (case when pat.name = 'Telephone' then pa.value else null end)) as "Telephone no",
      GROUP_CONCAT(distinct (case when pat.name = 'Referral source' then case when cv.concept_short_name is null then cv.concept_full_name else cv.concept_short_name end else null end)) as "Referred from",
      GROUP_CONCAT(DISTINCT cv1.concept_full_name) as "Type of Visit",
      date(v.date_started) as "Visit Date"

from patient p
      INNER JOIN patient_identifier pi on p.patient_id = pi.patient_id and pi.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'Patient Identifier' and retired=0) and pi.voided = 0
      LEFT JOIN patient_identifier piu on p.patient_id = piu.patient_id and piu.identifier_type in  (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0 )
      LEFT JOIN person_name pn on pn.person_id = p.patient_id
      LEFT JOIN person pr on pr.person_id = p.patient_id
      LEFT JOIN person_attribute pa on pr.person_id=pa.person_id and pa.voided=0
      LEFT JOIN person_attribute_type pat on  pa.person_attribute_type_id=pat.person_attribute_type_id
      LEFT JOIN concept_view cv on pa.value = cv.concept_id
      LEFT JOIN visit v on p.patient_id = v.patient_id
      LEFT JOIN encounter e on e.visit_id = v.visit_id
      LEFT JOIN obs o on o.encounter_id = e.encounter_id and o.voided = 0
      INNER JOIN concept_view cv1 on cv1.concept_id = o.value_coded and cv1.concept_full_name IN 
      (
            "HIV Self Testing",
            "Provider Testing and Counseling",
            "Confirmatory HIV testing and Counseling",
            "Contact Tracing",
            "Initial ART service",
            "ART Routine Service",
            "Unplanned or walk in visit",
            "Urgent",
            "Pick up Drugs (only)",
            "Review by MD/Doctor",
            "Review by Nurse",
            "Lab test (only)",
            "Basic 1 and ART 1 service",
            "Phone Call",
            "Home visit",
            "Hospital Visit",
            "Adherence Counselling",
            "PrEP Initial",
            "PrEP Continuation",
            "VIAC",
            "Family Planning",
            "VMMC"       
    )

where date(v.date_started) BETWEEN date('#startDate#') and date('#endDate#')
group by v.date_started,o.value_coded;

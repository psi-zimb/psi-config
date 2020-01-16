select
  art_patients.OI_No as "OI No.",
  art_patients.Name,
  art_patients.Surname,
  art_patients.sex as "Sex",
  art_patients.Age,
  art_patients.Category,
  art_patients.WksonART as "Wks on ART",
  (case when art_patients.WksonART < 48 then "NA"
      when exists
        (select obs.obs_datetime
          from orders o inner join obs obs on o.order_id = obs.order_id
            where o.order_type_id = 3 /*Lab Orders*/
              and o.patient_id = art_patients.patient_id
              and o.concept_id in (select distinct concept_id from concept_set where concept_set = (select concept_id from concept_view where concept_full_name = 'Viral Load' and retired = 0))  /* Viral Concepts TODO*/
              and Date(o.date_activated) BETWEEN
              (case
                when (SUBDATE(art_patients.art_end_date, INTERVAL 48 WEEK) < art_patients.art_start_date) then  Date(art_patients.art_start_date)
                ELSE Date(SUBDATE(art_patients.art_end_date, INTERVAL 48 WEEK))
               END)
              and Date(art_patients.art_end_date)
        ) then "NO"
      ELSE "YES"
    END) as "Is Viral Load Due",
  art_patients.UIC,
  art_patients.Mothers_name as "Mother's name",
    art_patients.District_of_Birth as "District of Birth",
    art_patients.Telephone_no as "Telephone no",
    art_patients.Referred_from as "Referred from",
    art_patients.Regime,
    art_patients.Date_Of_Initiation as "Date Of Initiation"

from (select DISTINCT
  piOINo.patient_id,
  piOINo.identifier as "OI_No",

  CONCAT(
    personName.given_name,
    " ",
    COALESCE(personName.middle_name, '')
  ) as "Name",
  personName.family_name as Surname,
  case when person.gender = 'M' then 'Male' when person.gender = 'F' then 'Female' when person.gender = 'O' then 'Other' end as "Sex",
  TIMESTAMPDIFF(
    YEAR,
    person.birthdate,
    CURDATE()
  ) as Age,
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeType.name = 'Population' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "Category",
  ordersForRegime.date_activated as art_start_date,
  case when EXISTS(select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) then (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) else  date('#endDate#') end as art_end_date,

  /*Wks on ART : If ART Stop date is present then ART stop date Else report end date for calculation*/
  ROUND(DATEDIFF(
  case when (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) is null then date('#endDate#')
  else
  (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id)
  END, obsForArtProg.value_datetime) / 7, 0) as "WksonART",
  piUIC.identifier as "UIC",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Mother\'s name' Then personAttribute.value else null end
    )
  ) as "Mothers_name",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'District of Birth' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "District_of_Birth",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Telephone' then personAttribute.value else null end
    )
  ) as "Telephone_no",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Referral source' then case when cvForRefferedFrom.concept_short_name is null then cvForRefferedFrom.concept_full_name else cvForRefferedFrom.concept_short_name end else null end
    )
  ) as "Referred_from",
  group_concat(distinct drug.name) as "Regime",
  DATE(
    min(ordersForRegime.date_activated)
  ) as "Date_Of_Initiation"
from
  patient
  INNER JOIN obs obsForArtProg on patient.patient_id = obsForArtProg.person_id
  INNER JOIN concept_name nameToGetArtProg on obsForArtProg.concept_id = nameToGetArtProg.concept_id
  and nameToGetArtProg.name = "PR, Start date of ART program"
  and nameToGetArtProg.concept_name_type = 'FULLY_SPECIFIED'
  AND obsForArtProg.voided = 0
  and obsForArtProg.person_id not in
         (/*Patient with ART stop date <= report end date then remove the patient else show the patient for the past period.*/
         select obs.person_id from obs INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
         Where obs.value_datetime <= Date('#endDate#'))
  /*Not to include patients which having stop date*/
  INNER JOIN orders ordersForRegime on patient.patient_id = ordersForRegime.patient_id
  and ordersForRegime.order_type_id = 2
  and date(ordersForRegime.date_activated) between date('#startDate#')
  and date('#endDate#')
  and date(ordersForRegime.date_activated)
  and ordersForRegime.patient_id not in (
    select
      patient_id
    from
      orders
      JOIN drug ON orders.concept_id = drug.concept_id
      and drug.name in (
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
        "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml",
        "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg",
        "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml",
        "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg",
        "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg",
        "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml",
        "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg",
        "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml",
        "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg",
        "Didanosine (ddl) 200mg", "Didanosine (ddl) 250mg",
        "Didanosine (ddl) 25mg", "Didanosine (ddl) 400mg" "Emitricitabine 200mg",
        "Tenofovir 300mg", "Indinavir 400mg",
        "Saquinavir 200mg",
        "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Dolutegravia (DTG) 50mg",
        "Dolutegravia (DTG) 50mg",
        "Dolutegravia (DTG) 25mg"
      )
      and date(orders.date_activated) < date('#startDate#')
  )
  INNER JOIN drug_order drugOrder on ordersForRegime.order_id = drugOrder.order_id
  INNER JOIN drug on drug.drug_id = drugOrder.drug_inventory_id
  and drug.name in (
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
    "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml",
    "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg",
    "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml",
    "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg",
    "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg",
    "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml",
    "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg",
    "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml",
    "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg",
    "Didanosine (ddl) 200mg", "Didanosine (ddl) 250mg",
    "Didanosine (ddl) 25mg", "Didanosine (ddl) 400mg" "Emitricitabine 200mg",
    "Tenofovir 300mg", "Indinavir 400mg",
    "Saquinavir 200mg",
    "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Dolutegravia (DTG) 50mg",
    "Dolutegravia (DTG) 50mg",
    "Dolutegravia (DTG) 25mg"
  )
  /*For getting only formulation drugs*/
  LEFT JOIN patient_identifier piOINo on patient.patient_id = piOINo.patient_id
  and piOINo.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'PREP/OI Identifier'
      and retired = 0
      and uniqueness_behavior = 'UNIQUE'
  ) and piOINo.voided = 0
  LEFT JOIN patient_identifier piUIC on patient.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'UIC'
      and retired = 0
  )
  LEFT JOIN person on patient.patient_id = person.person_id
  LEFT JOIN person_name personName on patient.patient_id = personName.person_id
  LEFT JOIN person_attribute personAttribute on patient.patient_id = personAttribute.person_id
  LEFT JOIN person_attribute_type personAttributeType on personAttribute.person_attribute_type_id = personAttributeType.person_attribute_type_id
  LEFT jOIN concept_view cvForRefferedFrom on personAttribute.value = cvForRefferedFrom.concept_id
group by
  patient.patient_id

UNION DISTINCT

select DISTINCT
  piOINo.patient_id,
  piOINo.identifier as "OI_No",
  CONCAT(
    personName.given_name,
    " ",
    COALESCE(personName.middle_name, '')
  ) as "Name",
  personName.family_name as Surname,
  case when person.gender = 'M' then 'Male' when person.gender = 'F' then 'Female' when person.gender = 'O' then 'Other' end as "Sex",
  TIMESTAMPDIFF(
    YEAR,
    person.birthdate,
    CURDATE()
  ) as Age,
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeType.name = 'Population' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "Category",
  ordersForRegime.date_activated as art_start_date,
  case when EXISTS(select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) then (select obs.value_datetime from obs
  INNER JOIN concept_view on obs.concept_id=concept_view.concept_id and concept_view.concept_full_name = "PR, ART Program Stop Date" and obs.voided=0
  where obs.person_id = patient.patient_id) else  date('#endDate#') end as art_end_date,
  /*Wks on ART : If ART Stop date is present then ART stop date Else report end date for calculation*/
  ROUND(DATEDIFF(
  case when pp.date_completed is null then date('#endDate#')
  else
  pp.date_completed
  END, pp.date_enrolled) / 7, 0) as "WksonART",
  piUIC.identifier as "UIC",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Mother\'s name' Then personAttribute.value else null end
    )
  ) as "Mothers_name",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'District of Birth' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "District_of_Birth",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Telephone' then personAttribute.value else null end
    )
  ) as "Telephone_no",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Referral source' then case when cvForRefferedFrom.concept_short_name is null then cvForRefferedFrom.concept_full_name else cvForRefferedFrom.concept_short_name end else null end
    )
  ) as "Referred_from",
  group_concat(distinct drug.name) as "Regime",
  DATE(
    min(ordersForRegime.date_activated)
  ) as "Date_Of_Initiation"
from
  patient
  INNER JOIN patient_program pp on patient.patient_id = pp.patient_id
  AND pp.program_id=(select program_id from program where name = 'ART Program')
  AND pp.voided = 0
  and pp.date_enrolled <= Date('#endDate#')
  INNER JOIN orders ordersForRegime on patient.patient_id = ordersForRegime.patient_id
  and ordersForRegime.order_type_id = 2
  and date(ordersForRegime.date_activated) between date('#startDate#')
  and date('#endDate#')
  and date(ordersForRegime.date_activated)
  and ordersForRegime.patient_id not in (
    select
      patient_id
    from
      orders
      JOIN drug ON orders.concept_id = drug.concept_id
      and drug.name in (
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
        "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml",
        "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg",
        "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml",
        "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg",
        "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg",
        "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml",
        "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg",
        "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml",
        "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg",
        "Didanosine (ddl) 200mg", "Didanosine (ddl) 250mg",
        "Didanosine (ddl) 25mg", "Didanosine (ddl) 400mg" "Emitricitabine 200mg",
        "Tenofovir 300mg", "Indinavir 400mg",
        "Saquinavir 200mg",
        "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Dolutegravia (DTG) 50mg",
        "Dolutegravia (DTG) 50mg",
        "Dolutegravia (DTG) 25mg"
      )
      and date(orders.date_activated) < date('#startDate#')
  )
  INNER JOIN drug_order drugOrder on ordersForRegime.order_id = drugOrder.order_id
  INNER JOIN drug on drug.drug_id = drugOrder.drug_inventory_id
  and drug.name in (
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
    "Atazanavir/Rtv 300/100 mg", "Lopinavir/Rtv 80/20 mg/ml",
    "Lopinavir/Rtv 100/25 mg", "Lopinavir/Rtv 200/50 mg",
    "Lamivudine (3TC) 150 mg", "Lamivudine (3TC) 50mg/5ml",
    "Efavirenz (EFV) 50 mg", "Efavirenz (EFV) 200 mg",
    "Efavirenz (EFV) 600 mg", "Zidovudine (AZT) 300 mg",
    "Zidovudine (AZT) 100mg", "Zidovudine (AZT) 50mg/5ml",
    "Abacavir (ABC) 20mg/ml", "Abacavir (ABC) 300 mg",
    "Abacavir (ABC) 60mg", "Nevirapine (NVP) 50mg/5ml",
    "Nevirapine (NVP) 200mg", "Didanosine (ddl) 125mg",
    "Didanosine (ddl) 200mg", "Didanosine (ddl) 250mg",
    "Didanosine (ddl) 25mg", "Didanosine (ddl) 400mg" "Emitricitabine 200mg",
    "Tenofovir 300mg", "Indinavir 400mg",
    "Saquinavir 200mg",
    "Tenofovir (TDF) 300mg + Lamivudine (3TC) 300mg + Dolutegravia (DTG) 50mg",
    "Dolutegravia (DTG) 50mg",
    "Dolutegravia (DTG) 25mg"
  )
  /*For getting only formulation drugs*/
  LEFT JOIN patient_identifier piOINo on patient.patient_id = piOINo.patient_id
  and piOINo.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'PREP/OI Identifier'
      and retired = 0
      and uniqueness_behavior = 'UNIQUE'
  ) and piOINo.voided = 0
  LEFT JOIN patient_identifier piUIC on patient.patient_id = piUIC.patient_id
  and piUIC.identifier_type in (
    select
      patient_identifier_type_id
    from
      patient_identifier_type
    where
      name = 'UIC'
      and retired = 0
  )
  LEFT JOIN person on patient.patient_id = person.person_id
  LEFT JOIN person_name personName on patient.patient_id = personName.person_id
  LEFT JOIN person_attribute personAttribute on patient.patient_id = personAttribute.person_id
  LEFT JOIN person_attribute_type personAttributeType on personAttribute.person_attribute_type_id = personAttributeType.person_attribute_type_id
  LEFT jOIN concept_view cvForRefferedFrom on personAttribute.value = cvForRefferedFrom.concept_id
group by
  patient.patient_id) art_patients where art_patients.WksonART>=48 order by art_patients.WksonART desc
;

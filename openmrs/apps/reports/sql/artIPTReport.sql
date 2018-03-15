SELECT
  piOINo.identifier as "OI No.",
  CONCAT(
    personName.given_name,
    " ",
    COALESCE(personName.middle_name, '')
  ) as "Name",
  personName.family_name as "Surname",
  case when person.gender = 'M' then 'Male' when person.gender = 'F' then 'Female' when person.gender = 'O' then 'Other' end as "Sex",
  TIMESTAMPDIFF(
    YEAR,
    person.birthdate,
    CURDATE()
  ) as "Age",
  GROUP_CONCAT(
    DISTINCT (
      case when personAttributeType.name = 'Population' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "Category",
  GROUP_CONCAT(
    distinct ROUND(
      DATEDIFF(
        CURDATE(),
        obsForArtProg.value_datetime
      ) / 7,
      0
    )
  ) as "Wks on ART",
  piUIC.identifier as "UIC",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Mother\'s name' Then personAttribute.value else null end
    )
  ) as "Mother's name",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'District of Birth' then cvForRefferedFrom.concept_full_name else null end
    )
  ) as "District of Birth",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Telephone' then personAttribute.value else null end
    )
  ) as "Telephone no",
  GROUP_CONCAT(
    distinct (
      case when personAttributeType.name = 'Referral source' then case when cvForRefferedFrom.concept_short_name is null then cvForRefferedFrom.concept_full_name else cvForRefferedFrom.concept_short_name end else null end
    )
  ) as "Referred from",
  Concat(
    ifnull(Group_concat(distinct codedDiagnosisObs.concept_full_name),''),
    Case when Group_Concat(distinct codedDiagnosisObs.concept_full_name) IS NULL then ''
    ELSE
            Case when Group_Concat(distinct nonCodedDiagnosisObs.value_text) IS NULL then '' ELSE ',' END
    End,
    ifnull(Group_Concat(distinct nonCodedDiagnosisObs.value_text),'')
  ) as "Diagnosis", /*applied case for getting diagnosis for coded and noncoded values*/
  DATE(obsForIPTProg.value_datetime) as "Start Date",
  DATE((   Select obsIPTStopDate.value_datetime
    from obs obsIPTStopDate
    Where obsIPTStopDate.person_id =patient.patient_id
    and obsIPTStopDate.voided = 0
    and obsIPTStopDate.concept_id IN (select concept_id from concept_name where name = 'PR, IPT Program Stop Date' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0 )
    and obsIPTStopDate.value_datetime > obsForIPTProg.value_datetime
    order by obsIPTStopDate.value_datetime asc limit 1
  ) )as "End Date"

from patient

INNER JOIN obs obsForArtProg on patient.patient_id = obsForArtProg.person_id
INNER JOIN concept_name nameToGetArtProg on obsForArtProg.concept_id = nameToGetArtProg.concept_id
and nameToGetArtProg.name = "PR, Start date of ART program"
and nameToGetArtProg.concept_name_type = 'FULLY_SPECIFIED'
AND obsForArtProg.voided=0
and
obsForArtProg.person_id NOT in
(select obs.person_id from obs JOIN concept_view on obs.concept_id = concept_view.concept_id and concept_view.concept_full_name = 'PR, ART Program Stop Date'
and obs.voided =0)
/*Getting start date of IPT program*/
INNER JOIN obs obsForIPTProg on patient.patient_id = obsForIPTProg.person_id
INNER JOIN concept_name nameToGetIPTProg on obsForIPTProg.concept_id = nameToGetIPTProg.concept_id
and nameToGetIPTProg.name = "PR, Start date of IPT program"
and nameToGetIPTProg.concept_name_type = 'FULLY_SPECIFIED'
and obsForIPTProg.voided = 0
/*Getting diagnosis for patient*/
LEFT JOIN
(
    Select cv.concept_full_name,
    codedDiagnosisObs.person_id
    from obs codedDiagnosisObs
INNER JOIN concept_view cv
    on codedDiagnosisObs.value_coded=cv.concept_id
    where  codedDiagnosisObs.concept_id=15 and codedDiagnosisObs.voided = 0
    And  codedDiagnosisObs.obs_group_id not in (
                                                    Select obs_group_id from obs inActiveDiagnosis
                                                    where concept_id = 49 and value_coded = 48 and voided = 0 and Status = 'Final'
                                                )
) as codedDiagnosisObs
 On codedDiagnosisObs.person_id = patient.patient_id /*for getting coded diagnosis*/

 LEFT JOIN
 (
     Select nonCodedDiagnosisObs.value_text,
     nonCodedDiagnosisObs.person_id
     from obs nonCodedDiagnosisObs
     where nonCodedDiagnosisObs.concept_id=14
     and nonCodedDiagnosisObs.voided = 0
     AND nonCodedDiagnosisObs.obs_group_id not in (
                                                    Select obs_group_id from obs inActiveDiagnosis
                                                    where concept_id = 49 and value_coded = 48 and voided = 0 and Status = 'Final'
                                                   )
 ) as nonCodedDiagnosisObs
 on nonCodedDiagnosisObs.person_id=patient.patient_id /*for getting non coded diagnosis*/


LEFT JOIN patient_identifier piOINo on patient.patient_id = piOINo.patient_id
and piOINo.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'PREP/OI Identifier' and retired=0 and uniqueness_behavior = 'UNIQUE')
and piOINo.voided = 0
LEFT JOIN patient_identifier piUIC on patient.patient_id = piUIC.patient_id
and piUIC.identifier_type in (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0)
LEFT JOIN person on patient.patient_id = person.person_id
LEFT JOIN person_name personName on patient.patient_id = personName.person_id
LEFT JOIN person_attribute personAttribute on patient.patient_id = personAttribute.person_id
LEFT JOIN person_attribute_type personAttributeType on personAttribute.person_attribute_type_id = personAttributeType.person_attribute_type_id
LEFT jOIN concept_view cvForRefferedFrom on personAttribute.value = cvForRefferedFrom.concept_id

where obsForIPTProg.value_datetime is not null  and date(obsForIPTProg.value_datetime) between date('#startDate#') and date('#endDate#')
group by DATE(obsForIPTProg.value_datetime)
order by DATE(obsForIPTProg.value_datetime);

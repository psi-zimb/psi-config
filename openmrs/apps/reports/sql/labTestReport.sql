SELECT
piuLabTest.identifier AS "UIC",
CONCAT(patientName.given_name, " ", COALESCE(patientName.middle_name, '')) AS "Name",
patientName.family_name AS "Surname",
CASE
   WHEN personLabTest.gender = 'M' THEN 'Male'
   WHEN personLabTest.gender = 'F' THEN 'Female'
   WHEN personLabTest.gender = 'O' THEN 'Other'
   END AS "Sex",
TIMESTAMPDIFF(YEAR, personLabTest.birthdate, CURDATE()) AS Age,
GROUP_CONCAT(DISTINCT (case WHEN pattyLabTest.description = 'Population' THEN cvAttributeLabTest.concept_full_name ELSE NULL END)) AS "Category",
GROUP_CONCAT(distinct (case WHEN pattyLabTest.name = 'Mother\'s name' THEN patLabTest.value ELSE NULL END)) AS "Mother's name",
GROUP_CONCAT(distinct (case WHEN pattyLabTest.name = 'District of Birth' THEN cvAttributeLabTest.concept_full_name ELSE NULL END)) AS "District of Birth",
GROUP_CONCAT(distinct (case WHEN pattyLabTest.name = 'Telephone' THEN patLabTest.value ELSE NULL END)) AS "Telephone no",
cvLabTest.concept_full_name AS "Lab Test",
COALESCE(obsLabTest.value_numeric,obsLabTest.value_text,codedValues.concept_short_name,codedValues.concept_full_name) AS "Test Result/Value",
CONCAT(pnLabTest.given_name, " ", COALESCE(pnLabTest.family_name, '')) AS "Lab Services Requested By"

FROM obs obsLabTest
JOIN concept_view cvLabTest ON cvLabTest.concept_id = obsLabTest.concept_id AND cvLabTest.retired =0 AND cvLabTest.concept_class_name = 'Labtest'
LEFT JOIN concept_view codedValues ON obsLabTest.value_coded = codedValues.concept_id
LEFT JOIN orders oLabTest ON oLabTest.concept_id = obsLabTest.concept_id
LEFT JOIN users uLabTest ON uLabTest.user_id = oLabTest.creator
LEFT JOIN person_name pnLabTest ON pnLabTest.person_id = uLabTest.person_id
LEFT JOIN person_name patientName ON patientName.person_id = obsLabTest.person_id
LEFT JOIN patient_identifier piuLabTest ON patientName.person_id = piuLabTest.patient_id AND piuLabTest.identifier_type IN (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'UIC' AND retired=0 )
LEFT JOIN person personLabTest ON patientName.person_id = personLabTest.person_id
LEFT JOIN person_attribute patLabTest ON personLabTest.person_id = patLabTest.person_id
LEFT JOIN person_attribute_type pattyLabTest ON patLabTest.person_attribute_type_id = pattyLabTest.person_attribute_type_id
LEFT JOIN concept_view cvAttributeLabTest ON patLabTest.value = cvAttributeLabTest.concept_id AND cvAttributeLabTest.retired = 0
WHERE COALESCE(obsLabTest.value_numeric,obsLabTest.value_text,obsLabTest.value_coded) IS NOT NULL
AND DATE(oLabTest.date_created) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
GROUP BY obsLabTest.person_id,cvLabTest.concept_full_name;

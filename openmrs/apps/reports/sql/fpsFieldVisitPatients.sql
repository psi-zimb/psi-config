select pi.identifier as "Patient Identifier",
CONCAT(pn2.given_name, " ", COALESCE(pn2.middle_name, ''), " ",pn2.family_name) as "Patient Name",
date(min(obsforFPInitial.obs_datetime)) as "FPS Program Enrollment Date",
CONCAT(pn.given_name, " ", COALESCE(pn.middle_name, ''), " ",pn.family_name) as "Clinician's Name"
from obs obsforFPInitial 
join concept_view cv on obsforFPInitial.concept_id = cv.concept_id
join encounter enc on obsforFPInitial.encounter_id = enc.encounter_id
join visit v on enc.visit_id = v.visit_id
join visit_type vt on vt.visit_type_id = v.visit_type_id
join provider pro on obsforFPInitial.creator = pro.person_id
join person_name pn on pro.provider_id = pn.person_id
join patient_identifier pi on obsforFPInitial.person_id = pi.patient_id
join person per on obsforFPInitial.person_id = per.person_id
join person_name pn2 on per.person_id = pn2.person_id
where vt.name = "FIELD"
and cv.concept_full_name IN ("FPS FORM,Method issued and/or administered","FPS Continuation, Method Administered")
And v.patient_id Not in (select patient_id from patient_program where program_id In (select program_id from program where name ="FPS Program") and voided = 0)
and pi.identifier_type = (select patient_identifier_type_id from patient_identifier_type where name = 'Patient Identifier')
and date(obsforFPInitial.obs_datetime) between date('#startDate#') and date('#endDate#')
and obsforFPInitial.voided = 0
and enc.voided = 0
and cv.retired = 0
and v.voided = 0
and vt.retired = 0
and pro.retired = 0
and pn.voided = 0
group by obsforFPInitial.person_id
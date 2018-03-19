select piPrimaryIdentifier.identifier as "Patient ID",
CONCAT(pnForPatientName.given_name, " ", COALESCE(pnForPatientName.middle_name, '')) as "Name",
pnForPatientName.family_name as Surname,
case 
            when perSexBdate.gender = 'M' then 'Male'
            when perSexBdate.gender = 'F' then 'Female'
            when perSexBdate.gender = 'O' then 'Other'
            end as "Sex",
TIMESTAMPDIFF(YEAR, perSexBdate.birthdate, CURDATE()) as "Age",
piUIC.identifier as "UIC",
asServiceName.name as "Appointment Service",
date(paiApptStartDateTime.start_date_time) as "Appointment Date" ,
time(paiApptStartDateTime.start_date_time) as "Appointment start time",
CONCAT(pnForProviderName.given_name, " ", COALESCE(pnForProviderName.family_name, '')) as "Provider details",
paiApptStartDateTime.status "Appointment Status"
from patient pat
INNER JOIN patient_appointment paiApptStartDateTime 
		  	on pat.patient_id = paiApptStartDateTime.patient_id
LEFT join appointment_service asServiceName 
			on paiApptStartDateTime.appointment_service_id=asServiceName.appointment_service_id
LEFT join provider prProviderName 
			on paiApptStartDateTime.provider_id = prProviderName.provider_id
LEFT join person_name pnForProviderName 
			on prProviderName.person_id = pnForProviderName.person_id
LEFT join patient_identifier piPrimaryIdentifier 
			on pat.patient_id = piPrimaryIdentifier.patient_id
and piPrimaryIdentifier.identifier_type 
	IN (select patient_identifier_type_id from patient_identifier_type where name = 'Patient Identifier' and retired = 0)
LEFT JOIN person_name pnForPatientName 
			on pat.patient_id = pnForPatientName.person_id
LEFT JOIN person perSexBdate 
			on pat.patient_id = perSexBdate.person_id
LEFT JOIN patient_identifier piUIC 
			on pat.patient_id = piUIC.patient_id 
	and piUIC.identifier_type 
	IN (select patient_identifier_type_id from patient_identifier_type where name = 'UIC' and retired=0) 
where paiApptStartDateTime.status = 'CheckedIn' 
and paiApptStartDateTime.voided = 0 
and asServiceName.voided = 0
and date(paiApptStartDateTime.start_date_time) between date('#startDate#') and date('#endDate#')
group by paiApptStartDateTime.patient_appointment_id;
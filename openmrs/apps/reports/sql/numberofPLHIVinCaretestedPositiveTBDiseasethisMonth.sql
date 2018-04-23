select
'Number of PLHIV in care tested positive TB disease this month' as '-' ,
count(distinct person_id) as 'Count'
from obs 
where concept_id IN 
(	select concept_id from concept_name where name IN 
		(
			'MTB PCR (TB)','RIF Resistance (TB)'
		)
)
and obs.value_coded IN
(
			select concept_id from concept_name where name IN 
		(
			"MTB Detected, Very Low",
			"MTB Detected, Low",
			"MTB Detected, High",
			"MTB Detected, Very High",
			"RIF Resistance Indeterminate",
			"RIF Resistance Detected"
		) 
		and concept_name.voided = 0
)
and obs.voided = 0
and date(obs.obs_datetime) between date('#startDate#') and date('#endDate#')
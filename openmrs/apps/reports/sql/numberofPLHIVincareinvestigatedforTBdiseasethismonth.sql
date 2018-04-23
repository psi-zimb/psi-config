select "Number of PLHIV in care investigated for TB disease this month" as "-", 
count(1) as "Count" 
from 
(
	select patient_id from orders where concept_id IN 
	(
		select concept_id from concept_name where name IN 
		(
			'Sputum Comments (TB)','MTB PCR (TB)','RIF Resistance (TB)'
		) 
		and concept_name_type = 'FULLY_SPECIFIED' 
		AND voided = 0
	)
	and date(orders.date_activated) between date('#startDate#') and date('#endDate#')
	and voided = 0 
	and date_stopped is NULL and order_action != "DISCONTINUE"
	group by patient_id
) as numberofPLHIVincareinvestigatedforTBdiseasethismonth
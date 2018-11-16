select 
coalesce (cvReasonforRemovalAnswer.concept_short_name,cvReasonforRemovalAnswer.concept_full_name) as "Reason for removal", 
count(distinct obsReasonforRemoval.encounter_id) as "Count" 
from obs obsReasonforRemoval
join concept_view cvReasonforRemoval on obsReasonforRemoval.concept_id = cvReasonforRemoval.concept_id
join concept_view cvReasonforRemovalAnswer on obsReasonforRemoval.value_coded = cvReasonforRemovalAnswer.concept_id
where cvReasonforRemoval.concept_full_name = "FPS FORM,State reason for removal" 
        and cvReasonforRemovalAnswer.concept_full_name IN (
						                                       "FPS FORM,Expired", 
						                                       "FPS FORM,Desire to be pregnant", 
						                                       "FPS FORM,Health concerns", 
						                                       "FPS FORM,Complications", 
						                                       "Other"
                                     					  ) 
and obsReasonforRemoval.voided = 0
and cvReasonforRemoval.retired = 0
and cvReasonforRemovalAnswer.retired = 0
and date(obsReasonforRemoval.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obsReasonforRemoval.value_coded
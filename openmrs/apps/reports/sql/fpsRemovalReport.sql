select 
case when cv2.concept_short_name is not null then cv2.concept_short_name 
else cv2.concept_full_name 
end as "Reason for removal", 
count(*) as "Count" 
from obs obsReasonforRemoval
join concept_view cv on obsReasonforRemoval.concept_id = cv.concept_id
join concept_view cv2 on obsReasonforRemoval.value_coded = cv2.concept_id
where cv.concept_full_name = "FPS FORM,State reason for removal" 
        and cv2.concept_full_name In (
                                       "FPS FORM,Expired", 
                                       "FPS FORM,Desire to be pregnant", 
                                       "FPS FORM,Health concerns", 
                                       "FPS FORM,Complications", 
                                       "Other"
                                     ) 
and obsReasonforRemoval.voided = 0
and cv.retired = 0
and cv2.retired = 0
and date(obsReasonforRemoval.obs_datetime) between date('#startDate#') and date('#endDate#')
group by obsReasonforRemoval.value_coded
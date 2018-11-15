select 
Case 
when cv2.concept_full_name = "FPS FORM,Copper T" then "Number of IUCD Removal"
when cv2.concept_full_name = "FPS FORM,LNG-IUS" then "Number of IUCD Removal"
when cv2.concept_full_name = "FPS FORM,Implanon" then "Number of Implants Removal"
when cv2.concept_full_name = "FPS FORM,Jadelle" then "Number of Implants Removal"
End as '-', 
Count(obsDeviceRemoval.obs_id) as "Count"
from obs obsDeviceRemoval
join concept_view cv on obsDeviceRemoval.concept_id = cv.concept_id
join concept_view cv2 on obsDeviceRemoval.value_coded = cv2.concept_id
where cv.concept_full_name = "FPS FORM,FP type" and cv2.concept_full_name In ("FPS FORM,Implanon","FPS FORM,Jadelle","FPS FORM,Copper T","FPS FORM,LNG-IUS") 
and obsDeviceRemoval.voided = 0
and cv.retired = 0
and cv2.retired = 0
and date(obsDeviceRemoval.obs_datetime) between date('#startDate#') and date('#endDate#')
group by 
Case 
when cv2.concept_full_name = "FPS FORM,Copper T" then "Number of IUCD Removal"
when cv2.concept_full_name = "FPS FORM,LNG-IUS" then "Number of IUCD Removal"
when cv2.concept_full_name = "FPS FORM,Implanon" then "Number of Implants Removal"
when cv2.concept_full_name = "FPS FORM,Jadelle" then "Number of Implants Removal" End
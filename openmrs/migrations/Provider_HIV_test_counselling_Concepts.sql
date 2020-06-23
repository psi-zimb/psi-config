set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider HIV test counselling, Was recency testing done?','Was recency testing done?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider HIV test counselling, What was the result?','What was the result?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Recent','Recent','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Long term','Long term','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider HIV test counselling, Date of recency testing result','Date of recency testing result','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider HIV test counselling, What was the testing modality used?','What was the testing modality used?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility VCT','Facility VCT','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility Index','Facility Index','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility PICT VMMC','Facility PICT VMMC','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility PICT TB','Facility PICT TB','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility PICT STI','Facility PICT STI','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Facility PICT Other','Facility PICT Other','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider HIV test counselling, Why was it not done?','Why was it not done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Client not eligible','Client not eligible','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Client declined','Client declined','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Kits not available','Kits not available','N/A','Misc',false);


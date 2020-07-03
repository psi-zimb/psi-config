set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Init Form, Was client initiated on PrEP?','Was client initaited on PrEP?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Init Form, Date client initiated on PrEP','Date client initiated on PrEP','Date','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Init Form, Duration of medication','Duration of medication','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'1 month or less','1 month or less','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'2 Months supply','2 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'3 Months supply','3 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'4 Months supply','4 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'5 Months supply','5 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'6 Months supply','6 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'More than 6 months supply','More than 6 months supply','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Init Form, Duration client intends to take prep?','Duration client intends to take prep?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'1 month','1 month','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'2 Months','2 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'3 Months','3 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'4 Months','4 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'5 Months','5 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'6 Months','6 Months','N/A','Misc',false);



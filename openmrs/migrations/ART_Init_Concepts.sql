set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Client initiated on ART','Client initiated on ART','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Next date of medication resupply','Next date of medication resupply','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Next review date','Next review date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Date client initiated on ART','Date client initiated on ART','Date','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Duration of medication','Duration of medication','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'1 month or less','1 month or less','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'2 Months supply','2 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'3 Months supply','3 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'4 Months supply','4 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'5 Months supply','5 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'6 Months supply','6 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'More than 6 months supply','More than 6 months supply','N/A','Misc',false);



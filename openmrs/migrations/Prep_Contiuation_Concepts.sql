set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;



call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Cont Form, Next date of medication resupply','Next date of medication resupply','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Cont Form, PrEP end date','PrEP end date','Date','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Cont Form, Duration of medication','Duration of medication','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'1 month or less','1 month or less','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'2 Months supply','2 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'3 Months supply','3 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'4 Months supply','4 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'5 Months supply','5 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'6 Months supply','6 Months supply','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'More than 6 months supply','More than 6 months supply','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prep Cont Form, Type of follow up','Type of follow up','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit1 at 2 weeks','Follow-up visit1 at 2 weeks','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 2 at 1 Month','Follow-up visit 2 at 1 Month','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 3 at 2 Months','Follow-up visit 3 at 2 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 4 at 3 Months','Follow-up visit 4 at 3 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 5 at 4 Months','Follow-up visit 5 at 4 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 6 at 5 Months','Follow-up visit 6 at 5 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 7 at 6 Months','Follow-up visit 7 at 6 Months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Follow-up visit 8 at more than 6 Months','Follow-up visit 8 at more than 6 Months','N/A','Misc',false);



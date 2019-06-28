set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Breast Feeding Program",'Breast Feeding Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Breast Feeding Program Workflow",'Breast Feeding Program Workflow','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Exclusive BF",'Exclusive BF','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Mixed BF",'Mixed BF','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Breast Feeding Program Outcomes",'Breast Feeding Program Outcomes','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Weaned",'Weaned','N/A','Misc',false);
set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"PrEP Program",'PrEP Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"PrEP Program Outcomes",'PrEP Program Outcomes','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"PrEP Program Workflow",'PrEP Program Workflow','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Initiated",'Initiated','N/A','Misc',false);
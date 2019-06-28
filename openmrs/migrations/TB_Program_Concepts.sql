set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"TB Program",'TB Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"TB Program Workflow",'TB Program Workflow','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Intensive",'Intensive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Continuation",'Continuation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"TB Program Outcome",'TB Program Outcome','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Cured",'Cured','N/A','Misc',false);

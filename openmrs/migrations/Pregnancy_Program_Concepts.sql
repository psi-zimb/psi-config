set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Pregnancy Program",'Pregnancy Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Pregnancy Program Workflow",'Pregnancy Program Workflow','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"1st Trimester",'1st Trimester','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"2nd Trimester",'2nd Trimester','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"3rd Trimester",'3rd Trimester','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Pregnancy Program Outcomes",'Pregnancy Program Outcomes','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Delivered",'Delivered','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Miscarriage","Miscarriage",'N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Still Birth",'Still Birth','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Maternal Death/Deceased",'Maternal Death/Deceased','N/A','Misc',false);
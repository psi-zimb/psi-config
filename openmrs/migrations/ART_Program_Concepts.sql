set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"ART Program",'ART Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"ART Program Workflow",'ART Program Workflow','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"1st Line",'1st Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"2nd Line",'2nd Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"3rd Line",'3rd Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"ART Program Outcomes",'ART Program Outcomes','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Lost to follow up","Lost to follow up",'N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Deceased",'Deceased','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Opted Out",'Opted Out','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Double Entry",'Double Entry','N/A','Misc',false);	
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Doctor's Decision","Transferred Out - Doctor's Decision",'N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Dosing Problems",'Transferred Out - Dosing Problems','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Drug not available",'Transferred Out - Drug not available','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Patient's decision","Transferred Out - Patient's decision",'N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Treatment failure",'Transferred Out - Treatment failure','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - Relocation",'Transferred Out - Relocation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"Transferred Out - GP/Treat all","Transferred Out - GP/Treat all",'N/A','Misc',false);



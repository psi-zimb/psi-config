set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"HTS Program",'HTS Program','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"HTS Program Outcomes",'HTS Program Outcomes','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"HIV positive",'HIV positive','N/A','Misc',false);



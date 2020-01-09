set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Is the client on treatment?','Is the client on treatment?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Which line of treatment?','Which line of treatment?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,1st Line','1st Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,2nd Line','2nd Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,3rd Line','3rd Line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Combination of drugs','Combination of drugs','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,TDF 300mg + 3TC 300mg + EFV 400mg','TDF 300mg + 3TC 300mg + EFV 400mg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,TDF 300mg + 3TC 300mg + EFV 600mg','TDF 300mg + 3TC 300mg + EFV 600mg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,AZT 300mg + 3TC 150mg + NVP 200mg','AZT 300mg + 3TC 150mg + NVP 200mg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,TDF 300mg + 3TC 300mg + DTG 50mg','TDF 300mg + 3TC 300mg + DTG 50mg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,AZT 300 + 3TC 300 + ATV/r 300/100','AZT 300 + 3TC 300 + ATV/r 300/100','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,AZT 300 + 3TC 300 + LPV/r 400/100','AZT 300 + 3TC 300 + LPV/r 400/100','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,TDF 300 + 3TC 300 + ATV/r 300/100','TDF 300 + 3TC 300 + ATV/r 300/100','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,TDF 300 + 3TC 300 + LPV/r 400/100','TDF 300 + 3TC 300 + LPV/r 400/100','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Others','Others','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,if others then specify','if others then specify','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Date of initiation','Date of initiation','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Latest viral load result','Latest viral load result','Numeric','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Reason for not on treatment','Reason for not on treatment','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Fear of side effects','Fear of side effects','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Fear of Disclosure','Fear of Disclosure','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Fear of Stigma and Discrimination','Fear of Stigma and Discrimination','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,ART not available','ART not available','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Opted to use Herbs','Opted to use Herbs','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Viac Form,Spiritual Healing','Spiritual Healing','N/A','Misc',false);



set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Template','NCD','N/A','Misc',true);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Service Provided','Service Provided','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Facility','Facility','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Site Type','Site Type','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, District','District','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Setting','Setting','Coded','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Clients screened for hypertension','Clients screened for hypertension','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Clients screened for Type 2 diabetes','Clients screened for Type 2 diabetes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Clients diagnosed with hypertension','Clients diagnosed with hypertension','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Clients diagnosed with Type 2 diabetes ','Clients diagnosed with Type 2 diabetes ','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Is hypertension condition controlled','Is hypertension condition controlled','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Is Diabetes condition controlled','Is Diabetes condition controlled','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Hypertension management','Hypertension management','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Diabetes management – gestational','Diabetes management – gestational','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'NCD Form, Diabetes management – non-gestational','Diabetes management – non-gestational','Coded','Misc',false);





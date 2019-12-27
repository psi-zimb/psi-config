set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Enhanced Adherence Counseling','Enhanced Adherence Counseling','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Provider name for Enhanced adherence counseling','Provider name for Enhanced Adherence Counseling','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Enhanced Adherence Counseling Template','Enhanced Adherence Counseling','N/A','Misc',true);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Have you been taking your drugs daily?','Have you been taking your drugs daily?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, What time are you taking the drugs?','What time are you taking the drugs?','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Have you been taking drugs at the same time daily?','Have you been taking drugs at the same time daily?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, What challenges are you facing to maintain the same time?','What challenges are you facing to maintain the same time?','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, What was your baseline CD4 count?','What was your baseline CD4 count?','Numeric','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Are you using any other medications or traditional herbs?','Are you using any other medications or traditional herbs?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, If Yes, Specify1','If Yes, Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Traditional Herbs','Traditional Herbs','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, If Others, Specify','If Others, Specify','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Have been having unprotected sex?','Have been having unprotected sex?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, If Yes, Specify2','If Yes, Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'With someone of unknown status refusing to test','With someone of unknown status refusing to test','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'With someone HIV infected but not on effective anti-retroviral treatment','With someone HIV infected but not on effective anti-retroviral treatment','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'With someone with a detectable viral load','With someone with a detectable viral load','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"EAC Form, What is the client's current viral load?","What is the client's current viral load?",'Numeric','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Assessment','Assessment','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Plan','Plan','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, What could be the possible cause of treatment failure?','What could be the possible cause of treatment failure?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Drug non-adherence','Drug non-adherence','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Baseline CD4 less than 100','Baseline CD4 less than 100','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Use of traditional Herbs','Use of traditional Herbs','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Drug to drug interaction','Drug to drug interaction','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, Specify drug','Specify drug','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Unprotected sex with a infected partner','Unprotected sex with a infected partner','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'EAC Form, What is the outcome of this current session?','What is the outcome of this current session?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'continue EAC','continue EAC','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Repeat Viral Load','Repeat Viral Load','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Virally suppressed discharge from EAC','Virally suppressed discharge from EAC','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Unsuppressed Switch to 2nd line','Unsuppressed Switch to 2nd line','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Unsuppressed transfer for 3rd line','Unsuppressed transfer for 3rd line','N/A','Misc',false);
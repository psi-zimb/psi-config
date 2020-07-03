set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;




call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Type of Visit','Type of Visit','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB Screening visit','TB Screening visit','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Results Entry','Results Entry','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Type of client','Type of client','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PSI client','PSI client','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Other facility client','Other facility client','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Did you received IPT?','Did you received IPT?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, IPT start date','IPT start date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Did you complete IPT?','Did you complete IPT?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, IPT completion date','IPT completion date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Reason for not completing IPT','Reason for not completing IPT','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'On contiuation','On contiuation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Stopped due to severe side effects','Stopped due to severe side effects','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Client opted out','Client opted out','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, HIV Status','HIV Status','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, ART Status','ART Status','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'New on ART','New on ART','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Already on ART','Already on ART','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Where is client getting medication','Where is client getting medication','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Are you on ART?','Are you on ART?','Coded','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Gene Xpert Results','Gene Xpert Results','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, RIF Resistance','RIF Resistance','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Screening method used today','Screening method used today','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Smear (Microscopy)','Smear (Microscopy)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Gene Xpert','Gene Xpert','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Smear (Microscopy) results','Smear (Microscopy) results','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'No AAFBs seen','No AAFBs seen','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AAFBs seen (trace -)','AAFBs seen (trace -)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AAFBs seen +','AAFBs seen +','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AAFBs seen ++','AAFBs seen ++','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AAFBs seen +++','AAFBs seen +++','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Specify method used','Specify method used','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Xray results','Xray results','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Not suggestive of TB','Not suggestive of TB','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Suggestive of TB','Suggestive of TB','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Type of TB case','Type of TB case','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Date of last TB treatment','Date of last TB treatment','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Treatment outcome','Treatment outcome','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Started on Treatment','Started on Treatment','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TB History Form Template, Course completion outcomes','Course completion outcomes','Coded','Misc',false);

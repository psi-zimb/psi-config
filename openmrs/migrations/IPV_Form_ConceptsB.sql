set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV TemplateB','IPVB','N/A','Misc',true);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Service Provided','Service Provided','N/A','Misc',true);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Facility','Facility','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Site Type','Site Type','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, District','District','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Setting','Setting','Coded','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Has partner ever threatened to hurt you?','Has partner ever threatened to hurt you?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Partner ever physically hurt you?','Partner ever physically hurt you?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Partner ever sexually abused you?','Partner ever sexually abused you?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Partner ever threatened you?','Partner ever threatened you?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'IPV FormB, Partner ever threatened to Kill you?','Partner ever threatened to Kill you?','Coded','Misc',false);






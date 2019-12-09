set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Have you ever been screened for cervical cancer?','Have you ever been screened for cervical cancer?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, When were you last screened?','When were you last screened?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, What screening test was used?','What screening test was used?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV DNA','HPV DNA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear','Papsmear','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA','VIA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC','VIAC','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, What was the the result?','What was the the result?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV DNA Pos-VIAC Neg','HPV DNA Pos-VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos','HPV Pos-VIAC Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive','VIAC Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive','VIA Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos','Papsmear Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV DNA Neg','HPV DNA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Neg','Papsmear Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Neg','VIA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Neg','VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Did not collect results','Did not collect results','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Don’t know','Don’t know','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV Pos-VIAC Pos Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Positive Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Positive Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Pos Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, HPV DNA Neg Date','HPV DNA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Papsmear Neg Date','Papsmear Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIA Neg Date','VIA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, VIAC Neg Date','VIAC Neg','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, When is your next date of screening?','When is your next date of screening?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AIVC, Is the client eligible for cervical cancer screening today?','Is the client eligible for cervical cancer screening today?','Coded','Misc',false);




call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Have you ever been screened for cervical cancer?','Have you ever been screened for cervical cancer?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, When were you last screened?','When were you last screened?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, What screening test was used?','What screening test was used?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV DNA','HPV DNA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear','Papsmear','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA','VIA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC','VIAC','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, What was the the result?','What was the the result?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV DNA Pos-VIAC Neg','HPV DNA Pos-VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos','HPV Pos-VIAC Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive','VIAC Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive','VIA Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos','Papsmear Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV DNA Neg','HPV DNA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Neg','Papsmear Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Neg','VIA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Neg','VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Did not collect results','Did not collect results','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Don’t know','Don’t know','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Other (Specify details) Text','If Other, Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV Pos-VIAC Pos Other (Specify date) Date','If Other, Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Other (Specify details) Text','If Other, Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Positive Other (Specify date) Date','If Other, Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Other (Specify details) Text','If Other, Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Positive Other (Specify date) Date','If Other, Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Other (Specify details) Text','If Other, Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Pos Other (Specify date) Date','If Other, Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, HPV DNA Neg Date','HPV DNA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Papsmear Neg Date','Papsmear Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIA Neg Date','VIA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, VIAC Neg Date','VIAC Neg','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, When is your next date of screening?','When is your next date of screening?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'RUUV, Is the client eligible for cervical cancer screening today?','Is the client eligible for cervical cancer screening today?','Coded','Misc',false);



call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Have you ever been screened for cervical cancer?','Have you ever been screened for cervical cancer?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, When were you last screened?','When were you last screened?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, What screening test was used?','What screening test was used?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV DNA','HPV DNA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear','Papsmear','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA','VIA','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC','VIAC','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, What was the the result?','What was the the result?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV DNA Pos-VIAC Neg','HPV DNA Pos-VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos','HPV Pos-VIAC Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive','VIAC Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive','VIA Positive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos','Papsmear Pos','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV DNA Neg','HPV DNA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Neg','Papsmear Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Neg','VIA Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Neg','VIAC Neg','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Did not collect results','Did not collect results','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Don’t know','Don’t know','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV Pos-VIAC Pos Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Positive Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Positive Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Did u have any intervention done?','Did u have any intervention done?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos If Yes','If Yes','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Cryotherapy','Cryotherapy','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Thermocoagulation','Thermocoagulation','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos LEEP','LEEP','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Referred to Gyne','Referred to Gyne','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Other (Specify details)','Other (Specify details)','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Other (Specify date)','Other (Specify date)','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Cryotherapy Date','Cryotherapy, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Thermocoagulation Date','Thermocoagulation, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos LEEP Date','LEEP, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Referred to Gyne Date','Referred to Gyne, Specify Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Other (Specify details) Text','Specify Details','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Pos Other (Specify date) Date','Specify Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, HPV DNA Neg Date','HPV DNA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Papsmear Neg Date','Papsmear Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIA Neg Date','VIA Neg','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, VIAC Neg Date','VIAC Neg','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, When is your next date of screening?','When is your next date of screening?','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Is the client eligible for cervical cancer screening today?','Is the client eligible for cervical cancer screening today?','Coded','Misc',false);
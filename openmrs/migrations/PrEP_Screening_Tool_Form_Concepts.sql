set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP Screening Tool Template','PrEP Screening Tool','N/A','Misc',true);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Is the Client HIV negative','Is the Client HIV negative','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Date tested','Date tested','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Is the client sexually active','Is the client sexually active','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Is the sexually active in a high prevalence / KP population in the last 6 months?','Is the sexually active in a high prevalence / KP population in the last 6 months?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, If Yes, then Specify1','If Yes, then Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'TG','TG','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Sero-discordant','Sero-discordant','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?','Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, How many sexual partners did you have vaginal or anal sex with?','How many sexual partners did you have vaginal or anal sex with?','Numeric','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, In the past 6 months, did you use condoms consistently during sex?','In the past 6 months, did you use condoms consistently during sex?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Does the client have a sex partner with one or more HIV risk factors','Does the client have a sex partner with one or more HIV risk factors','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, If Yes, then Specify2','If Yes, then Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Living with HIV','Living with HIV','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Injecting drugs','Injecting drugs','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Men having sex with men','Men having sex with men','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, A transgender person?','A transgender person?','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, A sex worker','A sex worker','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Has sex with multiple partners without condoms','Has sex with multiple partners without condoms','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, In the last 6 months has the client been treated for an STI by lab testing, self-reports, syndromic STI treatment','In the last 6 months has the client been treated for an STI by lab testing, self-reports, syndromic STI treatment','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, In the last 6 months have you taken post-exposure prophylaxis (PEP) following a potential exposure to HIV?','In the last 6 months have you taken post-exposure prophylaxis (PEP) following a potential exposure to HIV?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, In the last 6 months have you used emergency contraception?','In the last 6 months have you used emergency contraception?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, In the last 6 months have you had sex while under the influence of alcohol?','In the last 6 months have you had sex while under the influence of alcohol?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Are you in a Sero-discordant relationship?','Are you in a Sero-discordant relationship?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, If Yes, then Specify3','If Yes, then Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Trying to conceive','Trying to conceive','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Unknown treatment of positive partner','Unknown treatment of positive partner','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Partner with HIV who has not been on effective therapy for the entire 6 months','Partner with HIV who has not been on effective therapy for the entire 6 months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Unsuppressed/unknown viral load','Unsuppressed/unknown viral load','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Do you have a partners of unknown status who refuse testing?','Do you have a partners of unknown status who refuse testing?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Do you inject drugs?','Do you inject drugs?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Is the client eligible for PrEP','Is the client eligible for PrEP','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, If Yes, then Specify4','If Yes, then Specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PWID','PWID','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Has the client been referred for PrEP','Has the client been referred for PrEP','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'PrEP ST Form, Reason(s) for not referring the client','Reason(s) for not referring the client','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Not Ready','Not Ready','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Fear of side effects','Fear of side effects','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Need to notify partner first','Need to notify partner first','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Prefers other prevention methods','Prefers other prevention methods','N/A','Misc',false);








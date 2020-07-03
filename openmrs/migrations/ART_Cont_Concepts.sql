set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Activity status','Activity status','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Type of transfer out','Type of transfer out','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Self Transfer','Self Transfer','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Official Transfer','Official Transfer','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Cause of death','Cause of death','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'HIV Disease Resulting in TB','HIV Disease Resulting in TB','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'HIV Disease Resulting in Cancer','HIV Disease Resulting in Cancer','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'HIV Disease Resulting in other Infections and Parasitic Disease','HIV Disease Resulting in other Infections and Parasitic Disease','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Other Disease Resulting in other Disease or conditions leading to Death','Other Disease Resulting in other Disease or conditions leading to Death','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Other Natural Causes','Other Natural Causes','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Non-Natural Causes and Unknown Causes','Non-Natural Causes and Unknown Causes','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Specify Other Infections and Parasitic Disease','Specify Other Infections and Parasitic Disease','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Specify Other Natural Causes','Specify Other Natural Causes','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Specify other Disease or conditions leading to Death','Specify other Disease or conditions leading to Death','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date client reported as LTFU','Date client reported as LTFU','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Transfer out date','Transfer out date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date of death','Date of death','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Period initiated on ART before LTFU','Period initiated on ART before LTFU','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'less than 3 months','less than 3 months','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'more than 3 months','more than 3 months','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date client opted out','Date client opted out','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Transfer in Date','Transfer in Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date of Reinitiation','Date of Reinitiation','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Program stop date','Program stop date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Type of follow up','Type of follow up','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Duration of medication','Duration of medication','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Next date of medication resupply','Next date of medication resupply','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Next review date','Next review date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Is the client eligible for Viral Load?','Is the client eligible for Viral Load?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Was the sample sent to the lab','Was the sample sent to the lab','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Reason sample not sent to the lab','Reason sample not sent to the lab','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Sample clotted','Sample clotted','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Sample insufficient','Sample insufficient','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Wrong sample tube','Wrong sample tube','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Unsuitable sample','Unsuitable sample','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Sample not labelled','Sample not labelled','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Type of request','Type of request','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Routine','Routine','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Targeted','Targeted','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Routine type','Routine type','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'6 or 12 months routine','6 or 12 months routine','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Annual routine','Annual routine','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Targeted type','Targeted type','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Targeted after EAC','Targeted after EAC','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Targeted PREG/BF','Targeted PREG/BF','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Why is the client not eligible for V/L?','Why is the client not eligible for V/L?','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Has a valid result','Has a valid result','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Awaiting results','Awaiting results','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Less than 6 months on ART','Less than 6 months on ART','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Less than 12 month on ART','Less than 12 month on ART','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Results Entry','Results Entry','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Invalid test results','Invalid test results','N/A','Misc',false);


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date of last V/L','Date of last V/L','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, What is the value of the V/L?','What is the value of the V/L?','Numeric','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Date Viral load results received','Date Viral load results received','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Viral Load result','Viral Load result','Numeric','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Viral load status','Viral load status','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Suppressed','Suppressed','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Unsuppressed','Unsuppressed','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Client referred for EAC','Client referred for EAC','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'AP, Next Viral Load date','Next Viral Load date','Date','Misc',false);

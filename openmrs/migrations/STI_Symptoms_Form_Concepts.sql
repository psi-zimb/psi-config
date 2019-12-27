set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;


call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, The client is the Index or Contact person','The client is the Index or Contact person','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Index','Index','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Contact','Contact','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"STI Symptoms, Male, Client's HIV status","Client's HIV status",'Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Registered for ART','Registered for ART','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, If Yes','If Yes, then specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, NSC','OI number for NSC','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Other','OI number for Other','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Family Medical History','Family Medical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Other, Specify','if others, please specify','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Past significant Medical History','Past significant Medical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'MI','MI','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Other Cardiovascular diseases','Other Cardiovascular diseases','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Endocrine','Endocrine','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Eye, Ear, Nose & Throat','Eye, Ear, Nose & Throat','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Gastrointestinal','Gastrointestinal','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Hematologic','Hematologic','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Hepatic','Hepatic','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Musculoskeletal','Musculoskeletal','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Neurologic','Neurologic','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Oncologic','Oncologic','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Psychiatric','Psychiatric','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Developmental History','Developmental History','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Past Significant Surgical History','Past Significant Surgical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Thoracic Surgery','Thoracic Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Colon and Rectal Surgery','Colon and Rectal Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Obstetrics and Gynecology','Obstetrics and Gynecology','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Oncology','Oncology','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Neurological Surgery','Neurological Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Ophthalmic Surgery','Ophthalmic Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Oral and Maxillofacial Surgery','Oral and Maxillofacial Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Orthopaedic Surgery','Orthopaedic Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Otolaryngology','Otolaryngology','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Pediatric Surgery','Pediatric Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Plastic and Maxillofacial Surgery','Plastic and Maxillofacial Surgery','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Urology','Urology','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Vascular Surgery','Vascular Surgery','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Other type of discharge','if others, please specify','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Is the Ulcer painful?','Is the Ulcer painful?','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Correct and consistent use of condoms','Correct and consistent use of condoms','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Acute scrotal swelling','Acute scrotal swelling','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Inguinal Bubo','Inguinal Bubo','N/A','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Pubic Lice','Pubic Lice','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Syphilis Date','Syphilis, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Acute scrotal swelling Date','Acute scrotal swelling, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Balanitis Date','Balanitis, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Genital herpes Date','Genital herpes, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Genital ulcer disease Date','Genital ulcer disease, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Genital Warts Date','Genital Warts, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Inguinal Bubo Date','Inguinal Bubo, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Pubic Lice Date','Pubic Lice, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Scabies Date','Scabies, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Urethral Discharge Syndrome Date','Urethral Discharge Syndrome, Treatment Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Physical Examination','Physical Examination','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Investigations','Investigations','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Diagnosis','Diagnosis','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Anal Warts','Anal Warts','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Management','Management','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Review Date','Review','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Male, Contact Slip Issued','Contact Slip Issued','Coded','Misc',false);






call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, The client is the Index or Contact person','The client is the Index or Contact person','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,"STI Symptoms, Female, Client's HIV status","Client's HIV status",'Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Registered for ART','Registered for ART','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, If Yes','If Yes, then specify','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, NSC','OI number for NSC','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Other','OI number for Other','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Family Medical History','Family Medical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Other, Specify','if others, please specify','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Past significant Medical History','Past significant Medical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Cardiovascular','Cardiovascular','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Past Significant Surgical History','Past Significant Surgical History','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'Gynecologic Oncology','Gynecologic Oncology','N/A','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Correct and consistent use of condoms','Correct and consistent use of condoms','Coded','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Physical Examination','Physical Examination','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Investigations','Investigations','Text','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Diagnosis','Diagnosis','Coded','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Syphilis Date','Syphilis, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Genital herpes Date','Genital herpes, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Genital ulcer disease Date','Genital ulcer disease, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Genital Warts Date','Genital Warts, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Inguinal Bubo Date','Inguinal Bubo, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Pelvic Inflammatory Disease Date','Pelvic Inflammatory Disease, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Pubic Lice Date','Pubic Lice, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Scabies Date','Scabies, Treatment Date','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Vaginal Discharge Syndrome Date','Vaginal Discharge Syndrome, Treatment Date','Date','Misc',false);

call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Management','Management','Text','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Review Date','Review','Date','Misc',false);
call add_concept_psi(@concept_id,@concept_short_id,@concept_full_id,'STI Symptoms, Female, Contact Slip Issued','Contact Slip Issued','Coded','Misc',false);

 /*  Classification as first time user*/
                select
                case when cvMethodIssuedAnswer.concept_full_name IN ("FPS FORM,Projesterone only pill (POP)",
                                                                     "FPS FORM,Combined oral contaceptive (COC)",
                                                                     "FPS FORM,Emergency contraception",
                                                                     "FPS FORM,Injectable (Petogen)"
                                                                     )
                then "SHORT TERM METHODS"                                                 
                 when cvMethodIssuedAnswer.concept_full_name IN ("FPS FORM,Implanon Implants",
                                                                        "FPS FORM,Jadelle Implants",
                                                                        "FPS FORM,Copper T IUCD",
                                                                        "FPS FORM,LNG-IUS IUCD"
                                                                )
                                                                        
                   then "LARCS"
                when    
                   cvMethodIssuedAnswer.concept_full_name IN (
                                                                "FPS FORM,Tuberligation",
                                                                "FPS FORM,Vasectomy"
                                                              )
                   then "PERMANENT METHODS"
                   END AS "Category",                                                 
                
                case
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Projesterone only pill (POP)" then "POP"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Combined oral contaceptive (COC)" then "COC"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Emergency contraception" then "Emergency Contraception"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Injectable (Petogen)" then "Injectables"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Implanon Implants" then "Implanon"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Jadelle Implants" then "Jadelle"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Copper T IUCD" then "IUCD (Copper T)"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,LNG-IUS IUCD" then "IUS5 (Same as LNG IUS)"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Tuberligation" then "Tubal Ligation"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Vasectomy" then "Vasectomy"
                end
                as "FP Method",
                count(distinct obsForFirsttimeUser.encounter_id) as "Count"
                from obs obsForFirsttimeUser
                join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id
                join obs obsMethodIssued on obsForFirsttimeUser.encounter_id = obsMethodIssued.encounter_id
                join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                where 
                cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvforQuestionAnswer.concept_full_name In (
                                             "None"  
                                             )
                and obsForFirsttimeUser.voided = 0
                and cvforQuestion.retired = 0
                and cvforQuestionAnswer.retired = 0                            
                and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                and cvMethodIssuedAnswer.concept_full_name In (
                                              "FPS FORM,Projesterone only pill (POP)", 
                                              "FPS FORM,Combined oral contaceptive (COC)", 
                                              "FPS FORM,Injectable (Petogen)",
                                              "FPS FORM,Emergency contraception",
                                              "FPS FORM,Implanon Implants", 
                                              "FPS FORM,Jadelle Implants", 
                                              "FPS FORM,Copper T IUCD",
                                              "FPS FORM,LNG-IUS IUCD",
                                              "FPS FORM,Tuberligation",
                                              "FPS FORM,Vasectomy"    
                                             )
                and obsMethodIssued.voided = 0
                and cvMethodIssued.retired = 0
                and cvMethodIssuedAnswer.retired = 0
                and date(obsForFirsttimeUser.obs_datetime) between date('#startDate#') and date('#endDate#')
                group by cvMethodIssuedAnswer.concept_full_name
            
            
            UNION ALL
            /* Condoms given */
                    select
                    case when cvForQuestionAnswercdm.concept_full_name 
                    IN ("Male",
                        "Female"
                        )
                    then "SHORT TERM METHODS"
                    END AS "Category"
                    ,
                    case
                    when cvForQuestionAnswercdm.concept_full_name = "Male" then "Male Condoms"
                    when cvForQuestionAnswercdm.concept_full_name = "Female" then "Female Condoms"
                    end
                    as "FP Method",
                    count(distinct obsForCDM.obs_id) as "NEW Visit"
                    from
                    obs obsForFirsttimeUser
                    join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                    join concept_view cvforQuestionAnswer on obsForFirsttimeUser.value_coded = cvforQuestionAnswer.concept_id
                    Join person p on obsForFirsttimeUser.person_id = p.person_id
                    JOIN obs obsForCDM on obsForCDM.encounter_id=obsForFirsttimeUser.encounter_id
                    join concept_view cvForQuestioncdm on obsForCDM.concept_id = cvForQuestioncdm.concept_id
                    join concept_view cvForQuestionAnswercdm on obsForCDM.value_coded = cvForQuestionAnswercdm.concept_id
                    where 
                    
                cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                and cvforQuestionAnswer.concept_full_name In (
                                             "None"  
                                             )
                                             AND 
                    cvForQuestioncdm.concept_full_name = "FPS FORM,Condoms given"
                    and cvForQuestionAnswercdm.concept_full_name In (
                                                  "Male",
                                                  "Female"
                                                 )
                    and obsForCDM.voided =   0
                    and obsForFirsttimeUser.voided=0
                    and cvForQuestioncdm.retired = 0
                    and cvForQuestionAnswercdm.retired = 0   
                    and cvforQuestion.retired =0  
                    and cvForQuestionAnswercdm.retired =0
                and date(obsForCDM.obs_datetime) between date('#startDate#') and date('#endDate#')
                    GROUP BY cvForQuestionAnswercdm.concept_full_name
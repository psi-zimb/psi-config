                Select
                Case 
                when cvMethodIssuedAnswer.concept_full_name IN (
                                                                  "FPS FORM,Emergency contraception",
                                                                  "FPS FORM,Injectable (Petogen)"
                                                               )
                then "SHORT TERM METHODS"                                                 
                when cvMethodIssuedAnswer.concept_full_name IN ( 
                                                                  "FPS FORM,Implanon Implants",
                                                                  "FPS FORM,Jadelle Implants",
                                                                  "FPS FORM,Copper T IUCD",
                                                                  "FPS FORM,LNG-IUS IUCD"
                                                              )
                                                                        
                then "LARCS"
                END AS "Category",
                Case
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Emergency contraception" then "Emergency Contraception"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Injectable (Petogen)" then "Injectables"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Implanon Implants" then "Implanon"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Jadelle Implants" then "Jadelle"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Copper T IUCD" then "IUCD (Copper T)"
                when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,LNG-IUS IUCD" then "IUS5 (Same as LNG IUS)"
                end
                as "FP Method",
                count(distinct  obsForFirsttimeUser.obs_id) as "Quantities Issued to Clients"
                from obs obsForFirsttimeUser
                join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                join obs obsMethodIssued on obsForFirsttimeUser.encounter_id = obsMethodIssued.encounter_id
                join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                where 
                cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)"
                and obsForFirsttimeUser.voided = 0
                and cvforQuestion.retired = 0                       
                and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                and cvMethodIssuedAnswer.concept_full_name In (
                                                                "FPS FORM,Injectable (Petogen)",
                                                                "FPS FORM,Emergency contraception",
                                                                "FPS FORM,Implanon Implants", 
                                                                "FPS FORM,Jadelle Implants", 
                                                                "FPS FORM,Copper T IUCD",
                                                                "FPS FORM,LNG-IUS IUCD"
                                                              )
                and obsMethodIssued.voided = 0
                and cvMethodIssued.retired = 0
                and cvMethodIssuedAnswer.retired = 0
                group by cvMethodIssuedAnswer.concept_full_name

                UNION ALL
            /* Condoms given */
                    Select
                    Case 
                    when cvForQuestionAnswercdm.concept_full_name 
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
                    count(distinct obsForCDM.obs_id) as "Quantities Issued to Clients"
                    from
                    obs obsForFirsttimeUser
                    join concept_view cvforQuestion on obsForFirsttimeUser.concept_id = cvforQuestion.concept_id
                    Join person p on obsForFirsttimeUser.person_id = p.person_id
                    JOIN obs obsForCDM on obsForCDM.encounter_id=obsForFirsttimeUser.encounter_id
                    join concept_view cvForQuestioncdm on obsForCDM.concept_id = cvForQuestioncdm.concept_id
                    join concept_view cvForQuestionAnswercdm on obsForCDM.value_coded = cvForQuestionAnswercdm.concept_id
                    where 
                    cvforQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                    AND 
                    cvForQuestioncdm.concept_full_name = "FPS FORM,Condoms given"
                    and cvForQuestionAnswercdm.concept_full_name In (
                                                  "Male",
                                                  "Female"
                                                 )
                    and obsForCDM.voided =   0
                    and obsForFirsttimeUser.voided=0
                    and cvForQuestioncdm.retired = 0 
                    and cvforQuestion.retired =0  
                    and cvForQuestionAnswercdm.retired =0
                    GROUP BY cvForQuestionAnswercdm.concept_full_name
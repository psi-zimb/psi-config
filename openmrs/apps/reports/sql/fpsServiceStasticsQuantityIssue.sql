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
                count(distinct  obsForFirsttimeUser.encounter_id) as "Quantities Issued to Clients"
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
                and date(obsForFirsttimeUser.obs_datetime) between date('#startDate#') and date('#endDate#')
                group by cvMethodIssuedAnswer.concept_full_name

                UNION ALL
            /* Quantity of Condoms given */
                Select 
                  Category,
                  FPMethod as 'FP Method',
                  sum(QuantitiesIssuedToClients) as 'Quantities Issued To Clients' from 
                (
                    select          
                            "SHORT TERM METHODS" as "Category",
                            case
                            when cvForQuestioncdm.concept_full_name = "FPS FORM,Specify the quantity for male condoms" then "Male Condoms"
                            when cvForQuestioncdm.concept_full_name = "FPS FORM,Specify the quantity for female condoms" then "Female Condoms"
                            end
                            as "FPMethod",
                         case 
                            when cvForQuestioncdm.concept_full_name = "FPS FORM,Specify the quantity for male condoms" then obsForCDM.value_numeric 
                            when cvForQuestioncdm.concept_full_name = "FPS FORM,Specify the quantity for female condoms" then obsForCDM.value_numeric 
                            end as "QuantitiesIssuedToClients"                     
                    from
                            obs obsForFirsttimeUser
                            join concept_view cvforContraceptiveQuestion on obsForFirsttimeUser.concept_id = cvforContraceptiveQuestion.concept_id
                            JOIN obs obsForCDM on obsForCDM.encounter_id=obsForFirsttimeUser.encounter_id
                            join concept_view cvForQuestioncdm on obsForCDM.concept_id = cvForQuestioncdm.concept_id
                            where 
                            cvforContraceptiveQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                            AND 
                            cvForQuestioncdm.concept_full_name IN (
                                                                    "FPS FORM,Specify the quantity for male condoms",
                                                                    "FPS FORM,Specify the quantity for female condoms"
                                                                  )
                            and obsForCDM.voided = 0
                            and obsForFirsttimeUser.voided=0
                            and cvForQuestioncdm.retired = 0 
                            and cvforContraceptiveQuestion.retired =0  
                            and date(obsForCDM.obs_datetime) between date('#startDate#') and date('#endDate#')
                            group by obsForCDM.encounter_id,cvForQuestioncdm.concept_full_name
                )               
                as quantitiesOfCondom
                group by quantitiesOfCondom.Category,quantitiesOfCondom.FPMethod

                UNION ALL
/* State Cycles */
                  Select 
                  Category,
                  FPMethod as 'FP Method',
                  sum(QuantitiesIssuedToClients) as 'Quantities Issued To Clients' from 
                (
                    select          
                            "SHORT TERM METHODS" as "Category",
                            case
                            when cvForQuestionCycles.concept_full_name = "FPS FORM,State COC Cycles" then "COC"
                            when cvForQuestionCycles.concept_full_name = "FPS FORM, State POP Cycles" then "POP"
                            end
                            as "FPMethod",
                         case 
                            when cvForQuestionCycles.concept_full_name = "FPS FORM,State COC Cycles" then obsForCycles.value_numeric 
                            when cvForQuestionCycles.concept_full_name = "FPS FORM, State POP Cycles" then obsForCycles.value_numeric 
                            end as "QuantitiesIssuedToClients"                     
                    from
                            obs obsForFirsttimeUser
                            join concept_view cvforContraceptiveQuestion on obsForFirsttimeUser.concept_id = cvforContraceptiveQuestion.concept_id
                            JOIN obs obsForCycles on obsForCycles.encounter_id=obsForFirsttimeUser.encounter_id
                            join concept_view cvForQuestionCycles on obsForCycles.concept_id = cvForQuestionCycles.concept_id
                            where 
                            cvforContraceptiveQuestion.concept_full_name = "FPS FORM,Have you ever used any contraception before (tick all that apply)" 
                            AND 
                            cvForQuestionCycles.concept_full_name IN (
                                                                    "FPS FORM,State COC Cycles",
                                                                    "FPS FORM, State POP Cycles"
                                                                  )
                            and obsForCycles.voided = 0
                            and obsForFirsttimeUser.voided=0
                            and cvForQuestionCycles.retired = 0 
                            and cvforContraceptiveQuestion.retired =0
                            and date(obsForCycles.obs_datetime) between date('#startDate#') and date('#endDate#')
                            group by obsForCycles.encounter_id,cvForQuestionCycles.concept_full_name
                )               
                as stateCycles
                group by stateCycles.Category,stateCycles.FPMethod
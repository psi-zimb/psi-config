Select 
            contraceptiveDistributionReport.Month,
            Sum(PSIStaticControl) as 'Control PSI Static',
            Sum(PSIOutreachControl) as 'Control PSI Outreach',
            Sum(PSIStaticSecure) as 'Secure PSI Static',
            Sum(PSIOutreachSecure) as 'Secure PSI Outreach',
            Sum(PSIStaticPetogen) as 'Petogen PSI Static',
            Sum(PSIOutreachPetogen) as 'Petogen PSI Outreach',
            Sum(PSIStaticEmergencyContraception) as 'Emergency Contraception PSI Static',
            Sum(PSIOutreachEmergencyContraception) as 'Emergency Contraception PSI Outreach',
            Sum(PSIStaticImplanon) as 'Implanon PSI Static',
            Sum(PSIOutreachImplanon) as 'Implanon PSI Outreach',
            Sum(PSIStaticJadelle) as 'Jadelle PSI Static',
            Sum(PSIOutreachJadelle) as 'Jadelle PSI Outreach',
            Sum(PSIStaticIUCD) as 'IUCD PSI Static',
            Sum(PSIOutreachIUCD) as 'IUCD PSI Outreach',
            Sum(PSIStaticLNGIUS) as 'LNG-IUS PSI Static',
            Sum(PSIOutreachLNGIUS) as 'LNG-IUS PSI Outreach'
     
      from  (
              Select
                 contraceptiveDistribution.Month,
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Control' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachControl',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Secure' then Sum(contraceptiveDistribution.Count) end as 'PSIOutreachSecure',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Control' then Sum(contraceptiveDistribution.Count) end as 'PSIStaticControl',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Secure' then Sum(contraceptiveDistribution.Count) end as 'PSIStaticSecure',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Petogen' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachPetogen',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Petogen' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticPetogen',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Emergency Contraception' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachEmergencyContraception',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Emergency Contraception' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticEmergencyContraception',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Implanon' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachImplanon',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Implanon' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticImplanon',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Jadelle' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachJadelle',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Jadelle' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticJadelle',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach IUCD' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachIUCD',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static IUCD' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticIUCD',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach LNG-IUS' then Sum(contraceptiveDistribution.Count)  end as 'PSIOutreachLNGIUS',
                 Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static LNG-IUS' then Sum(contraceptiveDistribution.Count)  end as 'PSIStaticLNGIUS'

               from (  
                
                
                    select
                        case 
                        when date(obsSiteType.obs_datetime) like "%-01-%"
                        then "January"
                        when date(obsSiteType.obs_datetime) like "%-02-%"
                        then "February"
                        when date(obsSiteType.obs_datetime) like "%-03-%"
                        then "March"
                        when date(obsSiteType.obs_datetime) like "%-04-%"
                        then "April"
                        when date(obsSiteType.obs_datetime) like "%-05-%"
                        then "May"
                        when date(obsSiteType.obs_datetime) like "%-06-%"
                        then "June"
                        when date(obsSiteType.obs_datetime) like "%-07-%"
                        then "July"
                        when date(obsSiteType.obs_datetime) like "%-08-%"
                        then "August"
                        when date(obsSiteType.obs_datetime) like "%-09-%"
                        then "September"
                        when date(obsSiteType.obs_datetime) like "%-10-%"
                        then "October"
                        when date(obsSiteType.obs_datetime) like "%-11-%"
                        then "November"
                        when date(obsSiteType.obs_datetime) like "%-12-%"
                        then "December"
                        end as "Month",
                        case when cvSiteTypeAnswer.concept_full_name = "Static" then "PSI Static"
                        else "PSI Outreach" end as "SiteType",
                        case 
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Projesterone only pill (POP)" then "Secure"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Combined oral contaceptive (COC)" then "Control"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Injectable (Petogen)" then "Petogen"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Emergency contraception" then "Emergency Contraception"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Implanon Implants" then "Implanon"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Jadelle Implants" then "Jadelle"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,Copper T IUCD" then "IUCD"
                        when cvMethodIssuedAnswer.concept_full_name = "FPS FORM,LNG-IUS IUCD" then "LNG-IUS"
                        end as "MethodIssued",
                        count(distinct obsSiteType.encounter_id) as "Count"
                from obs obsSiteType
                join concept_view cvSiteType on obsSiteType.concept_id = cvSiteType.concept_id
                join concept_view cvSiteTypeAnswer on obsSiteType.value_coded = cvSiteTypeAnswer.concept_id
                join obs obsMethodIssued on obsSiteType.encounter_id = obsMethodIssued.encounter_id
                join concept_view cvMethodIssued on obsMethodIssued.concept_id = cvMethodIssued.concept_id
                join concept_view cvMethodIssuedAnswer on obsMethodIssued.value_coded = cvMethodIssuedAnswer.concept_id
                where 
                cvSiteType.concept_full_name = "FPS Form,Site Type" 
                and cvSiteTypeAnswer.concept_full_name In 
                                                         (
                                                          "Static",
                                                          "Outreach"
                                                         )
                and obsSiteType.voided = 0
                and cvSiteType.retired = 0
                and cvSiteTypeAnswer.retired = 0                            
                and cvMethodIssued.concept_full_name = "FPS FORM,Method issued and/or administered"
                    and cvMethodIssuedAnswer.concept_full_name In (
                                                                      "FPS FORM,Projesterone only pill (POP)", 
                                                                      "FPS FORM,Combined oral contaceptive (COC)", 
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
                and date(obsSiteType.obs_datetime) between ('#startDate#') and ('#endDate#')
                group by cvSiteTypeAnswer.concept_full_name,cvMethodIssuedAnswer.concept_full_name,month
  ) as contraceptiveDistribution
  
  group by contraceptiveDistribution.Month,
          Case when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Control' then 'PSI Outreach Control'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Secure' then 'PSI Outreach Secure' 
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Control' then 'PSI Static Control'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Secure' then 'PSI Static Secure'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Petogen' then 'PSI Outreach Petogen'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Petogen' then 'PSI Static Petogen'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Emergency Contraception' then 'PSI Outreach Emergency Contraception'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Emergency Contraception' then 'PSI Static Emergency Contraception'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Implanon' then 'PSI Outreach Implanon'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Implanon' then 'PSI Static Implanon'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach Jadelle' then 'PSI Outreach Jadelle'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static Jadelle' then 'PSI Static Jadelle'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach IUCD' then 'PSI Outreach IUCD'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static IUCD' then 'PSI Static IUCD'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Outreach LNG-IUS' then 'PSI Outreach LNG-IUS'
           when Concat(contraceptiveDistribution.SiteType,' ' ,MethodIssued) = 'PSI Static LNG-IUS' then 'PSI Static LNG-IUS'
           End
           ) as contraceptiveDistributionReport
           group by contraceptiveDistributionReport.Month
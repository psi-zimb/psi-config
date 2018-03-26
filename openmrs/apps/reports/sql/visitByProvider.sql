
            Select Provider,
            sum(AdherenceCounseling) as "Adherence Counseling",
            sum(Basic1andART1Visit) as "Basic 1 and ART 1 Visit",
            sum(ARTInitialVisit) as "ART Initial Visit",
            sum(LabTestVisit) as "Lab Test Visit",
            sum(PhoneCallVisits) as "Phone Call Visits",
            sum(Pickupdrugs) as "Pick up drugs",
            sum(PrEPContinuation) as "PrEP Continuation",
            sum(PrEPInitial) as "PrEP Initial",
            sum(ReviewByNurse) as "Review By Nurse",
            sum(RoutineVisit) as "Routine Visit",
            sum("Unplanned/WalkInVisit") as "Unplanned/Walk In Visit",
            sum(UrgentVisit) as "Urgent Visit"
      
            FROM
(

            Select Provider,                      /*Adherence Counseling*/
            Count(1) 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from
             obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Adherence counseling") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as aDherenceCounseling
            group by Provider 
            
UNION ALL            
      
            Select Provider,                   /*Basic 1 and ART 1 Visit*/
            '' as 'AdherenceCounseling',
            Count(1) 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from 
             obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Basic 1 and ART 1") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as bAsic1andArt1Visit
            group by provider
                        
UNION ALL            
            
            Select Provider,                    /*ART Initial Visit*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            Count(1) 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
             
            from(select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for ART Initial") and concept_name_type =  "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as artInitialVisit
            group by Provider

UNION ALL

            Select Provider,                        /*Lab Test Visit*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            count(1) 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Lab Test (Only)") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as lAbTest
            group by provider

UNION ALL

            Select Provider,                        /*Phone Call Visits*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            count(1) 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Phone Call") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as pHoneCallVisits
            group by provider

UNION ALL

            Select Provider,                          /*Pick up Drugs*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            count(1) 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Pick up drugs (Only)") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as pIckUpDrugs
            group by provider

UNION ALL

            Select Provider,                          /*PrEP Continuation*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            count(1) 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit' 
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Prep Continuation") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as pRePContinuation
            group by provider

UNION ALL

            Select Provider,                          /*PrEP Initial*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            count(1) 'PrEPInitial',
            '' as 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit' 
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for PrEP Initial") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as pRePInitial
            group by provider

UNION ALL

            Select Provider,                        /*Review By Nurse*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            count(1) 'ReviewByNurse',
            '' as 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit' 
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Review by Nurse") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as rEvIEWByNurse
            group by provider
                        
UNION ALL

            Select Provider,                           /*Routine Visit*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' AS 'ReviewByNurse',
            count(1) 'RoutineVisit',
            '' as 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'  
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for ART Routine") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as rOutineVisit
            group by provider

UNION ALL

            Select Provider,                           /*Unplanned Walk In Visit*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' AS 'ReviewByNurse',
            '' AS 'RoutineVisit',
            count(1) 'Unplanned/WalkInVisit',
            '' as 'UrgentVisit'
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Unplanned or Walk in Visit") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as uNplannedWalkinVisit
            group by provider
            
UNION ALL

            Select Provider,                             /*Urgent Visit*/
            '' as 'AdherenceCounseling',
            '' as 'Basic1andART1Visit',
            '' as 'ARTInitialVisit',
            '' as 'LabTestVisit',
            '' as 'PhoneCallVisits',
            '' as 'Pickupdrugs',
            '' as 'PrEPContinuation',
            '' as 'PrEPInitial',
            '' AS 'ReviewByNurse',
            '' AS 'RoutineVisit',
            '' AS 'Unplanned/WalkInVisit',
            count(1) 'UrgentVisit' 
            from(
            select cnProviderName.name as "Provider"
            from 
            obs obsProviderName 
            join concept_name cnTypeOfVisit on obsProviderName.concept_id = cnTypeOfVisit.concept_id
            join concept_name cnProviderName on obsProviderName.value_coded = cnProviderName.concept_id
            where cnTypeOfVisit.concept_id in (select concept_id from concept_name where name IN ("Provider name for Urgent") and concept_name_type = "FULLY_SPECIFIED")
            and date(obsProviderName.obs_datetime) between date('#startDate#') and date('#endDate#')
            group by obsProviderName.value_coded, obsProviderName.person_id, obsProviderName.obs_id
            ) as uRgentVisit
            group by provider    
            
) as A
            group by Provider

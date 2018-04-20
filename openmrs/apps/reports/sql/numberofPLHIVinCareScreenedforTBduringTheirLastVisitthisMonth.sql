select "Number of PLHIV in care screened for TB during their last visit this month" as "-", count(1) as "Count"
from (select o.person_id
            from person per
                join obs o on per.person_id = o.person_id
                join concept_name cn on o.concept_id = cn.concept_id
                where cn.name = 'TB Screening' 
                and o.voided = 0 and cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided = 0
                and o.person_id IN (select person_id from obs where concept_id IN (select concept_id from concept_name 
                where name IN ('Art initial Visit compulsory Question 1 of 2','Art initial Visit compulsory Question 2 of 2') 
                and concept_name_type = 'FULLY_SPECIFIED' and concept_name.voided = 0
                AND voided = 0) and voided = 0
                and date(obs.obs_datetime) < date(o.obs_datetime)
                )
                group by o.obs_id) as personPLSHIVScreenedforTB
select
   "Total Tests for Period" as "Report Name",
   count(1) as "Count"
from
   (
      select
         obsTotalTest.order_id
      from
         obs obsTotalTest
         INNER JOIN
            orders ordersTotalTest
            on obsTotalTest.order_id = ordersTotalTest.order_id
            and ordersTotalTest.order_type_id = 3
            and ordersTotalTest.date_stopped is null
            and obsTotalTest.order_id is not null
            and obsTotalTest.concept_id not in
            (
               select
                  cnTotalTest.concept_id
               from
                  concept_name cnTotalTest
               where
                  name IN
                  (
                     "LAB_NOTES",
                     "LAB_MINNORMAL",
                     "LAB_MAXNORMAL",
                     "LAB_ABNORMAL"
                  )
            )
         INNER JOIN
            concept_name cnTotalTest
            on obsTotalTest.concept_id = cnTotalTest.concept_id
      where
         date(obsTotalTest.obs_datetime) between date('#startDate#') and date('#endDate#')
      group by
         obsTotalTest.order_id
   )
   as output;

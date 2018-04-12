SELECT rsLabOrderCountPerUser.non_user_name AS "Lab User Name",
count(1)  AS "Count" FROM
result rLabOrderCountPerUser
JOIN result_signature rsLabOrderCountPerUser ON rLabOrderCountPerUser.id = rsLabOrderCountPerUser.result_id AND DATE(rsLabOrderCountPerUser.lastupdated) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
GROUP BY rsLabOrderCountPerUser.non_user_name;

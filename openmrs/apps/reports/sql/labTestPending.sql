SELECT
testPendingLabRequests.description AS "Lab Test Name",
count(1) AS "Pending Test Count"
FROM
analysis analysisPendingLabRequests
JOIN test testPendingLabRequests ON testPendingLabRequests.id = analysisPendingLabRequests.test_id
AND analysisPendingLabRequests.revision = 0
AND analysisPendingLabRequests.entry_date IS NULL
AND DATE(analysisPendingLabRequests.started_date) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
GROUP BY testPendingLabRequests.description
ORDER BY testPendingLabRequests.description;

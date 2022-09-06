/*
Writing dates stored from crime scene, 
into SQL format
*/
WITH t1 AS (SELECT date,
LTRIM(REPLACE(SUBSTRING(date, 1,2), '0', ''), '') AS month,
SUBSTRING(date, 4,2) AS day,
SUBSTRING(date, 7,4) AS year
FROM sf_crime_data
LIMIT 10)
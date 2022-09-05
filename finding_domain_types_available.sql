/*
In the accounts table, there is a column 
holding the website for each company. 
The last three digits specify what type of 
web address they are using. A list of extensions
 (and pricing) is provided here. 
 Pull these extensions and provide how many of each 
 website type exist in the accounts table.
*/
SELECT COUNT(*) types_available
FROM(
  SELECT 
        RIGHT(website, 3) AS address_type
        /*COUNT(*) AS types_available*/
  FROM accounts
  GROUP BY 1
)t1
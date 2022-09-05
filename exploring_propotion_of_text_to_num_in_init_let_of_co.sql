/*
create two groups: one group of company names that start with a number and a 
second group of those company names that start with a letter. 
What proportion of company names start with a letter?
*/
SELECT SUM(init_num)num, SUM(init_letter)letter
FROM(
  	  SELECT name,
            LEFT(name, 1) f_letter,
            CASE
            WHEN LEFT(name, 1)
            IN ('0','1','2','3','4','5','6','7','8','9')
            THEN 1 ELSE 0 END AS init_num,
            CASE
            WHEN LEFT(name, 1)
            IN('0', '1','2','3','4','5','6','7','8','9' )
            THEN 0 ELSE 1 END AS init_letter
       FROM accounts)t1

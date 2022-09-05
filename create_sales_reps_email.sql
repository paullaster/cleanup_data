/*
Each company in the accounts table wants to create an email address for each primary_poc.
 The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
  removing all of the spaces in the account name,
*/
/*ALSO*/
/*
We would also like to create an initial password, which they will change after their first log in. The first password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name, the number of 
letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.
*/
WITH ept AS (
	SELECT 
  		name,
  		primary_poc,
  		LEFT(
        primary_poc, POSITION(' ' IN primary_poc) -1
        ) fname,
       RIGHT(primary_poc,
       LENGTH(primary_poc) - STRPOS(primary_poc, ' ')
        )lname
  FROM accounts
)
SELECT 
primary_poc "Person of Contact",
LOWER(CONCAT(
 fname,'.',lname,'@',REPLACE(name, ' ',''),'.com'
)) email,
 LOWER(LEFT(fname, 1))||
 LOWER(RIGHT(fname, 1)) ||
 LOWER(LEFT(lname, 1))||
 LOWER (RIGHT(lname, 1))||
 LENGTH(fname)||
 LENGTH(lname)||
 UPPER(REPLACE(name, ' ', ''))passcode,
 name "Name of company"
FROM ept
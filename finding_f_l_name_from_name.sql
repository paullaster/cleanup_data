/*
from the accounts table to create first and
 last name columns that hold the first and 
 last names for the primary_poc
*/
SELECT 
primary_poc,
LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) firstname,
RIGHT(primary_poc,
LENGTH(primary_poc) - STRPOS(primary_poc, ' '))
lastname
FROM accounts
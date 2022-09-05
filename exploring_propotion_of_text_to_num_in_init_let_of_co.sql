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

/*
Consider vowels as a, e, i, o, and u. 
What proportion of company names start with
 a vowel, and what percent start with anything else?
*/
SELECT 
    SUM(init_vowel)vowels, 
    SUM(init_other_than_vowel)other_letters
FROM(
  	  SELECT name,
	   LEFT(name, 1) f_letter,
       CASE
       WHEN LEFT(name, 1)
       IN ('A','E','I','O','U')
       THEN 1 ELSE 0 END AS init_vowel,
       CASE
       WHEN LEFT(name, 1)
       IN('A','E','I','O','U')
       THEN 0 ELSE 1 END AS init_other_than_vowel
       FROM accounts)t1
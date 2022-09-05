/*There is much debate about how much the name
 (or even the first letter of a company name) matters.
  Use the accounts table to pull the first 
letter of each company name to see the distribution of
 company names that begin with each letter (or number).
*/
SELECT
		LEFT(name, 1) AS "First letters",
 		COUNT(LEFT(name, 1)) "Number of occurrence"
 FROM accounts
 GROUP BY 1
 ORDER BY 1 DESC
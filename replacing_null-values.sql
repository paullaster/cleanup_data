SELECT
    COUNT(a.id) AS id_count,
    COALESCE(a.id, a.id) AS id,
    COALESCE(o.account_id, a.id) AS account_id,
    COALESCE(o.standard_qty, 0) AS standard_qty,
    COALESCE(o.gloss_qty, 0) AS gloss_qty,
    COALESCE(o.poster_qty, 0) AS poster_qty,
    COALESCE(o.total, 0) AS total,
    COALESCE(o.standard_amt_usd, 0) AS standard_amt_usd,
    COALESCE(o.gloss_amt_usd, 0) AS gloss_amt_usd,
    COALESCE(o.poster_amt_usd, 0) AS poster_amt_usd,
    COALESCE(o.total_amt_usd, 0) AS total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, o.account_id, 
o.standard_qty, o.gloss_qty,
 o.poster_qty, o.total, 
 o.standard_amt_usd, o.gloss_amt_usd,
  o.poster_amt_usd, o.total_amt_usd
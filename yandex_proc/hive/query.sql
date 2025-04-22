SELECT currency,
       SUM(amount) AS total_amount
FROM transactions_v2
WHERE currency IN ('USD','EUR','RUB')
GROUP BY currency;

SELECT is_fraud,
       COUNT(*) AS cnt,
       SUM(amount) AS sum_amount,
       AVG(amount) AS avg_amount
FROM transactions_v2
GROUP BY is_fraud;

SELECT TO_DATE(transaction_date) AS day,
       COUNT(*) AS tx_count,
       SUM(amount) AS total_amount,
       AVG(amount) AS avg_amount
FROM transactions_v2
GROUP BY TO_DATE(transaction_date)
ORDER BY day;

SELECT t.transaction_id,
       COUNT(l.log_id) AS logs_per_tx,
       MAX(l.category) AS top_category
FROM transactions_v2 t
LEFT JOIN logs_v2 l
  ON t.transaction_id = l.transaction_id
GROUP BY t.transaction_id
ORDER BY logs_per_tx DESC;

SELECT payment_status,
       COUNT(*)       AS num_orders,
       SUM(total_amount) AS sum_amount,
       AVG(total_amount) AS avg_amount
FROM orders
GROUP BY payment_status;

SELECT o.order_id,
       COUNT(*)             AS items_count,
       SUM(oi.quantity)     AS total_qty,
       SUM(oi.quantity*oi.price) AS total_sum,
       AVG(oi.price)        AS avg_price
FROM orders AS o
JOIN order_items AS oi
  ON o.order_id = oi.order_id
GROUP BY o.order_id;

SELECT toDate(order_date) AS day,
       COUNT(*)           AS orders_count,
       SUM(total_amount)  AS sum_amount
FROM orders
GROUP BY day
ORDER BY day;

SELECT user_id,
       COUNT(*)           AS orders_count,
       SUM(total_amount)  AS total_spent
FROM orders
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 5;

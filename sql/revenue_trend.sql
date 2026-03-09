-- Query: Monthly Revenue Trend
-- Purpose: Analyse how total revenue changes over time.

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.Sales), 2) AS revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month;

-- To show how many customers are in each segment alongside their revenue 

SELECT
    c.segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    ROUND(SUM(oi.sales),2) AS revenue,
    ROUND(SUM(oi.sales) / COUNT(DISTINCT c.customer_id),2) AS revenue_per_customer
FROM fact_order_items oi
JOIN dim_orders o
    ON oi.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY revenue DESC;

--To show Customer Lifetime Value per customer. 

SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.sales),2) AS lifetime_revenue,
    ROUND(SUM(oi.sales) / COUNT(DISTINCT o.order_id),2) AS avg_order_value
FROM fact_order_items oi
JOIN dim_orders o
    ON oi.order_id = o.order_id
GROUP BY o.customer_id
ORDER BY lifetime_revenue DESC;

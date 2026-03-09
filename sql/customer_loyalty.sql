SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers,
    ROUND(SUM(total_spent), 2) AS revenue,
    ROUND(AVG(total_spent), 2) AS avg_customer_value
FROM (
    SELECT
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.sales) AS total_spent
    FROM fact_order_items oi
    JOIN dim_orders o
        ON oi.order_id = o.order_id
    GROUP BY o.customer_id
) t
GROUP BY customer_type;

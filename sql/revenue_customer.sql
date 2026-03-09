--To show revenue distribution between customers 

SELECT 
    o.customer_id,
    SUM(oi.sales) AS revenue
FROM fact_order_items oi
JOIN dim_orders o
    ON oi.order_id = o.order_id
GROUP BY o.customer_id
ORDER BY revenue DESC
LIMIT 10;

--To show revenue distribution between indvidual products 

SELECT
    p.product_name,
    ROUND(SUM(oi.sales),2) AS revenue
FROM fact_order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

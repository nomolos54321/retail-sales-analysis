-- To show revenue distribution across categories 

SELECT
    p.category,
    ROUND(SUM(oi.sales),2) AS revenue,
    ROUND(100 * SUM(oi.sales) / SUM(SUM(oi.sales)) OVER (),2) AS revenue_pct
FROM fact_order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- To show revenue distribution in the subcategory 

SELECT
    p.sub_category,
    ROUND(SUM(oi.sales),2) AS revenue
FROM fact_order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.sub_category
ORDER BY revenue DESC;

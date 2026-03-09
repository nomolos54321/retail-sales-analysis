SELECT
  ROUND(SUM(CASE WHEN revenue_decile = 1 THEN revenue ELSE 0 END), 2) AS top_10pct_revenue,
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(
    100 * SUM(CASE WHEN revenue_decile = 1 THEN revenue ELSE 0 END) / SUM(revenue),
    2
  ) AS top_10pct_share_pct
FROM customer_revenue_ranked;

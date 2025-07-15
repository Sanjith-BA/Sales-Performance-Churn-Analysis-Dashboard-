
-- Hypothetical churn analysis (based on repeat purchases)
SELECT 
  month,
  country,
  SUM(total_revenue) AS total_revenue
FROM sales_data
GROUP BY month, country
ORDER BY month, country;

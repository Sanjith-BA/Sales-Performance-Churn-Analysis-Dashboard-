
SELECT 
  country,
  SUM(total_revenue) AS revenue
FROM sales_data
GROUP BY country
ORDER BY revenue DESC;
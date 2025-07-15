
SELECT 
  country,
  ROUND(AVG(discount) * 100, 2) AS avg_discount_percent
FROM sales_data
GROUP BY country
ORDER BY avg_discount_percent DESC;

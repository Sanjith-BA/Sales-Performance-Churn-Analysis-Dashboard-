
SELECT 
  month,
  product_category,
  SUM(units_sold) AS total_units
FROM sales_data
GROUP BY month, product_category
ORDER BY month, total_units DESC;
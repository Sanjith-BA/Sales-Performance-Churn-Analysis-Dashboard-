
SELECT 
  product_category,
  SUM(total_revenue) AS category_revenue
FROM sales_data
GROUP BY product_category
ORDER BY category_revenue DESC;
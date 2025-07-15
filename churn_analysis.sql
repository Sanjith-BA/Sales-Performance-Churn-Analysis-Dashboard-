WITH monthly_sales AS (
    SELECT
        month,
        country,
        SUM(units_sold) AS total_units
    FROM sales_data
    GROUP BY month, country
),
ranked_sales AS (
    SELECT
        month,
        country,
        total_units,
        LAG(total_units) OVER (PARTITION BY country ORDER BY month) AS prev_month_units
    FROM monthly_sales
),
churn_analysis AS (
    SELECT
        month,
        country,
        total_units,
        prev_month_units,
        ROUND(
            (total_units - prev_month_units) * 100.0 / NULLIF(prev_month_units, 0),
            2
        ) AS pct_change,
        CASE 
            WHEN prev_month_units IS NULL THEN 'No Data'
            WHEN total_units < prev_month_units * 0.7 THEN 'Churn Risk'
            ELSE 'Stable'
        END AS churn_status
    FROM ranked_sales
)
SELECT * FROM churn_analysis
ORDER BY country, month;
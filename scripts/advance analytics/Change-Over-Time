-- Change-Over-Time (Analyze how a measure evovles over time, helps tract trends and identify seasonality in your data)
-- [Measure] By [Date Dimension], ex. Total sales by year

-- Analyze Sales Performance Over Time
USE DataWarehouse;

SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

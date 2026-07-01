-- Cumulative Analysis (Aggregate the data progressively over time, helps to understand whether our business is growing or declining)
-- [cumulative measure] by [Date Dimension], ex. Running total sales by year, moving average of sales by month

-- Calculate the total sales per month
-- and the running total of sales over time


SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (PARTITION BY YEAR(order_date) ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT
        DATETRUNC(month, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(month, order_date)
) t;

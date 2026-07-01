-- Explore All Objects in the Database
USE DataWarehouse;
SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Explore All Columns in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'gold.dim_customers'


-- Explore All Countries our customers come from.
SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories "The major Divisions"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3


-- Explore Date
-- Identify Date Boundaries
-- Find the date of the first the last order
-- How many years of sales are available

SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales

-- Find the yongest and oldest customer
SELECT 
MIN(birthdate) AS oldest_birthdate,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers


-- Measure Exploration (Big Numbers)

-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity 
FROM gold.fact_sales;

-- Find the average selling price
SELECT AVG(price) AS avg_price 
FROM gold.fact_sales;

-- Find the Total number of Orders
SELECT COUNT(order_number) AS total_orders 
FROM gold.fact_sales;

SELECT COUNT(DISTINCT order_number) AS total_orders 
FROM gold.fact_sales;

-- Find the total number of products
SELECT COUNT(product_name) AS total_products 
FROM gold.dim_products;

SELECT COUNT(DISTINCT product_name) AS total_products 
FROM gold.dim_products;

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers 
FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers 
FROM gold.fact_sales;


-- Generate a Report that shows all key metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value 
FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) 
FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) 
FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) 
FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) 
FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) 
FROM gold.dim_customers;

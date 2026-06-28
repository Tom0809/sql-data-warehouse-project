# Data Catalog for Gold Layer

## Overview

The Gold Layer is the business-level data representation designed for analytics and reporting.  
It contains dimension views and fact views that follow a star schema structure.

The main objects in the Gold Layer are:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

---

## 1. `gold.dim_customers`

### Purpose

Stores customer details enriched with demographic and geographic data.  
This dimension is used to analyze sales by customer attributes such as country, gender, marital status, and birthdate.

### Columns

| Column Name | Data Type | Description |
|---|---|---|
| `customer_key` | `INT` | Surrogate key that uniquely identifies each customer record in the dimension. |
| `customer_id` | `INT` | Original numerical customer ID from the source system. |
| `customer_number` | `NVARCHAR(50)` | Alphanumeric customer identifier used for tracking and referencing. |
| `first_name` | `NVARCHAR(50)` | Customer's first name. |
| `last_name` | `NVARCHAR(50)` | Customer's last name or family name. |
| `country` | `NVARCHAR(50)` | Customer's country of residence, such as `Australia`. |
| `marital_status` | `NVARCHAR(50)` | Customer's marital status, such as `Married`, `Single`, or `n/a`. |
| `gender` | `NVARCHAR(50)` | Customer's gender, such as `Male`, `Female`, or `n/a`. |
| `birthdate` | `DATE` | Customer's date of birth. |
| `create_date` | `DATE` | Date when the customer record was created in the source system. |

---

## 2. `gold.dim_products`

### Purpose

Provides product details and product classification attributes.  
This dimension is used to analyze sales by product, category, subcategory, product line, and cost.

### Columns

| Column Name | Data Type | Description |
|---|---|---|
| `product_key` | `INT` | Surrogate key that uniquely identifies each product record in the dimension. |
| `product_id` | `INT` | Original product ID from the source system. |
| `product_number` | `NVARCHAR(50)` | Alphanumeric product code used for tracking and referencing. |
| `product_name` | `NVARCHAR(50)` | Descriptive product name. |
| `category_id` | `NVARCHAR(50)` | Product category identifier used to link product records with category information. |
| `category` | `NVARCHAR(50)` | High-level product category, such as `Bikes` or `Components`. |
| `subcategory` | `NVARCHAR(50)` | More detailed product classification within the category. |
| `maintenance` | `NVARCHAR(50)` | Indicates whether the product requires maintenance. |
| `cost` | `INT` | Product cost or base cost value. |
| `product_line` | `NVARCHAR(50)` | Product line, such as `Road`, `Mountain`, `Touring`, or `Other Sales`. |
| `start_date` | `DATE` | Date when the product record became active. |

---

## 3. `gold.fact_sales`

### Purpose

Stores transactional sales data for analytical reporting.  
This fact table connects sales transactions with customer and product dimensions using surrogate keys.

### Columns

| Column Name | Data Type | Description |
|---|---|---|
| `order_number` | `NVARCHAR(50)` | Unique sales order number, such as `SO54496`. |
| `product_key` | `INT` | Surrogate key linking the sale to `gold.dim_products`. |
| `customer_key` | `INT` | Surrogate key linking the sale to `gold.dim_customers`. |
| `order_date` | `DATE` | Date when the order was placed. |
| `shipping_date` | `DATE` | Date when the order was shipped. |
| `due_date` | `DATE` | Date when the order was due. |
| `sales_amount` | `INT` | Total sales amount for the order line. |
| `quantity` | `INT` | Number of units ordered. |
| `price` | `INT` | Unit price of the product. |

---

## Data Model Relationship

The Gold Layer follows a star schema design:

```text
gold.dim_customers     gold.dim_products
        |                    |
        |                    |
        +---- gold.fact_sales ----+

# sql-data-warehouse-project
Building a modern data warehouse with SQL server, including ETL processing, data modelling and analystics

# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective

Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications

- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analytics)

#### Objective

Develop SQL-based analytics to deliver detailed insights into:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---
## 🏗️ Data Architecture

The data architecture for this project follows the Medallion Architecture with Bronze, Silver, and Gold layers.

### Bronze Layer

Stores raw data as-is from the source systems.  
Data is ingested from CSV files into SQL Server tables.

### Silver Layer

Cleans, standardizes, and transforms the raw data.  
This layer includes:

- Data cleansing
- Data standardization
- Data normalization
- Derived columns
- Data enrichment

### Gold Layer

Contains business-ready data modeled into a star schema for analytics and reporting.  
The Gold Layer includes:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

The Gold Layer can be used for:

- BI reporting
- Ad-hoc SQL analysis
- Dashboard creation

## 📊 Tableau Dashboard

An interactive Tableau dashboard was created on top of the Gold Layer to visualize sales performance, customer behavior, market distribution, and product performance.

The dashboard connects to the business-ready fact and dimension tables from the Gold Layer and translates the data warehouse outputs into actionable business insights.

The Tableau workbook includes two dashboard pages:

1. **Sales Performance Overview**  
   Executive-level KPI dashboard showing total sales, total orders, average order value, monthly sales momentum, 3-month moving average, and top revenue-driving subcategories.

2. **Customer & Product Performance Analysis**  
   Deep-dive dashboard analyzing customer value segments, country-level revenue contribution, non-bike product performance, and top product revenue ranking.

[View the Tableau dashboard documentation](dashboard/tableau/README.md)


## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---

## 🌟 About Me

Hi there! I'm **Huaxi Zeng**, a UBC Statistics student interested in data analytics, business intelligence, and data engineering.  
I enjoy working with SQL, Tableau, and data visualization to transform raw data into clear, actionable business insights.

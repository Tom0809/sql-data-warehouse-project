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

```mermaid
flowchart LR
    A[Source Systems<br>CRM CSV Files<br>ERP CSV Files] --> B[Bronze Layer<br>Raw Data Tables]

    B --> C[Silver Layer<br>Cleaned and Standardized Tables]

    C --> D[Gold Layer<br>Business-Ready Views<br>Star Schema]

    D --> E[BI & Reporting]
    D --> F[Ad-hoc SQL Queries]
    D --> G[Machine Learning]
---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---

## 🌟 About Me

Hi there! I'm **Huaxi Zeng**. I’m UBC student major in statistics and exploring SQL and enjoy with data!

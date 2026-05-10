# sql-server-ecommerce-project
Production-style e-commerce analytics project using SQL Server, advanced SQL, stored procedures, indexing, and star schema modeling.
# E-Commerce SQL Analytics Project

## Project Overview
This project builds a production-style e-commerce analytics system using SQL Server and SSMS. It uses the Brazilian E-Commerce Public Dataset by Olist and demonstrates relational database design, primary/foreign keys, data validation, business KPI analysis, advanced SQL, stored procedures, views, indexing, and star schema modeling.

## Dataset
- Dataset: Brazilian E-Commerce Public Dataset by Olist
- Source: Kaggle
- Domain: E-commerce marketplace

## Tools & Technologies
- SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Stored Procedures
- Views
- Indexing
- Star Schema / Data Warehouse Modeling

## Main Tables
### OLTP Tables
- customers
- orders
- order_items
- payments
- products
- sellers
- reviews
- geolocation_raw

### Star Schema Tables
- fact_sales
- dim_customers
- dim_products
- dim_sellers
- dim_date

## Business KPIs Covered
- Total revenue
- Monthly revenue
- Monthly order trend
- Average order value
- Revenue by state
- Revenue by product category
- Top customers
- Top sellers
- Delivery delay percentage
- Average delivery time
- Review score distribution
- Repeat customers

## SQL Concepts Used
- Joins
- Aggregations
- GROUP BY / HAVING
- CASE WHEN
- CTEs
- Window functions
- DENSE_RANK
- LAG
- Running totals
- Views
- Stored procedures
- Parameters
- Indexing
- Primary keys and foreign keys
- Star schema modeling




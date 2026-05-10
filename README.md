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

## Folder Structure
```text
schema/                 Primary keys, foreign keys, validation scripts
exploratory_queries/    Business KPI and analysis queries
advanced_queries/       CTEs, window functions, ranking queries
procedures/             Stored procedures
views/                  Reporting views
indexing/               Index creation scripts
star_schema/            Dimension and fact table creation scripts
screenshots/            ER diagrams and query result screenshots
```

## Suggested Screenshots to Add
Add these screenshots manually from SSMS:
1. Imported tables list
2. OLTP ER diagram
3. Star schema diagram
4. Revenue by state query output
5. Monthly revenue view output
6. Execution plan before/after indexing

## Resume Bullet
Built a production-style e-commerce analytics platform using SQL Server with normalized OLTP tables, primary/foreign keys, star schema warehouse modeling, business KPI analysis, stored procedures, views, indexing, and advanced SQL analytics.


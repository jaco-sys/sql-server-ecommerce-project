use ecommerce;

-- SQL Server does not support CREATE TABLE AS SELECT.
-- Use SELECT INTO instead.

drop table if exists dim_customers;
select distinct
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
into dim_customers
from customers;

alter table dim_customers
add constraint pk_dim_customers primary key(customer_id);

drop table if exists dim_products;
select distinct
    product_id,
    product_category_name
into dim_products
from products;

alter table dim_products
add constraint pk_dim_products primary key(product_id);

drop table if exists dim_sellers;
select distinct
    seller_id,
    seller_city,
    seller_state
into dim_sellers
from sellers;

alter table dim_sellers
add constraint pk_dim_sellers primary key(seller_id);

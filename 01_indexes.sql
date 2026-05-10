use ecommerce;

-- Indexes for OLTP tables
create nonclustered index idx_customers_city_include
on customers(customer_city)
include (customer_id, customer_unique_id, customer_state);

create nonclustered index idx_orders_customer
on orders(customer_id);

create nonclustered index idx_orders_purchase_date
on orders(order_purchase_timestamp);

create nonclustered index idx_payments_order
on payments(order_id);

create nonclustered index idx_order_items_order
on order_items(order_id);

create nonclustered index idx_order_items_product
on order_items(product_id);

-- Indexes for star schema fact table
create nonclustered index idx_fact_sales_customer
on fact_sales(customer_id);

create nonclustered index idx_fact_sales_product
on fact_sales(product_id);

create nonclustered index idx_fact_sales_seller
on fact_sales(seller_id);

create nonclustered index idx_fact_sales_order_date
on fact_sales(order_date);

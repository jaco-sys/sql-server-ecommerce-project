use ecommerce;

drop table if exists fact_sales;

select
    o.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    cast(o.order_purchase_timestamp as date) as order_date,
    cast(p.payment_value as decimal(18,2)) as payment_value,
    cast(oi.price as decimal(18,2)) as price,
    cast(oi.freight_value as decimal(18,2)) as freight_value
into fact_sales
from orders o
join order_items oi
on o.order_id = oi.order_id
join payments p
on o.order_id = p.order_id
where o.order_purchase_timestamp is not null;

-- Foreign keys from fact table to dimensions
alter table fact_sales
add constraint fk_fact_sales_customers
foreign key(customer_id)
references dim_customers(customer_id);

alter table fact_sales
add constraint fk_fact_sales_products
foreign key(product_id)
references dim_products(product_id);

alter table fact_sales
add constraint fk_fact_sales_sellers
foreign key(seller_id)
references dim_sellers(seller_id);

alter table fact_sales
add constraint fk_fact_sales_date
foreign key(order_date)
references dim_date(full_date);

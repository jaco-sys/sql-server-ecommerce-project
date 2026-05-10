use ecommerce;

-- List all user tables
select table_name
from information_schema.tables
where table_type = 'BASE TABLE'
order by table_name;

-- Row count validation
select 'customers' as table_name, count(*) as total_rows from customers
union all
select 'orders', count(*) from orders
union all
select 'products', count(*) from products
union all
select 'sellers', count(*) from sellers
union all
select 'order_items', count(*) from order_items
union all
select 'payments', count(*) from payments
union all
select 'reviews', count(*) from reviews;

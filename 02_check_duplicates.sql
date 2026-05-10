use ecommerce;

-- Duplicate check for customers
select customer_id, count(*) as duplicate_count
from customers
group by customer_id
having count(*) > 1;

-- Duplicate check for orders
select order_id, count(*) as duplicate_count
from orders
group by order_id
having count(*) > 1;

-- Duplicate check for products
select product_id, count(*) as duplicate_count
from products
group by product_id
having count(*) > 1;

-- Duplicate check for sellers
select seller_id, count(*) as duplicate_count
from sellers
group by seller_id
having count(*) > 1;

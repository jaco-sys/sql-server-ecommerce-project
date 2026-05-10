use ecommerce;

-- Total orders
select count(distinct order_id) as total_orders
from orders;

-- Orders by status
select 
    order_status,
    count(*) as total_orders
from orders
group by order_status
order by total_orders desc;

-- Total revenue
select round(sum(cast(payment_value as decimal(18,2))), 2) as total_revenue
from payments;

-- Average order value
select 
    round(sum(cast(payment_value as decimal(18,2))) / count(distinct order_id), 2) as average_order_value
from payments;

-- Revenue by payment type
select 
    payment_type,
    count(*) as total_payments,
    round(sum(cast(payment_value as decimal(18,2))), 2) as total_revenue
from payments
group by payment_type
order by total_revenue desc;

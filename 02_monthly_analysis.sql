use ecommerce;

-- Monthly revenue
select 
    format(o.order_purchase_timestamp, 'yyyy-MM') as order_month,
    round(sum(cast(p.payment_value as decimal(18,2))), 2) as monthly_revenue
from orders o
join payments p
on o.order_id = p.order_id
group by format(o.order_purchase_timestamp, 'yyyy-MM')
order by order_month;

-- Monthly order count
select 
    format(order_purchase_timestamp, 'yyyy-MM') as order_month,
    count(*) as total_orders
from orders
group by format(order_purchase_timestamp, 'yyyy-MM')
order by order_month;

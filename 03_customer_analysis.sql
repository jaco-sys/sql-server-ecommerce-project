use ecommerce;

-- Top 10 customers by spending
select top 10
    c.customer_id,
    c.customer_city,
    c.customer_state,
    round(sum(cast(p.payment_value as decimal(18,2))), 2) as total_spent
from customers c
join orders o
on c.customer_id = o.customer_id
join payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_city, c.customer_state
order by total_spent desc;

-- Revenue by state
select 
    c.customer_state,
    count(distinct o.order_id) as total_orders,
    round(sum(cast(p.payment_value as decimal(18,2))), 2) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
join payments p
on o.order_id = p.order_id
group by c.customer_state
order by total_revenue desc;

-- Repeat customers using customer_unique_id
select 
    c.customer_unique_id,
    count(o.order_id) as total_orders
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_unique_id
having count(o.order_id) > 1
order by total_orders desc;

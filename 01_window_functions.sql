use ecommerce;

-- Running revenue
select
    o.order_purchase_timestamp,
    p.payment_value,
    sum(cast(p.payment_value as decimal(18,2)))
        over(order by o.order_purchase_timestamp) as cumulative_revenue
from orders o
join payments p
on o.order_id = p.order_id;

-- Product category ranking by revenue
select
    p.product_category_name,
    round(sum(cast(oi.price as decimal(18,2))), 2) as revenue,
    dense_rank() over(order by sum(cast(oi.price as decimal(18,2))) desc) as revenue_rank
from products p
join order_items oi
on p.product_id = oi.product_id
group by p.product_category_name;

-- Customer purchase history using LAG
with customer_orders as (
    select
        c.customer_unique_id,
        o.order_purchase_timestamp,
        lag(o.order_purchase_timestamp)
            over(partition by c.customer_unique_id order by o.order_purchase_timestamp) as previous_order_date
    from customers c
    join orders o
    on c.customer_id = o.customer_id
)
select
    customer_unique_id,
    order_purchase_timestamp,
    previous_order_date,
    datediff(day, previous_order_date, order_purchase_timestamp) as days_between_orders
from customer_orders
where previous_order_date is not null;

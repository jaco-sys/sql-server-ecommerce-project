use ecommerce;

-- Top product categories by revenue
select top 10
    p.product_category_name,
    count(oi.order_id) as total_items_sold,
    round(sum(cast(oi.price as decimal(18,2))), 2) as total_revenue
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_category_name
order by total_revenue desc;

-- Top sellers by revenue
select top 10
    s.seller_id,
    s.seller_city,
    s.seller_state,
    round(sum(cast(oi.price as decimal(18,2))), 2) as seller_revenue
from sellers s
join order_items oi
on s.seller_id = oi.seller_id
group by s.seller_id, s.seller_city, s.seller_state
order by seller_revenue desc;

-- Average delivery time
select 
    avg(datediff(day, order_purchase_timestamp, order_delivered_customer_date)) as avg_delivery_days
from orders
where order_delivered_customer_date is not null;

-- Delay percentage
select 
    round(
        100.0 * sum(
            case 
                when order_delivered_customer_date > order_estimated_delivery_date 
                then 1 else 0 
            end
        ) / count(*), 2
    ) as delay_percentage
from orders
where order_delivered_customer_date is not null;

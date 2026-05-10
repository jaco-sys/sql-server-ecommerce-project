use ecommerce;

-- Revenue by state
select
    dc.customer_state,
    round(sum(fs.payment_value), 2) as revenue
from fact_sales fs
join dim_customers dc
on fs.customer_id = dc.customer_id
group by dc.customer_state
order by revenue desc;

-- Revenue by product category
select
    dp.product_category_name,
    round(sum(fs.payment_value), 2) as revenue
from fact_sales fs
join dim_products dp
on fs.product_id = dp.product_id
group by dp.product_category_name
order by revenue desc;

-- Monthly revenue
select
    dd.year_no,
    dd.month_no,
    dd.month_name,
    round(sum(fs.payment_value), 2) as revenue
from fact_sales fs
join dim_date dd
on fs.order_date = dd.full_date
group by dd.year_no, dd.month_no, dd.month_name
order by dd.year_no, dd.month_no;

-- Star schema validation
select top 10
    fs.order_id,
    dc.customer_state,
    dp.product_category_name,
    ds.seller_state,
    dd.year_no,
    fs.payment_value
from fact_sales fs
join dim_customers dc on fs.customer_id = dc.customer_id
join dim_products dp on fs.product_id = dp.product_id
join dim_sellers ds on fs.seller_id = ds.seller_id
join dim_date dd on fs.order_date = dd.full_date;

use ecommerce;

create or alter view vw_revenue_by_state as
select
    dc.customer_state,
    round(sum(cast(fs.payment_value as decimal(18,2))), 2) as revenue
from fact_sales fs
join dim_customers dc
on fs.customer_id = dc.customer_id
group by dc.customer_state;
go

create or alter view vw_revenue_by_category as
select
    dp.product_category_name,
    round(sum(cast(fs.payment_value as decimal(18,2))), 2) as revenue
from fact_sales fs
join dim_products dp
on fs.product_id = dp.product_id
group by dp.product_category_name;
go

create or alter view vw_monthly_revenue as
select
    dd.year_no,
    dd.month_no,
    dd.month_name,
    round(sum(cast(fs.payment_value as decimal(18,2))), 2) as revenue
from fact_sales fs
join dim_date dd
on fs.order_date = dd.full_date
group by dd.year_no, dd.month_no, dd.month_name;
go

-- Test views
select * from vw_revenue_by_state order by revenue desc;
select * from vw_revenue_by_category order by revenue desc;
select * from vw_monthly_revenue order by year_no, month_no;

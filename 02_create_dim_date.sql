use ecommerce;

drop table if exists dim_date;

create table dim_date(
    full_date date primary key,
    year_no int,
    quarter_no int,
    month_no int,
    month_name varchar(20),
    day_no int,
    day_name varchar(20),
    week_no int
);

insert into dim_date
select distinct
    cast(order_purchase_timestamp as date) as full_date,
    year(order_purchase_timestamp) as year_no,
    datepart(quarter, order_purchase_timestamp) as quarter_no,
    month(order_purchase_timestamp) as month_no,
    datename(month, order_purchase_timestamp) as month_name,
    day(order_purchase_timestamp) as day_no,
    datename(weekday, order_purchase_timestamp) as day_name,
    datepart(week, order_purchase_timestamp) as week_no
from orders
where order_purchase_timestamp is not null;

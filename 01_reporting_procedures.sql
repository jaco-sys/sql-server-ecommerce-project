use ecommerce;

-- Top customers by state and year
create or alter procedure customer_orders
    @state nvarchar(10),
    @year int
as
begin
    select
        c.customer_state,
        count(o.order_id) as total_orders
    from customers c
    join orders o
    on c.customer_id = o.customer_id
    where c.customer_state = @state
    and year(o.order_purchase_timestamp) = @year
    group by c.customer_state;
end;
go

-- Monthly revenue by year
create or alter procedure monthly_revenue_by_year
    @year int
as
begin
    select
        format(o.order_purchase_timestamp,'yyyy-MM') as sales_month,
        round(sum(cast(p.payment_value as decimal(18,2))), 2) as revenue
    from orders o
    join payments p
    on o.order_id = p.order_id
    where year(o.order_purchase_timestamp) = @year
    group by format(o.order_purchase_timestamp,'yyyy-MM')
    order by sales_month;
end;
go

-- Customers by city
create or alter procedure high_customers
    @city nvarchar(100) = 'osasco'
as
begin
    select 
        customer_id,
        customer_unique_id,
        customer_city,
        customer_state
    from customers
    where customer_city = @city;
end;
go

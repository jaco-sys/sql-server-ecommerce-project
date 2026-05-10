use ecommerce;

-- Output parameter: total orders
create or alter procedure sp_total_orders
    @total int output
as
begin
    select @total = count(*)
    from orders;
end;
go

declare @order_count int;
exec sp_total_orders @order_count output;
print @order_count;
go

-- Output parameter: total revenue
create or alter procedure sp_total_revenue
    @revenue decimal(18,2) output
as
begin
    select @revenue = sum(cast(payment_value as decimal(18,2)))
    from payments;
end;
go

declare @total_revenue decimal(18,2);
exec sp_total_revenue @total_revenue output;
print @total_revenue;
go

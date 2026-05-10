use ecommerce;

set statistics io on;
set statistics time on;

exec high_customers @city = 'osasco';

set statistics io off;
set statistics time off;

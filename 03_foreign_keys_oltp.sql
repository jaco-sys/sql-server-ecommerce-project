use ecommerce;

-- Run only if these constraints are not already created.

alter table orders
add constraint fk_orders_customers
foreign key(customer_id)
references customers(customer_id);

alter table order_items
add constraint fk_order_items_orders
foreign key(order_id)
references orders(order_id);

alter table order_items
add constraint fk_order_items_products
foreign key(product_id)
references products(product_id);

alter table order_items
add constraint fk_order_items_sellers
foreign key(seller_id)
references sellers(seller_id);

alter table payments
add constraint fk_payments_orders
foreign key(order_id)
references orders(order_id);

alter table reviews
add constraint fk_reviews_orders
foreign key(order_id)
references orders(order_id);

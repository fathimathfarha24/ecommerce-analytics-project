-- add primary keys
ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE sellers
ADD PRIMARY KEY (seller_id);

ALTER TABLE items
ADD PRIMARY KEY (order_id, order_item_id);

ALTER TABLE payments
ADD PRIMARY KEY (order_id, payment_sequential);

SELECT
    review_id,
    COUNT(*) AS total
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

SELECT
    order_id,
    COUNT(*) AS total
FROM reviews
GROUP BY order_id
HAVING COUNT(*) > 1;

ALTER TABLE product_category_name_translation
ADD PRIMARY KEY (product_category_name);

-- Add foreign keys
-- Orders -> Customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Order Items -> Orders
ALTER TABLE items
ADD CONSTRAINT fk_items_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items -> Products
ALTER TABLE items
ADD CONSTRAINT fk_items_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- Order Items -> Sellers
ALTER TABLE items
ADD CONSTRAINT fk_items_sellers
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);

-- Payments -> Orders
ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Reviews -> Orders
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Verify Primary Keys
SHOW KEYS FROM customers;
SHOW KEYS FROM orders;
SHOW KEYS FROM items;
SHOW KEYS FROM products;
SHOW KEYS FROM sellers;
SHOW KEYS FROM payments;
SHOW KEYS FROM reviews;

-- Verify foreign keys
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'ecommerce_analytics'
AND REFERENCED_TABLE_NAME IS NOT NULL;





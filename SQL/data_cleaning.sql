-- create backups for tables
CREATE TABLE customers_backup AS SELECT * FROM customers;
CREATE TABLE orders_backup AS SELECT * FROM orders;
CREATE TABLE order_items_backup AS SELECT * FROM items;
CREATE TABLE products_backup AS SELECT * FROM products;
CREATE TABLE sellers_backup AS SELECT * FROM sellers;
CREATE TABLE order_reviews_backup AS SELECT * FROM reviews;
CREATE TABLE order_payments_backup AS SELECT * FROM payments;

SET SQL_SAFE_UPDATES = 0;

SELECT @@SQL_SAFE_UPDATES;

-- trim
UPDATE customers
SET
customer_city = TRIM(customer_city),
customer_state = TRIM(customer_state);

UPDATE sellers
SET
seller_city = TRIM(seller_city),
seller_state = TRIM(seller_state);

UPDATE products
SET
product_category_name = TRIM(product_category_name);

-- Convert empty strings to null
UPDATE products
SET product_category_name = NULL
WHERE product_category_name='';

UPDATE customers
SET customer_city=NULL
WHERE customer_city='';
UPDATE customers
SET customer_state=NULL
WHERE customer_state='';

UPDATE sellers
SET seller_city=NULL
WHERE seller_city='';
UPDATE sellers
SET seller_state=NULL
WHERE seller_state='';

-- Check missing values
SELECT
SUM(customer_id IS NULL) AS customer_id,
SUM(customer_unique_id IS NULL) AS customer_unique_id,
SUM(customer_city IS NULL) AS customer_city,
SUM(customer_state IS NULL) AS customer_state
FROM customers;

SELECT
SUM(order_id IS NULL),
SUM(customer_id IS NULL),
SUM(order_status IS NULL),
SUM(order_purchase_timestamp IS NULL)
FROM orders;

SELECT
SUM(product_id IS NULL),
SUM(product_category_name IS NULL)
FROM products;

SELECT
SUM(payment_type IS NULL),
SUM(payment_value IS NULL)
FROM payments;

-- Remove duplicate rows
SELECT
customer_id,
COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*)>1;

SELECT
seller_id,
COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*)>1;

SELECT
order_id,
COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*)>1;

-- Standardize text
UPDATE customers
SET customer_city = LOWER(customer_city);

UPDATE sellers
SET seller_city = LOWER(seller_city);

UPDATE products
SET product_category_name = LOWER(product_category_name);

-- Standardize state codes
UPDATE customers
SET customer_state=UPPER(customer_state);

UPDATE sellers
SET seller_state=UPPER(seller_state);

SELECT
(SELECT COUNT(*) FROM customers) AS Customers,
(SELECT COUNT(*) FROM orders) AS Orders,
(SELECT COUNT(*) FROM items) AS Items,
(SELECT COUNT(*) FROM products) AS Products,
(SELECT COUNT(*) FROM sellers) AS Sellers,
(SELECT COUNT(*) FROM reviews) AS Reviews,
(SELECT COUNT(*) FROM payments) AS Payments;





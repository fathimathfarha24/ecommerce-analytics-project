SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'order_payments', COUNT(*) FROM payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'category_translation', COUNT(*) FROM product_category_name_translation;

-- customers null check
SELECT
SUM(customer_id IS NULL) AS customer_id_nulls,
SUM(customer_unique_id IS NULL) AS customer_unique_id_nulls,
SUM(customer_city IS NULL) AS customer_city_nulls,
SUM(customer_state IS NULL) AS customer_state_nulls
FROM customers;

-- orders null check
SELECT
SUM(order_id IS NULL) AS order_id_nulls,
SUM(customer_id IS NULL) AS customer_id_nulls,
SUM(order_status IS NULL) AS order_status_nulls,
SUM(order_purchase_timestamp IS NULL) AS purchase_date_nulls
FROM orders;

-- products null check
SELECT
SUM(product_id IS NULL) AS product_id_nulls,
SUM(product_category_name IS NULL) AS category_nulls,
SUM(product_weight_g IS NULL) AS weight_nulls
FROM products;

-- sellers null check
SELECT
SUM(seller_id IS NULL) AS seller_id_nulls,
SUM(seller_city IS NULL) AS seller_city_nulls,
SUM(seller_state IS NULL) AS seller_state_nulls
FROM sellers;

-- payments null check
SELECT
SUM(order_id IS NULL) AS order_id_nulls,
SUM(payment_type IS NULL) AS payment_type_nulls,
SUM(payment_value IS NULL) AS payment_value_nulls
FROM payments;

-- reviews null check
SELECT
SUM(review_id IS NULL) AS review_id_nulls,
SUM(order_id IS NULL) AS order_id_nulls,
SUM(review_score IS NULL) AS review_score_nulls
FROM reviews;

-- duplicate customers
SELECT
customer_id,
COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- duplicate orders
SELECT
order_id,
COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- duplicate products
SELECT
product_id,
COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- duplicate sellers
SELECT
seller_id,
COUNT(*) AS duplicate_count
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- duplicate reviews
SELECT
review_id,
COUNT(*) AS duplicate_count
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- earliest and latest order date
SELECT
MIN(order_purchase_timestamp) AS first_order,
MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- order date validation
SELECT *
FROM orders
WHERE order_purchase_timestamp >
order_delivered_customer_date;

-- negative price check
SELECT *
FROM items
WHERE price < 0;

-- negative freight check
SELECT *
FROM items
WHERE freight_value < 0;

-- invalid review score
SELECT *
FROM reviews
WHERE review_score NOT BETWEEN 1 AND 5;

-- orders without customers
SELECT o.*
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- order items without orders
SELECT i.*
FROM items i
LEFT JOIN orders o
ON i.order_id = o.order_id
WHERE o.order_id IS NULL;

-- products never sold
SELECT p.*
FROM products p
LEFT JOIN items i
ON p.product_id = i.product_id
WHERE i.product_id IS NULL;

-- sellers without sales
SELECT s.*
FROM sellers s
LEFT JOIN items i
ON s.seller_id = i.seller_id
WHERE i.seller_id IS NULL;

-- orders without payments
SELECT o.*
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

-- orders without reviews
SELECT o.*
FROM orders o
LEFT JOIN reviews r
ON o.order_id = r.order_id
WHERE r.order_id IS NULL;

-- product category validation
SELECT *
FROM products
WHERE product_category_name IS NULL;

-- state validation
SELECT
customer_state,
COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- seller state validation
SELECT
seller_state,
COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- payment type validation
SELECT
payment_type,
COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type;

-- order status validation
SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- product dimension validation
SELECT *
FROM products
WHERE product_length_cm <= 0
OR product_height_cm <= 0
OR product_width_cm <= 0;

-- geolocation validation
SELECT *
FROM geolocation
WHERE geolocation_lat IS NULL
OR geolocation_lng IS NULL;



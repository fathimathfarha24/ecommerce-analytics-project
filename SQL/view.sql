-- Customer Orders View
CREATE VIEW vw_customer_orders AS
SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM vw_customer_orders;

-- Product Sales View
CREATE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(i.order_id) AS total_sales,
    ROUND(SUM(i.price),2) AS revenue
FROM products p
JOIN items i
ON p.product_id = i.product_id
GROUP BY
    p.product_id,
    p.product_category_name;
    
SELECT *
FROM vw_product_sales
ORDER BY revenue DESC;

-- Seller Performance View
CREATE VIEW vw_seller_performance AS
SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(product_id) AS products_sold,
    ROUND(SUM(price),2) AS revenue
FROM items
GROUP BY seller_id;

SELECT *
FROM vw_seller_performance
ORDER BY revenue DESC;

-- Monthly Revenue View
CREATE VIEW vw_monthly_revenue AS
SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp);
    
SELECT *
FROM vw_monthly_revenue
ORDER BY year, month;

-- Delivery Performance View
CREATE VIEW vw_delivery_performance AS
SELECT
    order_id,
    order_status,
    DATEDIFF(
        order_delivered_customer_date,
        order_purchase_timestamp
    ) AS delivery_days,
    CASE
        WHEN order_delivered_customer_date < order_estimated_delivery_date
            THEN 'Early'
        WHEN order_delivered_customer_date = order_estimated_delivery_date
            THEN 'On Time'
        ELSE 'Delayed'
    END AS shipping_status
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

SELECT *
FROM vw_delivery_performance;

-- Top Selling Products View
CREATE VIEW vw_top_products AS
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(i.order_id) AS total_sales,
    ROUND(SUM(i.price),2) AS revenue
FROM products p
JOIN items i
ON p.product_id = i.product_id
GROUP BY
    p.product_id,
    p.product_category_name;
    
SELECT *
FROM vw_top_products
ORDER BY total_sales DESC
LIMIT 10;


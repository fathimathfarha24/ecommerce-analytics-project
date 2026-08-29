-- Delivery Days
SELECT
    order_id,
    DATE(order_purchase_timestamp) AS purchase_date,
    DATE(order_delivered_customer_date) AS delivery_date,
    DATEDIFF(order_delivered_customer_date,
             order_purchase_timestamp) AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
ORDER BY delivery_days DESC;

-- Average Delivery Time
SELECT
    ROUND(AVG(DATEDIFF(order_delivered_customer_date,
                       order_purchase_timestamp)),2)
    AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Delayed Orders
SELECT
    order_id,
    DATE(order_purchase_timestamp) AS purchase_date,
    DATE(order_estimated_delivery_date) AS estimated_delivery,
    DATE(order_delivered_customer_date) AS actual_delivery,
    DATEDIFF(order_delivered_customer_date,
             order_estimated_delivery_date) AS delay_days
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date
ORDER BY delay_days DESC;

-- Total Delayed Orders
SELECT
    COUNT(*) AS delayed_orders
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Shipping Performance
SELECT
    CASE
        WHEN order_delivered_customer_date < order_estimated_delivery_date
            THEN 'Early'
        WHEN order_delivered_customer_date = order_estimated_delivery_date
            THEN 'On Time'
        ELSE 'Delayed'
    END AS shipping_status,
    COUNT(*) AS total_orders
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY shipping_status;

-- Fastest Delivered Orders
SELECT
    order_id,
    DATEDIFF(order_delivered_customer_date,
             order_purchase_timestamp) AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
ORDER BY delivery_days ASC
LIMIT 10;


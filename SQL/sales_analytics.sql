-- monthly revenue
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS Month,
    ROUND(SUM(p.payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY Month
ORDER BY Month;

-- Monthly Orders
SELECT
    DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS Month,
    COUNT(*) AS Orders
FROM orders
GROUP BY Month
ORDER BY Month;

-- Daily Sales Revenue
SELECT
    DATE(order_purchase_timestamp) AS Sales_Date,
    ROUND(SUM(payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY Sales_Date
ORDER BY Sales_Date;

-- Daily Orders
SELECT
    DATE(order_purchase_timestamp) AS Sales_Date,
    COUNT(*) AS Orders
FROM orders
GROUP BY Sales_Date
ORDER BY Sales_Date;

-- Yearly Revenue
SELECT
    YEAR(order_purchase_timestamp) AS Year,
    ROUND(SUM(payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY Year
ORDER BY Year;

-- top revenue months
SELECT
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS Month,
ROUND(SUM(p.payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY Month
ORDER BY Revenue DESC
LIMIT 10;

-- Lowest Revenue Months
SELECT
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS Month,
ROUND(SUM(p.payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY Month
ORDER BY Revenue
LIMIT 10;

-- Revenue by State
SELECT
c.customer_state,
ROUND(SUM(p.payment_value),2) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY c.customer_state
ORDER BY Revenue DESC;

-- Orders by State
SELECT
c.customer_state,
COUNT(*) AS Orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_state
ORDER BY Orders DESC;

-- Average Revenue Per Order
SELECT
ROUND(AVG(order_total),2) AS Average_Order_Revenue
FROM
(
SELECT
order_id,
SUM(payment_value) AS order_total
FROM payments
GROUP BY order_id
)t;

-- Top 10 Highest Value Orders
SELECT
order_id,
ROUND(SUM(payment_value),2) AS Order_Value
FROM payments
GROUP BY order_id
ORDER BY Order_Value DESC
LIMIT 10;

-- Revenue by Weekday
SELECT
DAYNAME(order_purchase_timestamp) AS Weekday,
ROUND(SUM(payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY Weekday
ORDER BY Revenue DESC;

-- Revenue by Quarter
SELECT
CONCAT('Q',QUARTER(order_purchase_timestamp)) AS Quarter,
ROUND(SUM(payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY Quarter
ORDER BY Quarter;

-- Revenue by Order Status
SELECT
order_status,
ROUND(SUM(payment_value),2) AS Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY order_status
ORDER BY Revenue DESC;

-- Average Daily Revenue
SELECT
ROUND(AVG(Daily_Revenue),2) AS Average_Daily_Revenue
FROM
(
SELECT
DATE(order_purchase_timestamp) AS Sales_Date,
SUM(payment_value) AS Daily_Revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY Sales_Date
)t;





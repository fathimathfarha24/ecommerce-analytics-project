-- Top 10 Customers by Revenue
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value),2) AS Total_Revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY c.customer_unique_id
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Top 10 Customers by Number of Orders
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS Total_Orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_unique_id
ORDER BY Total_Orders DESC
LIMIT 10;

-- Repeat Customers
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS Orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY Orders DESC;

-- Customer Purchase Frequency
SELECT
order_count,
COUNT(*) AS Customers
FROM
(
SELECT
customer_unique_id,
COUNT(order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY customer_unique_id
)t
GROUP BY order_count
ORDER BY order_count;

-- Average Orders Per Customer
SELECT
ROUND(AVG(order_count),2) AS Avg_Orders_Per_Customer
FROM
(
SELECT
customer_unique_id,
COUNT(order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY customer_unique_id
)t;

-- Average Revenue Per Customer
SELECT
ROUND(AVG(customer_revenue),2) AS Avg_Revenue
FROM
(
SELECT
customer_unique_id,
SUM(payment_value) AS customer_revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY customer_unique_id
)t;

-- Customer Lifetime Value (CLV)
SELECT
customer_unique_id,
ROUND(SUM(payment_value),2) AS Customer_Lifetime_Value
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY customer_unique_id
ORDER BY Customer_Lifetime_Value DESC;

-- Customers by State
SELECT
customer_state,
COUNT(DISTINCT customer_unique_id) AS Customers
FROM customers
GROUP BY customer_state
ORDER BY Customers DESC;

-- Top Cities by Customers
SELECT
customer_city,
COUNT(DISTINCT customer_unique_id) AS Customers
FROM customers
GROUP BY customer_city
ORDER BY Customers DESC
LIMIT 10;

-- Customer Segmentation
SELECT
customer_unique_id,
COUNT(order_id) AS Orders,
CASE
WHEN COUNT(order_id)=1 THEN 'One-time Customer'
WHEN COUNT(order_id) BETWEEN 2 AND 4 THEN 'Repeat Customer'
WHEN COUNT(order_id)>=5 THEN 'Loyal Customer'
END AS Customer_Segment
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY customer_unique_id
ORDER BY Orders DESC;



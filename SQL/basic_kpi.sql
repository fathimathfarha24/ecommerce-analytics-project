SELECT
    (SELECT COUNT(*) FROM orders) AS Total_Orders,

    (SELECT COUNT(DISTINCT customer_unique_id)
     FROM customers) AS Total_Customers,

    (SELECT COUNT(*) FROM sellers) AS Total_Sellers,

    (SELECT COUNT(*) FROM products) AS Total_Products,

    (SELECT ROUND(SUM(payment_value),2)
     FROM payments) AS Total_Revenue,

    (
        SELECT ROUND(AVG(order_total),2)
        FROM
        (
            SELECT order_id,
                   SUM(payment_value) AS order_total
            FROM payments
            GROUP BY order_id
        ) x
    ) AS Average_Order_Value;
    
    SELECT
    COUNT(*) AS Total_Items_Sold
FROM items;

SELECT
    ROUND(AVG(product_count),2) AS Avg_Products_Per_Order
FROM
(
    SELECT
        order_id,
        COUNT(*) AS product_count
    FROM items
    GROUP BY order_id
) t;

SELECT
    ROUND(SUM(freight_value),2) AS Total_Freight
FROM items;

SELECT
    ROUND(AVG(freight_value),2) AS Average_Freight
FROM items;

SELECT
    ROUND(AVG(price),2) AS Average_Product_Price
FROM items;

SELECT
    ROUND(MAX(order_total),2) AS Highest_Order_Value
FROM
(
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) t;

SELECT
    ROUND(MIN(order_total),2) AS Lowest_Order_Value
FROM
(
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) t;

SELECT
    COUNT(DISTINCT product_category_name) AS Product_Categories
FROM products;

SELECT
    COUNT(*) AS Delivered_Orders
FROM orders
WHERE order_status='delivered';

SELECT
    COUNT(*) AS Cancelled_Orders
FROM orders
WHERE order_status='canceled';

SELECT
    ROUND(AVG(review_score),2) AS Average_Review_Score
FROM reviews;

SELECT
    ROUND(AVG(payment_installments),2) AS Average_Installments
FROM payments;

SELECT
    payment_type,
    COUNT(*) AS Total_Transactions
FROM payments
GROUP BY payment_type
ORDER BY Total_Transactions DESC;

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS Revenue
FROM payments
GROUP BY payment_type
ORDER BY Revenue DESC;


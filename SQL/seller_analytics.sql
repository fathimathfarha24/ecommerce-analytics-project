-- Best Sellers
SELECT
    seller_id,
    COUNT(order_id) AS total_orders,
    COUNT(product_id) AS products_sold
FROM items
GROUP BY seller_id
ORDER BY products_sold DESC
LIMIT 10;

-- Revenue by Seller
SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue
FROM items
GROUP BY seller_id
ORDER BY total_revenue DESC;

-- Average Order Value per Seller
SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price),2) AS total_revenue,
    ROUND(SUM(price) / COUNT(DISTINCT order_id),2) AS average_order_value
FROM items
GROUP BY seller_id
ORDER BY average_order_value DESC;

-- Top 10 Sellers by Revenue
SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue
FROM items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;


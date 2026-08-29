-- Best-Selling Products
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(i.order_id) AS total_sales
FROM items i
JOIN products p
    ON i.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

-- Lowest-Selling Products
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(i.order_id) AS total_sales
FROM items i
JOIN products p
    ON i.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_category_name
ORDER BY total_sales ASC
LIMIT 10;

-- Category Analysis
SELECT
    p.product_category_name,
    COUNT(i.order_id) AS products_sold
FROM products p
JOIN items i
    ON p.product_id = i.product_id
GROUP BY
    p.product_category_name
ORDER BY
    products_sold DESC;
    
-- Revenue by Category
SELECT
    p.product_category_name,
    ROUND(SUM(i.price),2) AS total_revenue
FROM products p
JOIN items i
    ON p.product_id = i.product_id
GROUP BY
    p.product_category_name
ORDER BY
    total_revenue DESC;
    
-- Top 5 Products by Revenue
SELECT
    p.product_id,
    p.product_category_name,
    ROUND(SUM(i.price),2) AS revenue
FROM products p
JOIN items i
    ON p.product_id = i.product_id
GROUP BY
    p.product_id,
    p.product_category_name
ORDER BY
    revenue DESC
LIMIT 5;


    
    
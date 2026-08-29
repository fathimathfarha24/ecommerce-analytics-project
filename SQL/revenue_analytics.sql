-- Average Ratings
SELECT
    ROUND(AVG(review_score),2) AS average_rating
FROM reviews;

-- Rating Distribution
SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;

-- Products with Poor Ratings
SELECT
    i.product_id,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN items i
    ON o.order_id = i.order_id
GROUP BY i.product_id
HAVING COUNT(r.review_id) >= 5
ORDER BY average_rating ASC
LIMIT 10;

-- Seller Ratings
SELECT
    i.seller_id,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN items i
    ON o.order_id = i.order_id
GROUP BY i.seller_id
HAVING COUNT(r.review_id) >= 5
ORDER BY average_rating DESC;

-- Highest Rated Products
SELECT
    i.product_id,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN items i
    ON o.order_id = i.order_id
GROUP BY i.product_id
HAVING COUNT(r.review_id) >= 5
ORDER BY average_rating DESC
LIMIT 10;

-- Average Rating by Product Category
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN items i
    ON o.order_id = i.order_id
JOIN products p
    ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY average_rating DESC;


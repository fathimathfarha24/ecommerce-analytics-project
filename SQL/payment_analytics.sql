-- Payment Methods
SELECT
    payment_type,
    COUNT(order_id) AS total_transactions
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- Installments Analysis
SELECT
    payment_installments,
    COUNT(order_id) AS total_orders
FROM payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- Payment Value by Payment Method
SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS total_payment_value
FROM payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;

-- Highest Payment Transactions
SELECT
    order_id,
    payment_type,
    payment_installments,
    ROUND(payment_value,2) AS payment_value
FROM payments
ORDER BY payment_value DESC
LIMIT 10;


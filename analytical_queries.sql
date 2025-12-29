-- Q1 Total revenue from Delivered orders
SELECT SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';

-- Q2 Month-wise revenue from Delivered orders
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;

-- Q3 Top 3 customers by revenue (Delivered orders)
SELECT 
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 3;

-- Q4 Revenue contribution by product
SELECT 
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS product_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY product_revenue DESC;

-- Q5 Customers whose revenue is above average
SELECT 
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.customer_id
)t
);
-- Q6 Branch-wise revenue
SELECT 
    b.branch_name,
    SUM(oi.quantity * oi.unit_price) AS branch_revenue
FROM branches b
JOIN orders o ON b.branch_id = o.branch_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY b.branch_name;

-- Q7 Average Order Value (AOV)
SELECT 
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- Q8 Customers with more than one order
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING order_count > 1;

-- Q9 Customers who never placed an order
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q10 Orders count by status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- Q11 Revenue contribution percentage by branch
SELECT 
    b.branch_name,
    ROUND(
        SUM(oi.quantity * oi.unit_price) /
        (SELECT SUM(quantity * unit_price) FROM order_items) * 100,
        2
    ) AS revenue_percentage
FROM branches b
JOIN orders o ON b.branch_id = o.branch_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY b.branch_name;

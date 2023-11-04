
--Task 1: SQL query 

SELECT c.customer_id, c.name, c.email, c.location, COUNT(o.order_id) AS total_orders
FROM Customers AS c
LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email, c.location
ORDER BY total_orders DESC;



--Task 2: SQL query 
SELECT p.name AS product_name, oi.quantity, oi.quantity * oi.unit_price AS total_amount
FROM Order_Items AS oi
JOIN Products AS p ON oi.product_id = p.product_id
ORDER BY oi.order_id ASC;


--Task 3: SQL query 
SELECT c.name AS category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Order_Items AS oi
JOIN Products AS p ON oi.product_id = p.product_id
JOIN Categories AS c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC;


--Task 4: SQL query 
SELECT c.name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_purchase_amount
FROM Customers AS c
JOIN Orders AS o ON c.customer_id = o.customer_id
JOIN Order_Items AS oi ON o.order_id = oi.order_id
GROUP BY c.name
ORDER BY total_purchase_amount DESC
LIMIT 5;

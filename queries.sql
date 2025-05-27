USE P02;

SHOW TABLES;

-- JOIN
SELECT u.name AS user_name, p.name AS product_name, o.order_date, oi.quantity, r.rating
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
LEFT JOIN Reviews r ON r.user_id = u.user_id AND r.product_id = p.product_id;

-- WHERE
SELECT * FROM Products
WHERE price > 100 AND category = 'Electronics';

-- GROUP BY + HAVING
SELECT p.category, COUNT(*) AS total_products, AVG(p.price) AS avg_price
FROM Products p
GROUP BY p.category
HAVING AVG(p.price) > 100;

-- ORDER BY
SELECT * FROM Users
ORDER BY city ASC, name DESC;

-- LIMIT
SELECT * FROM Reviews
ORDER BY rating DESC
LIMIT 3;

-- BONUS: UNION
SELECT name, 'User' AS type FROM Users
UNION ALL
SELECT name, 'Product' AS type FROM Products;

-- BONUS: CTE
WITH HighRatedProducts AS (
    SELECT product_id, AVG(rating) AS avg_rating
    FROM Reviews
    GROUP BY product_id
    HAVING AVG(rating) >= 4
)
SELECT p.name, h.avg_rating
FROM Products p
JOIN HighRatedProducts h ON p.product_id = h.product_id;



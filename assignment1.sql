CREATE DATABASE P02;

USE P02;

SHOW TABLES;

-- Таблиця користувачів
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Таблиця товарів
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

-- Таблиця замовлень
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Таблиця деталей замовлення
CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Таблиця відгуків
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Users
INSERT INTO Users VALUES
(1, 'Emma', 'emma@gmail.com', 'Kyiv'),
(2, 'Daria', 'daria@gmail.com', 'Kharkiv'),
(3, 'Vadym', 'vadym@gmail.com', 'Poltava'),
(4, 'Diana', 'diana@gmail.com', 'Odesa'),
(5, 'Alice', 'alice@gmail.com', 'Dnipro');

-- Products
INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics'),
(2, 'Smartphone', 800.00, 'Electronics'),
(3, 'Headphones', 150.00, 'Accessories'),
(4, 'Backpack', 60.00, 'Accessories'),
(5, 'Book', 20.00, 'Books');

-- Orders
INSERT INTO Orders VALUES
(1, 1, '2024-05-01'),
(2, 2, '2024-05-02'),
(3, 1, '2024-05-03'),
(4, 3, '2024-05-04'),
(5, 4, '2024-05-05');

-- OrderItems
INSERT INTO OrderItems VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 2, 2, 1),
(4, 3, 3, 1),
(5, 4, 4, 2),
(6, 5, 5, 3);

-- Reviews
INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Excellent laptop!'),
(2, 2, 2, 4, 'Good phone but a bit pricey'),
(3, 3, 1, 3, 'Sound quality is okay'),
(4, 4, 3, 5, 'Very comfortable'),
(5, 5, 4, 4, 'Interesting read');


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

-- ⭐ BONUS: UNION
SELECT name, 'User' AS type FROM Users
UNION ALL
SELECT name, 'Product' AS type FROM Products;

-- ⭐ BONUS: CTE
WITH HighRatedProducts AS (
    SELECT product_id, AVG(rating) AS avg_rating
    FROM Reviews
    GROUP BY product_id
    HAVING AVG(rating) >= 4
)
SELECT p.name, h.avg_rating
FROM Products p
JOIN HighRatedProducts h ON p.product_id = h.product_id;



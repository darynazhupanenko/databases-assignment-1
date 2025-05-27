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
CREATE TABLE products (
    PRODUCT_ID INT PRIMARY KEY, 
    PRODUCT_NAME TEXT,
    CATEGORY TEXT,
    PRICE REAL,
    STOCK_QUANTITY INT
);

INSERT INTO products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE, STOCK_QUANTITY) VALUES
(1, 'Gaming Laptop', 'Laptops', 1200.00, 15),
(2, 'Wireless Mouse', 'Accessories', 25.50, 120),
(3, 'Mechanical Keyboard', 'Accessories', 89.99, 45),
(4, '4K Monitor', 'Monitors', 349.99, 20),
(5, 'External SSD 1TB', 'Storage', 110.00, 60),
(6, 'Office Laptop Ultra', 'Laptops', 799.99, 8);

SELECT * 
FROM products 
WHERE PRICE >= 50.00 AND STOCK_QUANTITY > 0;

SELECT * 
FROM products 
WHERE PRODUCT_NAME LIKE '%Laptop%';

SELECT 
    MIN(PRICE) AS lowest_price, 
    MAX(PRICE) AS highest_price 
FROM products;

UPDATE products 
SET PRICE = 1149.99, STOCK_QUANTITY = 12 
WHERE PRODUCT_ID = 1;

DELETE FROM products 
WHERE PRODUCT_ID = 6;

SELECT * FROM products;



use empdb;

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price int,
    quantity INT
);

INSERT INTO products VALUES
(1, 'Laptop', 55000, 10),
(2, 'Mouse', 700, 50),
(3, 'Keyboard', 1200, 30),
(4, 'Headphones', 1500, 20),
(5, 'USB Cable', 300, 100);

SELECT * FROM products;

SET SQL_SAFE_UPDATES = 0;

UPDATE products SET price = 650 WHERE product_id = 2;

DELETE FROM products WHERE product_id = 5;

SELECT product_name, price FROM products;

SELECT * FROM products WHERE price > 500;


---


INSERT INTO products VALUES
(5, 'USB Cable', 300, 100),
(6, 'HDMI Cable', 5000, 15),
(7, 'Router', 7000, 50),
(8, 'Desktop', 8000, 70),
(9, 'Graphic Card', 10000, 10),
(10, 'AirPod', 500, 100);
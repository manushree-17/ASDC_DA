CREATE DATABASE analytics_demo;

use analytics_demo;

Create Table customers(
	customer_id INT PRIMARY KEY auto_increment,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY auto_increment,
    customer_id INT,
    product VARCHAR(50),
    amount decimal(10,2),
    foreign key (customer_id) references customers(customer_id) on delete cascade
    );
    
INSERT INTO customers(name, city) values
('Princy','Mumbai'),    
('Dhyani','Delhi'),    
('Hemal','Pune'),    
('Manushree','Surat'),    
('Dhvani','Mumbai');   

UPDATE customers
SET city = 'Surat'
WHERE customer_id = 6;

select * from customers;

DELETE FROM customers
WHERE customer_id = 7;


Insert into orders (customer_id, product, amount) values
(1, 'Laptop', 50000),
(5, 'Headphone', 3000),
(3, 'Moblie', 30000),
(2, 'Mouse', 900),
(5, 'Moblie', 30000),
(1, 'Mouse', 900);

CREATE TABLE products(
	product_id INT PRIMARY KEY auto_increment,
    product VARCHAR(50),
    amount decimal(10,2)
    );
  
INSERT INTO products(product, amount) values
('Laptop', 50000),    
('Headphone', 3000),    
('Moblie',30000),    
('Mouse', 900),    
('Keyboard',1500);

Alter table orders
add column product_id int;

UPDATE orders
SET product_id = 2
WHERE order_id = 2;

UPDATE orders
SET product_id = 5
WHERE order_id = 3;

UPDATE orders
SET product_id = 6
WHERE order_id = 4;

--- JOINS ---

Select customers.customer_id, customers.name, orders.order_id, orders.amount
from customers
inner join orders
on customers.customer_id = orders.customer_id;

SELECT customers.name, orders.order_id, products.product, orders.amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN products ON orders.product_id = products.product_id;

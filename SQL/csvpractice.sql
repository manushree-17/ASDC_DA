CREATE DATABASE CompanyDB;

use CompanyDB;

CREATE TABLE sales(
	serial_number int primary key auto_increment,
    customer varchar(50),
    region varchar(10),
    category varchar(50),
    product varchar(50),
    quantity int,
    sales int,
    date date,
    total int,
    profit decimal(10,1)
);

SHOW VARIABLES LIKE 'secure_file_priv';



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/06Sales_Data_Dashboard.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer,region,category,product,quantity,sales,date,total,profit);

select * from sales;
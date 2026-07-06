CREATE DATABASE superstore_db;

USE superstore_db;

CREATE TABLE Orders_Raw (
    Customer_Name VARCHAR(255),
    Customer_ID VARCHAR(50),
    Row_ID VARCHAR(50),
    Lenghth VARCHAR(50),
    Order_Priority VARCHAR(50),
    Discount VARCHAR(50),
    Unit_Price VARCHAR(50),
    Shipping_Cost VARCHAR(50),
    Ship_Mode VARCHAR(100),
    Customer_Segment VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Sub_Category VARCHAR(100),
    Product_Container VARCHAR(100),
    Product_Name TEXT,
    Product_Base_Margin VARCHAR(50),
    Country VARCHAR(100),
    Region VARCHAR(100),
    State_or_Province VARCHAR(100),
    City VARCHAR(100),
    Postal_Code VARCHAR(50),
    Order_Date VARCHAR(50),
    Ship_Date VARCHAR(50),
    Profit VARCHAR(50),
    Quantity_ordered_new VARCHAR(50),
    Sales VARCHAR(50),
    Order_ID VARCHAR(50),
    Status VARCHAR(50)
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SuperStoreUS-2015 1 (1).csv.xls'
INTO TABLE Orders_Raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    Customer_Name,
    Customer_ID,
    Row_ID,
    Lenghth,
    Order_Priority,
    Discount,
    Unit_Price,
    Shipping_Cost,
    Ship_Mode,
    Customer_Segment,
    Product_Category,
    Product_Sub_Category,
    Product_Container,
    Product_Name,
    Product_Base_Margin,
    Country,
    Region,
    State_or_Province,
    City,
    Postal_Code,
    Order_Date,
    Ship_Date,
    Profit,
    Quantity_ordered_new,
    Sales,
    Order_ID,
    Status,
    @dummy1,
    @dummy2,
    @dummy3
);

select * from Orders_Raw;


create table orders(
	Order_ID int,
    Status varchar(50)
);

select * from  orders;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SuperStoreUS-2015 1_orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
Order_ID,
Status);

-- 1
select * from Orders_Raw;

-- 2
SELECT Customer_Name, Product_Name, Sales, Profit
FROM Orders_Raw;	

-- 3 
SELECT * FROM Orders_Raw WHERE State_or_Province= 'California';

-- 4
SELECT * FROM Orders_Raw WHERE Profit < 0;

-- 5 
SELECT * FROM Orders_Raw WHERE Discount > 0.20;

-- 6 
SELECT * FROM Orders_Raw ORDER BY Sales DESC;

-- 7 
SELECT * FROM Orders_Raw ORDER BY Sales DESC LIMIT 10;

-- 8 
SELECT DISTINCT Customer_Segment FROM Orders_Raw;

-- 9 
SELECT * FROM Orders_Raw WHERE Sales BETWEEN 500 AND 2000;

-- 10 
SELECT *
FROM Orders_Raw WHERE Customer_Name LIKE 'A%';

-- 11 
SELECT SUM(Sales) AS Total_Sales FROM Orders_Raw;

-- 12 
SELECT AVG(Profit) AS Average_Profit FROM Orders_Raw;

-- 13 
SELECT MAX(Sales) AS Highest_Sales FROM Orders_Raw;

-- 14 
SELECT MIN(Profit) AS Lowest_Profit FROM Orders_Raw;

-- 15 
SELECT COUNT(*) AS Total_Orders FROM Orders_Raw;

-- 16 
SELECT Region,
SUM(Sales) AS Total_Sales
FROM Orders_Raw
GROUP BY Region;

-- 17 
SET SQL_SAFE_UPDATES = 1;

SELECT State_or_Province,
SUM(Profit) AS Total_Profit
FROM Orders_Raw
GROUP BY State_or_Province;

-- 18 
SELECT Customer_Segment,
AVG(Sales) AS Avg_Sales
FROM Orders_Raw
GROUP BY Customer_Segment;

-- 19
SELECT Region,
COUNT(DISTINCT Customer_Name) AS Customer_Count
FROM Orders_Raw
GROUP BY Region;	

-- 20 
SELECT Product_Category,
SUM(Quantity_ordered_new) AS Total_Quantity
FROM Orders_Raw
GROUP BY Product_Category;

-- 21 
SELECT Region,
SUM(Sales) AS Total_Sales
FROM Orders_Raw
GROUP BY Region
HAVING SUM(Sales) > 50000;

-- 22 
SELECT Product_Category,
AVG(Profit) AS Average_Profit
FROM Orders_Raw
GROUP BY Product_Category
HAVING AVG(Profit) > 100;

-- 23 
SELECT MONTH(Order_Date) AS Month_No,
COUNT(*) AS Total_Orders
FROM Orders_Raw
GROUP BY MONTH(Order_Date)
ORDER BY Month_No;

-- 24 
DESCRIBE Orders_Raw;

SELECT
    Order_ID,
    Order_Date,
    Ship_Date
FROM Orders_Raw
LIMIT 5;

SELECT
    Order_ID,
    Order_Date,
    Ship_Date,
    DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM Orders_Raw;


-- 25 
SELECT *
FROM Orders_Raw
WHERE Order_Date > '2015-06-01';

-- 26 

SELECT *
FROM Orders_Raw 
INNER JOIN Orders 
ON Orders_Raw.Order_ID = Orders.Order_ID;

-- 27 Non-Returned Orders

-- 28 Returned Orders by Region

-- 29 Top 5 Customers by Total Sales
SELECT Customer_Name,
SUM(Sales) AS Total_Sales
FROM Orders_Raw
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- 30 Most Profitable Category
SELECT Product_Category,
SUM(Profit) AS Total_Profit
FROM Orders_Raw
GROUP BY Product_Category
ORDER BY Total_Profit DESC
LIMIT 1;

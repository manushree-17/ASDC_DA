use companydb;

SELECT * FROM companydb.orders_raw;

select customer_name, product_name, sales, profit from orders_raw;

SELECT * FROM Orders_raw
WHERE State_or_Province = 'California';

ALTER TABLE Orders_raw
MODIFY COLUMN Profit DECIMAL(10,2);


 ---SELECT * FROM orders_raw WHERE Profit < 0;---

SELECT * FROM orders_raw
WHERE Discount > 0.20;

SELECT * FROM orders_raw
ORDER BY Sales DESC;

SELECT * FROM orders_raw
ORDER BY Sales DESC LIMIT 10;

SELECT DISTINCT Customer_Segment
FROM Orders_RAW;

SELECT * FROM orders_raw
WHERE Sales BETWEEN 500 AND 2000;

SELECT * FROM orders_raw
where CUSTOMER_NAME LIKE 'A%';


---


SELECT SUM(Sales) AS Total_Sales
FROM Orders_RAW;

---SELECT AVG(Profit) AS Average_Profit FROM Orders_RAW;---

SELECT MAX(Sales) AS Highest_Sales
FROM OrdeRS_RAW;

SELECT MIN(Profit) AS Lowest_Profit
FROM Orders_RAW;

SELECT COUNT(*) AS Total_Orders
FROM Orders_RAW;

SELECT Region, SUM(Sales) AS Total_Sales
FROM Orders_RAW GROUP BY Region;

--- SELECT State_or_Province, SUM(Profit) AS Total_Profit FROM Orders_RAW GROUP BY State_or_Province; ---

SELECT Customer_Segment, AVG(Sales) AS Average_Sales
FROM Orders_RAW GROUP BY Customer_Segment;

SELECT Region,
    COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM Orders_raw GROUP BY Region;

SELECT Product_Category, SUM(Quantity_ordered_new) AS Total_Quantity
FROM Orders_raw GROUP BY Product_Category;

------


SELECT Region, SUM(Sales) AS Total_Sales
FROM Orders_raw GROUP BY Region
HAVING SUM(Sales) > 50000;


SELECT Product_Category, AVG(Profit) AS Average_Profit
FROM Orders_raw GROUP BY Product_Category
HAVING AVG(Profit) > 100;

SELECT MONTH(Order_Date) AS Month_Number, COUNT(*) AS Total_Orders
FROM Orders_raw GROUP BY MONTH(Order_Date) ORDER BY Month_Number;

SELECT Order_ID, Customer_Name, Order_Date, Ship_Date, DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM Orders_raw;

SELECT * FROM Orders_raw
WHERE Order_Date > '2015-06-01';

------


SELECT o.Order_ID, o.Customer_Name, o.Product_Name FROM Orders_raw o
INNER JOIN Returns r ON o.Order_ID = r.Order_ID;

SELECT o.Order_ID, o.Customer_Name, o.Product_Name
FROM Orders_raw o
LEFT JOIN Returns r ON o.Order_ID = r.Order_ID
WHERE r.Order_ID IS NULL;

SELECT o.Region, COUNT(*) AS Returned_Orders
FROM Orders_raw o INNER JOIN Returns r
ON o.Order_ID = r.Order_ID GROUP BY o.Region;

-----


SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM Orders_raw GROUP BY Customer_Name
ORDER BY Total_Sales DESC LIMIT 5;

SELECT Product_Category, SUM(Profit) AS Total_Profit
FROM Orders_raw GROUP BY Product_Category
ORDER BY Total_Profit DESC LIMIT 1;
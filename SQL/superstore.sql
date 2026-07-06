use companydb;
drop table orders_raw;

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

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SuperStoreUS-2015 1.csv'
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

Create table return_data
(	order_id int,
	status_return varchar(15)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SuperStoreUS-2015 1.csv'
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
    Uni
    
    @dummy1,
    @dummy2,
    @dummy3
);

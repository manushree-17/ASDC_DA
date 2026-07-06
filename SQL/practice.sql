use companydb;

CREATE TABLE superstore(
	serial_number int primary key auto_increment,
    customer_name varchar(50),
    customer_id int,
    row_id int,
    length int,
    order_priority varchar(20),
    discount decimal(3,2),
    unit_price decimal(10,2),
    shipping_cost decimal(10,2),
    ship_mode varchar(20),
    customer_segment varchar(30),
    product_category varchar(30),
    product_sub_category varchar(40),
    product_container varchar(20),
    product_name varchar(100),
    product_base_margin decimal(3,2),
    country varchar(50),
    region varchar(20),
    state varchar(30),
    city varchar(30),
    postal_code int,
    order_date date,
    ship_date date,
    profit decimal(10,2)
    
    
    region varchar(10),
    category varchar(50),
    product varchar(50),
    quantity int,
    sales int,
    date date,
    total int,
    profit decimal(10,1)
);




DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders AS
SELECT
    Customer_Name,

    NULLIF(Customer_ID, '') + 0 AS Customer_ID,

    NULLIF(Row_ID, '') + 0 AS Row_ID,

    NULLIF(Lenghth, '') + 0 AS Lenghth,

    NULLIF(TRIM(Order_Priority), '') AS Order_Priority,

    /* Discount: 7% → 7 */
    NULLIF(
        REPLACE(TRIM(Discount), '%', ''),
    '') + 0 AS Discount,

    /* Unit Price */
    NULLIF(
        REPLACE(
            REPLACE(TRIM(Unit_Price), '$', ''),
        ',', ''),
    '') + 0 AS Unit_Price,

    /* Shipping Cost */
    NULLIF(
        REPLACE(
            REPLACE(TRIM(Shipping_Cost), '$', ''),
        ',', ''),
    '') + 0 AS Shipping_Cost,

    Ship_Mode,
    Customer_Segment,
    Product_Category,
    Product_Sub_Category,
    Product_Container,
    Product_Name,

    /* Product Base Margin */
    NULLIF(
        REPLACE(TRIM(Product_Base_Margin), '%', ''),
    '') + 0 AS Product_Base_Margin,

    Country,
    Region,
    State_or_Province,
    City,

    NULLIF(Postal_Code, '') + 0 AS Postal_Code,

    /* Dates */
    STR_TO_DATE(TRIM(Order_Date), '%d-%m-%Y') AS Order_Date,

    STR_TO_DATE(TRIM(Ship_Date), '%d-%m-%Y') AS Ship_Date,

    /* Profit Handling */
    CASE
        WHEN Profit LIKE '%(%'
        THEN -(
            NULLIF(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(TRIM(Profit), '(', ''),
                            ')', ''),
                        '$', ''),
                    ',', ''),
                ' ', ''),
            '') + 0
        )

        ELSE
            NULLIF(
                REPLACE(
                    REPLACE(
                        REPLACE(TRIM(Profit), '$', ''),
                    ',', ''),
                ' ', ''),
            '') + 0
    END AS Profit,

    NULLIF(Quantity_ordered_new, '') + 0
    AS Quantity_ordered_new,

    /* Sales */
    NULLIF(
        REPLACE(
            REPLACE(
                REPLACE(TRIM(Sales), '$', ''),
            ',', ''),
        ' ', ''),
    '') + 0 AS Sales,

    NULLIF(Order_ID, '') + 0 AS Order_ID,

    Status

FROM Orders_Raw;


SELECT * FROM companydb.sales;

-- DASHBOARD SUMMARY

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer) AS total_customers,
    SUM(quantity) AS total_quantity_sold,
    SUM(total) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(total)) * 100, 2) AS profit_margin_percent
FROM sales;


-- REGION ANALYSIS

SELECT
    region,
    SUM(total) AS revenue,
    SUM(profit) AS profit,
    SUM(quantity) AS quantity_sold
FROM sales
GROUP BY region
ORDER BY revenue DESC;


-- CATEGORY ANALYSIS

SELECT
    category,
    SUM(total) AS revenue,
    SUM(profit) AS profit,
    ROUND((SUM(profit) / SUM(total)) * 100, 2) AS profit_margin
FROM sales
GROUP BY category
ORDER BY revenue DESC;


-- TOP 10 PRODUCTS BY REVENUE

SELECT
    product,
    SUM(total) AS revenue,
    SUM(quantity) AS quantity_sold,
    SUM(profit) AS profit
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;


-- TOP 10 CUSTOMERS

SELECT
    customer,
    SUM(total) AS revenue,
    SUM(profit) AS profit,
    COUNT(*) AS orders_count
FROM sales
GROUP BY customer
ORDER BY revenue DESC
LIMIT 10;


-- MONTHLY SALES TREND

SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(total) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;


-- DAILY SALES TREND

SELECT
    date,
    SUM(total) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY date
ORDER BY date;


-- MOST PROFITABLE PRODUCTS

SELECT
    product,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_profit DESC
LIMIT 10;


-- LOSS-MAKING PRODUCTS

SELECT
    product,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- BEST CATEGORY PER REGION

SELECT
    region,
    category,
    SUM(total) AS revenue
FROM sales
GROUP BY region, category
ORDER BY region, revenue DESC;


-- TOP PRODUCT IN EACH CATEGORY

WITH ranked_products AS (
    SELECT
        category,
        product,
        SUM(total) AS revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(total) DESC
        ) AS rnk
    FROM sales
    GROUP BY category, product
)
SELECT
    category,
    product,
    revenue
FROM ranked_products
WHERE rnk = 1;


-- CUSTOMER PURCHASE FREQUENCY

SELECT
    customer,
    COUNT(*) AS orders_count
FROM sales
GROUP BY customer
ORDER BY orders_count DESC;


-- CUMULATIVE REVENUE TREND

SELECT
    date,
    SUM(total) AS daily_revenue,
    SUM(SUM(total)) OVER (
        ORDER BY date
    ) AS cumulative_revenue
FROM sales
GROUP BY date
ORDER BY date;


-- HIGHEST SINGLE SALE

SELECT *
FROM sales
ORDER BY total DESC
LIMIT 1;
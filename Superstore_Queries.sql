SELECT * FROM Cleaned_Superstore_Data LIMIT 10;

SHOW COLUMNS FROM Cleaned_Superstore_Data;

# 1. Profit Leak Analysis

SELECT 
    `Sub-Category`, 
    ROUND(SUM(`Sales`), 2) AS total_sales, 
    ROUND(SUM(`Profit`), 2) AS total_profit, 
    ROUND(AVG(`Discount`) * 100, 2) AS avg_discount_pct
FROM Cleaned_Superstore_Data
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;

# 2. Best Selling Categories & Segments

SELECT 
    `Category`, 
    `Segment`, 
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM Cleaned_Superstore_Data
GROUP BY `Category`, `Segment`
ORDER BY total_sales DESC;

# 3. Top 10 High-Value Customers

SELECT 
    `Customer Name`, 
    COUNT(`Order ID`) AS total_orders, 
    ROUND(SUM(`Sales`), 2) AS total_spent
FROM Cleaned_Superstore_Data
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 10;

# 4. Regional Performance Rank

SELECT 
    `Region`, 
    `State`, 
    ROUND(SUM(`Sales`), 2) AS state_sales,
    RANK() OVER (PARTITION BY `Region` ORDER BY SUM(`Sales`) DESC) AS sales_rank
FROM Cleaned_Superstore_Data
GROUP BY `Region`, `State`;

# Sales by Year

SELECT 
    `Order Year`, 
    ROUND(SUM(`Sales`), 2) AS annual_sales
FROM Cleaned_Superstore_Data
GROUP BY `Order Year`
ORDER BY `Order Year` ASC;
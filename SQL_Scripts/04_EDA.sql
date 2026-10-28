
/*
==========================================================
PROJECT : Coffee Shop Sales Analysis

FILE : 04_EDA.sql

OBJECTIVE :
Perform Exploratory Data Analysis (EDA)
to understand the dataset before
business analysis.

==========================================================
*/

/*==========================================================
STEP 1 : TOTAL TRANSACTIONS
==========================================================*/

SELECT
COUNT(*) AS Total_Transactions
FROM transactions;

/*==========================================================
STEP 2 : TOTAL PRODUCTS
==========================================================*/

SELECT
COUNT(*) AS Total_Products
FROM products;

/*==========================================================
STEP 3 : TOTAL STORES
==========================================================*/

SELECT
COUNT(*) AS Total_Stores
FROM stores;

/*==========================================================
STEP 4 : PRODUCT CATEGORIES
==========================================================*/

SELECT DISTINCT
product_category
FROM products;

/*==========================================================
STEP 5 : PRODUCT TYPES
==========================================================*/

SELECT DISTINCT
product_type
FROM products;

/*==========================================================
STEP 6 : STORE LOCATIONS
==========================================================*/

SELECT DISTINCT
store_location
FROM stores;


/*==========================================================
STEP 7 : DAILY TRANSACTION DISTRIBUTION
==========================================================*/

SELECT
    transaction_date,
    COUNT(*) AS Total_Transactions
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;



/*==========================================================
STEP 8 : PRODUCT PRICE DISTRIBUTION
==========================================================*/

SELECT
    MIN(unit_price) AS Minimum_Price,
    MAX(unit_price) AS Maximum_Price,
    ROUND(AVG(unit_price), 2) AS Average_Price
FROM products;



/*==========================================================
STEP 9 : TRANSACTION QUANTITY DISTRIBUTION
==========================================================*/

SELECT
    MIN(transaction_qty) AS Minimum_Quantity,
    MAX(transaction_qty) AS Maximum_Quantity,
    ROUND(AVG(transaction_qty), 2) AS Average_Quantity
FROM transactions;


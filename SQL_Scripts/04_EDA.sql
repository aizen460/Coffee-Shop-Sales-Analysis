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
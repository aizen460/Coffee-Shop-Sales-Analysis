/*
==========================================================
PROJECT : Coffee Shop Sales Analysis

FILE : 03_Data_Validation.sql

OBJECTIVE :
Validate the integrity of the cleaned data before analysis.
==========================================================
*/


/*==========================================================
STEP 1 : VALIDATE DATE RANGE
==========================================================*/

SELECT
MIN(transaction_date) AS First_Transaction_Date,
MAX(transaction_date) AS Last_Transaction_Date
FROM transactions;


/*
Expected Result:
The first transaction date should be
2023-01-01.

The last transaction date should be
2023-06-30.

Conclusion:
The dataset falls within the expected
business period.
*/


/*==========================================================
STEP 2 : VALIDATE TIME RANGE
==========================================================*/

SELECT
MIN(transaction_time) AS Earliest_Transaction,
MAX(transaction_time) AS Latest_Transaction
FROM transactions;
/*
Conclusion:
Transaction times fall within
expected business operating hours.
*/

/*==========================================================
STEP 3 : VERIFY RECORD COUNT
==========================================================*/

SELECT COUNT(*) AS Total_Transactions
FROM transactions;

SELECT COUNT(*) AS Total_Products
FROM products;

SELECT COUNT(*) AS Total_Stores
FROM stores;

/*
Conclusion:
Verified the total number of records
in all normalized tables.

The tables are complete and ready
for Exploratory Data Analysis.
*/

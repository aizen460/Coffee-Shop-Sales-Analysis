/*==========================================================
STEP 1 : CHECK FOR NULL VALUES
==========================================================*/

/* Transactions Table */

SELECT *
FROM transactions
WHERE transaction_id IS NULL
   OR transaction_date IS NULL
   OR transaction_time IS NULL
   OR transaction_qty IS NULL
   OR store_id IS NULL
   OR product_id IS NULL;
   
/* Products Table */

SELECT *
FROM products
WHERE product_id IS NULL
   OR product_category IS NULL
   OR product_type IS NULL
   OR product_detail IS NULL
   OR unit_price IS NULL;
   
   /* Stores Table */

SELECT *
FROM stores
WHERE store_id IS NULL
   OR store_location IS NULL;
   
/*
Result:
No NULL values were found in the transactions,
products, and stores tables.

Conclusion:
The dataset is complete and ready for further validation.
*/

/*==========================================================
STEP 2 : CHECK FOR DUPLICATE RECORDS
==========================================================*/

/* Transactions Table */

SELECT
transaction_id,
COUNT(*) AS duplicate_count
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

/* Products Table */

SELECT
product_id,
COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

/* Stores Table */

SELECT
store_id,
COUNT(*) AS duplicate_count
FROM stores
GROUP BY store_id
HAVING COUNT(*) > 1;

/*
Result:
No duplicate records were found in the transactions,
products, or stores tables.

Conclusion:
Each primary identifier is unique, ensuring
data integrity and preventing duplicate analysis.
*/

/*==========================================================
STEP 3 : CHECK FOR INVALID VALUES
==========================================================*/

/* Check for invalid transaction quantity */

SELECT *
FROM transactions
WHERE transaction_qty <= 0;

/* Check for invalid product price */
SELECT *
FROM products
WHERE unit_price <= 0;
/*
Result:
No invalid transaction quantities or product prices
were found.

Conclusion:
All transaction quantities and product prices are valid
for business analysis.
*/

/*==========================================================
STEP 4 : CHECK FOR BLANK VALUES
==========================================================*/

/* Products Table */

SELECT *
FROM products
WHERE TRIM(product_category) = ''
   OR TRIM(product_type) = ''
   OR TRIM(product_detail) = '';
   
/* Stores Table */

SELECT *
FROM stores
WHERE TRIM(store_location) = '';

/*verify transaction relationship */

SELECT *
FROM transactions t
LEFT JOIN products p
ON t.product_id = p.product_id
WHERE p.product_id IS NULL;

/* Verify Store Relationship */

SELECT *
FROM transactions t
LEFT JOIN stores s
ON t.store_id = s.store_id
WHERE s.store_id IS NULL;

/*
Result:
Every transaction is linked to a valid product
and a valid store.

Conclusion:
The relationships between transactions,
products, and stores are valid.
No orphan records were found.
*/


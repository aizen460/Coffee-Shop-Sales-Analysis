
/*
===========================================================
PROJECT : Coffee Shop Sales Analysis
Author  : Tanmay Chawan

STEP 1
Create Products Table
===========================================================
*/

CREATE TABLE products AS
SELECT DISTINCT
    product_id,
    product_category,
    product_type,
    product_detail,
    unit_price
FROM coffee_shop.coffee_shop_sales_raw;

/*
===========================================================
STEP 2
Create Stores Table
===========================================================
*/

CREATE TABLE stores AS
SELECT DISTINCT
    store_id,
    store_location
FROM coffee_shop.coffee_shop_sales_raw;

/*
===========================================================
STEP 3
Create Transactions Table
===========================================================
*/

CREATE TABLE transactions AS
SELECT
    `ï»¿transaction_id` AS transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    product_id
FROM coffee_shop.coffee_shop_sales_raw;

/*
===========================================================
STEP 4
Inspect table structure
===========================================================
*/

DESCRIBE products;

DESCRIBE stores;

DESCRIBE transactions;

/*
===========================================================
STEP 5
Convert transaction_date from TEXT to DATE
===========================================================
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE transactions
SET transaction_date =
STR_TO_DATE(transaction_date,'%d-%m-%Y');

ALTER TABLE transactions
MODIFY COLUMN transaction_date DATE;

/*
===========================================================
STEP 6
Convert transaction_time from TEXT to TIME
===========================================================
*/

UPDATE transactions
SET transaction_time =
STR_TO_DATE(transaction_time,'%H:%i:%s');

ALTER TABLE transactions
MODIFY COLUMN transaction_time TIME;

/*
===========================================================
STEP 7
Verify the changes
===========================================================
*/

DESCRIBE transactions;

SELECT *
FROM transactions
LIMIT 10;


-- ==========================================================
-- STEP 8: ADD PRIMARY KEYS
-- ==========================================================

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE stores
ADD PRIMARY KEY (store_id);

ALTER TABLE transactions
ADD PRIMARY KEY (transaction_id);


-- ==========================================================
-- STEP 9: ADD FOREIGN KEYS
-- ==========================================================

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_stores
FOREIGN KEY (store_id)
REFERENCES stores(store_id);








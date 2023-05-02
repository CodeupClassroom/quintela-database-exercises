-- Basic Statements Lesson

-- 1 SELECT [columns that we want]
-- 2 FROM [the table that the columns are on]
-- 3 WHERE [filters we want applied to that data]


-- SELECT can be used by iteself
-- FORMAT: SELECT [thing]

SELECT "Hello World";

SELECT 2+2;


-- To pull back data from the database, we have to incorporate our 
-- FROM statement 

USE farmers_market;

SELECT database();

SHOW tables;

SELECT * FROM customer;

SHOW tables;

SELECT *
FROM product;

SELECT product_id, product_name
FROM product;

SELECT product_id AS id_of_product, 
	product_name AS name_of_product 
FROM product;

SELECT *
FROM product;


-- To filter rows, we need to use the WHERE clause

-- FORMAT: SELECT * FROM [table] WHERE [condition]

-- condition FORMAT: [column_name] operator [value]

SELECT *
FROM product
WHERE product_qty_type = 'lbs';

SELECT *
FROM product
WHERE product_size = 'medium';

-- not equal: != or <>

SELECT *
FROM product
WHERE product_category_id != 1;

SELECT *
FROM product_category;

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty < 1;

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty > 1;

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty BETWEEN 3 AND 4;

SELECT DISTINCT product_id, vendor_id
FROM customer_purchases;

-- order is important, WHERE comes after FROM
SELECT *
WHERE cost_to_customer_per_qty > 1
FROM customer_purchases;

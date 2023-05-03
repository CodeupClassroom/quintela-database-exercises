-- Functions Lesson

-- Numeric Functions

USE farmers_market;

SELECT *
FROM customer_purchases;

SELECT AVG(quantity)
FROM customer_purchases;

SELECT AVG(quantity), MIN(quantity), MAX(quantity)
FROM customer_purchases;

-- String Functions

-- CONCAT
SELECT customer_first_name, 
	customer_last_name, 
	CONCAT(customer_first_name, ' ', customer_last_name) AS customer_full_name
FROM customer;

-- SUBSTR
SELECT product_name, SUBSTR(product_name, 5, 10)
FROM product;

-- UPPER & LOWER
SELECT customer_first_name, UPPER(customer_first_name), LOWER(customer_first_name)
FROM customer;

-- REPLACE
SELECT product_size, REPLACE(product_size, 'medium', 'M') 
FROM product;

-- Date Functions

-- Get the datetime for right now
SELECT NOW();
-- Get the date for right now
SELECT CURDATE();
-- Get the time for right now
SELECT CURTIME();

SELECT unix_timestamp();

SELECT unix_timestamp('1993-11-19');

SELECT CONCAT(
	'Teaching data science at Codeup for ',
	UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2022-05-23'),
    ' seconds'
);

-- Casting
SELECT 2 + '2';

SELECT '10' - 5;

SELECT CONCAT('Here is a number ', 5000)
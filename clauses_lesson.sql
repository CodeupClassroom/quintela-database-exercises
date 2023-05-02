-- Clauses: WHERE Advanced

-- BETWEEN
-- We know this 

-- LIKE/ NOT LIKE

USE farmers_market;

SELECT *
FROM customer
WHERE customer_first_name LIKE '%ll%';

SELECT *
FROM customer
WHERE customer_first_name NOT LIKE 'J%';

-- IN 
SELECT *
FROM customer
WHERE customer_first_name IN ('Bob', 'Betty');

SELECT *
FROM customer
WHERE customer_first_name NOT IN ('Bob', 'Betty');

-- NULL / NOT NULL
SELECT *
FROM product
WHERE product_qty_type IS NULL;

SELECT *
FROM product
WHERE product_qty_type IS NOT NULL;

-- Chaining WHERE clauses with AND and OR
SELECT *
FROM product
WHERE product_size = 'medium'
	AND product_qty_type = 'lbs';

SELECT *
FROM product
WHERE product_size = 'medium'
	OR product_qty_type = 'lbs';
    
SELECT *
FROM product
-- product_category_id 1 is FRESH PRODUCE
WHERE (product_size = 'medium' AND product_category_id = 1) 
	OR product_qty_type = 'lbs';
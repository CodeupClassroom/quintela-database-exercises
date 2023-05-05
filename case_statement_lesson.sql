USE farmers_market;

-- Basic Case Statement

SELECT *,
	CASE booth_type
		WHEN 'standard' THEN 1
        ELSE 0
	END AS is_standard    
FROM booth;

-- Verbose Case Statements

-- -- Creating New Product Categories
SELECT product_category_name,
	CASE 
		WHEN product_category_name LIKE '%fresh%' THEN 'Fresh'
        WHEN product_category_name LIKE '%packaged%' THEN 'Packaged'
		-- WHEN product_category_name IS NULL THEN 'UNKNOWN'
        ELSE 'Non-Edible'
		-- ELSE product_category_name
	END
FROM product_category;

-- -- Investigate Prices to see what appropriate categories would be
SELECT DISTINCT cost_to_customer_per_qty
FROM customer_purchases
ORDER BY cost_to_customer_per_qty;

-- -- Create Price Categories
SELECT *,
	CASE
		WHEN cost_to_customer_per_qty <= 1 THEN 'Low-end'
        WHEN cost_to_customer_per_qty > 1 AND cost_to_customer_per_qty < 5  THEN 'Mid-range'
        WHEN cost_to_customer_per_qty >= 5 THEN 'High-end'
	END AS price_category
FROM customer_purchases;

-- IF() Function
-- -- Build up a query to be used as a subquery later
SELECT AVG(quantity)
FROM customer_purchases;

-- -- Rewritting a SIMPLE case as an IF
SELECT *,
	CASE booth_type
		WHEN 'Standard' THEN 1
        ELSE 0
	END AS is_standard
FROM booth;

SELECT *,
	IF(booth_type = 'Standard', 1, 0)
FROM booth;

-- -- Use a our previous query as a subquery in our IF() function statement
SELECT *,
	IF(quantity > (SELECT AVG(quantity) FROM customer_purchases), 'Large Purchase', 'Normal Purchase') AS purchase_type
FROM customer_purchases;

-- Making Pivot Tables
-- -- Here, I'm building up my columns and values before I group by vendor and use an aggregate function to get a count of values in each column.
SELECT vendor_name,
	CASE WHEN booth_type = 'Standard' THEN booth_type ELSE NULL END AS 'Standard',
    CASE WHEN booth_type = 'Large' THEN booth_type ELSE NULL END AS 'Large',
    CASE WHEN booth_type = 'Small' THEN booth_type ELSE NULL END AS 'Small'
FROM vendor_booth_assignments vba
JOIN booth b ON vba.booth_number = b.booth_number
JOIN vendor v ON vba.vendor_id = v.vendor_id;

-- -- Next, I add my GROUP BY clause and COUNT function to get a count of all booths that have been used by each vendor.
SELECT vendor_name,
	COUNT(CASE WHEN booth_type = 'Standard' THEN booth_type ELSE NULL END) AS 'Standard',
    COUNT(CASE WHEN booth_type = 'Large' THEN booth_type ELSE NULL END) AS 'Large',
    COUNT(CASE WHEN booth_type = 'Small' THEN booth_type ELSE NULL END) AS 'Small'
FROM vendor_booth_assignments vba
JOIN booth b ON vba.booth_number = b.booth_number
JOIN vendor v ON vba.vendor_id = v.vendor_id
GROUP BY vendor_name;


-- -- In this query, I filter in my JOINs for vendors who's vendor_type contains the term fresh.
SELECT vendor_name,
	COUNT(CASE WHEN booth_type = 'Standard' THEN booth_type ELSE NULL END) AS 'Standard',
    COUNT(CASE WHEN booth_type = 'Large' THEN booth_type ELSE NULL END) AS 'Large',
    COUNT(CASE WHEN booth_type = 'Small' THEN booth_type ELSE NULL END) AS 'Small'
FROM vendor_booth_assignments vba
JOIN booth b ON vba.booth_number = b.booth_number
JOIN vendor v ON vba.vendor_id = v.vendor_id AND v.vendor_type LIKE '%fresh%'
GROUP BY vendor_name;
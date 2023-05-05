-- Subquery Lesson

USE farmers_market;

-- Scalar Subquery

-- Let's find the every day where the the market_min_temp is higher than the average market_min_temp

-- This causes an error because we can't use an aggregation function in the WHERE clause
SELECT *
FROM market_date_info
WHERE market_min_temp < AVG(market_min_temp);


-- I could just hard code it...
SELECT AVG(market_min_temp) 
FROM market_date_info;

SELECT *
FROM market_date_info
WHERE market_min_temp < 54.32258064516129;

-- but this won't update on its own. I would have to update this by hand each time.

-- I can use a subquery to get the value and then use that in my WHERE clause.
SELECT *
FROM market_date_info
WHERE market_min_temp < (
							SELECT AVG(market_min_temp) 
                            FROM market_date_info
						);
                        
-- Column Subquery

-- Let's find all the vendors that worked on 2019-04-03
SELECT vendor_id
FROM vendor_booth_assignments
WHERE market_date = '2019-04-03';

SELECT *
FROM vendor
WHERE vendor_id IN (1, 3, 4, 7, 8, 9);

-- I could also use a join, but let's use a subquery

SELECT *
FROM vendor
WHERE vendor_id IN (
                        SELECT vendor_id
                        FROM vendor_booth_assignments
                        WHERE market_date = '2019-04-03'
                    );
                    

-- Use join and subquery to find customers who bought high quantities of items
-- SELECT DISTINCT customer_id
-- FROM customer_purchases 
-- WHERE quantity > 10
-- ORDER BY customer_id;

-- Row Subquery

-- Lets find the name of the first customer that bought something at the market
SELECT customer_id
FROM customer_purchases
ORDER BY market_date, transaction_time
LIMIT 1;

SELECT customer_first_name, customer_last_name
FROM customer
WHERE customer_id = (
						SELECT customer_id
						FROM customer_purchases
						ORDER BY market_date, transaction_time
						LIMIT 1
                    );

-- Table Subquery

-- Let's get the purchases of all customers 
SELECT *
FROM customer;

SELECT *
FROM (
		SELECT *
		FROM customer
		WHERE customer_zip = 22821
	) AS c
JOIN customer_purchases cp ON c.customer_id = cp.customer_id;

SELECT *
FROM customer_purchases cp
JOIN (
		SELECT *
		FROM customer
        WHERE customer_zip = 22821
	) AS c ON cp.customer_id = c.customer_id;
USE farmers_market;

SELECT DISTINCT customer_first_name
FROM customer;

SELECT customer_first_name
FROM customer
GROUP BY customer_first_name;

SELECT customer_first_name, customer_last_name
FROM customer
GROUP BY customer_first_name, customer_last_name;

-- Group by with aggregation functions
SELECT *
FROM customer_purchases;

SELECT customer_id AS id_of_customer, 
	COUNT(*) n_of_purchases
FROM customer_purchases
GROUP BY customer_id;

-- HAVING

-- How many purchases has each customer had?
SELECT customer_id, 
	COUNT(*) n_of_purchases
FROM customer_purchases
GROUP BY customer_id
HAVING n_of_purchases > 200;

-- How many customers bought less than 100 items that cost over $4
SELECT customer_id,
	COUNT(*) n_of_high_end_purchases
FROM customer_purchases
WHERE cost_to_customer_per_qty > 4
GROUP BY customer_id
HAVING n_of_high_end_purchases < 100;
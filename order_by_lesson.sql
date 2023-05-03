-- ORDER BY Clause

USE farmers_market;

SELECT *
FROM market_date_info
ORDER BY market_min_temp;

-- Default is Ascending

SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC;

-- We can sort by multiple columns
SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC, market_max_temp ASC;
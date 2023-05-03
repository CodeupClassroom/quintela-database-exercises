USE 311_data;

-- LIMIT limits the number of returned rows
SELECT * 
FROM cases
LIMIT 10;

-- OFFSET lets us skip ahead
SELECT * 
FROM cases
LIMIT 10 OFFSET 10;
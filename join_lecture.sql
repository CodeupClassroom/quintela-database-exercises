-- INDEXES & JOINS LESSON QUERIES --

USE farmers_market;

-- Let's get a sense of what the tables in our database look like. 
-- I'm particularly interested in identifying PRIMARY KEY and FOREIGN KEY columns
DESCRIBE vendor_booth_assignments;

SELECT * 
FROM vendor_booth_assignments;

-- vendor_booth_assignments seems to have 3 primary keys from the output of DESCRIBE
-- Let's look at the table creation code to see what happened:
SHOW CREATE TABLE vendor_booth_assignments;

/*
CREATE TABLE `vendor_booth_assignments` (
  `vendor_id` int NOT NULL,
  `booth_number` int NOT NULL,
  `market_date` date NOT NULL,
  PRIMARY KEY (`vendor_id`,`booth_number`,`market_date`),
  KEY `market_date_fk_idx` (`market_date`),
  KEY `booth_number_fk_idx` (`booth_number`),
  CONSTRAINT `booth_number_fk` FOREIGN KEY (`booth_number`) REFERENCES `booth` (`booth_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `market_date_fk` FOREIGN KEY (`market_date`) REFERENCES `market_date_info` (`market_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vendor_id_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
*/

-- It appears that the primary key is made up of three different columns
-- This table is a "joiner" table, used to connect two tables that wouldn't otherwise have a connection

-- Let's try and inner join the vendor_booth_assignments table to the vendor table
DESCRIBE vendor;

-- What do these tables look like again?
SELECT * 
FROM vendor 
LIMIT 10;

SELECT * 
FROM vendor_booth_assignments 
LIMIT 10;

-- Inner join of vendor and vendor_booth_assignments
SELECT *
FROM vendor
JOIN vendor_booth_assignments ON vendor.vendor_id = vendor_booth_assignments.vendor_id
LIMIT 50;

-- Now that I've successfully joined vendor to vendor_booth_assignments, I'll add on to my query

SELECT * 
FROM booth;

-- Inner join of vendor, vendor_booth_assignments, and booth_number
SELECT *
FROM vendor
JOIN vendor_booth_assignments ON vendor.vendor_id = vendor_booth_assignments.vendor_id
JOIN booth ON booth.booth_number = vendor_booth_assignments.booth_number
LIMIT 50;

-- Suppose I don't need every single column from all three tables. I can specify what I want
-- Selecting vendor_name, booth_number, and booth_description from inner join of vendor, vendor_booth_assignments, and booth
SELECT vendor.vendor_name,
	booth.booth_number,
    booth.booth_description
FROM vendor
JOIN vendor_booth_assignments ON vendor.vendor_id = vendor_booth_assignments.vendor_id
JOIN booth ON booth.booth_number = vendor_booth_assignments.booth_number
LIMIT 50;

-- Same as above, but with aliases
SELECT v.vendor_name,
	b.booth_number,
    b.booth_description
FROM vendor AS v
JOIN vendor_booth_assignments vba ON v.vendor_id = vba.vendor_id
JOIN booth AS b ON b.booth_number = vba.booth_number
LIMIT 50;

-- Same as above, but let's add a WHERE clause. 
-- Notice that it is filtering on a column that isn't in our SELECT statement and this is ok
SELECT v.vendor_name,
	b.booth_number,
    b.booth_description
FROM vendor AS v
JOIN vendor_booth_assignments vba ON v.vendor_id = vba.vendor_id
JOIN booth AS b ON b.booth_number = vba.booth_number
WHERE b.booth_price_level = 'A';

-- Let's do this again with vendor_inventory
SELECT *
FROM vendor_inventory;

SELECT *
FROM vendor_inventory vi
JOIN vendor v ON v.vendor_id = vi.vendor_id;

SELECT *
FROM vendor_inventory vi
JOIN vendor v ON v.vendor_id = vi.vendor_id
JOIN product p ON p.product_id = v.vendor_id;

SELECT *
FROM vendor_inventory vi
JOIN vendor v ON v.vendor_id = vi.vendor_id
JOIN product p ON p.product_id = v.vendor_id
ORDER BY market_date;

SELECT vi.market_date,
	vi.quantity,
    p.product_qty_type,
    v.vendor_name,
    p.product_name
FROM vendor_inventory vi
JOIN vendor v ON v.vendor_id = vi.vendor_id
JOIN product p ON p.product_id = v.vendor_id
ORDER BY market_date;
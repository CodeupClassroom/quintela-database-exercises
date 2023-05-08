USE curie_949;

-- Create tempory table
CREATE TEMPORARY TABLE my_numbers_2(
	n INT UNSIGNED NOT NULL
);

-- Look at the temporary table
SELECT * FROM my_numbers_2;

-- Add rows to temporary table
INSERT INTO my_numbers_2(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers_2;

-- Create temp table with two columns
CREATE TEMPORARY TABLE student_names(
	first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM student_names;

-- Add rows to multiple columns
INSERT INTO student_names(first_name, last_name) VALUES ('Ryan', 'McCall'), ('John', 'Grinstead'), ('Brooke', 'Holyoak');

SELECT * FROM student_names;

SELECT * FROM my_numbers;

-- change values on table
UPDATE my_numbers SET n = n + 1;

SELECT * FROM my_numbers;
-- remove values
DELETE FROM my_numbers WHERE n % 2 = 0;

SELECT * FROM my_numbers;

-- Make a temp table with a query

-- Use the read_only database
-- This avoids needing to re-type the db_name in front of every table_name
USE employees;

-- Specify the db where you have permissions and add the temp table name.
-- Replace "my_database_with_permissions"" with the database name where you have appropriate permissions. It should match your username.
CREATE TEMPORARY TABLE curie_949.employees_with_salaries AS 
SELECT * FROM employees JOIN salaries USING(emp_no);

-- Change the current db.
USE curie_949;
SELECT * FROM employees_with_salaries;
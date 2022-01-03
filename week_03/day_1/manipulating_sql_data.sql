/* Learning Objectives
* Be able to create column alias using AS
* DISTICT - return unique records by column 
* Aggregates function 
* Sort records and Limit the number returned
*/

SELECT 
      id, 
      first_name, 
      last_name,
      department 
FROM employees 
WHERE department = 'Accounting';

-- Aliases via AS 

/* Can we get a list of all employees with their
* first and last names combined into one field called
* 'full_name'?
*/

-- CONCAT() concatenates strings together

SELECT 
      CONCAT('Hello', ' ', 'there!') as greeting;
     
-- ||
SELECT 
      'Hello' || ' ' || 'there!' AS greeting;
     
SELECT 
      id, 
      first_name, 
      last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE first_name IS NOT NULL AND last_name IS NOT NULL


/*
 * Add a WHERE clause to the query above to filter out any rows 
 * that don’t have both a first and second name.
 */

-- DISTINCT()

/* Our database may be out of date. We should have six departments
 * in the coorportation. How many departments do employees belong to
 * at present
 */

SELECT 
      DISTINCT(department)
FROM employees;

-- Aggregate Functions:
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()

/* How many employees started work for the coorporation in 2001
 */

SELECT 
      COUNT(*) AS total_employed_2001
FROM employees WHERE start_date BETWEEN '2001-01-01' AND '2001-12-31'

/* 1. “What are the maximum and minimum salaries of all employees?”
2. “What is the average salary of employees in the Human Resources department?”
*/

-- Question 1

SELECT
      MAX(salary) AS max_salary 
FROM employees;  

SELECT
      MIN(salary) AS min_salary 
FROM employees; 

-- Or

SELECT
	MAX(salary) AS max_salary,
	MIN(salary) AS min_salary
FROM employees;

-- Question 2

SELECT
      AVG(salary) AS avg_salary_in_hr
FROM employees 
WHERE department = 'Human Resources';

-- Question 3 

SELECT 
      SUM(salary) AS sum_salary_employees_2018
FROM employees 
WHERE start_date BETWEEN '2018-01-01' AND '2018-12-31'; 

-- Sorting by Columns 
-- ORDER BY always comes after any WHERE clause
-- Examples 

SELECT *
FROM employees 
WHERE salary IS NOT NULL 
ORDER BY salary DESC
LIMIT 100;

-- More examples

SELECT *
FROM employees 
ORDER BY salary ASC NULLS LAST;

SELECT *
FROM employees 
ORDER BY salary DESC NULLS LAST;

/* Order employees by full-time equivalent hours,
 * highest first, and then alphabetically by last name
 */

SELECT *
FROM employees 
ORDER BY 
	fte_hours DESC NULLS LAST,
	last_name ASC NULLS LAST;

-- Taskles 

/* 1. “Get the details of the longest-serving employee of the corporation.”
2. “Get the details of the highest paid employee of the corporation in Libya.”
 */

-- Question 1:

SELECT *
FROM employees 
ORDER BY
	start_date ASC NULLS LAST
LIMIT 1;

-- Question 2:

SELECT *
FROM employees
WHERE country = 'Libya'
ORDER BY
	salary DESC NULLS LAST
LIMIT 1;
 
-- SELECT * - select all columns 
     



-- Grouping and Subqueries

-- "Find the number of employees in each department?"

SELECT
	department,
	COUNT(id) 
FROM employees
GROUP BY department;

-- "How many employees are there in each country?"

SELECT
	country,
	COUNT(id) 
FROM employees
GROUP BY country;

-- Combination of WHERE

--"How many employees in each department, work 0.25 or 0.5 fte hours?"

SELECT
	department,
	COUNT(id) AS number_fte_hours_less_than_half 
FROM employees
WHERE fte_hours BETWEEN 0.25 AND 0.5
GROUP BY department

-- WHERE needs to be before GROUP_BY

-- Different Counts

SELECT 
	COUNT(first_name) AS n_first_names,
	COUNT(id) AS count_id,
	COUNT(*) AS count_star
FROM employees;

-- Code above counts the number of primary keys


-- Order of Execution:

-- So few workers go home on time on time
-- SELECT, FROM, WHERE, GROUP_BY, HAVING, ORDER BY, LIMIT. 

-- Find the longest time served by any one employee in each depends 

SELECT
	department,
	ROUND(EXTRACT(DAY FROM NOW() - MIN(start_date))/365.25) AS longest_time_served
FROM employees
GROUP BY department;

-- How does GROUP BY group by?

-- Sorts data into groups
-- then labels them

-- Taskles - 1. “How many employees in each department are enrolled in the pension scheme?”

SELECT
	department,
	COUNT(id) AS employees_enrolled_on_pension
FROM employees
WHERE pension_enrol = TRUE
GROUP BY department;

-- BEWARE: Cannot perform operation on Booleans in a COUNT()

-- Put conditions in the where clause


-- Taskles 2 - “Perform a breakdown by country of the number of employees that do not have a stored first name.”

SELECT 
	country,
	COUNT(id) AS number_of_employees_with_no_first_name
FROM employees
WHERE first_name IS NULL
GROUP BY country;

-- HAVING

-- WHERE clause lets us filter rows 
-- HAVING lets us filter groups 

-- "Show the departments in which at least 40 employees =, work
-- either 0.25 or 0.5 fte_hours"

SELECT 
	department,
	COUNT(id) AS number_of_employees
FROM employees
WHERE fte_hours BETWEEN 0.25 AND 0.5
GROUP BY department
HAVING COUNT(id) >= 40;

-- Order of execution is different to the Order of Operation.
-- So requires HAVING to specify the count.

-- "Show any countries in which the minimum salary amongst
-- pension enrolled employees is less than $21,000"

SELECT 
	country,
	MIN(salary) AS min_salary
FROM employees 
WHERE pension_enrol = TRUE 
GROUP BY country 
HAVING MIN(salary) < 21000;

-- Taskles

-- “Show any departments in which the earliest start date amongst grade 1 employees is prior to 1991”

SELECT
	department,
	MAX(grade),
	MIN(start_date)
FROM employees 
WHERE grade = 1
GROUP BY department
HAVING MIN(start_date) < '1991-01-01';

-- Subqueries 

-- "Find all employees in Japan who earn over the company wide
-- wide average salary"

-- Find company average salary
-- Use the value to filter

SELECT 
FROM employees 
WHERE country = 'Japan' AND salary > AVG(salary);

-- Oh no! we cannot perform aggregate function in where clause

SELECT 
	AVG(salary)
FROM employees;

SELECT *
FROM employees 
WHERE   country = 'Japan' AND 
		salary > (SELECT AVG(salary) FROM employees);
	

-- Taskle
	
-- “Find all the employees in Legal who earn less than the mean salary in that same department.”
	
SELECT *
FROM employees 
WHERE   department = 'Legal' AND 
		salary < (SELECT AVG(salary) 
	              FROM employees 
	              WHERE department = 'Legal');
	
SELECT
	AVG(salary)
FROM employees 
WHERE department = 'Legal'

-- Taskle

-- “Find all the employees in the United States who work the most common full-time equivalent hours across the corporation.”

SELECT *
FROM employees 
WHERE   country = 'United States' AND 
		fte_hours = (SELECT fte_hours 
	              FROM employees
	              GROUP BY fte_hours
	              ORDER BY COUNT(*) DESC 
	              LIMIT 1);
	            
	


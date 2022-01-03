SELECT *
FROM employees; 

-- Filter by WHERE 

-- Find the employee with id = 3

SELECT *
FROM employees 
WHERE id = 3;

-- Find all the employees working 0.5 full time equv or greater

-- != : not equal
-- >  : greater than
-- <  : less than
-- >= : greater than or equal to
-- <= : less than or equal to 

SELECT *
FROM employees 
WHERE fte_hours >= 0.5;

-- Taskles: Find all the employees not in Brazil

SELECT *
FROM employees 
WHERE country != 'Brazil';

/*  This is a comment
* End of the comment is represented by below
*/ 

-- Let's find all employees in China who started working for OmniCorp in 2019

SELECT *
FROM employees 
WHERE country = 'China' AND start_date >= '2019-01-01' AND start_date <= '2019-12-31';

/* Of all the employees based in China, find those who either started working for OmniCorp
 * from 2019 onwards or who are enrolled in the pension scheme.
 */

SELECT *
FROM employees 
WHERE country = 'China' AND (start_date >= '2019-01-01' OR pension_enrol = TRUE);

-- The brackets returns what is inside as a single logical expression

/* Find all employees who work between 0.25 and 0.5 full-time hours inclusive
 */

SELECT *
FROM employees 
WHERE fte_hours >= 0.25 AND fte_hours <= 0.5;

/* Find all employees who started working for OmniCorp in years other than 2017
*/

SELECT *
FROM employees 
WHERE start_date <= '2017-01-01' OR start_date >= '2017-12-31';

-- BETWEEN, NOT and IN operations 

-- Find employees with hours between 0.25 and 0.5 hours

SELECT *
FROM employees 
WHERE fte_hours BETWEEN 0.25 AND 0.5;

-- Between statement is inclusive of the numbers given. (>=)

SELECT *
FROM employees 
WHERE fte_hours >= 0.25 AND fte_hours <= 0.5;

-- Two pieces of code above are the same

SELECT *
FROM employees 
WHERE start_date NOT BETWEEN '2017-01-01' AND '2017-12-31';

-- Not Between statement not inclusive of dates given

SELECT *
FROM employees 
WHERE start_date < '2017-01-01' OR start_date > '2017-12-31';

-- Two pieces of code above are the same

-- Taskles

/* "Find all employees who started work at OmniCorp in 2016 who work 0.5 full time equivalent hours or greater."
 */

SELECT *
FROM employees 
WHERE (start_date BETWEEN '2016-01-01' AND '2016-12-31') AND fte_hours >= 0.5;

-- IN 

/* Find all employees based in Spain, SA, Ireland OR Germany 
 */

SELECT *
FROM employees 
WHERE country IN ('Spain', 'South Africa', 'Ireland', 'Germany');

/* Find all employees based in countries other than
 * Finland, Argentina, Canada
 */

SELECT *
FROM employees 
WHERE country NOT IN ('Finland', 'Argentina', 'Canada')

-- SELECT: Column wise operation
-- FROM: Table
-- WHERE: Filter by rows

-- AND and OR, BETWEEN, NOT IN 

-- LIKE: regex 
-- IS NULL: is it empty 

-- Taskles

/* “I was talking with a colleague from Greece last month, 
 * I can’t remember their last name exactly, 
 * I think it began ‘Mc…’ something-or-other. Can you find them?”
*/

SELECT *
FROM employees 
WHERE country = 'Greece' AND last_name LIKE 'Mc%';

-- _ : a single character (+)
-- % : 0 or more characters (*)


/* Find all employees with last name containing the phrase 
 * 'ere' anywhere
 */

SELECT *
FROM employees 
WHERE last_name LIKE '%ere%';

/* Find all employees in the legal department with
 * a last name beginning with 'D'
 */

SELECT *
FROM employees 
WHERE department = 'Legal' AND last_name LIKE 'D%';

-- “Find all employees having ‘a’ as the second letter of their first names.”

SELECT *
FROM employees 
WHERE first_name LIKE '_a%';

/* Find all employees whose last name contains a letter
 * 'ha' anywhere
 */

SELECT *
FROM employees 
WHERE last_name ILIKE '%ha%';

-- ILIKE is case insentive.

-- Posix Comparator
-- ~ : case-senstive matches
-- ~* : case-insensitve matches
-- !~ : case-sensitive does not match
-- !~*: case-insensitive does not match

/* Find all employees for whom the second letter
 * of their last name is 'r' or 's' and the third
 * letter is 'a' or 'o'
 */

SELECT *
FROM employees 
WHERE last_name ~ '^.[rs][ao]';

-- starts with (^) any letter (.), second letter [rs], third letter [ao]

SELECT *
FROM employees 
WHERE last_name !~* '^.[rs][ao]';

-- IS NULL

/* We need to ensure our employee record are up to date.
 * Find all employees who do not have a listed email address
 */

SELECT *
FROM employees 
WHERE email IS NULL;

SELECT *
FROM employees 
WHERE email IS NOT NULL;



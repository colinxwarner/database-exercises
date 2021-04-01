USE employees;

SELECT *
FROM employees
WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M';


SELECT *
FROM employees
WHERE last_name LIKE ('E%')
   OR last_name LIKE ('%E');


SELECT *
FROM employees
WHERE last_name LIKE ('E%')
  AND last_name LIKE ('%E');


SELECT *
FROM employees
WHERE last_name NOT LIKE ('%qu%')
  AND last_name LIKE ('%q%');

SELECT YEAR(birth_date)
FROM employees
LIMIT 100;
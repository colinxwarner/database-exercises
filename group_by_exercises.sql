USE employees;

SELECT DISTINCT title FROM titles;

SELECT last_name FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;

SELECT last_name FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT last_name, COUNT(*) FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*) DESC;

SELECT COUNT(*), gender FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;
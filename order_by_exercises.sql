use employees;

SELECT *
FROM employees
WHERE first_name IN ('Irene','Vidya', 'Maya')
ORDER BY first_name;


SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY last_name, first_name;


SELECT *
FROM employees
WHERE (first_name = 'Irene'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M';


SELECT *
FROM employees
WHERE last_name like 'E%'
ORDER BY emp_no;


SELECT *
FROM employees
WHERE last_name like 'E%'
ORDER BY emp_no DESC;


SELECT *
FROM employees
WHERE birth_date like '%-12-25'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;
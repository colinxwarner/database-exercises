use employees;

SELECT emp_no
FROM salaries
ORDER BY salary
DESC LIMIT 5;


SELECT emp_no
FROM salaries
ORDER BY salary
DESC LIMIT 5 OFFSET 45;
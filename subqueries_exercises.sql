USE employees;

-- # TODO: Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT CONCAT(first_name, ' ', last_name) AS 'Name'
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);

-- # TODO: Find all the titles held by all employees with the first name Aamod.
SELECT t.title, COUNT(t.title) AS 'First name Aamod'
FROM titles AS t
WHERE t.emp_no IN (
    SELECT e.emp_no
    FROM employees AS e
    WHERE e.first_name = 'Aamod'
)
GROUP BY t.title
ORDER BY t.title;

-- # TODO: Find all the current department managers that are female.
SELECT CONCAT(first_name, ' ', last_name) AS 'Current Female Managers'
FROM employees AS e
WHERE e.emp_no IN (
    SELECT dm.emp_no
    FROM dept_manager AS dm
    Where e.gender = 'f'
      AND dm.to_date > NOW()
);



-- #  BONUS
-- #
-- # TODO: Find all the department names that currently have female managers.
SELECT dept_name
FROM departments AS d
WHERE d.dept_no IN (
    SELECT dm.dept_no
    FROM dept_manager AS dm
    WHERE dm.emp_no IN (
        SELECT e.emp_no
        FROM employees AS e
        WHERE e.gender = 'f'
    )
      AND dm.to_date > NOW()
);

-- # TODO: Find the first and last name of the employee with the highest salary.

SELECT first_name, last_name FROM employees
WHERE emp_no = (
    SELECT emp_no FROM salaries
    WHERE salary = (
        SELECT MAX(salary) FROM salaries
    )
);
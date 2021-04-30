USE employees;

-- TODO: Show each department along with the name of the current manager for that department.
SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- TODO: Find the name of all departments currently managed by women.
SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date > now()
  AND e.gender = 'f'
ORDER BY d.dept_name;

-- TODO: Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, COUNT(t.emp_no)
FROM titles AS t
         JOIN dept_emp AS de
              ON de.emp_no = t.emp_no
         JOIN employees AS e
              ON de.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = de.dept_no
WHERE t.to_date > now()
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

-- TODO: Find the current salary of all current managers.
# TABLES NEEDED:
# salaries
# employees
# dpt_manager
# departments

SELECT d.dept_name,
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary
FROM employees AS e -- Branching out to employees
         JOIN salaries AS s -- Branching out from employees to salaries via emp_no
              ON e.emp_no = s.emp_no
         JOIN dept_manager AS dm -- Branching out from employees to dept_manager vai emp_no
              ON e.emp_no = dm.emp_no
         JOIN departments AS d -- Branching out from dept_manager to departments via dept_no
              ON dm.dept_no = d.dept_no
WHERE dm.to_date > now()
  AND s.to_date > now()
ORDER BY d.dept_name;


-- TODO: *BONUS* Find the names of all current employees, their department name, and their current manager's name .
#  TABLES NEEDED:
# employees
# dept_emp
# departments
# dept_manager

SELECT CONCAT(e.first_name, ' ', e.last_name)       AS 'Employee',
       d.dept_name                                  AS Department,
       CONCAT(mgmt.first_name, ' ', mgmt.last_name) AS 'Manager'
FROM employees AS e -- Branching to employees
         JOIN dept_emp AS de -- Branching from employees to dept_emp via emp_no
              ON e.emp_no = de.emp_no
         JOIN departments AS d -- Branching from dept_emp to departments via dept_no
              ON de.dept_no = d.dept_no
         JOIN dept_manager AS dm -- Branching from departments to dept_manager via dept_no
              ON d.dept_no = dm.dept_no
         JOIN employees AS mgmt -- rejoining employees as new alias mgmt
              ON dm.emp_no = mgmt.emp_no
WHERE de.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name;
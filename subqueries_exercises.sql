use employees;



# 1.Find all the employees with the same hire date as employee 101010 using a subquery.

# 69 Rows

SELECT concat(first_name,' ',last_name) AS 'Name'
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
    );


# 2.Find all the titles held by all employees with the first name Aamod.

# 314 total titles, 6 unique titles

SELECT DISTINCT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no FROM employees
    WHERE first_name = 'Aamod'
    );

# SELECT title AS 'Titles'
# FROM titles
# WHERE emp_no IN (
#     SELECT emp_no
#     FROM employees
#     WHERE first_name = 'Aamod'
# );

# 3.Find all the current department managers that are female.
#
#
# +------------+------------+
# | first_name | last_name  |
# +------------+------------+
# | Isamu      | Legleitner |
# | Karsten    | Sigstam    |
# | Leon       | DasSarma   |
# | Hilary     | Kambil     |
# +------------+------------+


SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
    ) AND gender = 'F';


# BONUS
#
# Find all the department names that currently have female managers.
#
# Expected Output
# +-----------------+
# | dept_name       |
# +-----------------+
# | Development     |
# | Finance         |
# | Human Resources |
# | Research        |
# +-----------------+


SELECT dept_name from departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no from employees
        where gender = 'F' and to_date > NOW()
        )
    );

#     Find the first and last name of the employee with the highest salary.
#
#     Expected Output
#     +------------+-----------+
#     | first_name | last_name |
#     +------------+-----------+
#     | Tokuyasu   | Pesch     |
#     +------------+-----------+

SELECT first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    ORDER BY salary DESC limit 1
    );

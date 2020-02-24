use employees;

# SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, departments.dept_name
# FROM employees
#          JOIN dept_emp
#               ON dept_emp.emp_no = employees.emp_no
#          JOIN departments
#               ON departments.dept_no = dept_emp.dept_no
# WHERE dept_emp.to_date = '9999-01-01' AND employees.emp_no = 10001;

# 2.Using the example in the Associative Table Joins section as a guide, write a query that shows each
# department along with the name of the current manager for that department.
# Department Name    | Department Manager
#  --------------------+--------------------
#   Customer Service   | Yuchang Weedman
#   Development        | Leon DasSarma
#   Finance            | Isamu Legleitner
#   Human Resources    | Karsten Sigstam
#   Marketing          | Vishwani Minakawa
#   Production         | Oscar Ghazalie
#   Quality Management | Dung Pesch
#   Research           | Hilary Kambil
#   Sales              | Hauke Zhang

Select departments.dept_name as 'Department Name', concat(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
         Join dept_manager
              on employees.emp_no = dept_manager.emp_no
         join departments
              on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01'
order by  dept_name;

# 3.Find the name of all departments currently managed by women.
#
# Expected Result:
# Department Name | Manager Name
# ----------------+-----------------
# Development     | Leon DasSarma
# Finance         | Isamu Legleitner
# Human Resources | Karsetn Sigstam
# Research        | Hilary Kambil

Select dept_name as 'Department Name', concat(first_name, ' ', last_name) AS 'Manager Name'
FROM employees
         Join dept_manager
              on employees.emp_no = dept_manager.emp_no
         join departments
              on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND gender = 'F'
order by  dept_name ASC;

# 4.Find the current titles of employees currently working in the Customer Service department.

# Expected Output:

# Title              | Count
# -------------------+------
# Assistant Engineer |    68
# Engineer           |   627
# Manager            |     1
# Senior Engineer    |  1790
# Senior Staff       | 11268
# Staff              |  3574
# Technique Leader   |   241

Select title as 'Title', count(*) AS 'Count'
FROM titles
         join dept_emp
              on titles.emp_no = dept_emp.emp_no
         join departments
              on dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service' AND dept_emp.to_date = '9999-01-01' AND titles.to_date = '9999-01-01'
group by title;

# 5.Find the current salary of all current managers.

# Expected output
# Department Name    | Name              | Salary
# -------------------+-------------------+-------
# Customer Service   | Yuchang Weedman   |  58745
# Development        | Leon DasSarma     |  74510
# Finance            | Isamu Legleitner  |  83457
# Human Resources    | Karsten Sigstam   |  65400
# Marketing          | Vishwani Minakawa | 106491
# Production         | Oscar Ghazalie    |  56654
# Quality Management | Dung Pesch        |  72876
# Research           | Hilary Kambil     |  79393
# Sales              | Hauke Zhang       | 101987

SELECT dept_name, CONCAT(employee.first_name, ' ', employee.last_name) AS 'Name', salaries.salary
FROM salaries
         JOIN dept_manager AS manager
              ON manager.emp_no = salaries.emp_no
         JOIN employees AS employee
              ON employee.emp_no = manager.emp_no
         JOIN departments AS department
              ON department.dept_no = manager.dept_no
WHERE manager.to_date > NOW() AND salaries.to_date > NOW()
ORDER BY dept_name;


# Bonus Find the names of all current employees, their department name, and their current manager's name.

# Expected Output
#     240,124 Rows
#
#     Employee Name | Department Name  |  Manager Name
#     --------------|------------------|-----------------
#      Huan Lortz   | Customer Service | Yuchang Weedman
#
#      .....

SELECT concat(employees.first_name,' ',employees.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', concat(managers.first_name, ' ', managers.last_name) AS 'Manager Name'
FROM employees
        JOIN dept_emp AS de
            on de.emp_no = employees.emp_no
        JOIN departments AS d
            on de.dept_no = d.dept_no
        JOIN dept_manager AS m
            on m.dept_no = d.dept_no
        JOIN employees AS managers
            ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW() AND m.to_date > NOW();
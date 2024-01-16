--Data Analysis
--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    Employees.emp_no
    ,Employees.last_name
    ,Employees.first_name
    ,Employees.sex
    ,Salaries.salary
FROM Employees 
JOIN Salaries  
ON Employees.emp_no = Salaries.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name
    ,last_name
    ,hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    Departments.dept_no
    ,Departments.dept_name
    ,Dept_Manager.emp_no
    ,Employees.last_name
    ,Employees.first_name
FROM Departments
JOIN Dept_Manager 
ON Departments.dept_no = Dept_Manager.dept_no
JOIN Employees 
ON Dept_Manager.emp_no = Employees.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    Dept_Emp.dept_no
    ,Employees.emp_no
    ,Employees.last_name
    ,Employees.first_name
    ,Departments.dept_name
FROM Employees
JOIN Dept_Emp 
ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments 
ON Dept_Emp.dept_no = Departments.dept_no;



--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT 
    first_name
    ,last_name 
    ,sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'



--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	Employees.emp_no 
    ,Employees.last_name
    ,Employees.first_name
	,'Sales Department' as dept_name
FROM Employees
JOIN Dept_Emp 
ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments 
ON Dept_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales'


--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--join method
SELECT 
    Employees.emp_no
    ,Employees.last_name
    ,Employees.first_name
    ,Departments.dept_name
FROM Employees
JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name IN ('Development', 'Sales');

--SubQuery method
SELECT  
    Employees.emp_no
    ,Employees.last_name
    ,Employees.first_name
FROM Employees 
WHERE emp_no IN (
    SELECT emp_no FROM Dept_Emp 
    WHERE dept_no IN (
        SELECT dept_no 
        FROM Departments 
        WHERE dept_name IN ('Development', 'Sales')));


--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT
    last_name AS "employee last name"
    ,COUNT(last_name) AS "name count"
FROM Employees
GROUP BY "employee last name"
ORDER BY "name count" DESC;







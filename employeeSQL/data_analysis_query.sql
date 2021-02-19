-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
	FROM employees e
	INNER JOIN salaries s
	ON (s.emp_no=e.emp_no); 

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, 
	e.last_name, 
	e.hire_date
	FROM employees e 
	WHERE CAST(hire_date as TEXT) LIKE '1986%'; 

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
	FROM employees e
	INNER JOIN department_manager dm on (dm.emp_no=e.emp_no)
	INNER JOIN departments d on (d.dept_no=dm.dept_no);

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
	FROM employees e
	INNER JOIN department_employee de on (de.emp_no=e.emp_no)
	INNER JOIN departments d on (d.dept_no=de.dept_no);

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
	e.last_name,
	e.sex
	FROM employees e
	WHERE e.first_name = 'Hercules'
	and e.last_name LIKE 'B%'; 

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
	FROM employees e
	INNER JOIN department_employee de on (de.emp_no=e.emp_no)
	INNER JOIN departments d on (d.dept_no=de.dept_no)
	WHERE dept_name LIKE '%Sales%'; 

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
	FROM employees e
	INNER JOIN department_employee de on (de.emp_no=e.emp_no)
	INNER JOIN departments d on (d.dept_no=de.dept_no)
	WHERE dept_name LIKE '%Sales%' 
	OR dept_name LIKE '%Develop%'; 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  last_name, count(last_name)
FROM employees
GROUP BY  last_name
HAVING COUNT(DISTINCT first_name) > 0
ORDER BY COUNT(last_name) DESC;

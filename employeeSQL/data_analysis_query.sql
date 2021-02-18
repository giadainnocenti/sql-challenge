SELECT * FROM employee_sum_up;
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no, 
	last_name, 
	first_name, 
	sex, 
	salary
	FROM employee_sum_up; 

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
	last_name, 
	hire_date
	FROM employee_sum_up 
	WHERE CAST(hire_date as TEXT) LIKE '1986%'; 

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_no, 
	dept_name, 
	emp_no,
	last_name,
	first_name
	FROM employee_sum_up 
	WHERE (emp_no, dept_no) IN (SELECT emp_no, dept_no FROM department_manager); 


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp_no, 
	last_name,
	first_name,
	dept_name
	FROM employee_sum_up; 

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
	FROM employee_sum_up
	WHERE first_name = 'Hercules'
	and last_name LIKE 'B%'; 

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, 
	last_name,
	first_name,
	dept_name
	FROM employee_sum_up
	WHERE dept_name LIKE '%Sales%'; 

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, 
	last_name,
	first_name,
	dept_name
	FROM employee_sum_up
	WHERE dept_name LIKE '%Sales%'
	OR dept_name LIKE '%Develop%'; 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  last_name, count(last_name)
FROM employee_sum_up
GROUP BY  last_name
HAVING COUNT(DISTINCT first_name) > 0
ORDER BY COUNT(last_name) DESC;

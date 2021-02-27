-- creating a staff title table
CREATE TABLE staff_title (title_id VARCHAR(7) NOT NULL PRIMARY KEY,
							title  VARCHAR(30)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM staff_title ST;
--Create the main table Employees
CREATE TABLE employees (emp_no INT NOT NULL PRIMARY KEY,
			  emp_title_id VARCHAR(6),
			  birth_date DATE,
			  first_name VARCHAR(40) ,
			  last_name VARCHAR(40),
			  sex VARCHAR(3),
			  hire_date DATE,
			  FOREIGN KEY (emp_title_id) REFERENCES staff_title(title_id)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM employees E;

--Create a table that relates the employee numbers with the employee's salary 
CREATE TABLE salaries (	emp_no INT NOT NULL,
						salary  FLOAT(25),
					   	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Checking the table just created and creating an alias for it.
SELECT * FROM salaries S;

-- creating a departments table
CREATE TABLE departments (dept_no VARCHAR(7) NOT NULL PRIMARY KEY,
							dept_name  VARCHAR(30)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM departments D;

--Create a table that relates the department employee number with the department number 
-- one employee could work in more than one department - primary key is a composite key
CREATE TABLE department_employee (emp_no INT,
								  dept_no VARCHAR(10),
								  PRIMARY KEY (emp_no, dept_no),
								  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
								  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM department_employee DE;

--Create a table that relates the department manager employee number with the department number 
-- one manager could work in more than one department
CREATE TABLE department_manager (dept_no VARCHAR(10),
								  emp_no  INT,
								  PRIMARY KEY (dept_no, emp_no),
								  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
								  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM department_manager DM;

-- run these couple of lines only after importing the salaries.csv in the table
ALTER TABLE salaries
ADD COLUMN id SERIAL PRIMARY KEY;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW employee_details AS
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
	FROM employees e
	INNER JOIN salaries s
	ON (s.emp_no=e.emp_no); 
-- Showing the employee_details view
SELECT * FROM employee_details;

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

-- I am creating a Table view for the bonus exercise
CREATE VIEW employees_info AS
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	sf.title,
	s.salary
	FROM employees e
	INNER JOIN salaries s ON (s.emp_no=e.emp_no)
	INNER JOIN staff_title sf ON (sf.title_id=e.emp_title_id); 
-- Showing the employee_details view
SELECT * FROM employees_info



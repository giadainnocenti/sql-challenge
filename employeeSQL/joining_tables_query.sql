SELECT *
FROM staff_title; 
-- checking if the department employee table contains the department manager information
SELECT *
FROM department_employee 
WHERE (dept_no, emp_no) IN (SELECT dept_no, emp_no FROM department_manager);

-- dropping the table I am creating from the Join in case it already exists
DROP TABLE employee_sum_up;
-- creating a table while joining the other tables
CREATE TABLE employee_sum_up AS
	SELECT employees.emp_no, 
	emp_title_id, 
	birth_date, 
	first_name, 
	last_name, 
	sex, 
	hire_date, 
	department_employee.dept_no,
	departments.dept_name,
	staff_title.title,
	salaries.salary
FROM employees
LEFT JOIN department_employee
                ON department_employee.emp_no = employees.emp_no
LEFT JOIN departments 
				ON departments.dept_no = department_employee.dept_no
LEFT JOIN staff_title 
				ON staff_title.title_id = employees.emp_title_id
LEFT JOIN salaries
				ON salaries.emp_no = employees.emp_no;
-- adding the primary key as combined key to the table just created
-- I cannot use emp_no as primary key because it is not unique
ALTER TABLE employee_sum_up
ADD CONSTRAINT employee_sum_up_pk PRIMARY KEY (emp_no,dept_no);
-- checking that the join was successfull								
select * from employee_sum_up;
-- looking if any value in the duplicate row is different.
SELECT *
FROM employee_sum_up 
WHERE  emp_no = 10010;
-- checking that the manager information are actually there
SELECT *
FROM employee_sum_up 
WHERE (dept_no, emp_no) IN (SELECT dept_no, emp_no FROM department_manager);



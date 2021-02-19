--Create the main table Employees
CREATE TABLE employees (emp_no INT NOT NULL PRIMARY KEY,
			  emp_title_id VARCHAR(6),
			  birth_date DATE,
			  first_name VARCHAR(40) ,
			  last_name VARCHAR(40),
			  sex VARCHAR(3),
			  hire_date DATE
);
--Checking the table just created and creating an alias for it.
SELECT * FROM employees E;

--Create a table that relates the department employee number with the department number 
-- one employee could work in more than one department - primary key is a composite key
CREATE TABLE department_employee (emp_no INT,
								  dept_no VARCHAR(10),
								  PRIMARY KEY (emp_no, dept_no)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM department_employee DE;

--Create a table that relates the department manager employee number with the department number 
-- one manager could work in more than one department
CREATE TABLE department_manager (dept_no VARCHAR(10),
								  emp_no  INT,
								  PRIMARY KEY (dept_no, emp_no)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM department_manager DM;

--Create a table that relates the employee numbers with the employee's salary 
CREATE TABLE salaries (emp_no INT NOT NULL PRIMARY KEY,
								  salary  FLOAT(25)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM salaries S;

-- creating a staff title table
CREATE TABLE staff_title (title_id VARCHAR(7) NOT NULL PRIMARY KEY,
							title  VARCHAR(30)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM staff_title ST;

-- creating a staff title table
CREATE TABLE departments (dept_no VARCHAR(7) NOT NULL PRIMARY KEY,
							dept_name  VARCHAR(30)
);
--Checking the table just created and creating an alias for it.
SELECT * FROM departments D;

-- Defining the FOREIGN KEYS
ALTER TABLE "department_employee" 
	ADD FOREIGN KEY ("emp_no") 
		REFERENCES "employees" ("emp_no");

ALTER TABLE "department_manager" 
	ADD FOREIGN KEY ("emp_no") 
		REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" 
	ADD FOREIGN KEY ("emp_no") 
		REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" 
	ADD FOREIGN KEY ("emp_title_id") 
		REFERENCES "staff_title" ("title_id");

ALTER TABLE "department_manager" 
	ADD FOREIGN KEY ("dept_no") 
		REFERENCES "departments" ("dept_no");

ALTER TABLE "department_employee" 
	ADD FOREIGN KEY ("dept_no") 
		REFERENCES "departments" ("dept_no");
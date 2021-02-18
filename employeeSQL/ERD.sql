CREATE TABLE "Employees" (
  "emp_no" INT PRIMARY KEY,
  "emp_title_id" VARCHAR(6),
  "birth_date" DATE,
  "first_name" VARCHAR(40),
  "last_name" VARCHAR(40),
  "sex" VARCHAR(3),
  "hire_date" DATE
);

CREATE TABLE "department_employee" (
  "emp_no" INT,
  "dept_no" VARCHAR(10),
  "PRIMARY" "KEY(emp_no, dept_no)"
);

CREATE TABLE "department_manager" (
  "dept_no" VARCHAR(10),
  "emp_no" INT,
  "PRIMARY" "KEY(dept_no, emp_no)"
);

CREATE TABLE "salaries" (
  "emp_no" INT PRIMARY KEY,
  "salary" FLOAT(25)
);

CREATE TABLE "staff_title" (
  "title_id" VARCHAR(7) PRIMARY KEY,
  "title" VARCHAR(30)
);

CREATE TABLE "departments" (
  "dept_no" VARCHAR(7) PRIMARY KEY,
  "dept_name" VARCHAR(30)
);

ALTER TABLE "department_employee" ADD FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no");

ALTER TABLE "department_manager" ADD FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no");

ALTER TABLE "salaries" ADD FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD FOREIGN KEY ("emp_title_id") REFERENCES "staff_title" ("title_id");

ALTER TABLE "department_manager" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "department_employee" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

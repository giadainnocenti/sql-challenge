//// -- LEVEL 1
//// -- Tables and References

// Creating tables

TABLE Employees as E {
        emp_no INT [pk]
			  emp_title_id VARCHAR(6)
			  birth_date DATE
			  first_name VARCHAR(40)
			  last_name VARCHAR(40)
			  sex VARCHAR(3)
			  hire_date DATE
}

TABLE department_employee as DE {
        emp_no INT
				dept_no VARCHAR(10)
				PRIMARY KEY (emp_no, dept_no)
}

table department_manager as DM{
        dept_no VARCHAR(10)
				emp_no  INT
				PRIMARY KEY (dept_no, emp_no)
}

table salaries as S{
        emp_no INT 
				salary  FLOAT(25)
				id [pk]
}

table staff_title as ST {
        title_id VARCHAR(7) [pk]
				title  VARCHAR(30)
}

table departments as D{
        dept_no VARCHAR(7) [pk]
				dept_name  VARCHAR(30)
}



// Creating references
// You can also define relationship separately
// > many-to-one; < one-to-many; - one-to-one
Ref: E.emp_no < DE.emp_no
Ref: E.emp_no < DM.emp_no
Ref: E.emp_no - S.emp_no
Ref: E.emp_title_id > ST.title_id
Ref: DM.dept_no > D.dept_no
Ref: DE.dept_no > D.dept_no

//----------------------------------------------//

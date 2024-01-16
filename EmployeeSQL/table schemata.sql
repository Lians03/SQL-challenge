CREATE TABLE Titles (
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
	PRIMARY KEY (title_id)
);

select *
from Titles

CREATE TABLE Employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

select *
from Employees

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY(dept_no)
);


select *
from departments

CREATE TABLE Dept_Manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (dept_no,emp_no)
);

select *
from Dept_Manager


CREATE TABLE Dept_Emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (dept_no,emp_no)
);

select *
from Dept_Emp

CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (emp_no)
);

select *
from Salaries


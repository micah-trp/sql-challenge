--Week 9 sql_challenge- the following file will creat tables
--Micah Raquena-Pequeno "sql_challenge"
--The following sets up the tables required for employee_db

--Clean Out Erroneous Tables
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;

--Set date format to ingest USA date format and output MDY
ALTER DATABASE "Employees.db" SET datestyle = "ISO, MDY";

--Create TABLE
--Note - due the constraints Import the tables in the following orders
--
CREATE TABLE titles (
    title_id varchar(20)   NOT NULL,
    title varchar   NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE departments (
    dept_no varchar(20)   NOT NULL,
    dept_name varchar(25)   NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(20)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(25)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex varchar(1)   NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_manager (
    dept_no varchar(20)   NOT NULL,
    emp_no int   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),               --Note Composite Key 
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE dept_emp (
    emp_no int  NOT NULL,
    dept_no varchar(20)   NOT NULL,
    PRIMARY KEY (emp_no,dept_no),                 --Note Composite Key 
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary money   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);


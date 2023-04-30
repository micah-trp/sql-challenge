-- SELECT * FROM Employees limit 10;
-- SELECT * FROM titles limit 10;
-- SELECT * FROM departments limit 10;
-- SELECT * FROM dept_manager limit 10;
-- SELECT * FROM dept_emp limit 10;
-- SELECT * FROM salaries limit 10;

--DATA ANALYSIS
----------------------------------
-- List the employee number, last name, first name, sex, AND salary of each employee.
SELECT a.emp_no 		AS "Employee Number",
last_name 				AS "Last Name",
first_name 				AS "First Name",
sex 					AS "Sex",
salary 					AS "Salary"

FROM Employees a LEFT JOIN salaries b ON a.emp_no = b.emp_no
ORDER  BY a.emp_no;
----------------------------------
-- List the first name, last name, AND hire date for the employees who were hired in 1986.
SELECT 
first_name 				AS "First Name",
last_name 				AS "Last Name",
hire_date 				AS "Hire Date"
FROM Employees

WHERE hire_date between '1 jan 1986' AND '31 dec 1986'
ORDER  BY hire_date;
----------------------------------
-- List the manager of each department alONg with their department number, department name, employee number, last name, AND first name.
SELECT 
a.dept_no 				AS "Department Number",
a.emp_no 				AS "Manager ID",
b.dept_name 			AS "Department Name",
--c.emp_no 				AS "Employee Number",
last_name 				AS "Last Name",
first_name 				AS "First Name"

FROM dept_manager a LEFT JOIN departments b ON a.dept_no = b.dept_no  	
LEFT JOIN Employees c ON a.emp_no = c.emp_no
ORDER  BY a.dept_no, c.emp_no;		
----------------------------------
-- List the department number for each employee alONg with that employee’s employee number, last name, first name, AND department name.
SELECT
a.dept_no 				AS "Department Number",
c.emp_no 				AS "Employee Number",
last_name 				AS "Last Name",
first_name 				AS "First Name",
b.dept_name 			AS "Department Name"
	
FROM dept_emp a LEFT JOIN departments b ON a.dept_no = b.dept_no  
LEFT JOIN Employees c ON a.emp_no = c.emp_no
ORDER  BY a.dept_no, c.emp_no;
----------------------------------
-- List the first name, last name, AND sex of each employee whose first name is Hercules AND whose last name begins with the letter B.
SELECT 
first_name 				AS "First Name",
last_name 				AS "Last Name",
sex 					AS "Sex" 	
FROM Employees 
WHERE first_name = 'Hercules' AND last_name like 'B%'
ORDER  BY first_name, last_name;
----------------------------------
-- List each employee in the Sales department, including their employee number, last name, AND first name.
SELECT 
c.dept_name 			AS "Department Name",
a.emp_no 				AS "Employee Number",
last_name 				AS "Last Name",
first_name 				AS "First Name"
	
FROM Employees a LEFT JOIN dept_emp b ON a.emp_no = b.emp_no
				LEFT JOIN departments c ON 	b.dept_no = c.dept_no		
					
WHERE b.dept_no in (SELECT distinct dept_no FROM departments WHERE dept_name = 'Sales')
ORDER  BY "Last Name", "First Name";
----------------------------------
-- List each employee in the Sales AND Development departments, including their employee number, last name, first name, AND department name.
SELECT 
c.dept_name 			AS "Department Name",
a.emp_no 				AS "Employee Number",
last_name 				AS "Last Name",
first_name 				AS "First Name"

FROM Employees a LEFT JOIN dept_emp b ON a.emp_no = b.emp_no
				LEFT JOIN departments c ON 	b.dept_no = c.dept_no		
					
WHERE b.dept_no in (SELECT distinct dept_no FROM departments WHERE dept_name in ('Sales','Development'))
ORDER  BY c.dept_name, "Last Name", "First Name" ;
----------------------------------
-- List the frequency COUNTs, in descending ORDER , of all the employee last names (that is, how many employees share each last name).
-- First audit the  
-- SELECT COUNT(emp_no) 	FROM Employees 
-- SELECT COUNT(distinct emp_no) FROM Employees

SELECT last_name 		AS "Last Name",
COUNT(emp_no) 			AS "Name Count"
	
FROM Employees 
	
GROUP BY "Last Name"
ORDER  BY COUNT(emp_no) desc
	
	

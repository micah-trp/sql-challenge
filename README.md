# sql-challenge
Module 9 Challenge
Please refer to the following files:

1.1 Employees_erdschema - Employees ERT Schema diagram
1.2 Employees_schema- Employess Schemata
1.3 Employees_analysis- Employees Analysis script 
    
    
Each question has it's own query in the same sql script file to be run individually or read individually e.g:

/*
-onee question example
-- List the first name, last name, AND hire date for the employees who were hired in 1986.
SELECT 
first_name 				AS "First Name",
last_name 				AS "Last Name",
hire_date 				AS "Hire Date"
FROM Employees

WHERE hire_date between '1 jan 1986' AND '31 dec 1986'
ORDER  BY hire_date;*/

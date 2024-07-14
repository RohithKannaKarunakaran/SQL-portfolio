/*
**SQL Queries**:
     1. Which departments have the most employees.
     2. List the top 3 highest paid employees in each department. 
     3. calculate the total salary expenditure of each department.
     4. find the employees who earn more than average salary in HR department.
     5. Find department where the average salary is higher than overall company average salary?

*/
# Answers to the question 
--1. Which departments have the most employees.

SELECT d.department_name, COUNT(e.department_id) AS number_of_employees
FROM employees e
JOIN department d ON d.department_id = e.department_id
GROUP BY e.department_id
ORDER BY COUNT(e.department_id) DESC;

--2. List the top 3 highest paid employees in each department. 

SELECT * 
FROM(
SELECT e.Name, d.department_name, s.salary,
ROW_NUMBER() OVER (PARTITION BY d.department_name ORDER BY s.salary) as NC
FROM employees e
JOIN department d ON d.department_id = e.department_id
JOIN salaries s ON s.employee_id = e.id) NT
WHERE NT.NC <=3;

--3. calculate the total salary expenditure of each department.

SELECT d.department_name, sum(s.salary)
FROM employees e
JOIN department d ON d.department_id = e.department_id
JOIN salaries s ON s.employee_id = e.id
GROUP BY d.department_name;

--4. find the employees who earn more than average salary in HR department.

SELECT e.id, e.Name, s.salary
FROM employees e
JOIN department d ON d.department_id = e.department_id
JOIN salaries s ON s.employee_id = e.id
WHERE d.department_name = 'HR' AND s.salary >
(
SELECT AVG(s.salary)
FROM employees e2
JOIN department d2 ON d2.department_id = e2.department_id
JOIN salaries s ON s2.employee_id = e2.id
WHERE d2.department_name = 'HR'
);

--5. Find department where the average salary is higher than overall company average salary?

SELECT d.department_name , avg(s.salary) AS avg_salary
FROM employees e
JOIN department d ON d.department_id = e.department_id
JOIN salaries s ON s.employee_id = e.id
GROUP BY d.department_name
HAVING AVG(s.salary) > 
(
SELECT AVG(s.salary)
FROM salaries 
);

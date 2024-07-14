--Create table 

CREATE TABLE department (
department_id INT , 
department_name VARCHAR(3),
PRIMARY KEY (dealer_ID)
);

CREATE TABLE employees (
id INT,
Name VARCHAR(50),
age INT,
department_id INT,
PRIMARY KEY (id),
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE salaries (
employee_id INT , 
salary INT , 
FOREIGN KEY (employee_id) REFERENCES employees(id)
);

#loaded csv file using mysql workbench

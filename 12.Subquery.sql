CREATE TABLE employee
	(
		emp_id INT PRIMARY KEY AUTO_INCREMENT,
        emp_name VARCHAR(50),
        dept_id INT,
        salary INT,
        age INT
    );
INSERT INTO employee(emp_name,dept_id,salary,age)
VALUES
	("John", 101,50000,28),
    ("Emma",101,65000,32),
    ("Raj",102,45000,26),
    ("Meera",103,70000,38),
    ("Ravi", 103, 52000, 30),
    ("Naina", 103,52000,29),
    ("Alex", 101, 58000, 31);
    
CREATE TABLE department
	(
		dept_id INT PRIMARY KEY,
        dept_name VARCHAR(50)
    );

INSERT INTO department(dept_id, dept_name)
VALUES
(101, "Sales"),
(102, "Marketing"),
(103, "Finance");

SELECT * FROM employee;
SELECT * FROM department;

-- FInd the employees whose salary is higher than the average salary
SELECT
	emp_name,
    salary,
    (SELECT AVG(salary) FROM employee) AS average_salary 
FROM employee
WHERE salary>
(SELECT AVG(salary) FROM employee);

-- Get the department name using subquery
SELECT 
    emp_name
    FROM employee
WHERE dept_id=(SELECT dept_id,dept_name FROM department WHERE dept_name="Sales");

-- Find the highest paid employee
SELECT
	emp_name,
    salary
FROM employee
WHERE salary=(SELECT MAX(salary) FROM employee);

-- Find employee older than the youngest employee
SELECT
	emp_name,
    age,
    (SELECT MIN(age) FROM employee) as youngest_emplooyee
FROM employee
WHERE age>(SELECT MIN(age) FROM employee);

-- Find employees whose salary is greater than the average salary
SELECT
	emp_name,
    salary,
    (SELECT AVG(salary) FROM employee) as average_salary
FROM employee
WHERE salary>(SELECT AVG(salary) FROM employee);

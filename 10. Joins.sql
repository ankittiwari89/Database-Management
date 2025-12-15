 
CREATE TABLE employees_1(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

INSERT INTO employees_1 (emp_id, emp_name, dept_id, salary) VALUES
(1, 'John', 101, 50000),
(2, 'Emma', 101, 65000),
(3, 'Raj', 102, 45000),
(4, 'Meera', 103, 70000),
(5, 'Ravi', 102, 48000),
(6, 'Naina', 103, 52000),
(7, 'Alex', 101, 58000);

create  table departments_1(
Dept_Id int,
Dept_Name varchar(50)
);

Insert Into departments_1(Dept_Id,Dept_Name)
values
(101,"Sales"),
(102,"Marketing"),
(103,"Finance"),
(104,"HR");

-- 1. Display employee names with their department name.
SELECT
E.Emp_name,
D.Dept_name
From employees_1 AS E
Inner Join departments_1 AS D
ON
E.dept_Id=D.dept_Id;

-- 2. List all employees including those with no matching department.
SELECT 
E.Emp_name,
D.Dept_name
FROM Employees_1 AS E
LEFT JOIN  departments_1 AS D
ON E.dept_id=D.dept_id;

-- 3. List all departments even if there are no employees.
SELECT 
D.Dept_name,
E.Emp_name
FROM departments_1 AS D
LEFT JOIN employees_1 AS E
ON D.Dept_Id=E.dept_id;

-- 4.Show employees from the Sales department. 
SELECT
E.Emp_name,
D.Dept_name
FROM employees_1 AS E
LEFT JOIN departments_1 AS D
ON
E.dept_id=D.Dept_Id
Where Dept_Name="Sales";

-- 5. Find the top 3 highest paid employees.
select
Emp_name,Salary
FROM employees_1
ORDER BY salary DESC
LIMIT 3;

-- 6. Find employees earning more than 50,000 from Marketing.
SELECT
E.Emp_name,
E.Salary,
D.Dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.Dept_Id=D.Dept_Id
WHERE D.Dept_name='Marketing'
AND E.salary>50000;

-- 7. Count employees in each department.
SELECT
    D.Dept_Name,
    COUNT(E.emp_id) AS total_employees
FROM departments_1 AS D
LEFT JOIN employees_1 AS E
    ON D.Dept_Id = E.Dept_Id
GROUP BY D.Dept_Name;

-- 8. Show departments having more than 2 employees. 
SELECT 
    D.Dept_Name,
    COUNT(E.emp_id) AS total_employees
FROM departments_1 AS D
LEFT JOIN employees_1 AS E
ON D.Dept_Id = E.Dept_Id
GROUP BY D.Dept_Name
HAVING COUNT(E.emp_id) > 2;

-- 9.Show highest salary in each department.
SELECT 
    D.dept_name,
    MAX(E.salary) AS highest_salary
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
GROUP BY D.dept_name;

-- 10. Show employees whose salary is above department average.
SELECT 
    E.emp_name,
    E.salary,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
WHERE E.salary >
(
    SELECT AVG(salary) 
    FROM employees_1 
    WHERE dept_id = E.dept_id
);

-- 11.	Show employees and their departments sorted by department name.
SELECT 
    E.emp_name,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
ORDER BY D.dept_name;

-- 12.	List the 2 lowest-paid employees with department names.
SELECT 
    E.emp_name,
    E.salary,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
ORDER BY E.salary ASC
LIMIT 2;

-- 13.	Show total salary expenditure per department.
SELECT
    D.dept_name,
    SUM(E.salary) AS total_salary
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
GROUP BY D.dept_name;

-- 14.	Show departments where the total salary spent is more than 150,000.
SELECT
    D.dept_name,
    SUM(E.salary) AS total_salary
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
GROUP BY D.dept_name
HAVING SUM(E.salary) > 150000;

-- 15.	Show employees who belong to departments starting with 'S'.
SELECT 
    E.emp_name,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
WHERE D.dept_name LIKE 'S%';

-- 16.	Find employees whose salary is the highest in their department.
SELECT
    E.emp_name,
    E.salary,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
WHERE E.salary = (
    SELECT MAX(salary)
    FROM employees_1
    WHERE dept_id = E.dept_id
);

-- 17.	Show employees and departments sorted by salary descending.
SELECT
    E.emp_name,
    E.salary,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
ORDER BY E.salary DESC;

-- 18.	Count how many employees earn above 50,000 per department.
SELECT
    D.dept_name,
    COUNT(E.emp_id) AS employees_above_50000
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
WHERE E.salary > 50000
GROUP BY D.dept_name;

-- 19.	Show employee name, department, and salary for employees between 45,000 and 60,000.
SELECT 
    E.emp_name,
    E.salary,
    D.dept_name
FROM employees_1 AS E
INNER JOIN departments_1 AS D
ON E.dept_id = D.dept_id
WHERE E.salary BETWEEN 45000 AND 60000;

-- 20 Find departments with no employees.
SELECT 
    D.dept_name
FROM departments_1 AS D
LEFT JOIN employees_1 AS E
ON D.dept_id = E.dept_id
WHERE E.emp_id IS NULL;







 


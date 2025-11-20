use company;
create table employee_new(
emp_id INT auto_increment PRIMARY KEY,
first_name varchar(100),
last_name varchar(100),
department varchar(50),
salary decimal(10,2),
hire_date Date
);
INSERT INTO employee_new(first_name, last_name, department, salary, hire_date)
values
("John","Doe","IT",60000.00,"2019-01-10"),
("Jane","Smith","HR",55000.00,"2018-03-05"),
("Emily","Jones","IT",62000.00,"2020-07-23"),
("Michel","Brown","Finance",70000.00,"2016-05-14"),
("Sarah","Davis","Finance",69000.00,"2017-11-18"),
("David","Johnson","HR",48000.00,"2021-09-10");
select*from employee_new;

-- 1. Find the average salary of employees in each department
SELECT department, AVG(salary) AS average_salary
FROM employee_new
group by department;

-- 2. Find the total number of employees hired after 2019.
select
hire_date,
count(*) as no_emp,
(select COUNT(*) FROM employee_new where year(hire_date)>2019) as tot_count
FROM employee_new
WHERE year(hire_date)>2019
GROUP BY hire_date;

-- 3. List the departments and the total salary of all employees in each department, Ordered by the total salary.
SELECT 
department,
sum(salary) as tot_salary
FROM employee_new
GROUP BY department
ORDER BY sum(salary) Desc;

-- 4. Find the highest salary in the finance department.
SELECT first_name, last_name, salary
FROM employee_new
WHERE department="Finance"
 AND Salary=(SELECT Max(salary) FROM employee_new where department = "finance"); 
 
 -- 5. Get the top 3 highest- paid  employees
 SELECT * FROM employee_new
 ORDER by salary DESC
 Limit 3;
 
 -- 6. Find the department with the minimum average salary. 
 SELECT department,
 avg(salary) as average_salary
 FROM employee_new
 GROUP BY department
 ORDER BY AVG(salary)
 LIMIT 1;
 
 -- 7. Display the total number of employee in each department, order by the number of employees 
 SELECT department,
 count(*) as total_emp
 FROM employee_new
 GROUP BY department
 ORDER BY count(*);
 
 -- 8. Find the average salary of employee who were hired before 2020. 
 SELECT AVG(salary) as avg_salary
 FROM employee_new
 WHERE YEAR (hire_date)<2020;
 
 -- 9. List the names of employees in the IT department order by hire date, with the most recently hire employee first. 
 SELECT*FROM employee_new
 WHERE department="IT"
 ORDER BY hire_date DESC;
 
 -- 10. Find the sum of salaries for all employees hired after January 1, 2019, order by salary. 
 SELECT hire_date,
 sum(salary) as total_salary
 FROM employee_new
 WHERE hire_date>"2019-01-01"
 GROUP BY hire_date
 ORDER BY sum(salary) DESC;
 
 -- 11. Get the employee with the lowest salary in the HR department.
 SELECT*FROM employee_new
 WHERE department ="HR"
 ORDER BY salary;
 
 -- 12. Find the total salary paid to the employees in each department, but limit the result to the top 2 highest-paying departments. 
 SELECT department,
 sum(salary) AS total_salary
 FROM employee_new
 GROUP BY department
 ORDER BY total_salary DESC
 LIMIT 2;
 
 -- 13. List all employees hired after 2018, order by salary, and show only the first 4 employees. 
 SELECT * FROM employee_new
 WHERE year (hire_date)>2018
 ORDER BY salary DESC
 LIMIT 4;
 
 -- 14. find the highest salary in the IT department, but limit the results to the top 1 results. 
 SELECT * FROM employee_new 
 WHERE department ="IT"
 ORDER BY salary DESC
 LIMIT 1;
 
 -- 15. Get the average salary of employee in each department and list only department with an average salary greater than $60,000. 
 SELECT department,
 avg(salary)
 FROM employee_new
 GROUP BY department 
 HAVING avg (salary)>60000;

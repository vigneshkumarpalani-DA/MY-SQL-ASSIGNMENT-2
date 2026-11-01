USE EMPLOYEE;


-- DISTINCT --
select distinct	SALARY
from employees;

-- alias(as)--
select age as EMPLOYEE_AGE,salary as EMPLOYEE_SALARY from employees;



-- where clauses & operator--
SELECT * FROM employees 
WHERE salary > 50000 
  AND hire_date < '2016-01-01';
  
update employees
set designation = 'data scientist'
where employee_id = (5004);  
  
-- order by--
SELECT * FROM employees 
ORDER BY department_id ASC, salary DESC;
  
  
 --Limit-- 
  SELECT * FROM employees 
WHERE hire_date LIKE '2018%' 
ORDER BY hire_date ASC 
LIMIT 5;


--AGGREGATION FUNCTION 1--
SELECT SUM(e.salary) AS total_finance_salary 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
WHERE d.department_name = 'Finance';

--AGGREGATION FUNCTION 2--
SELECT MIN(age) AS minimum_age 
FROM employees;


-- GROUP BY-- 1
SELECT location_id, MAX(salary) AS max_salary 
FROM employees 
GROUP BY location_id;

-- GROUP BY -- 2
select designation, AVG(salary) AS avg_salary 
FROM employees 
WHERE designation LIKE '%Analyst%' 
GROUP BY designation;

-- HAVING --
SELECT department_id, COUNT(employee_id) AS total_employees 
FROM employees
GROUP BY department_id 
HAVING COUNT(employee_id) < 3;


SELECT l.location, ROUND(AVG(e.age), 2) AS avg_age
FROM employees e
INNER JOIN locations l ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;


-- JOIN --
-- INNER JOIN--
SELECT e.employee_name, e.designation, d.department_name 
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department;


-- LEFT JOIN--
SELECT d.department_name, COUNT(e.employee_id) AS total_employees 
FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_name;

-- RIGHT JOIN--
select * FROM locations;
SELECT l.location, e.employee_name 
FROM locations l 
RIGHT JOIN employees e ON l.location_id = e.location_id;










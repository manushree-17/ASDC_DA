use empdb;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees
VALUES
(1, 'Rohit', 'IT', 45000),
(2, 'Neha', 'HR', 60000),
(3, 'Arjun', 'IT', 70000),
(4, 'Simran', 'Finance', 55000),
(5, 'Rahul', 'HR', 40000),
(6, 'Mohit', 'Sales', 35000),
(7, 'Rehna', 'HR', 65000),
(8, 'Kayva', 'IT', 70000),
(9, 'Rita', 'Finance', 35000),
(10, 'Taniya', 'Sales', 40000);

SELECT * FROM employees WHERE department = 'IT';

SELECT * FROM employees WHERE salary > 50000;

select * from employees where salary >= 40000;

SELECT * FROM employees WHERE department = 'IT' AND salary > 50000;

select * from employees where department = 'Finance' OR salary = 35000;

select * from employees where not department = 'IT';

select * from employees where salary between 30000 and 60000;

select * from employees where department in ('HR', 'Sales');

SELECT * FROM employees WHERE emp_name LIKE 'R%';

select * from employees where emp_name like '%n';

select * from employees where emp_name like '%a%';

select * from employees order by salary asc;

select * from employees order by salary desc;

select distinct department from employees;

select * from employees limit 5;

SELECT emp_name AS Employee_Name FROM employees;

---

select * from employees;

select * from employees where salary > 50000;

select * from employees where department ='IT'

SELECT * FROM employees WHERE emp_name LIKE 'R%';

select * from employees order by salary desc;

select distinct department from employees;

select * from employees where salary between 50000 and 100000;
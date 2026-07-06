create database empdb;

use empdb;

create table employee(
	emp_id int,
    emp_name varchar(50),
    emp_age int,  
    emp_salary int
);

insert into employee values
(1, "Sakshi", 22, 50000),
(2, "Mahek", 23, 40000),
(3, "Hetvi", 24, 45000);

select emp_id,emp_salary from employee;
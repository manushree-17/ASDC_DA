use empdb;

create table student(
	id int,
    student_name varchar(50),
    age int,
    course varchar(50)
);

insert into student values
(101, "Princy", 22, "Data Analytics"),
(102, "Dhyani", 21, "Data Science"),
(103, "Hemal", 23, "Python"),
(104, "Manushree", 23, "Data Engineering");

SELECT * FROM student;

SELECT * FROM student WHERE age > 22;

SET SQL_SAFE_UPDATES = 1;

UPDATE student SET course = 'Data Engineering' WHERE id = 101;

DELETE FROM student WHERE id = 104;


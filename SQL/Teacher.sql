create database Teacher;

use Teacher;

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50)
);

INSERT INTO teachers (teacher_id, name, subject)
VALUES
(1, 'Amit Sharma', 'Mathematics'),
(2, 'Priya Patel', 'Physics'),
(3, 'Rahul Verma', 'Chemistry'),
(4, 'Sneha Gupta', 'Biology'),
(5, 'Arjun Singh', 'Computer Science');

ALTER TABLE teachers ADD email VARCHAR(100);

ALTER TABLE teachers MODIFY subject VARCHAR(150);

ALTER TABLE teachers RENAME COLUMN subject TO subject_name;

ALTER TABLE teachers DROP COLUMN email;

RENAME TABLE teachers TO faculty;

CREATE TABLE faculty_salary (
    salary_id INT PRIMARY KEY,
    teacher_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (teacher_id) REFERENCES faculty(teacher_id) 
);

ALTER TABLE faculty_salary
DROP FOREIGN KEY faculty_salary_ibfk_1;

ALTER TABLE faculty_salary
ADD CONSTRAINT faculty_salary_ibfk_1
FOREIGN KEY (teacher_id) REFERENCES faculty(teacher_id) ON DELETE CASCADE;


TRUNCATE TABLE faculty_salary;

DROP TABLE faculty_salary; DROP TABLE faculty;
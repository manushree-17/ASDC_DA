use empdb;

CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  course VARCHAR(20),
  marks INT
);

Insert into students values
(1,"Aman", "BCA", 75),
(2,"Neha", "MCA", 90),
(3,"Karan", "BCA", 65),
(4,"Riya", "BCA", 80),
(5,"Meena", "MCA", 88);

Select course, Avg(marks) as average_marks FROM students GROUP BY course;

Select course, avg(marks) as avg_marks FROM students GROUP BY course HAVING avg(marks) > 70;

SELECT name, marks FROM students ORDER BY marks DESC LIMIT 3;

SELECT * FROM students WHERE course IN ("BCA", "MCA") AND marks BETWEEN 70 AND 90;

SELECT 
	COUNT(*) AS total_students,
    SUM(marks) AS total_marks,
    AVG(marks) AS average_marks,
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM students;


--- Practice ---

SELECT COUNT(*) AS total_students FROM students;

SELECT MAX(marks) AS highest_marks, MIN(marks) AS lowest_marks FROM students;

SELECT course, SUM(marks) AS total_marks FROM students GROUP BY course;

SELECT course, AVG(marks) AS average_marks FROM students GROUP BY course;

SELECT course, AVG(marks) AS average_marks FROM students GROUP BY course HAVING AVG(marks) > 80;

SELECT name, marks FROM students ORDER BY marks DESC LIMIT 2;

SELECT * FROM students where marks BETWEEN 60 AND 90;
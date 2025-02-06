CREATE database DemoJoins;
USE DemoJoins;

CREATE TABLE Student
(
ID INT,
Student_Name VARCHAR(100)
);

INSERT INTO Student VALUES
(101,'KIRTIK'),
(102,'RAVI'),
(103,'KALU'),
(104,'BABU');

SELECT * from Student;

CREATE TABLE Course(
ID INT PRIMARY KEY,
Course_Name VARCHAR(80)
);

INSERT INTO Course VALUES
(107,'English'),
(102,'Python'),
(104,'Hindi'),
(108,'Maths');


SELECT * FROM Course;


-- Inner Join (also known as Simple Join / Equi Join):
-- retrieves records that have matching values in both tables involved in the join.
-- Retrieve records with matching IDs from both tables

 SELECT Student.id, Student_name, Course_Name
FROM Student
INNER JOIN course ON Student.ID = Course.ID;

 select* from Student;

-- Left Join (also known as Left Outer Join):
-- retrieves all records from the left table and the matched records from the right table.
-- Retrieve all records from 'student and matching records from 'course'

SELECT student.id, student_name, course_name
FROM student
LEFT JOIN course ON student.id = course.id;


-- Right Join (also known as Right Outer Join):
-- retrieves all records from the right table and the matched records from the left table.
-- Retrieve all records from 'course' and matching records from 'Course'
SELECT course.id, student_name, course_name
FROM student
RIGHT JOIN course ON student.id = course.id;

-- Full Join (also known as Full Outer Join):
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where thare
-- Retrieve all records from both tables, with NULLS where there are no matches

SELECT Student.id, Student_name, Course_Name
FROM Student
INNER JOIN course ON Student.ID = Course.ID
UNION
SELECT Student.id, student_name, course_name
FROM student
RIGHT JOIN course ON student.id = course.id;


-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.
-- Retrieve records from 'student that do not have matches in 'course'

SELECT student.id, student_name, course_name
FROM student
LEFT JOIN course ON student.id = course.id
WHERE Course.ID IS NULL;

-- Right Exclusive Join (also known as Right Anti Join):
-- retrieves rows from the right table that do not have matching rows in the left table.
-- Retrieve records from 'course' that do not have matches in 'student'
 SELECT student.id, student_name, course_name
FROM student
RIGHT JOIN course ON student.id = course.id
WHERE student.id IS NULL;


-- Seif Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Jein)
-- Self Join is a special case of a join that allows a table to be joined with itself.
-- Join the 'student' table with itself based on matching IDs
 SELECT student.id, student_name, course_name
 FROM student, course
 WHERE student.id = course.id;

-- Cross Join: (also known as a Cartesian Join or Cartesian Product Join)
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
 SELECT student.id, student_name, course_name
 FROM student
 CROSS JOIN course;
 
 
 -- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D', 'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 'Building E', 'eva.davis@example.com');


-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);


-- Inner Join (also known as Simple Join / Equi Join):
-- retrieves records that have matching values in both tables involved in the join.


-- join 2 tables
SELECT faculty.faculty_id, faculty_name, student_name
FROM student
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;

-- join 2 tables
SELECT faculty.*, student_name
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;

-- join 3 tables
SELECT T1. faculty_id, faculty_name, department_name, student_name
FROM students as T1
INNER JOIN faculty as T2 ON T1. faculty_id = T2.faculty_id
INNER JOIN department as T3 ON T2. faculty_id = T3.faculty_id;


-- join 4 tables
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
INNER JOIN students s ON m.student_id = s.student_id
INNER JOIN department d ON s.department_id = d.department_id
INNER JOIN faculty f ON d. faculty_id = f.faculty_id;

SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM salary s
INNER JOIN faculty f ON s.faculty_id = f.faculty_id
INNER JOIN department d ON f. faculty_id = d.faculty_id
INNER JOIN students st ON d.department_id = st.department_id;

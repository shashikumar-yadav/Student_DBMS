
/*Creating Database*/

Create database Student_DBMS

--Calling DB for creating table and inserting records
Use Student_DBMS;

--Creating table "Student"
CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    department VARCHAR(100) NOT NULL,
    enrollment_date DATE DEFAULT GETDATE()
);

-- Step 3: Create Courses Table
CREATE TABLE Courses (
    course_id INT IDENTITY(101,1) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    credits INT CHECK (credits BETWEEN 1 AND 10),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE SET NULL
);

-- Step 4: Create Faculty Table
CREATE TABLE Faculty (
    faculty_id INT IDENTITY(1,1) PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL
);


-- Step 5: Create Enrollments Table (Many-to-Many Relationship)
CREATE TABLE Enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT GETDATE(),
    grade CHAR(2) CHECK (grade IN ('A', 'B', 'C', 'D', 'F', NULL)),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Step 6: Create Attendance Table
CREATE TABLE Attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    attendance_date DATE DEFAULT GETDATE(),
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent', 'Late')),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

/*Explanation of the Tables:
Students Table: Stores student details like name, email, department, and DOB.
Courses Table: Stores course details, including faculty association.
Faculty Table: Stores faculty details and their assigned department.
Enrollments Table: Tracks which student enrolled in which course.
Attendance Table: Tracks student attendance for each course. */

---Inserting 25 records in Faculty Table
INSERT INTO Faculty (faculty_name, email, department) VALUES
('Dr. Amit Sharma', 'amit.sharma@university.com', 'Computer Science'),
('Prof. Neha Verma', 'neha.verma@university.com', 'Mechanical Engineering'),
('Dr. Rajesh Khanna', 'rajesh.khanna@university.com', 'Electronics'),
('Prof. Sneha Kapoor', 'sneha.kapoor@university.com', 'Electrical Engineering'),
('Dr. Suresh Patil', 'suresh.patil@university.com', 'Information Technology'),
('Dr. Anil Rao', 'anil.rao@university.com', 'Civil Engineering'),
('Prof. Kavita Das', 'kavita.das@university.com', 'Computer Science'),
('Dr. Ramesh Iyer', 'ramesh.iyer@university.com', 'Mechanical Engineering'),
('Prof. Priya Joshi', 'priya.joshi@university.com', 'Electronics'),
('Dr. Alok Sen', 'alok.sen@university.com', 'Electrical Engineering'),
('Prof. Sumit Saxena', 'sumit.saxena@university.com', 'Information Technology'),
('Dr. Tarun Mehta', 'tarun.mehta@university.com', 'Civil Engineering'),
('Prof. Simran Kaur', 'simran.kaur@university.com', 'Computer Science'),
('Dr. Vinay Sharma', 'vinay.sharma@university.com', 'Mechanical Engineering'),
('Prof. Anjali Nair', 'anjali.nair@university.com', 'Electronics'),
('Dr. Rishi Kapoor', 'rishi.kapoor@university.com', 'Electrical Engineering'),
('Prof. Sanya Gupta', 'sanya.gupta@university.com', 'Information Technology'),
('Dr. Kunal Yadav', 'kunal.yadav@university.com', 'Civil Engineering'),
('Prof. Meera Sen', 'meera.sen@university.com', 'Computer Science'),
('Dr. Uday Joshi', 'uday.joshi@university.com', 'Mechanical Engineering'),
('Prof. Anupama Das', 'anupama.das@university.com', 'Electronics'),
('Dr. Manish Tiwari', 'manish.tiwari@university.com', 'Electrical Engineering'),
('Prof. Shivani Bhatt', 'shivani.bhatt@university.com', 'Information Technology'),
('Dr. Raghav Malhotra', 'raghav.malhotra@university.com', 'Civil Engineering'),
('Prof. Vishal Sinha', 'vishal.sinha@university.com', 'Computer Science');

---inserting 25 values in Courses Table
INSERT INTO Courses (course_name, department, credits, faculty_id) VALUES
('Database Management Systems', 'Computer Science', 4, 1),
('Machine Learning', 'Computer Science', 3, 2),
('Thermodynamics', 'Mechanical Engineering', 4, 3),
('Digital Signal Processing', 'Electronics', 3, 4),
('Power Systems', 'Electrical Engineering', 4, 5),
('Software Engineering', 'Information Technology', 3, 6),
('Data Structures', 'Computer Science', 4, 7),
('Artificial Intelligence', 'Computer Science', 3, 8),
('Embedded Systems', 'Electronics', 4, 9),
('Control Systems', 'Electrical Engineering', 4, 10),
('Heat Transfer', 'Mechanical Engineering', 3, 11),
('Cybersecurity', 'Information Technology', 3, 12),
('Structural Analysis', 'Civil Engineering', 4, 13),
('Fluid Mechanics', 'Mechanical Engineering', 4, 14),
('Wireless Networks', 'Electronics', 3, 15),
('Robotics', 'Computer Science', 4, 16),
('Microprocessors', 'Electronics', 3, 17),
('Renewable Energy', 'Electrical Engineering', 3, 18),
('Mobile App Development', 'Information Technology', 3, 19),
('Data Mining', 'Computer Science', 4, 20),
('Geotechnical Engineering', 'Civil Engineering', 4, 21),
('Industrial Automation', 'Electronics', 3, 22),
('Power Electronics', 'Electrical Engineering', 4, 23),
('Cloud Computing', 'Information Technology', 3, 24),
('Environmental Engineering', 'Civil Engineering', 4, 25);

---inserting 25 values in Students Table

INSERT INTO Students (first_name, last_name, email, dob, gender, department) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '2002-03-15', 'Male', 'Computer Science'),
('Ishita', 'Patel', 'ishita.patel@example.com', '2001-11-22', 'Female', 'Mechanical Engineering'),
('Rahul', 'Verma', 'rahul.verma@example.com', '2000-07-09', 'Male', 'Electronics'),
('Sanya', 'Khan', 'sanya.khan@example.com', '2002-05-01', 'Female', 'Electrical Engineering'),
('Neha', 'Singh', 'neha.singh@example.com', '2001-08-12', 'Female', 'Information Technology'),
('Kunal', 'Yadav', 'kunal.yadav@example.com', '1999-12-25', 'Male', 'Civil Engineering'),
('Pooja', 'Mehta', 'pooja.mehta@example.com', '2002-02-14', 'Female', 'Computer Science'),
('Amit', 'Chopra', 'amit.chopra@example.com', '2000-06-30', 'Male', 'Electronics'),
('Priya', 'Rana', 'priya.rana@example.com', '2001-04-18', 'Female', 'Mechanical Engineering'),
('Rohit', 'Kapoor', 'rohit.kapoor@example.com', '2000-09-10', 'Male', 'Electrical Engineering'),
('Sakshi', 'Joshi', 'sakshi.joshi@example.com', '2002-01-21', 'Female', 'Computer Science'),
('Aditya', 'Dube', 'aditya.dube@example.com', '1999-10-07', 'Male', 'Information Technology'),
('Simran', 'Bhatia', 'simran.bhatia@example.com', '2001-06-05', 'Female', 'Civil Engineering'),
('Vikas', 'Saxena', 'vikas.saxena@example.com', '2000-03-17', 'Male', 'Electronics'),
('Richa', 'Arora', 'richa.arora@example.com', '2001-07-29', 'Female', 'Mechanical Engineering'),
('Varun', 'Malik', 'varun.malik@example.com', '1999-05-11', 'Male', 'Electrical Engineering'),
('Anjali', 'Gupta', 'anjali.gupta@example.com', '2002-09-13', 'Female', 'Computer Science'),
('Siddharth', 'Tiwari', 'siddharth.tiwari@example.com', '2001-12-19', 'Male', 'Information Technology'),
('Tanisha', 'Kaur', 'tanisha.kaur@example.com', '2000-08-04', 'Female', 'Civil Engineering'),
('Harsh', 'Bhatt', 'harsh.bhatt@example.com', '1999-04-25', 'Male', 'Mechanical Engineering'),
('Raghav', 'Malik', 'raghav.malik@example.com', '2000-08-11', 'Male', 'Civil Engineering'),
('Megha', 'Awasthi', 'megha.awasthi@example.com', '2002-10-09', 'Female', 'Computer Science'),
('Meera', 'Iyer', 'meera.iyer@example.com', '2001-05-19', 'Female', 'Information Technology'),
('Rohan', 'Deshmukh', 'rohan.deshmukh@example.com', '2000-11-30', 'Male', 'Mechanical Engineering');

---adding 25th value as above consisted of 24 value
INSERT INTO Students (first_name, last_name, email, dob, gender, department) VALUES
('Kritika', 'Nair', 'kritika.nair@example.com', '2002-07-25','Female','Information Technology');

---Checking entries
Select * from  Enrollments;

---Inserting 25 records in enrollment table
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) 
VALUES 
(1, 101, '2024-01-15', 'A'),
(2, 102, '2024-01-16', 'B+'),
(3, 103, '2024-01-17', 'A-'),
(4, 104, '2024-01-18', 'B'),
(5, 105, '2024-01-19', 'A'),
(6, 106, '2024-01-20', 'C+'),
(7, 107, '2024-01-21', 'B-'),
(8, 108, '2024-01-22', 'A'),
(9, 109, '2024-01-23', 'B+'),
(10, 110, '2024-01-24', 'C'),
(11, 101, '2024-01-25', 'A-'),
(12, 102, '2024-01-26', 'B'),
(13, 103, '2024-01-27', 'B+'),
(14, 104, '2024-01-28', 'C-'),
(15, 105, '2024-01-29', 'A'),
(16, 106, '2024-01-30', 'B-'),
(17, 107, '2024-01-31', 'C'),
(18, 108, '2024-02-01', 'B+'),
(19, 109, '2024-02-02', 'A'),
(20, 110, '2024-02-03', 'C+'),
(21, 101, '2024-02-04', 'B'),
(22, 103, '2024-02-05', 'A-'),
(23, 105, '2024-02-06', 'B+'),
(24, 107, '2024-02-07', 'C'),
(25, 109, '2024-02-08', 'A');

Select * from Enrollments;

---Inserting 25 records in Attendance table

INSERT INTO Attendance (student_id, course_id, attendance_date, status) 
VALUES 
(1, 101, '2024-02-01', 'Present'),
(2, 102, '2024-02-01', 'Absent'),
(3, 103, '2024-02-01', 'Present'),
(4, 104, '2024-02-01', 'Present'),
(5, 105, '2024-02-01', 'Late'),
(6, 106, '2024-02-02', 'Present'),
(7, 107, '2024-02-02', 'Absent'),
(8, 108, '2024-02-02', 'Present'),
(9, 109, '2024-02-02', 'Present'),
(10, 110, '2024-02-02', 'Late'),
(11, 101, '2024-02-03', 'Present'),
(12, 102, '2024-02-03', 'Absent'),
(13, 103, '2024-02-03', 'Present'),
(14, 104, '2024-02-03', 'Present'),
(15, 105, '2024-02-03', 'Late'),
(16, 106, '2024-02-04', 'Absent'),
(17, 107, '2024-02-04', 'Present'),
(18, 108, '2024-02-04', 'Present'),
(19, 109, '2024-02-04', 'Late'),
(20, 110, '2024-02-04', 'Present'),
(21, 101, '2024-02-05', 'Absent'),
(22, 103, '2024-02-05', 'Present'),
(23, 105, '2024-02-05', 'Late'),
(24, 107, '2024-02-05', 'Present'),
(25, 109, '2024-02-05', 'Present');


-- Check Students Table
SELECT * FROM Students;

-- Check Courses Table
SELECT * FROM Courses;

-- Check Enrollments Table
SELECT * FROM Enrollments;

-- Check Attendance Table
SELECT * FROM Attendance;

-----------------JOINS----------

--Get Student Enrollment Details

SELECT s.student_id, s.first_name, s.last_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;


---Get Attendance Report for a Student

SELECT s.first_name, s.last_name, c.course_name, a.attendance_date, a.status
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Courses c ON a.course_id = c.course_id
WHERE s.student_id = 8;  -- Replace with a student ID

---List of Students Who Are Absent More Than 2 Times
SELECT s.student_id, s.first_name, s.last_name, COUNT(*) AS Absent_Count
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
WHERE a.status = 'Absent'
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(*) > 0;


---List of Top Performing Students (Grade > A)

/*SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade > 80
ORDER BY e.grade DESC;*/

SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade IN ('A') --'A+', 'B+', 'B')  -- Adjust based on your grading system
ORDER BY e.grade ASC;

---checking data type of grade
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Enrollments' AND COLUMN_NAME = 'grade';

---Course-Wise Student Count
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  age INT,
  grade CHAR(2),
  course VARCHAR(50),
  dob DATE,
  blood_group VARCHAR(5),
  country VARCHAR(50)
)

INSERT INTO students (first_name, last_name, email, age, grade, course, dob, blood_group, country) VALUES
('John', 'Doe', 'john.doe@example.com', 20, 'A+', 'Computer Science', '2004-05-15', 'O+', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', 22, 'B', 'Mathematics', '2002-03-10', 'A-', 'Canada'),
('Alice', 'Johnson', 'alice.johnson@example.com', 21, 'C', 'Physics', '2003-07-25', 'B+', 'UK'),
('Bob', 'Brown', 'bob.brown@example.com', 19, 'A', 'Chemistry', '2005-11-18', 'AB+', 'Australia'),
('Charlie', 'Davis', 'charlie.davis@example.com', 23, 'B+', 'Biology', '2001-09-12', 'O-', 'Germany'),
('Emily', 'Wilson', 'emily.wilson@example.com', 20, 'A-', 'Economics', '2004-02-28', 'B-', 'France'),
('David', 'Lee', 'david.lee@example.com', 22, 'B', 'History', '2002-08-05', 'O+', 'Japan'),
('Sophia', 'Miller', 'sophia.miller@example.com', 21, 'C+', 'Engineering', '2003-12-01', 'A+', 'India'),
('Michael', 'Anderson', 'michael.anderson@example.com', 24, 'A', 'Psychology', '2000-06-30', 'AB-', 'Spain'),
('Olivia', 'Thomas', 'olivia.thomas@example.com', 19, 'B-', 'Literature', '2005-04-20', 'O-', 'Italy');

SELECT * FROM students
  WHERE grade = 'A' AND course = 'Chemistry';

SELECT * FROM students ORDER BY age DESC;

SELECT upper(first_name) FROM students;


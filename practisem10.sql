CREATE TABLE students10 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  score NUMERIC,
  department_id INT REFERENCES departments10(id)
)

CREATE TABLE departments10 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
)

CREATE TABLE enrollments10 (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students10(id),
  course_title VARCHAR(100),
  enrolled_on DATE
)

INSERT INTO departments10 (name) VALUES 
  ('CSE'),
  ('MCT'),
  ('SWE'),
  ('BBA');

INSERT INTO students10 (name, age, score, department_id) VALUES 
  ('John Doe', 20, 85.5, 1),
  ('Jane Smith', 22, 92.3, 2),
  ('Alice Johnson', 21, 78.9, 3),
  ('Bob Brown', 19, 88.7, 4);

INSERT INTO enrollments10 (student_id, course_title, enrolled_on) VALUES 
  (1, 'Database Systems', '2025-01-10'),
  (2, 'Operating Systems', '2025-02-15'),
  (3, 'Data Structures', '2025-03-20'),
  (4, 'Business Ethics', '2025-04-25');

  SELECT AVG(score) AS avg_score FROM students10;
  -- avg score

  SELECT * FROM students10
    WHERE score > (SELECT AVG(score) FROM students10);
    -- students who scored above average score

SELECT * FROM departments10;
SELECT * FROM students10;
SELECT * FROM enrollments10;
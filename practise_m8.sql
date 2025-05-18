-- Active: 1747538163412@@127.0.0.1@5432@test_db1
CREATE TABLE students2 (
  id SERIAL PRIMARY KEY,
  roll INT UNIQUE,
  name VARCHAR(50),
  age INT,
  department CHAR(10),
  score INT,
  status VARCHAR(10),
  last_login DATE
);

INSERT INTO students2 (roll, name, age, department, score, status, last_login) VALUES
  -- (1, 'John Doe', 20, 'CSE', 85, 'active', '2022-01-01'),
  -- (2, 'Jane Smith', 22, 'CE', 92, 'active', '2022-02-01'),
  -- (3, 'Alice Johnson', 21, 'IT', 78, 'inactive', '2022-03-01'),
  (4, 'Bob Brown', 19, 'ME', NULL, 'active', '2022-04-01')

-- 1
ALTER TABLE students2
  ADD COLUMN email VARCHAR(50);

-- 2
ALTER TABLE students2
  RENAME COLUMN email to student_email;

-- 3
ALTER TABLE students2
  ADD CONSTRAINT unique_student_email UNIQUE (student_email);



-- 6
SELECT * FROM students2
  WHERE score > 80 AND score IS NOT NULL;

-- 7
SELECT * FROM students2
  WHERE NOT department = 'CSE';

-- 8
SELECT * FROM students2
  WHERE name ILIKE 'a%';

-- 9
SELECT * FROM students2
  WHERE age BETWEEN 20 AND 25;

-- 10
SELECT * FROM students2
  WHERE roll IN (1,2);

-- 11
SELECT COUNT(*) AS total_students FROM students2;

-- 12
SELECT AVG(score) AS average_score FROM students2
  WHERE department = 'CSE';

-- 13
SELECT MAX(age) AS max_age FROM students2;

-- 14
UPDATE students2
  set status = 'failed'
  WHERE score < 50;

-- 16

SELECT * FROM students2;
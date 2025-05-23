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
  ('John Doe Smith', 20, 85.5, 1);

INSERT INTO enrollments10 (student_id, course_title, enrolled_on) VALUES 
  (1, 'Database Systems', '2025-01-10'),
  (2, 'Operating Systems', '2025-02-15'),
  (3, 'Data Structures', '2025-03-20'),
  (4, 'Business Ethics', '2025-04-25');

-- Query & Subqueries

  SELECT AVG(score) AS avg_score FROM students10;
  -- avg score

  SELECT * FROM students10
    WHERE score > (SELECT AVG(score) FROM students10);
    -- students who scored above average score

  SELECT * FROM students10
    WHERE age > (SELECT AVG(age) FROM students10);
      -- students whose age are above average age

  SELECT name FROM students10
    WHERE id IN (
      SELECT student_id FROM enrollments10
    );
    --Get names of students who are enrolled in any course (use IN with subquery).

  SELECT name FROM students10
    WHERE id NOT IN (
      SELECT student_id FROM enrollments10
    );

  SELECT d.name AS department_name FROM departments10 d
  WHERE EXISTS (
    SELECT 1 FROM students10 s
    WHERE s.department_id = d.id
    HAVING MAX(s.score) > 90
  );
  --Retrieve departments with at least one student scoring above 90 (use EXISTS).

  
  -- Views 

  CREATE VIEW student_score_with_dept
  AS
  SELECT s.name as student_name, d.name as department, score FROM students10 s
  JOIN departments10 d ON s.department_id = d.id;

  SELECT * FROM student_score_with_dept;
  -- Create a view to show each student’s name, department, and score.


  CREATE VIEW student_enrollments 
  AS
  SELECT name, course_title, enrolled_on FROM students10
    JOIN enrollments10 ON students10.id = enrollments10.student_id

  SELECT * FROM student_enrollments;
  -- Create a view that lists all students enrolled in any course with the enrollment date.


  -- Functions

  CREATE FUNCTION get_grade(score NUMERIC)
  RETURNS VARCHAR(2)
  LANGUAGE plpgsql
  AS $$
    BEGIN
      IF score >= 90 THEN
        RETURN 'A';
      ELSIF score >= 80 THEN
        RETURN 'B';
      ELSIF score >= 70 THEN
        RETURN 'C';
      ELSIF score >= 60 THEN
        RETURN 'D';
      ELSE
        RETURN 'F';
      END IF;
    END
  $$

  SELECT get_grade(85);

  CREATE FUNCTION get_name_dept()
  RETURNS TABLE (name VARCHAR(50), department VARCHAR(50))
  LANGUAGE SQL
  AS $$
    SELECT s.name as name, d.name as department FROM students10 s
    JOIN departments10 d ON s.department_id = d.id;
  $$

  SELECT * FROM get_name_dept();


  -- Procedures


  CREATE PROCEDURE update_dept()
  LANGUAGE PLPGSQL
  AS $$
  BEGIN
    UPDATE students10
    SET department_id = 2
    WHERE id = 1;
  END
  $$

  CALL update_dept();

  CREATE PROCEDURE remove_unenrolled_students()
  LANGUAGE PLPGSQL
  AS $$
  BEGIN
    DELETE FROM students10
    WHERE id NOT IN (
      SELECT student_id FROM enrollments10
    );
  END
  $$

  CALL remove_unenrolled_students();



SELECT * FROM departments10;
SELECT * FROM students10;
SELECT * FROM enrollments10;
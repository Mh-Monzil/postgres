-- Active: 1747538163412@@127.0.0.1@5432@test_db1
SELECT * FROM students;

SELECT country, COUNT(*), avg(age) FROM students
  GROUP BY country;

SELECT country, avg(age) FROM students
  GROUP BY country
  HAVING avg(age) > 22;

SELECT extract(year from dob) as birth_year, COUNT(*) 
  FROM students
  GROUP BY birth_year;
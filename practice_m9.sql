-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Inserting sample data into the departments table
INSERT INTO departments (department_name) VALUES 
    ('HR'), 
    ('Marketing'), 
    ('Finance'), 
    ('IT'), 
    ('Sales'), 
    ('Engineering'), 
    ('Customer Support'), 
    ('Administration'), 
    ('Research'), 
    ('Quality Assurance');

-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES 
    ('John Doe', 1, 60000.00, '2022-01-10'),
    ('Jane Smith', 2, 75000.50, '2021-05-22'),
    ('Bob Johnson', 3, 80000.75, '2020-11-15'),
    ('Alice Williams', 4, 90000.25, '2019-08-03'),
    ('David Lee', 5, 65000.50, '2020-03-18'),
    ('Sara Brown', 6, 70000.00, '2021-09-28'),
    ('Mike Miller', 7, 55000.75, '2022-02-05'),
    ('Emily Davis', 8, 95000.00, '2018-12-12'),
    ('Chris Wilson', 9, 72000.50, '2020-06-30'),
    ('Amy White', 10, 68000.25, '2021-11-09'),
    ('John Johnson', 1, 62000.00, '2022-01-15'),
    ('Jessica Thompson', 2, 78000.50, '2021-06-05'),
    ('Michael Harris', 3, 85000.75, '2020-11-25'),
    ('Emma Martinez', 4, 92000.25, '2019-09-15'),
    ('James Taylor', 5, 67000.50, '2020-04-08'),
    ('Sophia Anderson', 6, 72000.00, '2021-10-10'),
    ('William Jackson', 7, 56000.75, '2022-02-10'),
    ('Olivia Nelson', 8, 97000.00, '2018-12-20'),
    ('Daniel White', 9, 73000.50, '2020-07-05'),
    ('Ava Wilson', 10, 69000.25, '2021-11-15'),
    ('Matthew Brown', 1, 63000.00, '2022-01-20'),
    ('Emily Garcia', 2, 76000.50, '2021-06-15'),
    ('Christopher Allen', 3, 86000.75, '2020-12-05'),
    ('Madison Hall', 4, 93000.25, '2019-09-25'),
    ('Andrew Cook', 5, 68000.50, '2020-04-18'),
    ('Abigail Torres', 6, 73000.00, '2021-10-20'),
    ('Ethan Murphy', 7, 57000.75, '2022-02-15'),
    ('Ella King', 8, 98000.00, '2018-12-28'),
    ('Nathan Rivera', 9, 74000.50, '2020-07-15'),
    ('Mia Roberts', 10, 70000.25, '2021-11-20');

SELECT * FROM employees
  JOIN departments USING(department_id);

SELECT department_name, avg(salary) as avg_salary FROM employees
  JOIN departments USING(department_id)
  GROUP BY department_name;

SELECT department_name, max(salary) as highest_avg_salary FROM employees
  JOIN departments USING(department_id)
  GROUP BY department_name
  ORDER BY highest_avg_salary DESC
  LIMIT 1;

SELECT EXTRACT(YEAR FROM hire_date) as hired_year, COUNT(*) FROM employees
  GROUP BY hired_year;

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  order_date DATE,
  amount DECIMAL(10, 2)
);

INSERT INTO customers (name, email) VALUES
  ('John Doe', 'j7M5U@example.com'),
  ('Jane Smith', 'jane.smith@example.com'),
  ('Bob Johnson', 'bob.johnson@example.com'),
  ('Alice Williams', 'alice.williams@example.com')


INSERT INTO orders (customer_id, order_date, amount) VALUES
  (1, '2022-01-01', 100.00),
  (2, '2022-02-01', 200.00),
  (2, '2022-05-01', 250.00),
  (3, '2022-03-01', 300.00),
  (1, '2022-04-01', 400.00),
  (2, '2022-06-01', 500.00);


  DROP TABLE orders;
  DROP TABLE customers;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT name,email, SUM(amount) as total_amount, COUNT(*) FROM orders
  JOIN customers USING (customer_id)
  GROUP BY name, email
  HAVING COUNT(*) > 2;


SELECT EXTRACT(MONTH FROM order_date) as month, SUM(amount) FROM orders
  WHERE EXTRACT(YEAR FROM order_date) = 2022
  GROUP BY month;




UPDATE students2
  SET last_login = '2025-05-15'
  WHERE id = 3;

SELECT * FROM students2
  WHERE last_login >= CURRENT_DATE - INTERVAL '30 day';

SELECT EXTRACT(month from last_login) as month, COUNT(*) AS total_students FROM students2
  GROUP BY month;



ALTER TABLE students2
ADD COLUMN department_id INT;

ALTER TABLE students2
  ADD CONSTRAINT department_id 
  FOREIGN KEY (department_id)
  REFERENCES departments(department_id) ;

  INSERT INTO students2 VALUES
    (5, 5, 'John Doe', 20, 'CSE', 85, 'active', '2022-01-01', NULL, 10)

  DELETE FROM students2
    WHERE id = 5



SELECT * FROM students2

SELECT * FROM departments;
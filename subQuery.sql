CREATE TABLE employees2 (
  employee_id SERIAL PRIMARY KEY,
  employee_name VARCHAR(50),
  department_name VARCHAR(50),
  salary DECIMAL(10, 2),
  hire_date DATE
)

INSERT INTO employees2 (employee_name, department_name, salary, hire_date) VALUES
('Rahim Uddin', 'HR', 45000.00, '2022-03-15'),
('Karim Khan', 'Finance', 55000.00, '2021-07-10'),
('Shila Akter', 'IT', 60000.00, '2023-01-05'),
('Tanvir Hasan', 'Marketing', 48000.00, '2020-11-20'),
('Nadia Rahman', 'IT', 62000.00, '2022-09-01'),
('Jamal Mia', 'HR', 47000.00, '2021-05-18'),
('Farzana Ahmed', 'Sales', 50000.00, '2023-06-30'),
('Sabbir Hossain', 'Finance', 58000.00, '2022-12-12'),
('Rima Chowdhury', 'Sales', 51000.00, '2021-08-08'),
('Arif Mahmud', 'Marketing', 49000.00, '2020-04-25');





SELECT * FROM employees2 WHERE salary > (SELECT MAX(salary) FROM employees2
  WHERE department_name = 'HR')
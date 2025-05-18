ALTER TABLE employees
  ADD COLUMN email varchar (50) DEFAULT 'default@gmail.com' NOT NULL;

INSERT into employees VALUES(7, 'Mohammad', 'Senior Developer', 'mh@gmail.com');

ALTER TABLE employees
  RENAME COLUMN role to designation;

ALTER TABLE employees
  ALTER COLUMN user_name TYPE varchar(20);

ALTER TABLE employees
  ADD CONSTRAINT unique_employees_email UNIQUE (email);

SELECT * FROM employees;
  
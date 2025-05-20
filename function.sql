CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS 
$$
SELECT COUNT(*) FROM employees;
$$;

SELECT emp_count();


CREATE FUNCTION find_emp_by_id(p_emp_id int)
RETURNS TABLE (employee_id int, employee_name varchar(50), department_id int, salary decimal(10, 2), hire_date date)
LANGUAGE SQL
AS 
$$
  SELECT * FROM employees WHERE employee_id = p_emp_id;
$$;

SELECT find_emp_by_id(1);

DROP Function find_emp_by_id(int);

SELECT * FROM employees2;



-- PROCEDURE

CREATE PROCEDURE remove_emp()
LANGUAGE plpgsql
AS
$$
BEGIN
  DELETE FROM employees2 WHERE employee_id = 10;
END;
$$ 

CALL remove_emp();


CREATE PROCEDURE remove_emp_var()
LANGUAGE plpgsql
AS
$$
  DECLARE
  test_var int;
  BEGIN
  SELECT employee_id INTO test_var FROM employees2 WHERE employee_id = 9;
    DELETE FROM employees2 WHERE employee_id = test_var;
  END;
$$ 

CALL remove_emp_var();
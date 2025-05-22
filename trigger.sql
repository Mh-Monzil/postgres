CREATE TABLE my_users (
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(50),
  email VARCHAR(100)
);

INSERT INTO my_users VALUES 
  (1, 'John Doe', 'john.doe@example.com'),
  (2, 'Jane Smith', 'jane.smith@example.com'),
  (3, 'Alice Johnson', 'alice.johnson@example.com'),
  (4, 'Bob Brown', 'bob.brown@example.com');

SELECT * FROM my_users;

CREATE TABLE deleted_user_audit (
  deleted_user_name VARCHAR(50),
  deleted_at TIMESTAMP
);

-- TRIGGER
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$ 
  BEGIN
    INSERT INTO deleted_user_audit VALUES (OLD.user_name, now());
    RAISE NOTICE 'Deleted user: %', OLD.user_name;
    RETURN OLD;
  END
$$;

CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
on my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE id = 3;

SELECT * FROM deleted_user_audit;
SELECT * FROM my_users;
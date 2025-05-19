CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  username VARCHAR(25) UNIQUE NOT NULL
)

INSERT INTO "user" (username) VALUES ('alice'), ('bob'), ('charlie'), ('dave');

SELECT * FROM "user";

CREATE TABLE post (
  id SERIAL PRIMARY KEY,
  title text NOT NULL,
  user_id INTEGER REFERENCES "user"(id)
)

ALTER TABLE post
  alter COLUMN user_id set NOT NULL ;

INSERT INTO post (title, user_id) VALUES
  ('title 4', 2)

SELECT * FROM post;

DELETE FROM "user"
  WHERE id = 3;

SELECT title, username FROM post
  JOIN "user" ON post.user_id = "user".id;
-- 1
DROP ROLE IF EXISTS michael;

--2
CREATE ROLE michael;

-- 3
DROP DATABASE IF EXISTS todo_app;

-- 4
CREATE DATABASE todo_app;

--5
\c todo_app;

--67
CREATE TABLE tasks(
  id serial PRIMARY KEY,
  title varchar(40),
  description text,
  created_at timestamp DEFAULT now(),
  updated_at timestamp null,
  completed BOOLEAN DEFAULT false
);
--8
ALTER TABLE IF EXISTS tasks DROP COLUMN IF EXISTS id;
ALTER TABLE IF EXISTS tasks ADD COLUMN completed_at timestamp DEFAULT null;
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET DEFAULT now();
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');
SELECT title
FROM tasks
WHERE completed_at = null;
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';
SELECT title, description
FROM tasks
WHERE completed_at = null;
SELECT *
FROM tasks
ORDER BY created_at DESC;
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');
INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');
SELECT *
FROM tasks
WHERE title SIMILAR TO '%mistake%';
DELETE FROM tasks WHERE title = 'mistake 1';
SELECT (title, description)
FROM tasks
WHERE title SIMILAR TO '%mistake%';
DELETE FROM tasks
WHERE title SIMILAR TO '%mistake%';
SELECT *
FROM tasks
ORDER BY title ASC;
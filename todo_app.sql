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
  id serial PRIMARY KEY
);
--8
ALTER TABLE IF EXISTS tasks DROP COLUMN IF EXISTS id;

--9

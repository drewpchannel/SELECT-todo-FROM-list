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
--9

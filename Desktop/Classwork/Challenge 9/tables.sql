-- Start a transaction
BEGIN;
-- Table for departments
CREATE TABLE departments (
   Dept_no CHAR(4) NOT NULL PRIMARY KEY,  -- Department number
   Dept_name VARCHAR(30) NOT NULL         -- Department name
);
SELECT * FROM departments; --Check table

-- Table for titles
CREATE TABLE titles (
    title_id CHAR(5) NOT NULL PRIMARY KEY,  -- Title ID
    title VARCHAR(30)                      -- Title
);
SELECT * FROM titles; --Check table

-- Table for employees
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,        -- Employee number
    emp_title CHAR(5),                      -- Title ID of the employee
    birth_date DATE,                        -- Employee's date of birth
    first_name VARCHAR(30) NOT NULL,        -- Employee's first name
    last_name VARCHAR(30) NOT NULL,         -- Employee's last name
    sex VARCHAR(30),                        -- Employee's sex
    hire_date DATE,                         -- Date when the employee was hired
    FOREIGN KEY (emp_title) REFERENCES titles(title_id)  -- Foreign key referencing titles table
);
SELECT * FROM employees; --Check table

-- Table for department employees
CREATE TABLE dept_emp (
    emp_no INT,                             -- Employee number
    dept_no CHAR(4),                        -- Department number
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),   -- Foreign key referencing employees table
    FOREIGN KEY (dept_no) REFERENCES departments(Dept_no) -- Foreign key referencing departments table
);

SELECT * FROM dept_emp; --Check the table

-- Table for department managers
CREATE TABLE dept_manager (
    dept_no CHAR(4),                        -- Department number
    emp_no INT,                             -- Employee number
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),   -- Foreign key referencing employees table
    FOREIGN KEY (dept_no) REFERENCES departments(Dept_no) -- Foreign key referencing departments table
);

SELECT * FROM dept_manager; --Check the table

-- Table for salaries
CREATE TABLE salaries (
    emp_no INT,                             -- Employee number
    salary FLOAT,                           -- Employee's salary
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)    -- Foreign key referencing employees table
);
SELECT * FROM salaries; --Check the table

-- Commit the transaction
COMMIT;
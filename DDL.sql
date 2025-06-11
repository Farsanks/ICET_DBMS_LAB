-- Step 1: Create a table
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    age NUMBER
);

-- Step 2: Alter the table to add a new column
ALTER TABLE students ADD (department VARCHAR2(20));

-- Step 3: Describe the table to view structure
DESC students;

-- Step 4: Drop the column (remove it)
ALTER TABLE students DROP COLUMN department;

-- Step 5: Truncate the table (delete all data, cannot be rolled back)
TRUNCATE TABLE students;

-- Step 6: Drop the entire table structure
DROP TABLE students;

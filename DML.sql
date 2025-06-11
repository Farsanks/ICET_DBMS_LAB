-- Step 1: Create table again
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    age NUMBER
);

-- Step 2: Insert some rows
INSERT INTO students VALUES (1, 'Farsan', 22);
INSERT INTO students VALUES (2, 'Aisha', 21);
INSERT INTO students VALUES (3, 'Ravi', 23);

-- Step 3: Select data
SELECT * FROM students;

-- Step 4: Update data
UPDATE students SET age = 24 WHERE student_id = 3;

-- Step 5: Delete a record
DELETE FROM students WHERE student_id = 2;

-- Step 6: Commit changes to save them permanently
COMMIT;

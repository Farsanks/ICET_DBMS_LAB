--Step 1: Create the students table
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks NUMBER
);

 --Step 2: Insert multiple sample students
INSERT INTO students VALUES (1, 'Arjun', 85);
INSERT INTO students VALUES (2, 'Farsan', 72);
INSERT INTO students VALUES (3, 'Neha', 91);
INSERT INTO students VALUES (4, 'Vikram', 65);
INSERT INTO students VALUES (5, 'Aisha', 78);

--Step 3: Create the log table
CREATE TABLE student_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    student_name VARCHAR2(50),
    log_time DATE
);

-- Step 4: Create a Trigger for INSERT on students
CREATE OR REPLACE TRIGGER trg_log_student_insert
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_log(student_name, log_time)
    VALUES (:NEW.name, SYSDATE);
END; --This trigger automatically logs the student's name and the time they were inserted

-- Step 5: Insert one more student to test trigger
INSERT INTO students VALUES (6, 'Sneha', 88);
--Then view log:
SELECT * FROM student_log;

--example for update  trigger using the same students table
CREATE TABLE update_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    student_id NUMBER,
    old_marks NUMBER,
    new_marks NUMBER,
    update_time DATE
);

CREATE OR REPLACE TRIGGER trg_update_marks
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO update_log(student_id, old_marks, new_marks, update_time)
    VALUES (:OLD.student_id, :OLD.marks, :NEW.marks, SYSDATE);
END;

UPDATE students SET marks = 95 WHERE student_id = 2;

SELECT * FROM update_log;

----example for update  trigger using the same students table
CREATE TABLE delete_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    student_id NUMBER,
    name VARCHAR2(50),
    marks NUMBER,
    delete_time DATE
);

CREATE OR REPLACE TRIGGER trg_delete_student
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO delete_log(student_id, name, marks, delete_time)
    VALUES (:OLD.student_id, :OLD.name, :OLD.marks, SYSDATE);
END;

DELETE FROM students WHERE student_id = 3;

SELECT * FROM delete_log;




-- Step 6: Create a Cursor to display high-scoring students
DECLARE
    CURSOR high_score_cursor IS
        SELECT name, marks FROM students WHERE marks > 75;

    stu_name students.name%TYPE;
    stu_marks students.marks%TYPE;
BEGIN
    OPEN high_score_cursor;
    LOOP
        FETCH high_score_cursor INTO stu_name, stu_marks;
        EXIT WHEN high_score_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Student: ' || stu_name || ' - Marks: ' || stu_marks);
    END LOOP;
    CLOSE high_score_cursor;
END;






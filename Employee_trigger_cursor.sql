CREATE TABLE employees (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department VARCHAR2(50),
    salary NUMBER(10,2)
);

CREATE TABLE employees_log (
    id NUMBER,
    name VARCHAR2(100),
    department VARCHAR2(50),
    salary NUMBER(10,2)
);

CREATE OR REPLACE TRIGGER trg_after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_log (id, name, department, salary)
    VALUES (:NEW.id, :NEW.name, :NEW.department, :NEW.salary);
END;
/

INSERT INTO employees (id, name, department, salary)
VALUES (1, 'Alice Johnson', 'HR', 60000);

SELECT * FROM employees;
SELECT * FROM employees_log;


--cursor
SET SERVEROUTPUT ON;

DECLARE
    -- Define the cursor
    CURSOR emp_cursor IS
        SELECT id, name, department, salary FROM employees;

    -- Variables to hold each row's values
    v_id         employees.id%TYPE;
    v_name       employees.name%TYPE;
    v_department employees.department%TYPE;
    v_salary     employees.salary%TYPE;

BEGIN
    -- Open and loop through the cursor
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_department, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Print each employee's data
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ', Name: ' || v_name ||
            ', Department: ' || v_department ||
            ', Salary: ' || v_salary
        );
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;
END;
/

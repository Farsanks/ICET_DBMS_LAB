sqlplus / as sysdba


SELECT NAME, OPEN_MODE FROM V$PDBS;


ALTER SESSION SET CONTAINER = XEPDB1;

CREATE USER scott IDENTIFIED BY tiger;

GRANT CONNECT, RESOURCE TO scott;


-- Example: Allow insert, delete, update, and select on a specific table
GRANT INSERT, DELETE, UPDATE, SELECT ON your_table TO scott;

-- Or give system-wide permission (not always recommended)
GRANT CREATE TABLE TO scott;
GRANT CREATE SESSION TO scott;


SELECT * FROM SESSION_PRIVS;--Login as the user (e.g., scott) and run:

SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE = 'SCOTT';


COMPLETE EXAMPLE
-- STEP 1: Login as SYSDBA in SQL*Plus
-- Command in terminal (not inside SQL prompt):
-- sqlplus / as sysdba

-- STEP 2: Check all pluggable databases
SELECT NAME, OPEN_MODE FROM V$PDBS;

-- STEP 3: Switch to your working PDB (e.g., XEPDB1)
ALTER SESSION SET CONTAINER = XEPDB1;

-- STEP 4: Create a new user 'farsan' with password '1234'
CREATE USER farsan IDENTIFIED BY 1234;

-- STEP 5: Grant essential privileges to allow login and basic operations
GRANT CONNECT, RESOURCE TO farsan;

-- STEP 6: Grant additional useful privileges
GRANT CREATE SESSION TO farsan;
GRANT CREATE TABLE TO farsan;
GRANT UNLIMITED TABLESPACE TO farsan;

-- STEP 7: Set unlimited quota on the USERS tablespace
ALTER USER farsan QUOTA UNLIMITED ON USERS;

-- STEP 8: Exit from SYSDBA session
EXIT;

-- Command in terminal (not SQL prompt):
sqlplus farsan/1234@localhost/XEPDB1

-- STEP 9: Create a table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER
);

-- STEP 10: Insert values into the table
INSERT INTO employees VALUES (1, 'Alice', 50000);
INSERT INTO employees VALUES (2, 'Bob', 60000);

-- STEP 11: View the table data
SELECT * FROM employees;

-- STEP 12: Update a record
UPDATE employees SET salary = salary + 5000 WHERE name = 'Alice';

-- STEP 13: Delete a record
DELETE FROM employees WHERE name = 'Bob';

-- STEP 14: View data after update and delete
SELECT * FROM employees;


-- Show system-level privileges granted to current user
SELECT * FROM SESSION_PRIVS;

-- Show table-level privileges
SELECT * FROM USER_TAB_PRIVS;





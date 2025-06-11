-- Step 1: Create a sample table
CREATE TABLE bank_accounts (
    acc_no NUMBER PRIMARY KEY,
    holder_name VARCHAR2(50),
    balance NUMBER
);

-- Step 2: Insert initial data
INSERT INTO bank_accounts VALUES (101, 'Farsan', 1000);
INSERT INTO bank_accounts VALUES (102, 'Aisha', 1500);

-- Step 3: Check data before transaction
SELECT * FROM bank_accounts;

-- Step 4: Start Transaction (by default in Oracle, a new transaction begins after DML)
-- Let's make some changes without committing them yet

UPDATE bank_accounts SET balance = balance + 500 WHERE acc_no = 101;

-- Step 5: Create a SAVEPOINT after one update
SAVEPOINT s1;

-- Step 6: Perform another update
UPDATE bank_accounts SET balance = balance - 200 WHERE acc_no = 102;

-- Step 7: View changes (Note: changes are not yet committed)
SELECT * FROM bank_accounts;

-- Step 8: ROLLBACK TO SAVEPOINT
-- This will undo the update done in Step 6, but keep the change done before savepoint
ROLLBACK TO s1;

-- Step 9: Check data again after rollback to savepoint
SELECT * FROM bank_accounts;

-- Step 10: Commit the transaction
-- This saves the current state of the table permanently
COMMIT;

-- Step 11: Check data after COMMIT (This is now permanent)
SELECT * FROM bank_accounts;

-- Step 12: Perform another update
UPDATE bank_accounts SET balance = balance + 100 WHERE acc_no = 101;

-- Step 13: ROLLBACK without savepoint (Undo the last update completely)
ROLLBACK;

-- Step 14: Final check – balance should go back to after Step 11
SELECT * FROM bank_accounts;

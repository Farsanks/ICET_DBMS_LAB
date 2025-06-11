-- Step 1: Grant permission to user farsan
GRANT SELECT, INSERT, UPDATE, DELETE ON students TO farsan;

-- Step 2: Revoke permission from user farsan
REVOKE DELETE ON students FROM farsan;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    num        NUMBER := &num;         -- Accept input from user
    digit      NUMBER;
    sum_digits NUMBER := 0;
    original   NUMBER;
BEGIN
    original := num;                   -- Store the original number
    WHILE num > 0 LOOP
        digit := MOD(num, 10);        -- Extract last digit
        sum_digits := sum_digits + digit;
        num := TRUNC(num / 10);       -- Remove last digit
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Sum of digits of ' || original || ' = ' || sum_digits);
END;
/

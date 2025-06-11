SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 153;         
    original NUMBER;
    digit NUMBER;
    total NUMBER := 0;
BEGIN
    original := num;

    WHILE num > 0 LOOP
        digit := MOD(num, 10);                  -- Get last digit
        total := total + (digit * digit * digit); -- Cube and add
        num := TRUNC(num / 10);                 -- Remove last digit
    END LOOP;

    IF total = original THEN
        DBMS_OUTPUT.PUT_LINE(original || ' is an Armstrong Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(original || ' is Not an Armstrong Number');
    END IF;
END;
/

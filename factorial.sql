SET SERVEROUTPUT ON;

DECLARE
    num INTEGER := 5;  -- You can change this value
    fact INTEGER := 1;
    i INTEGER;
BEGIN
    IF num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not defined for negative numbers');
    ELSIF num = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial of 0 is 1');
    ELSE
        FOR i IN 1..num LOOP
            fact := fact * i;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is ' || fact);
    END IF;
END;
/

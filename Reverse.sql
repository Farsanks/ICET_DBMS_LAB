SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 12345;        -- You can change this value
    reversed NUMBER := 0;
    digit NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Original number: ' || num);

    WHILE num > 0 LOOP
        digit := MOD(num, 10);             -- Get the last digit
        reversed := reversed * 10 + digit; -- Build reversed number
        num := TRUNC(num / 10);            -- Remove last digit
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Reversed number: ' || reversed);
END;
/

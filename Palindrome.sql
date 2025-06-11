SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 121;       -- You can change this value
    original NUMBER := num;
    reversed NUMBER := 0;
    digit NUMBER;
BEGIN
    WHILE num > 0 LOOP
        digit := MOD(num, 10);             -- Extract last digit
        reversed := reversed * 10 + digit; -- Build reversed number
        num := TRUNC(num / 10);            -- Remove last digit
    END LOOP;

    IF original = reversed THEN
        DBMS_OUTPUT.PUT_LINE(original || ' is a Palindrome');
    ELSE
        DBMS_OUTPUT.PUT_LINE(original || ' is Not a Palindrome');
    END IF;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    num1 INTEGER := 10;
    num2 INTEGER := 20;
    result INTEGER;
BEGIN
    result := num1 + num2;
    DBMS_OUTPUT.PUT_LINE('The sum of ' || num1 || ' and ' || num2 || ' is ' || result);
END;
/

CREATE OR REPLACE PROCEDURE square_number(n IN NUMBER) IS
    result NUMBER;
BEGIN
    result := n * n;
    DBMS_OUTPUT.PUT_LINE('Square of ' || n || ' is ' || result);
END;
/

SET SERVEROUTPUT ON;
BEGIN
    square_number(9);  -- You can pass any number here
END;
/

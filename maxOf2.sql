CREATE OR REPLACE PROCEDURE find_max(x IN INTEGER, y IN INTEGER) IS
    max_value INTEGER;
BEGIN
    IF x > y THEN
        max_value := x;
    ELSE
        max_value := y;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Maximum value is: ' || max_value);
END;
/

SET SERVEROUTPUT ON;
BEGIN
    find_max(12, 45);
END;
/

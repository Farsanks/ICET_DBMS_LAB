SET SERVEROUTPUT ON;

DECLARE
    a INTEGER := 25;
    b INTEGER := 42;
    c INTEGER := 17;
    greatest INTEGER;
BEGIN
    IF a >= b AND a >= c THEN
        greatest := a;
    ELSIF b >= a AND b >= c THEN
        greatest := b;
    ELSE
        greatest := c;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Greatest number is: ' || greatest);
END;
/

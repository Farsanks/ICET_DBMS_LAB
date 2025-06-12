SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    temp NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before Swapping:');
    DBMS_OUTPUT.PUT_LINE('a = ' || a || ', b = ' || b);

    temp := a;
    a := b;
    b := temp;

    DBMS_OUTPUT.PUT_LINE('After Swapping:');
    DBMS_OUTPUT.PUT_LINE('a = ' || a || ', b = ' || b);
END;
/

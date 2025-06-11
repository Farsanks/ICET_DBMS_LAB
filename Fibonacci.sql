SET SERVEROUTPUT ON;

DECLARE
    n NUMBER := 10;        -- Number of terms to generate
    a NUMBER := 0;
    b NUMBER := 1;
    temp NUMBER;
    i NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fibonacci Series up to ' || n || ' terms:');

    WHILE i <= n LOOP
        DBMS_OUTPUT.PUT_LINE(a);
        temp := a + b;
        a := b;
        b := temp;
        i := i + 1;
    END LOOP;
END;
/

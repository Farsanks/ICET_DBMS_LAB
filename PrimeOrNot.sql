SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 17;  -- You can change this value
    i NUMBER := 2;
    is_prime BOOLEAN := TRUE;
BEGIN
    IF num <= 1 THEN
        is_prime := FALSE;
    ELSE
        WHILE i <= num / 2 LOOP
            IF MOD(num, i) = 0 THEN
                is_prime := FALSE;
                EXIT;
            END IF;
            i := i + 1;
        END LOOP;
    END IF;

    IF is_prime THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is a Prime Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is Not a Prime Number');
    END IF;
END;
/

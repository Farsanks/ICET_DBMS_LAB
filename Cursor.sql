CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    price NUMBER
);

INSERT INTO products VALUES (101, 'Pen Drive', 650);
INSERT INTO products VALUES (102, 'Laptop', 45000);
INSERT INTO products VALUES (103, 'Keyboard', 850);
INSERT INTO products VALUES (104, 'Mouse', 300);
INSERT INTO products VALUES (105, 'Monitor', 7500);

--Step 3: Create a cursor to display products under 1000
DECLARE
    CURSOR low_price_cursor IS
        SELECT product_name, price FROM products WHERE price < 1000;

    pname products.product_name%TYPE;
    pprice products.price%TYPE;
BEGIN
    OPEN low_price_cursor;
    LOOP
        FETCH low_price_cursor INTO pname, pprice;
        EXIT WHEN low_price_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product: ' || pname || ' | Price: Rs.' || pprice);
    END LOOP;
    CLOSE low_price_cursor;
END;

--Expected Output
Product: Pen Drive | Price: Rs.650  
Product: Keyboard  | Price: Rs.850  
Product: Mouse     | Price: Rs.300

(Cursor Name: low_price_cursor

Condition: Fetch rows where price < 1000

Data fetched: product_name and price)


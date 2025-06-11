1)--Create Tables
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age FLOAT
);

CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(50)
);

CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);
2)--Insert Records
-- Sailors
INSERT INTO Sailors VALUES (22, 'Dustin', 7, 45.0);
INSERT INTO Sailors VALUES (29, 'Brutus', 1, 33.0);
INSERT INTO Sailors VALUES (31, 'Lubber', 8, 55.5);
INSERT INTO Sailors VALUES (32, 'Andy', 8, 25.5);
INSERT INTO Sailors VALUES (58, 'Rusty', 10, 35.0);
INSERT INTO Sailors VALUES (64, 'Horatio', 7, 35.0);
INSERT INTO Sailors VALUES (71, 'Zorba', 10, 16.0);
INSERT INTO Sailors VALUES (74, 'Horatio', 9, 35.0);
INSERT INTO Sailors VALUES (85, 'Art', 3, 25.5);
INSERT INTO Sailors VALUES (95, 'Bob', 3, 63.5);

-- Boats
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');

-- Reserves
INSERT INTO Reserves VALUES (22, 101, TO_DATE('10-10-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (22, 102, TO_DATE('10-10-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (22, 103, TO_DATE('08-10-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (22, 104, TO_DATE('07-10-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (31, 102, TO_DATE('10-11-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (31, 103, TO_DATE('06-11-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (31, 104, TO_DATE('12-11-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (64, 101, TO_DATE('05-09-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (64, 102, TO_DATE('08-09-1998', 'DD-MM-YYYY'));
INSERT INTO Reserves VALUES (74, 103, TO_DATE('08-09-1998', 'DD-MM-YYYY'));
3)--Queries
SELECT DISTINCT sname FROM Sailors; --Find distinct names of sailors

SELECT * FROM Sailors --Find all information on sailors who have reserved boat number 101
WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 101);

SELECT DISTINCT sname FROM Sailors --Find names of sailors who have reserved at least one boat
WHERE sid IN (SELECT sid FROM Reserves);

SELECT DISTINCT S.sname, S.age --Find names of sailors who have reserved a red boat, ordered by age
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = 'red'
ORDER BY S.age;

SELECT DISTINCT S.sid, S.sname  --Find IDs and names of sailors who reserved two different boats on the same day
FROM Sailors S
WHERE EXISTS (
    SELECT 1 FROM Reserves R1, Reserves R2
    WHERE R1.sid = S.sid AND R2.sid = S.sid
      AND R1.bid <> R2.bid AND R1.day = R2.day
);

--  Find the IDs of sailors who have reserved a red boat OR a green boat
-- Sailors who reserved a red boat 
SELECT DISTINCT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'
UNION
-- Sailors who reserved a green boat
SELECT DISTINCT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'green';



SELECT DISTINCT S.sname --Find the names of sailors who have reserved boat 103
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 103;

SELECT sname, age --Find the name and the age of the youngest sailor
FROM Sailors
WHERE age = (SELECT MIN(age) FROM Sailors);

SELECT sname --Find the names of sailors who have reserved all boats
FROM Sailors S
WHERE NOT EXISTS (
    SELECT B.bid
    FROM Boats B
    MINUS
    SELECT R.bid
    FROM Reserves R
    WHERE R.sid = S.sid
);


SELECT rating, AVG(age) AS Average_Age -- Find the average age of sailors for each rating level
FROM Sailors
GROUP BY rating;



SELECT COUNT(DISTINCT sname) AS Unique_Names --Count the number of different sailor names
FROM Sailors;

SELECT AVG(age) AS Overall_Average_Age --Calculate the average age of all sailors
FROM Sailors;





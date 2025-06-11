--table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Marks INT
);

--data
INSERT INTO Students VALUES (1, 'Sanjay', 64);
INSERT INTO Students VALUES (2, 'Varun', 72);
INSERT INTO Students VALUES (3, 'Akash', 45);
INSERT INTO Students VALUES (4, 'Rohit', 86);
INSERT INTO Students VALUES (5, 'Anjali', 92);
INSERT INTO Students VALUES (6, 'Ammu', 95);
INSERT INTO Students VALUES (7, 'Rahul', 80);
INSERT INTO Students VALUES (8, 'Prathibha', 62);
INSERT INTO Students VALUES (9, 'Ravi', 75);
INSERT INTO Students VALUES (10, 'Pulkit', 76);

1)--Count the number of students scoring marks > 75
SELECT COUNT(*) AS High_Scorers
FROM Students
WHERE Marks > 75;
2)--Calculate the average marks of all students
SELECT AVG(Marks) AS Average_Marks
FROM Students;
3)--Retrieve the minimum marks out of all students
SELECT MIN(Marks) AS Min_Marks
FROM Students;
4)--Retrieve the maximum marks out of all students
SELECT MAX(Marks) AS Max_Marks
FROM Students;


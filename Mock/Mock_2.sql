-- Create the database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Create the Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(50),
    ContactNumber VARCHAR(15),
    Experience INT

);

-- Display the tables
SELECT * FROM Doctors;

SET FOREIGN_KEY_CHECKS=0;

Drop Table Doctors;

-- Insert records into Doctors table
INSERT INTO Doctors (Name, Specialty, ContactNumber,Experience) VALUES
('Dr. Rajesh Sharma', 'Cardiologist', '9876543210',25),
('Dr. Sunita Verma', 'Dermatologist', '9876543211',15),
('Dr. Anil Kapoor', 'Orthopedic', '9876543212',2),
('Dr. Preeti Mehta', 'Neurologist', '9876543213',5),
('Dr. Vikram Singh', 'Pediatrician', '9876543214',18);

-- Create the Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Disease VARCHAR(100),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert records into Patients table
INSERT INTO Patients (Name, Age, Disease, DoctorID) VALUES
('Amit Kumar', 45, 'Heart Disease', 1),
('Pooja Sharma', 32, 'Skin Allergy', 2),
('Ravi Verma', 55, 'Fracture', 3),
('Sonia Gupta', 29, 'Migraine', 4),
('Karan Singh', 5, 'Flu', 5);

-- Display the tables
SELECT * FROM Patients;


/* 1.Data Definition Language (DDL): Create, Drop, Alter.
Data Manipulation Language (DML): Insert, Update, Delete.
Data Query Language (DQL): Select, functions, Aggregations.
*/

-- DML (Data Manipulation Language) Queries............................................

-- 1. Add a new column for Doctor's experience in years
ALTER TABLE Doctors ADD Experience INT;

-- 2. Modify the ContactNumber column to hold up to 20 characters
ALTER TABLE Doctors MODIFY ContactNumber VARCHAR(20);

-- 3. Rename the Doctors table to MedicalStaff
ALTER TABLE Doctors RENAME TO MedicalStaff;

-- 4. Delete the MedicalStaff table (Be careful! This removes all data)
DROP TABLE MedicalStaff;

-- DML (Data Manipulation Language) Queries.................................................

-- 5. Insert a new doctor
INSERT INTO Doctors (Name, Specialty, ContactNumber) 
VALUES ('Dr. Ananya Joshi', 'ENT', '9876543215');

-- 6. Update a doctor's contact number
UPDATE Doctors SET ContactNumber = '9998887776' WHERE Name = 'Dr. Rajesh Sharma';

-- 7. Increase experience of all doctors by 2 years
UPDATE Doctors SET Experience = Experience + 2;

-- 8. Delete a doctor with a specific ID
DELETE FROM Doctors WHERE DoctorID = 5;

-- DQL (Data Query Language) Queries..............................................

-- 9. Select all doctors who are Cardiologists
SELECT * FROM Doctors WHERE Specialty = 'Cardiologist';

-- 10. Count the number of doctors
SELECT COUNT(*) AS TotalDoctors FROM Doctors;



-- CLAUSES and operators..............................................
-- 1. Find doctors whose names start with 'Dr. A' (LIKE)
SELECT * FROM Doctors WHERE Name LIKE 'Dr. A%';

-- 2. Find doctors specializing in either 'Cardiologist' or 'Neurologist' (IN)
SELECT * FROM Doctors WHERE Specialty IN ('Cardiologist', 'Neurologist');

-- 3. Find doctors with experience between 5 and 15 years (BETWEEN)
SELECT * FROM Doctors WHERE Experience BETWEEN 5 AND 15;

-- 4. Find doctors who are either Cardiologists or have more than 10 years of experience (OR)
SELECT * FROM Doctors WHERE Specialty = 'Cardiologist' OR Experience > 10;

-- 5. Find doctors who are Neurologists and have more than 5 years of experience (AND)
SELECT * FROM Doctors WHERE Specialty = 'Neurologist' AND Experience > 5;

-- 6. Sort doctors by their experience in descending order (ORDER BY)
SELECT * FROM Doctors ORDER BY Experience DESC;

-- 7. Count the number of doctors in each specialty (GROUP BY)
SELECT Specialty, COUNT(*) AS TotalDoctors FROM Doctors GROUP BY Specialty;

-- 8. Find specialties that have more than 2 doctors (HAVING)
SELECT Specialty, COUNT(*) AS TotalDoctors 
FROM Doctors 
GROUP BY Specialty 
HAVING COUNT(*) > 2;

-- 9. Retrieve only the top 3 most experienced doctors (LIMIT)
SELECT * FROM Doctors ORDER BY Experience DESC LIMIT 3;

-- 10. List all unique specialties in the hospital (DISTINCT)
SELECT DISTINCT Specialty FROM Doctors;


-- 1. Find patients whose names contain 'Kumar' (LIKE)
SELECT * FROM Patients WHERE Name LIKE '%Kumar%';

-- 2. Find patients who have either 'Diabetes' or 'Heart Disease' (IN)
SELECT * FROM Patients WHERE Disease IN ('Diabetes', 'Heart Disease');

-- 3. Find patients between the ages of 30 and 50 (BETWEEN)
SELECT * FROM Patients WHERE Age BETWEEN 30 AND 50;

-- 4. Find patients who have 'Migraine' or are older than 40 (OR)
SELECT * FROM Patients WHERE Disease = 'Migraine' OR Age > 40;

-- 5. Find patients assigned to DoctorID 2 and having a disease related to the skin (AND)
SELECT * FROM Patients WHERE DoctorID = 2 AND Disease LIKE '%Skin%';

-- 6. Sort patients by their age in ascending order (ORDER BY)
SELECT * FROM Patients ORDER BY Age ASC;

-- 7. Count the number of patients assigned to each doctor (GROUP BY)
SELECT DoctorID, COUNT(*) AS TotalPatients FROM Patients GROUP BY DoctorID;

-- 8. Find doctors who have more than 2 patients assigned (HAVING)
SELECT DoctorID, COUNT(*) AS TotalPatients 
FROM Patients 
GROUP BY DoctorID 
HAVING COUNT(*) > 2;

-- 9. Retrieve the youngest 3 patients (LIMIT)
SELECT * FROM Patients ORDER BY Age ASC LIMIT 3;

-- 10. List all unique diseases in the hospital (DISTINCT)
SELECT DISTINCT Disease FROM Patients;


-- FUNCTION QUERIES...............................

SELECT COUNT(*) AS TotalDoctors FROM Doctors;

SELECT AVG(Age) AS AverageAge FROM Patients;

SELECT Name, MAX(Specialty) AS MostSpecialty FROM Doctors;

SELECT SUM(Age) AS TotalAge FROM Patients;

SELECT UPPER(Name) AS PatientName FROM Patients;


-- USER DEHINE FUNCTION (udf)..................................................................

DELIMITER //

CREATE FUNCTION GetRetirementAge(currentAge INT) RETURNS INT
DETERMINISTIC
BEGIN
    RETURN 65 - currentAge;
END //

DELIMITER ;

SELECT Name, GetRetirementAge(Experience + 30) AS YearsToRetirement FROM Doctors;



DELIMITER //

CREATE FUNCTION GetDoctorFullName(firstName VARCHAR(50), lastName VARCHAR(50)) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(firstName, ' ', lastName);
END //

DELIMITER ;

SELECT GetDoctorFullName('Rajesh', 'Sharma') AS FullName;


DELIMITER //

CREATE FUNCTION IsSeniorCitizen(patientAge INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF patientAge >= 60 THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //

DELIMITER ;

SELECT Name, Age, IsSeniorCitizen(Age) AS SeniorCitizen FROM Patients;


DELIMITER //

CREATE FUNCTION CalculateBill(amount DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN amount + (amount * 0.10);  -- Adding 10% tax
END //

DELIMITER ;

SELECT CalculateBill(5000) AS TotalBill;


DELIMITER //

CREATE FUNCTION GetAgeCategory(patientAge INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF patientAge < 18 THEN
        RETURN 'Child';
    ELSEIF patientAge BETWEEN 18 AND 60 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Senior Citizen';
    END IF;
END //

DELIMITER ;

SELECT Name, Age, GetAgeCategory(Age) AS AgeCategory FROM Patients;



-- JOINS AND ALIAS.................................................................................

SELECT p.Name AS PatientName, p.Age, p.Disease, d.Name AS DoctorName, d.Specialty 
FROM Patients p 
INNER JOIN Doctors d ON p.DoctorID = d.DoctorID;


SELECT d.Name AS DoctorName, d.Specialty, p.Name AS PatientName, p.Disease 
FROM Doctors d 
LEFT JOIN Patients p ON d.DoctorID = p.DoctorID;


SELECT p.Name AS PatientName, p.Age, d.Name AS DoctorName, d.Specialty 
FROM Patients p 
RIGHT JOIN Doctors d ON p.DoctorID = d.DoctorID;


SELECT p.Name AS PatientName, p.Age, d.Name AS DoctorName, d.Specialty 
FROM Patients p 
LEFT JOIN Doctors d ON p.DoctorID = d.DoctorID 

UNION 

SELECT p.Name AS PatientName, p.Age, d.Name AS DoctorName, d.Specialty 
FROM Patients p 
RIGHT JOIN Doctors d ON p.DoctorID = d.DoctorID;


SELECT d1.Name AS Doctor1, d2.Name AS Doctor2, d1.Specialty 
FROM Doctors d1 
JOIN Doctors d2 ON d1.Specialty = d2.Specialty AND d1.DoctorID <> d2.DoctorID;


-- VIEWA NAD CTE (Common Table Expressions) ..................................................

CREATE VIEW ActiveDoctors AS
SELECT DoctorID, Name, Specialty
FROM Doctors 
WHERE Specialty> 5;


CREATE VIEW PatientDoctorInfo AS
SELECT p.PatientID, p.Name AS PatientName, p.Age, p.Disease, d.Name AS DoctorName, d.Specialty
FROM Patients p
JOIN Doctors d ON p.DoctorID = d.DoctorID;


CREATE VIEW SeniorPatients AS
SELECT PatientID, Name, Age, Disease 
FROM Patients 
WHERE Age >= 60;


CREATE VIEW PatientCountPerDoctor AS
SELECT d.Name AS DoctorName, d.Specialty, COUNT(p.PatientID) AS TotalPatients
FROM Doctors d
LEFT JOIN Patients p ON d.DoctorID = p.DoctorID
GROUP BY d.Name, d.Specialty;


CREATE VIEW HighBillPatients AS
SELECT PatientID, Name, Age, Disease
FROM Patients
WHERE Age > 45;


WITH AgeData AS (
    SELECT Name, Age FROM Patients ORDER BY Age DESC LIMIT 1
)
SELECT * FROM AgeData;


WITH PatientAges AS (
    SELECT AVG(Age) AS AvgPatientAge FROM Patients
)
SELECT * FROM PatientAges;


WITH Doctors AS (
    SELECT DoctorID, Name, Specialty, ContactNumber
    FROM Doctors 
    WHERE ContactNumber >= 9876543212
)
SELECT * FROM Doctors;


-- STORED PROCEDURE.............................................

DELIMITER //

CREATE PROCEDURE AddDoctor(
    IN docName VARCHAR(100), 
    IN docSpecialty VARCHAR(50), 
    IN doContactNumber INT
)
BEGIN
    INSERT INTO Doctors (Name, Specialty, ContactNumber) 
    VALUES (docName, docSpecialty, doContactNumber);
END //

DELIMITER ;
CALL AddDoctor('Dr. Arjun Mehta', 'Cardiologist',9876543212 );

-- drop procedure ................
DROP PROCEDURE IF EXISTS AddDoctor;



DELIMITER //

CREATE PROCEDURE GetPatientsByDisease(IN diseaseName VARCHAR(50))
BEGIN
    SELECT * FROM Patients WHERE Disease = diseaseName;
END //

DELIMITER ;

CALL GetPatientsByDisease('Diabetes');


DELIMITER //

CREATE PROCEDURE UpdateDoctorExperience(
    IN docID INT, 
    IN newExperience INT
)
BEGIN
    UPDATE Doctors SET Experience = newExperience WHERE DoctorID = docID;
END //

DELIMITER ;

CALL UpdateDoctorExperience(2, 15);


DELIMITER //

CREATE PROCEDURE DeletePatient(IN patientID INT)
BEGIN
    DELETE FROM Patients WHERE PatientID = patientID;
END //

DELIMITER ;

CALL DeletePatient(5);


DELIMITER //

CREATE PROCEDURE CountPatientsPerDoctor()
BEGIN
    SELECT d.Name AS DoctorName, COUNT(p.PatientID) AS TotalPatients
    FROM Doctors d
    LEFT JOIN Patients p ON d.DoctorID = p.DoctorID
    GROUP BY d.Name;
END //

DELIMITER ;

CALL CountPatientsPerDoctor();


-- SUB-QUERIES....................................................

SELECT Name, Specialty, Experience
FROM Doctors
WHERE Experience > (SELECT AVG(Experience) FROM Doctors);

SELECT Name, Age, Disease
FROM Patients
WHERE DoctorID = (SELECT DoctorID FROM Doctors WHERE DoctorID = 2);

SELECT Name, Age, Disease
FROM Patients
WHERE PatientID = (SELECT MAX(PatientID) FROM Patients);


SELECT Name, Specialty
FROM Doctors
WHERE DoctorID NOT IN (SELECT DISTINCT DoctorID FROM Patients);


SELECT Name, Age, Disease
FROM Patients
WHERE Disease = (SELECT Disease FROM Patients WHERE PatientID = 5);


SELECT Name, Specialty
FROM Doctors
WHERE Experience = (SELECT MAX(Experience) FROM Doctors);


SELECT Name, Age, BillAmount
FROM Patients
WHERE BillAmount = (SELECT MAX(BillAmount) FROM Patients);


SELECT Name
FROM Doctors
WHERE DoctorID IN (SELECT DoctorID FROM Doctors GROUP BY DoctorID HAVING COUNT(Specialty) > 1);


SELECT Name, Age, BillAmount
FROM Patients
WHERE BillAmount > (SELECT AVG(BillAmount) FROM Patients);



-- DCL (Data Control Language) and TCL (Transaction Control Language).......................

-- DCL (Data Control Language)...................................................

GRANT SELECT ON Doctors TO 'user1'@'localhost';

GRANT INSERT, UPDATE ON Patients TO 'user2'@'localhost';


GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;


REVOKE SELECT ON Doctors FROM 'user1'@'localhost';


REVOKE INSERT ON Patients FROM 'user2'@'localhost';



-- TCL (Transaction Control Language)..............................................

START TRANSACTION;


COMMIT;


ROLLBACK;


START TRANSACTION;
INSERT INTO Doctors (Name, Specialty, Experience) VALUES ('Dr. Amit Kumar', 'Dermatologist', 8);
COMMIT;

START TRANSACTION;
INSERT INTO Doctors (Name, Specialty, Experience) VALUES ('Dr. Sunita', 'Orthopedist', 12);
INSERT INTO Doctors (Name, Specialty, Experience) VALUES ('Dr. Ramesh', 'Neurologist', 15);
COMMIT;

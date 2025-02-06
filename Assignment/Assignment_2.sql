-- Create the database
CREATE DATABASE Healthcare_System;
USE Healthcare_System;

-- Table 1: Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15)
);

/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

-- SELECT QUERIES.........................

select * from Patients;

select * from Patients WHERE DOB = '1993-09-25';

select * from Patients where LastName like '%davis%';

select * from Patients order by  Gender = 'Male';

DESCRIBE Patients;

SELECT FirstName,ContactNumber FROM Patients LIMIT 0, 1000;

SELECT ContactNumber, COUNT(*) 
FROM Patients 
GROUP BY ContactNumber 
HAVING COUNT(*) > 1;

SELECT FirstName FROM Patients GROUP BY FirstName; 

SELECT DOB FROM Patients GROUP BY DOB;

SELECT DOB, COUNT(*) FROM Patients GROUP BY DOB HAVING COUNT(*)>1;


-- ALTER QUERIES.....

ALTER TABLE Patients ADD COLUMN Report VARCHAR(100);

ALTER TABLE Patients ADD New_Patient_ID INT ;

ALTER TABLE Patients DROP COLUMN Report;

ALTER TABLE Patients MODIFY FirstName VARCHAR(15) NULL;

ALTER TABLE Patients MODIFY DOB DATE;

ALTER TABLE Patients MODIFY COLUMN LastName VARCHAR(15) NULL;

-- UPDATE QUERIES ...............................
SET SQL_SAFE_UPDATES=0;

UPDATE Patients SET FirstName = 'Rao'
 WHERE FirstName = 'Jhon';
 
 SELECT * FROM Patients WHERE FirstName = 'Rao';

UPDATE Patients SET  LastName = 'Patil'
WHERE LastName ='Smith';

-- DELETE QUERIES..............................
DELETE FROM Patients WHERE PatientID ='2';

DELETE FROM patients WHERE Gender ="Other";

-- TRUNCAT QUERIES............................
TRUNCATE TABLE Patients;

/*
This ALTER QUERIE will not going to execute because the COLUMN which we had mention
it contain's Duplicate value so if run this we will get a ERROR

ALTER TABLE Patients
 ADD CONSTRAINT uq_Contact_Number UNIQUE (ContactNumber);
 */
 
-- Insert sample records into each table
-- Patients
INSERT INTO Patients (FirstName, LastName, DOB, Gender, ContactNumber) VALUES
('John', 'Doe', '1980-05-15', 'Male', '1234567890'),
('Jane', 'Smith', '1990-08-20', 'Female', '987654321'),
('Alice', 'Johnson', '1985-03-12', 'Female', '1122334455'),
('Bob', 'Brown', '1978-01-23', 'Male', '2233445566'),
('Charlie', 'Davis', '2000-07-07', 'Other', '3344556677'),
('David', 'Wilson', '1982-10-11', 'Male', '4455667788'),
('Emma', 'Moore', '1995-12-05', 'Female', '5566778899'),
('Grace', 'Taylor', '1988-04-16', 'Female', '6677889900'),
('Henry', 'Anderson', '1993-09-25', 'Male', '7788990011'),
('Ivy', 'Thomas', '2002-11-30', 'Female', '8899001122');


-- Table 2: Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

select * from Doctors;

DROP TABLE Doctors;
-- SELECT QUERIES........................................

SELECT* FROM Doctors WHERE FirstName ="%S%";

SELECT ContactNumber, Email FROM Doctors; 

-- ALTER QUERIES.........................................

ALTER TABLE Doctors add COLUMN Report VARCHAR(100);

ALTER TABLE Doctors DROP COLUMN Report;

ALTER TABLE Doctors MODIFY COLUMN ContactNumber BIGINT DEFAULT 87496472456; -- (Ya wali Querie wright ha fir be jab ya run hua tu value jo default set ha vo nahi aya uska place pa 0 aya )

-- If there’s still an issue, verify the table structure with:
DESCRIBE Doctors;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Doctors SET Report = "Good Work"
WHERE REPORT= NULL;

UPDATE Doctors SET DoctorID = "11"
WHERE DoctorID ="1";

-- Doctors
INSERT INTO Doctors (FirstName, LastName, Specialty, ContactNumber, Email) VALUES
('Sarah', 'Clark', 'Cardiology', '9988776655', 's.clark@example.com'),
('Michael', 'Lewis', 'Dermatology', '8877665544', 'm.lewis@example.com'),
('Emily', 'Walker', 'Neurology', '7766554433', 'e.walker@example.com'),
('Daniel', 'Hall', 'Pediatrics', '6655443322', 'd.hall@example.com'),
('Sophia', 'King', 'Orthopedics', '5544332211', 's.king@example.com'),
('James', 'Scott', 'Oncology', '4433221100', 'j.scott@example.com'),
('Linda', 'Adams', 'Gastroenterology', '3322110099', 'l.adams@example.com'),
('Robert', 'Carter', 'Endocrinology', '', 'r.carter@example.com'),
('Lisa', 'Phillips', 'Psychiatry', '1100998877', 'l.phillips@example.com'),
('Kevin', 'Evans', 'Ophthalmology', '0099887766', 'k.evans@example.com');


-- Table 3: Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

select * from Appointments;
-- SELECT QUERIES........................................

SELECT* FROM Appointments WHERE Status ="%S%";

SELECT AppointmentDate, AppointmentTime FROM Appointments; 

-- ALTER QUERIES.........................................

ALTER TABLE Appointments add COLUMN Report VARCHAR(100);

ALTER TABLE Appointments DROP COLUMN Report;

ALTER TABLE Appointments 
MODIFY COLUMN status ENUM('Scheduled', 'Cancelled', 'Completed') DEFAULT 'Cancelled';
 -- (Ya wali Querie wright ha fir be jab ya run hua tu value jo default set ha vo nahi aya uska place pa 0 aya )

-- If there’s still an issue, verify the table structure with:
DESCRIBE Doctors;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Appointments SET Report = "Good Work"
WHERE REPORT;

UPDATE Appointments SET DoctorID = "11"
WHERE DoctorID ="1";


-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2024-01-10', '09:00:00', 'Scheduled'),
(2, 2, '2024-01-11', '10:00:00', 'Scheduled'),
(3, 3, '2024-01-12', '11:00:00', 'Scheduled'),
(4, 4, '2024-01-13', '12:00:00', 'Scheduled'),
(5, 5, '2024-01-14', '13:00:00', 'Scheduled'),
(6, 6, '2024-01-15', '14:00:00', 'Scheduled'),
(7, 7, '2024-01-16', '15:00:00', 'Scheduled'),
(8, 8, '2024-01-17', '16:00:00', 'Scheduled'),
(9, 9, '2024-01-18', '17:00:00', 'Scheduled'),
(10, 10, '2024-01-19', '18:00:00', 'Scheduled');

-- Table 4: MedicalRecords
CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    RecordDate DATE,
    PrescribedBy INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PrescribedBy) REFERENCES Doctors(DoctorID)
);

select * from MedicalRecords;
-- SELECT QUERIES........................................

SELECT* FROM MedicalRecords WHERE Treatment ="%S%";

SELECT Diagnosis, Treatment FROM MedicalRecords; 

-- ALTER QUERIES.........................................

ALTER TABLE MedicalRecords add COLUMN Report VARCHAR(100);

ALTER TABLE MedicalRecords DROP COLUMN Report;

ALTER TABLE MedicalRecords 
MODIFY COLUMN RecordDate BIGINT DEFAULT 20200105; -- Default value should match the BIGINT type

 -- (Ya wali Querie wright ha fir be jab ya run hua tu value jo default set ha vo nahi aya uska place pa 0 aya )

-- If there’s still an issue, verify the table structure with:
DESCRIBE Doctors;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  MedicalRecords SET Report = "Good Work"
WHERE REPORT;

UPDATE MedicalRecords SET PatientID = "11"
WHERE PatientID ="1";

-- MedicalRecords
INSERT INTO MedicalRecords (PatientID, Diagnosis, Treatment, RecordDate, PrescribedBy) VALUES
(1, 'Hypertension', 'Medication and Lifestyle Changes', '2023-12-01', 1),
(2, 'Acne', 'Topical Creams and Oral Antibiotics', '2023-11-15', 2),
(3, 'Migraine', 'Pain Relievers and Preventive Medication', '2023-11-10', 3),
(4, 'Asthma', 'Inhalers and Anti-inflammatory Drugs', '2023-11-05', 4),
(5, 'Fracture', 'Casting and Physical Therapy', '2023-10-25', 5),
(6, 'Diabetes', 'Insulin and Diet Management', '2023-10-20', 6),
(7, 'Irritable Bowel Syndrome', 'Dietary Adjustments and Medication', '2023-10-15', 7),
(8, 'Thyroid Disorder', 'Hormonal Therapy', '2023-10-10', 8),
(9, 'Depression', 'Therapy and Antidepressants', '2023-10-05', 9),
(10, 'Glaucoma', 'Eye Drops and Surgery', '2023-09-30', 10);

-- Table 5: Medications
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    SideEffects TEXT,
    Dosage VARCHAR(50),
    Price DECIMAL(10,2)
);

select * from Medications;

-- SELECT QUERIES........................................

SELECT* FROM Medications WHERE Description ="Pain Reliver%";

SELECT Name, Description FROM Medications; 

-- ALTER QUERIES.........................................

ALTER TABLE Medications add COLUMN Report VARCHAR(100);

ALTER TABLE Medications DROP COLUMN Report;

ALTER TABLE Medications 
MODIFY COLUMN Dosage VARCHAR(50)  DEFAULT '100mg'; -- Default value should match the BIGINT type

 -- (Ya wali Querie wright ha fir be jab ya run hua tu value jo default set ha vo nahi aya uska place pa 0 aya )

-- If there’s still an issue, verify the table structure with:
DESCRIBE Medications;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Medications SET Report = "Good Work"
WHERE REPORT;

UPDATE Medications SET MedicationID = "01"
WHERE MedicationID ="1";

-- Medications
INSERT INTO Medications (Name, Description, SideEffects, Dosage, Price) VALUES
('Aspirin', 'Pain reliever and anti-inflammatory', 'Nausea, Dizziness', '50mg', 10.00),
('Metformin', 'Blood sugar regulator for diabetes', 'Diarrhea, Nausea', '500mg', 12.50),
('Ibuprofen', 'Pain reliever', 'Stomach Upset, Nausea', '200mg', 8.75),
('Albuterol', 'Bronchodilator for asthma', 'Tremors, Palpitations', '100mcg', 15.00),
('Paracetamol', 'Pain reliever and fever reducer', 'Rash, Liver Damage', '500mg', 5.00),
('Omeprazole', 'Stomach acid reducer', 'Headache, Diarrhea', '20mg', 11.25),
('Losartan', 'Blood pressure medication', 'Dizziness, Fatigue', '50mg', 9.00),
('Citalopram', 'Antidepressant', 'Dry Mouth, Sleep Issues', '20mg', 18.75),
('Prednisone', 'Anti-inflammatory steroid', 'Weight Gain, Mood Swings', '10mg', 14.50),
('Amoxicillin', 'Antibiotic', 'Allergic Reactions, Nausea', '250mg', 7.50);


-- Table 6: Prescriptions
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    RecordID INT,
    MedicationID INT,
    Quantity INT,
    Instructions TEXT,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

select * from Prescriptions;

-- SELECT QUERIES........................................

SELECT* FROM Prescriptions WHERE Instructions ="%S%";

SELECT RecordID, Quantity FROM Prescriptions; 

-- ALTER QUERIES.........................................

ALTER TABLE Prescriptions add COLUMN Report VARCHAR(100);

ALTER TABLE Prescriptions DROP COLUMN Report;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Prescriptions SET Report = "Good Work"
WHERE REPORT;

UPDATE Prescriptions SET RecordID = "11"
WHERE RecordID ="1";


-- Prescriptions
INSERT INTO Prescriptions (RecordID, MedicationID, Quantity, Instructions) VALUES
(1, 7, 30, 'Take one tablet daily'),
(2, 3, 20, 'Apply cream twice daily'),
(3, 2, 15, 'Take one tablet after meals'),
(4, 4, 25, 'Inhale as needed'),
(5, 5, 10, 'Take one tablet for pain'),
(6, 1, 30, 'Take one tablet with water'),
(7, 6, 20, 'Take before meals'),
(8, 8, 15, 'Take one tablet daily'),
(9, 9, 10, 'Take as prescribed by doctor'),
(10, 10, 20, 'Take three times daily after meals');

-- Table 7: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    HeadOfDepartment VARCHAR(100),
    ContactNumber VARCHAR(15),
    Description TEXT
);

select * from Departments;

-- SELECT QUERIES........................................

SELECT* FROM Departments WHERE Description ="%S%";

SELECT ContactNumber, Location FROM Departments; 

-- ALTER QUERIES.........................................

ALTER TABLE Departments add COLUMN Report VARCHAR(100);

ALTER TABLE Departments DROP COLUMN Report;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Departments SET Report = "Good Work"
WHERE REPORT;

UPDATE Departments SET Location = "Building A, Floor 320"
WHERE Location ="Building A, Floor 3";


-- Departments
INSERT INTO Departments (Name, Location, HeadOfDepartment, ContactNumber, Description) VALUES
('Cardiology', 'Building A, Floor 3', 'Dr. Sarah Clark', '9988776655', 'Heart-related treatments'),
('Dermatology', 'Building B, Floor 1', 'Dr. Michael Lewis', '8877665544', 'Skin and hair care'),
('Neurology', 'Building C, Floor 2', 'Dr. Emily Walker', '7766554433', 'Nervous system disorders'),
('Pediatrics', 'Building A, Floor 1', 'Dr. Daniel Hall', '6655443322', 'Child healthcare'),
('Orthopedics', 'Building D, Floor 2', 'Dr. Sophia King', '5544332211', 'Bone and joint care'),
('Oncology', 'Building E, Floor 3', 'Dr. James Scott', '4433221100', 'Cancer treatment'),
('Gastroenterology', 'Building B, Floor 2', 'Dr. Linda Adams', '3322110099', 'Digestive system care'),
('Endocrinology', 'Building C, Floor 3', 'Dr. Robert Carter', '2211009988', 'Hormonal treatments'),
('Psychiatry', 'Building A, Floor 4', 'Dr. Lisa Phillips', '1100998877', 'Mental health care'),
('Ophthalmology', 'Building D, Floor 1', 'Dr. Kevin Evans', '0099887766', 'Eye care');


-- Table 8: Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

select * from Staff;

-- SELECT QUERIES........................................

SELECT* FROM Staff WHERE LastName ="Smith";

SELECT StaffID, Role FROM Staff; 

-- ALTER QUERIES.........................................

ALTER TABLE Staff add COLUMN Report VARCHAR(100);

ALTER TABLE Staff DROP COLUMN Report;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Departments SET Report = "Good Work"
WHERE REPORT;

UPDATE Staff SET Role = "Nurse"
WHERE Role ="Technician";

-- Staff
INSERT INTO Staff (FirstName, LastName, Role, DepartmentID) VALUES
('Anna', 'Smith', 'Nurse', 1),
('Tom', 'Brown', 'Technician', 2),
('Ella', 'Johnson', 'Receptionist', 3),
('Mark', 'Lee', 'Nurse', 4),
('Nina', 'White', 'Technician', 5),
('Paul', 'Green', 'Receptionist', 6),
('Sophia', 'Harris', 'Nurse', 7),
('Luke', 'Walker', 'Technician', 8),
('Chloe', 'Davis', 'Receptionist', 9),
('Ryan', 'Martinez', 'Technician', 10);


-- Table 9: Insurance
CREATE TABLE Insurance (
    InsuranceID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(100),
    PolicyNumber VARCHAR(50),
    CoverageAmount DECIMAL(10,2),
    ExpiryDate DATE,
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

select * from Insurance;

-- SELECT QUERIES........................................

SELECT* FROM Insurance WHERE CompanyName ="MedSecure";

SELECT PolicyNumber, ExpiryDate FROM Insurance; 

-- ALTER QUERIES.........................................

ALTER TABLE Insurance add COLUMN Report VARCHAR(100);

ALTER TABLE Insurance DROP COLUMN Report;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Insurance SET Report = "Good Work"
WHERE REPORT;

UPDATE Insurance 
SET CompanyName = "Horizon"  
WHERE CompanyName = "CareFirst";


-- Insurance
INSERT INTO Insurance (CompanyName, PolicyNumber, CoverageAmount, ExpiryDate, PatientID) VALUES
('LifeCare Insurance', 'POL12345', 100000.00, '2025-12-31', 1),
('HealthPlus', 'POL23456', 150000.00, '2024-11-30', 2),
('MedSecure', 'POL34567', 200000.00, '2026-10-15', 3),
('CareFirst', 'POL45678', 75000.00, '2023-09-10', 4),
('WellnessPro', 'POL56789', 120000.00, '2024-05-20', 5),
('LifeShield', 'POL67890', 50000.00, '2025-03-25', 6),
('PrimeHealth', 'POL78901', 80000.00, '2026-01-01', 7),
('SecureCare', 'POL89012', 180000.00, '2024-07-31', 8),
('EliteHealth', 'POL90123', 95000.00, '2025-10-10', 9),
('OptiCare', 'POL01234', 110000.00, '2026-06-15', 10);


-- Table 10: Billing
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    TotalAmount DECIMAL(10,2),
    PaidAmount DECIMAL(10,2),
    DueAmount DECIMAL(10,2),
    BillingDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

select * from Billing;

-- SELECT QUERIES........................................

SELECT* FROM Billing WHERE DueAmount ="200.00";

SELECT PaidAmount, DueAmount FROM Billing; 

-- ALTER QUERIES.........................................

ALTER TABLE Billing add COLUMN Report VARCHAR(100);

ALTER TABLE Billing DROP COLUMN Report;

--  UPDATE QUERIES.......................................
SET SQL_SAFE_UPDATES = 0;

UPDATE  Billing SET Report = "Good Work"
WHERE REPORT;

UPDATE Billing 
SET DueAmount = "500.00"  
WHERE DueAmount = "200.00";



-- Billing
INSERT INTO Billing (PatientID, TotalAmount, PaidAmount, DueAmount, BillingDate) VALUES
(1, 1000.00, 800.00, 200.00, '2024-01-10'),
(2, 2000.00, 1500.00, 500.00, '2024-01-11'),
(3, 1500.00, 1000.00, 500.00, '2024-01-12'),
(4, 2500.00, 2000.00, 500.00, '2024-01-13'),
(5, 1800.00, 1700.00, 100.00, '2024-01-14'),
(6, 3000.00, 2500.00, 500.00, '2024-01-15'),
(7, 1200.00, 1000.00, 200.00, '2024-01-16'),
(8, 1600.00, 1400.00, 200.00, '2024-01-17'),
(9, 1100.00, 900.00, 200.00, '2024-01-18'),
(10, 1400.00, 1200.00, 200.00, '2024-01-19');


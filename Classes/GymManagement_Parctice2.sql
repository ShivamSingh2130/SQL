create database gym;
use gym;

-- table 1
create table user(
user_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email varchar (50) unique,
phoneNo varchar(15),
gender enum('Male', 'Female', 'Other'),
join_date date
);

-- insert values
insert into user (first_name,last_name,email,phoneNo,gender,join_date)
values
('John', 'Doe', 'johndoe@example.com', '555-1234', 'Male', '2025-01-01'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 'Female', '2025-01-10'),
('Michael', 'Johnson', 'michaelj@example.com', '555-8765','Male', '2025-01-12'),
('Emily', 'Davis', 'emilydavis@example.com', '555-3456', 'Female', '2025-01-03'),
('Chris', 'Martinez', 'chrismartinez@example.com', '555-7654', 'Male', '2025-01-09');
select *from user;
 
 -- SELECT QUERIES.......
 
 SELECT * FROM User WHERE last_name = '%Doe%';
 
 SELECT first_name , phoneno FROM USER ;
 
 
 -- ALTER QUERIES......
 
 ALTER TABLE user
 ADD COLUMN Review VARCHAR(100);

ALTER TABLE USER 
DROP REVIEW;

-- UPDATE QUERIES....
SET SQL_SAFE_UPDATES=0;

UPDATE USER SET  first_name = 'Babu'
WHERE first_name = 'chris';
  
 UPDATE USER SET phoneno = '554455445'
 WHERE phoneno = '555-1234';
 
 -- RENAME QUERIES ......
 
 ALTER TABLE user RENAME COLUMN email TO Email;
 
 ALTER TABLE user RENAME COLUMN phoneNo TO mobileNo;

SELECT VERSION();

 
 -- TRUNCATE QUERIES ......
 TRUNCATE USER;

-- DLETE QUERIES........
/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM USER WHERE first_name ='emily';

SET SQL_SAFE_UPDATES=0;
DELETE FROM USER WHERE  join_date ='2025-01-01';

-- table 2
CREATE TABLE Memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_name VARCHAR(100),
    duration_months INT,
    price DECIMAL(10, 2),
    benefits TEXT
);

-- insert values
insert into memberships(membership_name,duration_months,price,benefits)
values
('Basic Membership', 1, 50.00, 'Access to gym equipment and locker rooms'),
('Premium Membership', 12, 500.00, 'Access to gym equipment, locker rooms, classes, and personal trainer'),
('Family Membership', 6, 300.00, 'Access for 2 adults and 2 children to all facilities'),
('Student Membership', 3, 120.00, 'Discounted rate for students, includes full access to gym'),
('VIP Membership', 24, 1000.00, 'Includes all services, priority booking, and free guest passes');
select * from memberships;


-- SELECT QUERIES.......
 
 SELECT * FROM memberships WHERE membership_name = '%VIP%';
 
 SELECT duration_months , benefits FROM memberships ;
 
 
 -- ALTER QUERIES......
 
 ALTER TABLE memberships
 ADD COLUMN Start_Date  timestamp Default current_timestamp;

ALTER TABLE memberships
DROP column Start_Date;

-- UPDATE QUERIES....
SET SQL_SAFE_UPDATES=0;

UPDATE memberships SET  duration_months = '32'
WHERE duration_months = '24';
  
 UPDATE memberships SET price = '10000.00'
 WHERE price = '1000.00';
 
 
 -- TRUNCATE QUERIES ......
 TRUNCATE USER;
 
 ALTER TABLE memberships RENAME COLUMN duration_months TO Duration;


-- DLETE QUERIES........
/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM memberships WHERE price ='50.00';

SET SQL_SAFE_UPDATES=0;
DELETE FROM memberships WHERE  benefits not like 'a%';


-- table 3
create table user_membership(
user_id int,
membership_id int,
start_date date,
end_date date,
foreign key (user_id) references user (user_id),
foreign key (membership_id) references memberships(membership_id)
);

-- insert values
insert into user_membership(user_id,membership_id,start_date,end_date)
values
(1, 1, '2025-01-01', '2025-02-01'),
(2, 2, '2025-01-10', '2026-01-10'),
(3, 2, '2025-01-12', '2025-07-12'),
(4, 4, '2025-01-03', '2025-04-03'),
(5, 3, '2025-01-09', '2027-01-09');
select * from user_membership;

-- SELECT QUERIES.......
 
 SELECT * FROM user_membership WHERE user_id = '3';
 
 SELECT start_date ,end_date FROM user_membership ;
 
 
 -- ALTER QUERIES......
 
 ALTER TABLE user_membership
 ADD COLUMN start_Month  timestamp Default current_timestamp;

ALTER TABLE user_membership
DROP column start_Month;

-- UPDATE QUERIES....
SET SQL_SAFE_UPDATES=0;

UPDATE user_membership SET  start_date = '2025-11-11'
WHERE start_date = '2025-01-01';
  
 UPDATE user_membership SET membership_id = '01'
 WHERE membership_id = '1';
 
 
 -- TRUNCATE QUERIES ......
 TRUNCATE USER_membership;

-- DLETE QUERIES........
/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM  user_membership WHERE membership_id ='01';

SET SQL_SAFE_UPDATES=0;
DELETE FROM user_membership WHERE  user_id not like '3%';

-- table 4
CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    certification VARCHAR(100),
    hire_date DATE,
    status ENUM('Active', 'Inactive')
);

-- insert values
INSERT INTO Trainers (first_name, last_name, email, phone, certification, hire_date, status)
VALUES
('David', 'Williams', 'davidwilliams@example.com', '555-9999', 'Certified Personal Trainer', '2024-12-01', 'Active'),
('Sarah', 'Brown', 'sarahbrown@example.com', '555-1122', 'Certified Yoga Instructor', '2024-08-15', 'Inactive'),
('James', 'Miller', 'jamesmiller@example.com', '555-3344', 'Certified Strength Coach', '2024-05-20', 'Active'),
('Olivia', 'Taylor', 'oliviataylor@example.com', '555-4455', 'Certified Nutritionist', '2024-11-01', 'Active'),
('Daniel', 'Wilson', 'danielwilson@example.com', '555-5566', 'Certified CrossFit Trainer', '2024-09-15', 'Active');
select *from trainers;

-- SELECT QUERIES.......
 
 SELECT * FROM Trainers WHERE first_name = 'James';
 
 SELECT hire_date ,certification FROM Trainers ;
 
 
 -- ALTER QUERIES......
 
 ALTER TABLE Trainers
 ADD COLUMN start_Month  timestamp Default current_timestamp;

ALTER TABLE Trainers
DROP column start_Month;

-- UPDATE QUERIES....
SET SQL_SAFE_UPDATES=0;

UPDATE Trainers SET  last_name = 'Mumbaikar'
WHERE last_name = 'Williams';
  
 UPDATE Trainers SET trainer_id = '01'
 WHERE trainer_id = '1';
 
 
 -- TRUNCATE QUERIES ......
 TRUNCATE Trainers;

-- DLETE QUERIES........
/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM  Trainers WHERE trainer_id ='01';

SET SQL_SAFE_UPDATES=0;
DELETE FROM Trainers WHERE first_name not like 'James%';


-- table 5
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer'),
    payment_status ENUM('Pending', 'Completed', 'Failed'),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- insert values
INSERT INTO Payments (user_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 50.00, '2025-01-05', 'Credit Card', 'Completed'),
(2, 120.00, '2025-01-12', 'Debit Card', 'Completed'),
(3, 500.00, '2025-01-11', 'Bank Transfer', 'Pending'),
(4, 60.00, '2025-01-06', 'Cash', 'Completed'),
(5, 300.00, '2025-01-09', 'Credit Card', 'Completed');

select * from Payments;

-- SELECT QUERIES.......
 
 SELECT * FROM Payments WHERE payment_status = 'Pending';
 
 SELECT user_id ,payment_date FROM Payments ;
 
 
 -- ALTER QUERIES......
 
 ALTER TABLE Payments
 ADD COLUMN start_Month  timestamp Default current_timestamp;

ALTER TABLE Payments
DROP column start_Month;

-- UPDATE QUERIES....
SET SQL_SAFE_UPDATES=0;

UPDATE Payments SET  payment_date = '2025-03-5'
WHERE payment_id = '1';
  
 UPDATE Payments SET Payment_method = 'Cash'
 WHERE payment_method = 'Bank Transfer';
 
 
 -- TRUNCATE QUERIES ......
 TRUNCATE Trainers;

-- DLETE QUERIES........
/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM  Payments WHERE Payment_id ='1';

SET SQL_SAFE_UPDATES=0;
DELETE FROM Payments WHERE Payment_method not like 'Cash%';


-- Table Alias
SELECT p.payment_ID, p.user_id, p.amount, p.payment_date, p.payment_method,p.payment_status
FROM Payments p;

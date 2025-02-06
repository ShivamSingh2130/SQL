/*                                                  Quiz_1 
											DataBase-Laptop_showroom
*/

/*
Task: Database- laptop_showroom
1. create 5 tables within minimum 5 attributes using proper datatypes 
and constraints  (100 points)
2. Insert values in each table (data must be unique and relevant).  (100 points)
3. write queries to drop, truncate nad show data for each table and database  (100 points)
4. Do proper documentation  (100 points)
5. write 10 queries (conditional) using select queries  (100 points) 
*/

-- create database laptop_showroom
CREATE DATABASE laptop_showroom;

-- After creating database use the database
USE laptop_showroom;


# task 1 
# create 5 tables within 5 attributes
# table-1 showroom_details
CREATE TABLE showroom_detail(
    showroom_id INT PRIMARY KEY AUTO_INCREMENT,
    Name varchar(50),
    Location varchar(50),
    contactNo varchar(50),
    laptop_id int
);

-- Insert values into table
INSERT INTO showroom_detail (Name, Location, contactNo, laptop_id)
VALUES
('xy showroom','Thane, Mumbai','0215-3330',2),
('Fingers','Kalyan, Mumbai','0251-2255',3),
('automoble','Navi mumabi','2510-0000',10),
('why showroom','Mumbai','0215-3565',6),
('Laptopzz','Karjat, Mumbai','0215-0021',7),
('Discord','Bandra, Mumbai','0215-6666',8),
('Nvidia','Dadar, Mumbai','0215-2541',1),
('Intel','New Delhi','0215-7771',4),
('Vivo','Kerla','0215-3333',9),
('pointer','Punjab','0215-1111',5);

-- Drop and truncate queries
drop table showroom_detail;
truncate table showroom_detail;

-- To show data we use
select*from showroom_detail;


-- table-2 laptops
CREATE TABLE laptop (
    laptop_id int primary key auto_increment,
    brand VARCHAR(50),
    model VARCHAR(50),
    price DECIMAL(10, 2),
    ReleaseDate DATE,
    showroom_id INT,
    FOREIGN KEY (showroom_id) REFERENCES showroom_detail(showroom_id)
);

-- insert values in table
INSERT INTO laptop (brand, model, price, ReleaseDate,showroom_id) 
VALUES
('Dell', 'XPS 13', 999.99, '2022-01-15',1),
('Apple', 'MacBook Air', 1199.99, '2023-03-01',1),
('HP', 'Spectre x360', 1399.99, '2022-05-10',2),
('Lenovo', 'ThinkPad X1 Carbon', 1299.99, '2022-08-20',3),
('Asus', 'ZenBook 14', 899.99, '2022-07-25',4),
('Acer', 'Swift 3', 749.99, '2022-04-15',5),
('Razer', 'Blade Stealth 13', 1799.99, '2023-02-01',6),
('Microsoft', 'Surface Laptop 4', 999.99, '2022-06-01',7),
('Samsung', 'Galaxy Book Pro', 1099.99, '2023-05-10',8),
('LG', 'Gram 14', 1399.99, '2023-03-20',9);

-- Drop and truncate queries
drop table laptop;
truncate table laptop;

-- To show data we use
select*from laptop;


-- table-3 customers
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values into table
INSERT INTO Customers (FirstName, LastName, Email, Phone) 
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
('Emily', 'Johnson', 'emily.johnson@example.com', '2345678901'),
('Michael', 'Brown', 'michael.brown@example.com', '3456789012'),
('Sarah', 'Davis', 'sarah.davis@example.com', '4567890123'),
('David', 'Clark', 'david.clark@example.com', '5678901234'),
('Linda', 'Miller', 'linda.miller@example.com', '6789012345'),
('Robert', 'Wilson', 'robert.wilson@example.com', '7890123456'),
('Jessica', 'Taylor', 'jessica.taylor@example.com', '8901234567'),
('Daniel', 'Anderson', 'daniel.anderson@example.com', '9012345678');

-- Drop and truncate queries
drop table Customers;
truncate table Customers;

-- To show data we use
select*from Customers;


-- table-4 sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    laptop_id INT,
    Customer_id INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (laptop_id) REFERENCES laptop(laptop_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);


-- insert values
INSERT INTO Sales (laptop_id, Customer_id, SaleDate, Quantity) 
VALUES
(1, 1,'2023-01-20', 1),
(2, 2,'2023-02-15', 1),
(3, 3,'2023-03-10', 2),
(4, 4,'2023-03-20', 1),
(5, 5,'2023-03-25', 1),
(6, 6,'2023-04-01', 1),
(7, 7,'2023-04-15', 1),
(8, 8,'2023-04-20', 1),
(9, 9,'2023-05-05', 1),
(10, 10,'2023-05-10', 1);

-- Drop and truncate queries
drop table Sales;
truncate table Sales;

-- To show data we use
select*from Sales;


-- table-5
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- insert values into table
INSERT INTO Suppliers (SupplierName, ContactPerson, Phone, Email) 
VALUES
('Tech Supply Co.', 'Alice Green', '5678901234', 'alice.green@techsupply.com'),
('Electro World', 'Bob White', '6789012345', 'bob.white@electroworld.com'),
('Laptop Haven', 'Charlie Black', '7890123456', 'charlie.black@laptophaven.com'),
('Gadgets Galore', 'Diana Silver', '8901234567', 'diana.silver@gadgetsgalore.com'),
('Computers Plus', 'Evan Gold', '9012345678', 'evan.gold@computersplus.com'),
('Best Buy Supplies', 'Fiona Blue', '0123456789', 'fiona.blue@bestbuysupplies.com'),
('PC World', 'George Red', '1234567890', 'george.red@pcworld.com'),
('ShopTech', 'Hannah Purple', '2345678901', 'hannah.purple@shoptech.com'),
('Laptops R Us', 'Ian Orange', '3456789012', 'ian.orange@laptopsrus.com'),
('Tech Haven', 'Judy Yellow', '4567890123', 'judy.yellow@techhaven.com');

-- Drop and truncate queries
drop table Suppliers;
truncate table Suppliers;

-- To show data we use
select*from Suppliers;



# Task-5 
-- ------------- 10 select queries --------------
-- 1.select specific column form suppliers table (Phone, Email)
select Phone, Email from Suppliers;

-- 2.select sales for specific customer
select * from Sales where Customer_id = 2;
 
-- 3.count no of laptops
select count(*) as total_no_of_laptops from Sales;
 
-- 4.select sales set in desc 
select * from Sales order by SaleDate desc limit 5;

-- 5.select laptop where price is greater tha 999.99
select * from laptop where price > 999.99;

-- 6.select showroon_detail which specific laptop id
select*from showroom_detail where laptop_id = 5;

-- 7.select showroom detail and show Names that have character length than 8
select * from showroom_detail where char_length(Name) > 8;

-- 8.show contactNo in  Asc order
select * from showroom_detail order by contactNo;

-- 9.select customers where firstname starting is J
select * from Customers where FirstName like 'J%';

-- 10.select suppliers where Phonenot like 000000000
select * from Suppliers where Phone not like 0000000000;
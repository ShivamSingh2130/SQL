/*1. CREATE A DATABASE - E-COMMERCE SYSTEM
2. CREATE 5 TABLES USING MIN 5 ATTRIBUTES, INCLUDING VARIOUS TYPES OF DATATYPES & MULTIPLE CONSTRAINTS
3. INSERT 5 RECORDS IN EACH TABLES & DO PROPER DOCUMENTATIONS
4. WRITE BASIC QUERIES FOR EACH TABLE INCLUDING-
	--> SHOW DATA 
    --> TRUNCATE DROP
    --> ALTER, UPDATE, DELETE
    --> RENAME
5. DO PROPER ANALYSIS ABOUT EACH TABLES, GENERATE REAL WORLD BASED SITUATION AND WRITE MISLENEOUS QUERIES INCLUDING
	--> FUNCTIONS, OPERATORS, ALIAS, CLAUSES
*/

CREATE DATABASE E_COMMERCE_SYSTEM;

USE E_COMMERCE_SYSTEM;

CREATE TABLE USERS(
USER_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
EMAIL VARCHAR(40),
MOBILE_NUMBER VARCHAR(12)
);

INSERT INTO USERS( FIRST_NAME, LAST_NAME, EMAIL, MOBILE_NUMBER )
VALUES
('SANKET','SABLE','sanketsable123@gmail.com','8291621013'),
('YASH','GARUD','yashgarud123@gmail.com','8489486668'),
('SHIVAM','SINGH','shivamsingh123@gmail.com','9984944664'),
('ANJALI','MALI','anjalimali123@gmail.com','7848662261'),
('MUKASHSHAF','MOMIN','mukashshafmomin123@gmail.com','8468684667');

-- SHOW DATA..............................
-- 1. select All column from the countries Table
SELECT LAST_NAME from USERS;

-- DROP FUNCTION..........................
DROP TABLE USERS;

-- Delete ..............

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM USERS WHERE FIRST_NAME ='SANKET';


-- TRUNCATE ...............
TRUNCATE TABLE USER;

-- ALTER TABLE...................
ALTER TABLE USERS ADD COLUMN Report VARCHAR(100);

-- UPDATE TABLE .................
SET SQL_SAFE_UPDATES=0;

UPDATE USERS SET Report = 'Good'
 WHERE Report =Null;
 
 -- RENAME .......................
 ALTER TABLE USERS RENAME COLUMN EMAIL TO email;

select * from Users;



CREATE TABLE PRODUCTS(
PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50),
DESCRIPTION VARCHAR(200),
PRICE VARCHAR(10),
QUANTITY VARCHAR(10) -- PER BOX
);

DROP TABLE PRODUCTS;
INSERT INTO PRODUCTS( NAME, DESCRIPTION, PRICE, QUANTITY )
VALUES 
('SMART WATCH','ROUGH AND TOUGH, WATER RESISTANCE AND ACCURATE IN FITNESS','2999','30'),
('BLUETOOTH NECKBAND','RELIABLE AND NOISE CANCELLATION SYSTEM','899','20'),
('BLUETOOTH EARBUDS','LOW LATENCY, WATER RESISTENCE AND NOISE CANCELLATION','1200','26'),
('SMART PHONES','6.9 INCH DISPLAY, 128GB STORAGE','12999','25'),
('LAPTOPS','GAMING LAPTOP WITH NVIDIA GRAPHICS OF 3040 512GB SSD','48999','45');

Select * from PRODUCTS;

-- SHOW DATA..............................
-- 1. select All column from the countries Table
SELECT NAME from PRODUCTS;

-- DROP FUNCTION..........................
DROP TABLE PRODUCTS;

-- Delete ..............

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM PRODUCTS WHERE NAME ='SMART WATCH';

-- TRUNCATE ...............
TRUNCATE TABLE PRODUCTS;

-- ALTER TABLE...................
ALTER TABLE PRODUCTS ADD COLUMN Report VARCHAR(100);

-- UPDATE TABLE .................
SET SQL_SAFE_UPDATES=0;

UPDATE PRODUCTS SET Report = 'Good'
 WHERE Report =Null;
 
 -- RENAME .......................
 ALTER TABLE PRODUCTS RENAME COLUMN PRICE TO price;



CREATE TABLE ORDERS(
ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
USER_ID INT,
ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
STATUS VARCHAR(30),
TOTAL_AMOUNT VARCHAR(30),
FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);
DROP TABLE ORDERS;
INSERT INTO ORDERS( USER_ID, STATUS, TOTAL_AMOUNT )
VALUES
(1,'PROCESSING','15000'),
(2,'SHIPPED','20000'),
(3,'DELIVERED','50000'),
(4,'SHIPPED','13000'),
(5,'DELIVERED','55000');

-- SHOW DATA..............................
-- 1. select All column from the countries Table
SELECT STATUS from ORDERS;

-- DROP FUNCTION..........................
DROP TABLE ORDERS;

-- Delete ..............

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM ORDERS WHERE STATUS = 'DELIVERED';


-- TRUNCATE ...............
TRUNCATE TABLE ORDERS;

-- ALTER TABLE...................
ALTER TABLE ORDERS ADD COLUMN Report VARCHAR(100);

-- UPDATE TABLE .................
SET SQL_SAFE_UPDATES=0;

UPDATE ORDERS SET Report = 'Good'
 WHERE Report =Null;
 
 -- RENAME .......................
 ALTER TABLE ORDERS RENAME COLUMN STATUS TO Status;

select * from ORDERS;



CREATE TABLE ORDER_ITEMS(
ORDER_ITEM_ID INT PRIMARY KEY AUTO_INCREMENT,
ORDER_ID INT NOT NULL,
PRODUCT_ID INT NOT NULL,
QUANTITY VARCHAR(20),
PRICE_PER_UNIT VARCHAR(20),
TOTAL_AMOUNT VARCHAR(10),
FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID) 
);
DROP TABLE ORDER_ITEMS;
INSERT INTO ORDER_ITEMS( ORDER_ID, PRODUCT_ID, QUANTITY, PRICE_PER_UNIT, TOTAL_AMOUNT)
VALUES
(1,1,'2','2999','5998'),
(2,4,'3','12999','38997'),
(3,2,'6','899','5394'),
(4,3,'5','1200','6000'),
(5,5,'4','48999','195996');

-- SHOW DATA..............................
-- 1. select All column from the countries Table
SELECT QUANTITY from ORDER_ITEMS;

-- DROP FUNCTION..........................
DROP TABLE ORDER_ITEMS;

-- Delete ..............

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM ORDER_ITEMS WHERE QUANTITY = '5';


-- TRUNCATE ...............
TRUNCATE TABLE ORDER_ITEMS;

-- ALTER TABLE...................
ALTER TABLE ORDER_ITEMS ADD COLUMN Report VARCHAR(100);

-- UPDATE TABLE .................
SET SQL_SAFE_UPDATES=0;

UPDATE ORDER_ITEMS SET Report = 'Good'
 WHERE Report =Null;
 
 -- RENAME .......................
 ALTER TABLE ORDER_ORDERS RENAME COLUMN STATUS TO Status;

SELECT * from ORDER_ITEMS;


CREATE TABLE CATEGORIES(
CATEGORY_ID INT PRIMARY KEY AUTO_INCREMENT,
PRODUCT_ID INT,
NAME VARCHAR(50),
DESCRIPTION VARCHAR(200),
STOCK_AVAILABLE INT,
RESTOCK_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

INSERT INTO CATEGORIES( PRODUCT_ID, NAME, DESCRIPTION, STOCK_AVAILABLE)
VALUES
(1,'WEARABALES','ROUGH AND TOUGH, WATER RESISTANCE AND ACCURATE IN FITNESS',12),
(2,'KDM','RELIABLE AND NOISE CANCELLATION SYSTEM',10),
(3,'NOISE','LOW LATENCY, WATER RESISTENCE AND NOISE CANCELLATION',8),
(4,'SAMSUNG','6.9 INCH DISPLAY, 128GB STORAGE',5),
(5,'ACER','GAMING LAPTOP WITH NVIDIA GRAPHICS OF 3040 512GB SSD',3);

-- SHOW DATA..............................
-- 1. select All column from the countries Table
SELECT NAME from CATEGORIES;

-- DROP FUNCTION..........................
DROP TABLE CATEGORIES;

-- Delete ..............

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM CATEGORIES WHERE STATUS = 'pRODUCT_ID';


-- TRUNCATE ...............
TRUNCATE TABLE CATEGORIES;

-- ALTER TABLE...................
ALTER TABLE CATEGORIES ADD COLUMN Report VARCHAR(100);

-- UPDATE TABLE .................
SET SQL_SAFE_UPDATES=0;

UPDATE CATEGORIES SET Report = 'Good'
 WHERE Report =Null;
 
 -- RENAME .......................
 ALTER TABLE CATEGORIES RENAME COLUMN STATUS TO Status;


SELECT * FROM CATEGORIES;

-- Table Alias
SELECT C.CATEGORY_ID, C.PRODUCT_NAME, C.NAME, C.DESCRIPTION,C.STOCK_AVAILABLE,C.RESTOCK_DATE,C.Report 
FROM CATEGORIES C;


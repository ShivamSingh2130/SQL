-- Create the database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(100),
    BirthYear INT
);

INSERT INTO Authors (Name, Country, BirthYear) VALUES
('J.K. Rowling', 'United Kingdom', 1965),
('George R.R. Martin', 'United States', 1948),
('J.R.R. Tolkien', 'United Kingdom', 1892),
('Agatha Christie', 'United Kingdom', 1890),
('Dan Brown', 'United States', 1964);

SELECT * FROM Authors;


/*Implement DDL (Data Definition Language)
Using DDL commands like CREATE, ALTER, DROP, etc., to define and manage the structure of the database.*/

-- ALTER QUERIES...............................
ALTER TABLE Authors ADD COLUMN Intrest VARCHAR(100);

-- DROP QUERIES................................
ALTER TABLE Authors DROP COLUMN Intrest;


 /*Implement DML (Data Manipulation Language)

Insert sample data into your tables using INSERT commands.
Update existing records with UPDATE statements.
Delete unwanted records with DELETE statements.*/

-- UPDATE QUERIES..................................

SET SQL_SAFE_UPDATES=0;
UPDATE Authors SET Intrest = "Intrested"
WHERE Intrest = NULL;

-- INSERT QUERIES....................................
INSERT INTO Authors (Name, Country) 
VALUES ('KUMAR VISHWAS', 'INDIA');

-- DELETE QUERIES....................................
DELETE FROM Authors WHERE NAME ='J.K.Rowling';


/*Use DQL (Data Query Language)
Write SELECT queries to fetch specific data from your tables.*/

SELECT Name,Country FROM Authors;

SELECT *FROM Authors WHERE Country ='INDIA';


/*Incorporate Clauses
Use clauses like:
WHERE: Filter records...................
GROUP BY: Organize data into groups................
HAVING: Apply conditions to groups...........................
ORDER BY: Sort data....................................................  */

SELECT * FROM Authors;
-- WHERE CLAUSE.............................

-- SELECT 'Insert' FROM Author WHERE 

SELECT Country FROM Authors WHERE Country="INDIA"; -- (=) THIS SYMBOL IS USE TO SELECT ONE VALUE WHICH WAS WRITTEN.

SELECT Country FROM Authors WHERE Country IN ("INDIA","United States","United Kingdom"); -- TO SELECT MULTIPLE VALUES WE SHOULD USE (IN) CLAUSE IF WE USE (=) SYMBOL IT WILL GIVE YOU AN ERROR.

-- GROUP BY CALAUSE..............................................


-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Mystery'),
('Fantasy'),
('Science Fiction'),
('Biography');

SELECT * FROM Categories;

-- Table: Publishers
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(100)
);

INSERT INTO Publishers (Name, Country) VALUES
('Penguin Books', 'United Kingdom'),
('HarperCollins', 'United States'),
('Hachette Livre', 'France'),
('Macmillan Publishers', 'United Kingdom'),
('Simon & Schuster', 'United States');

SELECT * FROM Publishers;

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    CategoryID INT,
    PublisherID INT,
    YearPublished INT,
    ISBN VARCHAR(13),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

INSERT INTO Books (Title, AuthorID, CategoryID, PublisherID, YearPublished, ISBN) VALUES
('Harry Potter and the Philosopher\'s Stone', 1, 3, 1, 1997, '9780747532743'),
('A Game of Thrones', 2, 3, 2, 1996, '9780553103540'),
('The Hobbit', 3, 3, 1, 1937, '9780618968633'),
('Murder on the Orient Express', 4, 2, 4, 1934, '9780062693662'),
('The Da Vinci Code', 5, 2, 5, 2003, '9780307474278');

SELECT * FROM Books;

-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Members (Name, Address, PhoneNumber, Email) VALUES
('John Doe', '123 Main St, City A', '123-456-7890', 'johndoe@example.com'),
('Jane Smith', '456 Elm St, City B', '234-567-8901', 'janesmith@example.com'),
('Alice Johnson', '789 Oak St, City C', '345-678-9012', 'alicej@example.com'),
('Bob Brown', '101 Pine St, City D', '456-789-0123', 'bobb@example.com'),
('Charlie White', '202 Cedar St, City E', '567-890-1234', 'charliew@example.com');

SELECT * FROM Members;

-- Table: Locations
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    SectionName VARCHAR(100),
    Floor INT
);

INSERT INTO Locations (SectionName, Floor) VALUES
('Fiction', 1),
('Non-Fiction', 2),
('Reference', 3),
('Children', 1),
('Archives', -1);

SELECT * FROM Locations;

-- Table: Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE
);

INSERT INTO Staff (Name, Position, HireDate) VALUES
('Emma Green', 'Librarian', '2015-06-01'),
('Liam Johnson', 'Assistant Librarian', '2018-09-15'),
('Sophia Brown', 'Archivist', '2020-11-20'),
('James Wilson', 'Technician', '2019-03-10'),
('Olivia Taylor', 'Manager', '2014-02-28');

SELECT * FROM Staff;


-- Table: BorrowRecords
CREATE TABLE BorrowRecords (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    DueDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, DueDate, ReturnDate) VALUES
(1, 1, '2025-01-01', '2025-01-15', '2025-01-10'),
(2, 2, '2025-01-05', '2025-01-20', NULL),
(3, 3, '2025-01-08', '2025-01-22', NULL),
(4, 4, '2025-01-10', '2025-01-24', '2025-01-20'),
(5, 5, '2025-01-12', '2025-01-26', NULL);

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM BorrowRecords;

-- Table: Fines
CREATE TABLE Fines (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowID INT,
    Amount DECIMAL(5, 2),
    Paid BOOLEAN,
    FOREIGN KEY (BorrowID) REFERENCES BorrowRecords(BorrowID)
);

INSERT INTO Fines (BorrowID, Amount, Paid) VALUES
(1, 0.00, TRUE),
(2, 5.00, FALSE),
(3, 0.00, TRUE),
(4, 2.50, TRUE),
(5, 0.00, FALSE);

SELECT * FROM Fines;

-- Table: Transactions
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Transactions (MemberID, Amount, TransactionDate) VALUES
(1, 0.00, '2025-01-10'),
(2, 5.00, '2025-01-20'),
(3, 0.00, '2025-01-22'),
(4, 2.50, '2025-01-20'),
(5, 0.00, '2025-01-26');

DROP TABLE Transactions;
SELECT * FROM Transactions;

CREATE database Restaurant ;
use Restaurant;


-- Creating Tables

CREATE TABLE Menu (
    Item_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    Category VARCHAR(50)
);
select * from Menu;

-- This are the some Example of how can we found MIN and Max in Menu Table............................................

SELECT MAX(Price) 
FROM Menu 
WHERE Price < (SELECT MAX(Price) FROM Menu);

SELECT min(Price) 
FROM Menu 
WHERE Price > (SELECT min(Price) FROM Menu);

SELECT MAX(Price) AS MAX_Price FROM Menu;

SELECT min(Price) AS min_Price FROM Menu;






-- Inserting Records into Menu
INSERT INTO Menu VALUES
(1, 'Margherita Pizza', 'Classic cheese and tomato pizza', 8.99, 'Main Course'),
(2, 'Caesar Salad', 'Fresh salad with Caesar dressing', 6.50, 'Starter'),
(3, 'Spaghetti Bolognese', 'Pasta with meat sauce', 10.99, 'Main Course'),
(4, 'Chocolate Cake', 'Rich chocolate dessert', 5.50, 'Dessert'),
(5, 'Grilled Chicken', 'Served with roasted vegetables', 12.50, 'Main Course'),
(6, 'French Fries', 'Crispy fried potatoes', 3.99, 'Side'),
(7, 'Chicken Wings', 'Spicy wings with dip', 7.99, 'Starter'),
(8, 'Tiramisu', 'Italian dessert with coffee flavor', 6.99, 'Dessert'),
(9, 'Vegetable Soup', 'Hot soup with fresh vegetables', 4.99, 'Starter'),
(10, 'Cheeseburger', 'Beef patty with cheese and lettuce', 8.50, 'Main Course');


CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

select * from Customers;

-- Inserting Records into Customers
INSERT INTO Customers VALUES
(1, 'John Doe', '1234567890', 'john.doe@example.com', '123 Elm Street'),
(2, 'Jane Smith', '9876543210', 'jane.smith@example.com', '456 Oak Avenue'),
(3, 'Michael Brown', '4561237890', 'michael.brown@example.com', '789 Pine Road'),
(4, 'Emily Davis', '7891234560', 'emily.davis@example.com', '321 Maple Lane'),
(5, 'Sarah Johnson', '6547893210', 'sarah.johnson@example.com', '654 Birch Way'),
(6, 'James Wilson', '3219876540', 'james.wilson@example.com', '987 Cedar Drive'),
(7, 'Olivia Martinez', '2589631470', 'olivia.martinez@example.com', '852 Aspen Circle'),
(8, 'William Anderson', '1478523690', 'william.anderson@example.com', '159 Walnut Street'),
(9, 'Sophia Thomas', '3692581470', 'sophia.thomas@example.com', '753 Cherry Lane'),
(10, 'Daniel Lee', '7418529630', 'daniel.lee@example.com', '951 Poplar Avenue');




CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
select * from Orders;
-- Inserting Records into Orders
INSERT INTO Orders VALUES
(1, 1, '2025-01-01', 25.48, 'Credit Card'),
(2, 2, '2025-01-02', 18.50, 'Cash'),
(3, 3, '2025-01-03', 45.99, 'Debit Card'),
(4, 4, '2025-01-04', 32.75, 'UPI'),
(5, 5, '2025-01-05', 27.50, 'Credit Card'),
(6, 6, '2025-01-06', 15.99, 'Cash'),
(7, 7, '2025-01-07', 54.25, 'UPI'),
(8, 8, '2025-01-08', 39.99, 'Debit Card'),
(9, 9, '2025-01-09', 20.75, 'Cash'),
(10, 10, '2025-01-10', 63.50, 'Credit Card');




CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2),
    Contact_Number VARCHAR(15)
);

select * from Staff;

-- Inserting Records into Staff
INSERT INTO Staff VALUES
(1, 'Alice Johnson', 'Manager', 50000, '5551112222'),
(2, 'Bob Williams', 'Chef', 40000, '5553334444'),
(3, 'Cathy Brown', 'Waiter', 20000, '5555556666'),
(4, 'David Smith', 'Cleaner', 18000, '5557778888'),
(5, 'Evelyn Taylor', 'Cashier', 22000, '5559990000'),
(6, 'Frank Moore', 'Chef', 42000, '5551231234'),
(7, 'Grace Harris', 'Waiter', 21000, '5554564567'),
(8, 'Hank White', 'Security', 25000, '5557897890'),
(9, 'Ivy Martin', 'Manager', 52000, '5551472583'),
(10, 'Jack Davis', 'Dishwasher', 17000, '5553692581');



CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Item_Name VARCHAR(50),
    Quantity INT,
    Supplier VARCHAR(100),
    Restock_Date DATE
);

select * from Inventory;


-- Inserting Records into Inventory
INSERT INTO Inventory VALUES
(1, 'Tomato Sauce', 50, 'Food Supplies Co.', '2025-01-15'),
(2, 'Cheese', 30, 'Dairy Delights', '2025-01-14'),
(3, 'Chicken Breast', 40, 'Meat Masters', '2025-01-12'),
(4, 'Flour', 25, 'Baker Supplies', '2025-01-16'),
(5, 'Vegetables', 60, 'Fresh Produce Co.', '2025-01-10'),
(6, 'Spices', 35, 'Spice World', '2025-01-13'),
(7, 'Oil', 20, 'Cooking Essentials', '2025-01-18'),
(8, 'Beverages', 50, 'Drink Co.', '2025-01-17'),
(9, 'Dessert Mix', 15, 'Sweet Treats', '2025-01-11'),
(10, 'Bread', 40, 'Baker Supplies', '2025-01-14');


-- Creating Tables

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock_Quantity INT
);
select * from Products;
-- Inserting Records into Products
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 750.00, 50),
(2, 'Headphones', 'Accessories', 50.00, 100),
(3, 'Smartphone', 'Electronics', 500.00, 70),
(4, 'Gaming Console', 'Electronics', 300.00, 30),
(5, 'Smartwatch', 'Wearables', 200.00, 40),
(6, 'Tablet', 'Electronics', 350.00, 20),
(7, 'Wireless Mouse', 'Accessories', 25.00, 150),
(8, 'Keyboard', 'Accessories', 30.00, 120),
(9, 'Monitor', 'Electronics', 150.00, 35),
(10, 'External Hard Drive', 'Accessories', 100.00, 60);




CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Contact_Number VARCHAR(15),
    Address VARCHAR(255)
);
select * From Customers;
-- Inserting Records into Customers
INSERT INTO Customers VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
(2, 'Jane Smith', 'jane.smith@example.com', '9876543210', '456 Oak Avenue'),
(3, 'Michael Brown', 'michael.brown@example.com', '4561237890', '789 Pine Road'),
(4, 'Emily Davis', 'emily.davis@example.com', '7891234560', '321 Maple Lane'),
(5, 'Sarah Johnson', 'sarah.johnson@example.com', '6547893210', '654 Birch Way'),
(6, 'James Wilson', 'james.wilson@example.com', '3219876540', '987 Cedar Drive'),
(7, 'Olivia Martinez', 'olivia.martinez@example.com', '2589631470', '852 Aspen Circle'),
(8, 'William Anderson', 'william.anderson@example.com', '1478523690', '159 Walnut Street'),
(9, 'Sophia Thomas', 'sophia.thomas@example.com', '3692581470', '753 Cherry Lane'),
(10, 'Daniel Lee', 'daniel.lee@example.com', '7418529630', '951 Poplar Avenue');


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    Shipping_Address VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

select * from Orders;

-- Inserting Records into Orders
INSERT INTO Orders VALUES
(1, 1, '2025-01-01', 800.00, '123 Elm Street'),
(2, 2, '2025-01-02', 550.00, '456 Oak Avenue'),
(3, 3, '2025-01-03', 50.00, '789 Pine Road'),
(4, 4, '2025-01-04', 300.00, '321 Maple Lane'),
(5, 5, '2025-01-05', 225.00, '654 Birch Way'),
(6, 6, '2025-01-06', 375.00, '987 Cedar Drive'),
(7, 7, '2025-01-07', 180.00, '852 Aspen Circle'),
(8, 8, '2025-01-08', 150.00, '159 Walnut Street'),
(9, 9, '2025-01-09', 100.00, '753 Cherry Lane'),
(10, 10, '2025-01-10', 750.00, '951 Poplar Avenue');


CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    Payment_Date DATE,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

select * from Payments;
-- Inserting Records into Payments
INSERT INTO Payments VALUES
(1, 1, 800.00, 'Credit Card', '2025-01-01'),
(2, 2, 550.00, 'Debit Card', '2025-01-02'),
(3, 3, 50.00, 'UPI', '2025-01-03'),
(4, 4, 300.00, 'PayPal', '2025-01-04'),
(5, 5, 225.00, 'Credit Card', '2025-01-05'),
(6, 6, 375.00, 'Cash', '2025-01-06'),
(7, 7, 180.00, 'Debit Card', '2025-01-07'),
(8, 8, 150.00, 'UPI', '2025-01-08'),
(9, 9, 100.00, 'PayPal', '2025-01-09'),
(10, 10, 750.00, 'Credit Card', '2025-01-10');


CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Rating INT,
    Feedback VARCHAR(255),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

select * from Reviews;

-- Inserting Records into Reviews
INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Excellent product, highly recommend!'),
(2, 2, 2, 4, 'Good quality, but slightly expensive.'),
(3, 3, 3, 5, 'Great performance, worth the price!'),
(4, 4, 4, 4, 'Nice gaming console, but could improve packaging.'),
(5, 5, 5, 5, 'Stylish and functional, love it!'),
(6, 6, 6, 3, 'Average quality, not as expected.'),
(7, 7, 7, 4, 'Works well, decent value for money.'),
(8, 8, 8, 5, 'Excellent keyboard, very comfortable.'),
(9, 9, 9, 4, 'Good monitor, crisp display.'),
(10, 10, 10, 5, 'Fast and reliable external hard drive.');

-- Creating Tables

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    ISBN VARCHAR(20)
);
Select * from Books;
-- Inserting Records into Books
INSERT INTO Books VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '9780061120084'),
(2, '1984', 'George Orwell', 'Dystopian', '9780451524935'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '9780743273565'),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', '9780141040349'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '9780316769488'),
(6, 'Moby-Dick', 'Herman Melville', 'Adventure', '9781503280786'),
(7, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '9780547928227'),
(8, 'Harry Potter and the Sorcerer’s Stone', 'J.K. Rowling', 'Fantasy', '9780439708180'),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', '9780061122415'),
(10, 'The Book Thief', 'Markus Zusak', 'Historical Fiction', '9780375842207');


CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Membership_Date DATE,
    Contact_Number VARCHAR(15),
    Address VARCHAR(255)
);

Select * from Members;
-- Inserting Records into Members
INSERT INTO Members VALUES
(1, 'Alice Johnson', '2022-01-15', '5551112222', '123 Elm Street'),
(2, 'Bob Smith', '2021-03-10', '5553334444', '456 Oak Avenue'),
(3, 'Cathy Brown', '2023-07-22', '5555556666', '789 Pine Road'),
(4, 'David White', '2020-11-05', '5557778888', '321 Maple Lane'),
(5, 'Evelyn Taylor', '2022-09-30', '5559990000', '654 Birch Way'),
(6, 'Frank Moore', '2021-06-12', '5551231234', '987 Cedar Drive'),
(7, 'Grace Harris', '2023-02-18', '5554564567', '852 Aspen Circle'),
(8, 'Hank Martin', '2020-08-25', '5557897890', '159 Walnut Street'),
(9, 'Ivy Davis', '2022-04-14', '5551472583', '753 Cherry Lane'),
(10, 'Jack Lee', '2021-12-01', '5553692581', '951 Poplar Avenue');

CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY,
    Member_ID INT,
    Book_ID INT,
    Issue_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

Select * from Loans;
-- Inserting Records into Loans
INSERT INTO Loans VALUES
(1, 1, 1, '2025-01-01', '2025-01-15'),
(2, 2, 2, '2025-01-02', '2025-01-16'),
(3, 3, 3, '2025-01-03', '2025-01-17'),
(4, 4, 4, '2025-01-04', '2025-01-18'),
(5, 5, 5, '2025-01-05', '2025-01-19'),
(6, 6, 6, '2025-01-06', '2025-01-20'),
(7, 7, 7, '2025-01-07', '2025-01-21'),
(8, 8, 8, '2025-01-08', '2025-01-22'),
(9, 9, 9, '2025-01-09', '2025-01-23'),
(10, 10, 10, '2025-01-10', '2025-01-24');


CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact_Number VARCHAR(15),
    Shift_Timings VARCHAR(50)
);

Select * from Staff;
-- Inserting Records into Staff
INSERT INTO Staff VALUES
(1, 'Liam Walker', 'Librarian', '5551234567', '9 AM - 5 PM'),
(2, 'Emma Robinson', 'Assistant Librarian', '5552345678', '10 AM - 6 PM'),
(3, 'Noah Johnson', 'Library Clerk', '5553456789', '11 AM - 7 PM'),
(4, 'Olivia Davis', 'Technician', '5554567890', '12 PM - 8 PM'),
(5, 'William Martinez', 'Security', '5555678901', '8 AM - 4 PM'),
(6, 'Sophia Brown', 'Librarian', '5556789012', '1 PM - 9 PM'),
(7, 'James Wilson', 'Cataloger', '5557890123', '9 AM - 5 PM'),
(8, 'Mia Garcia', 'Archivist', '5558901234', '10 AM - 6 PM'),
(9, 'Benjamin Lee', 'Janitor', '5559012345', '7 AM - 3 PM'),
(10, 'Charlotte Smith', 'Receptionist', '5550123456', '8 AM - 4 PM');



CREATE TABLE Publishers (
    Publisher_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100)
);

Select * from Publishers;

-- Inserting Records into Publishers
INSERT INTO Publishers VALUES
(1, 'Penguin Random House', '1745 Broadway, New York, NY', '2125556789', 'contact@penguinrandomhouse.com'),
(2, 'HarperCollins', '195 Broadway, New York, NY', '2125557890', 'info@harpercollins.com'),
(3, 'Simon & Schuster', '1230 Avenue of the Americas, New York, NY', '2125558901', 'support@simonandschuster.com'),
(4, 'Macmillan Publishers', '120 Broadway, New York, NY', '2125559012', 'help@macmillan.com'),
(5, 'Hachette Book Group', '1290 Avenue of the Americas, New York, NY', '2125550123', 'info@hachettebookgroup.com'),
(6, 'Scholastic Corporation', '557 Broadway, New York, NY', '2125551234', 'contact@scholastic.com'),
(7, 'Oxford University Press', '198 Madison Avenue, New York, NY', '2125552345', 'info@oup.com'),
(8, 'Cambridge University Press', '1 Liberty Plaza, New York, NY', '2125553456', 'support@cambridge.org'),
(9, 'Wiley', '111 River Street, Hoboken, NJ', '2015554567', 'help@wiley.com'),
(10, 'Pearson Education', '221 River Street, Hoboken, NJ', '2015555678', 'contact@pearson.com');

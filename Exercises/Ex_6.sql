-- Create the airline database if it does not already exist

CREATE DATABASE IF NOT EXISTS airline123;

USE airline123; ----- Set the context to the airline database

-- Functions
/*
Functions in MySQL era predefined operations that can be used to perform calculations, manipulate data, and retrieve specific information. These functions make it easier to work with strings, numbers, dates, and more.
Functions-----
	1. Built-in functions (sum(), avg(),count()...)
	2. User defined functions
They are categorized as follows based on their functionality:

1. String Functions
These functions are used to manipulate and process string data.

LENGTH(str): Returns the length of the string.

CONCATE(str1, str2,....): Concatenates two or more string.alter

LOWER(str): Convert a string to lowercase.

SUBSTRING(str, start, length): Returns a substring from a string.

2. Numeric Functions
These functions perform operations on numeric data.

ROUND(number, decimals): Rounds a number to a specifled number of decimal places.

FLOOR(number): Returns the largest integer less than or equal to a number.

CEIL(number): Returns the smallest integer greater than or equal to a number.

ABS(number): Returns the absolute value of a number.

3. Date and Time Functions
These functions are used to manipulate and format date and time values.

NOW() Returns the current date and time

CURDATE(): Returns the cunnent date

DATE FORMAT(date, Format) formats a date according to a specified format.

DATEDIFF(datel, date2): Returns the difference in days between two dates.


4. Aggregate Functions
These functions perform calculations on a set of values and return a single value.

COUNT (expression):Returns the number of rows that match a specified condition.

SUM(column):Returns the sum of a numeric column.

AVG(column):Returns the average value of a numeric column.

MAX(column):Returns the maximum value of a column.

MIN(column):Returns the minimum value of a column.

5. Control Flow Functions
These functions allow for conditional logic in SQL queries.

IF(condition, true_value, false_value): Return one value if the condition is true and another value if it is false.

CASE: Provides a way to perform conditional logic in a more complex manner

6. Conversion Functions
These functions convert data from one type to another

CAST(expression AS type): Converts an expression to a specified data type.

CONVERT (expression, type): Similar to CAST, but with different syntax.

7. JSON Functions 
These functions are used to work with JSON data types.

JSON_EXTRACT(json_doc, path): Extracts data from a JSON document.

JSON_ARRAYAGG(value): Aggregates values into a JSON array.


User Defined Functions (UDFs)
MySQL allows users to create theort our functions for specific tasks.
*/
 -- ----------------------------------------------- Table Queries ----------------------------------------------------------------------------------------

-- Data Definition Language (DDL) (Create, Alter, Drop, Truncate, Rename, Comment}
-- Data Manipulation Language (DML) (Insert, Update, Delete}
-- Data Query Language (DOL) (select query)



-- Table-1 Create Flights table

-- Table-1 Create Flights table
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY, -- Unique identifier for each flight (Primary Key)
  Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
  Departure_Airport VARCHAR(100) NOT NULL, -- Name of the departure airport (Not Null)
  Arrival_Airport VARCHAR(100) NOT NULL, -- Name of the arrival airport (Not Null)
  Departure_Time DATETIME NOT NULL, -- Scheduled departure time (Not Null)
  Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
  Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
  Seats_Available INT NOT NULL CHECK (Seats_Available >= 0),
  -- Number of available seats (Not Null, must be non-negative)
  Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
  Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time'
  -- Current status of the flight (Not Null, default is 'On Time')
);
drop table Flights;

select * from Flights;
-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');


-- . Select Countries with a Description that is Not NULL
SELECT * FROM Flights WHERE  Arrival_Time  NOT like '2023-10-01 11:00:00' ;

-- . Select Countries with a Description that is Not NULL
SELECT * FROM Flights WHERE  Arrival_Time   like '2023-10-01 11:00:00' ;

-- select Flights where Departure_Airport names 'pune'

select * from Flights where Departure_Airport != 'Pune';

-- select Flights where DEparture_Airport names contain "a"
SELECT * FROM Flights WHERE Departure_Airport LIKE '%a%';

-- select Flights with a Aircraft_type starting with 'B'
select * from Flights where Aircraft_Type like 'B%';


-- Alter Queries .......

ALTER TABLE Flights
MODIFY COLUMN Aircraft_Type VARCHAR(10);


/*ALTER TABLE Flights
RENAME COLUMN Flight_Duration to Durations;*/


ALTER TABLE Flights
ADD COLUMN Feedback INT;

ALTER TABLE Flights
DROP COLUMN Feedback ;


ALTER TABLE Flights
ALTER COLUMN Feedback SET default '100';

ALTER TABLE Flights
MODIFY COLUMN Feedback INT ;


-- UPDATE Queries........

UPDATE Flights
set Arrival_Airport = 'Navi mumbai'
where flight_id = 1;

SET SQL_SAFE_UPDATES =0;

UPDATE Flights
SET Flight_Duration = 450, Seats_Available = '150'
WHERE Flight_Number = 'AI101';

UPDATE Flights
SET Flight_Duration =0
WHERE Flight_Duration <150;

UPDATE Flights
SET Departure_Airport= 'Gurugram,Harayana'
WHERE Flight_ID =14;

UPDATE Flights
SET Status = 'Delayed'
WHERE Flight_ID = 2;

-- Delete Queries.......

delete from Flights where status ='Delayed';

delete from Flights where Flight_ID ='AI103';

delete from Flights where Aircraft_Type ='Boeing A32';

delete from Flights where Departure_Time ='2023-10-01 16:00:00';

delete from Flights where Arrival_Time ='2023-10-01 17:30:00';

-- Mysql Alias

/*

In MySQL, an alias is a temporary name assigned to a table or a column for the duration of a query (within the scope of a query).
 Aliases are primarily used to enhance the readability and clarity of SQL statements, making it easier for users to understand the 
 purpose of the data being retrieved or manipulated.
Key Points about MySQL Aliases:

1. Temporary Nature:
Aliases exist only for the duration of the query. 
Once the query execution is complete, the alias ceases to exist.

2. Improved Readability:
By using aliases, you can simplify complex column names or provide more meaningful names
that betten describe the data. This is particularly useful when dealing with long or complicated column names.

Syntax:

For column aliases, the syntax is

SELECT column_name AS alias_neme 
FROM table_name;

-- For column aliases, the syntax, is..
SELECT column name AS alias_name 
FROM table_name;

-- Fon table aliases, the syntax is:
SELECT column_name 
FROM table_name AS alias_name;

3. Usage in Queries:
Aliases can be used in various SQL statements, i toluding SELECT, UPDATE, and DELETE. 
They can also be used in Lonjunction wits aggregate functions, joins, and subqueries.

4. No Impact on Database Structure:
Using an alias does not change the actual cable or column names in the database; 
it only affects how they are referenced in the query.
*/
-- Table Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport 
FROM Flights f;

-- Column Alias
SELECT f.Flight_ID AS ID, f.Flight_Number AS Num, f. Departure_Airport AS Departure, f.Arrival_Airport AS Arrival
 FROM Flights f;
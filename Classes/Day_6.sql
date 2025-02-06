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
 
 
 
 -- 9. UNION Clause
/*The UNION clause is used to combine the results of two or more SELECT 
statements. Duplicate rows are removed by default.*/



-- 1.Select Flights from Two Different Departure Airports
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport
FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport
FROM Flights
WHERE Departure_Airport = 'Mumbai (BOM)';

-- 2. Select All Delayer and Cancelled Flights
SELECT Flight_ID, Flight_Number, Status


-- 10.INTO Clause(MY SQL DOES NOT SUPPORT INTO CLAUSE DIRECTLY IN THIS WAY)
-- Create a new table to store flights with Less than 50 available seats
SELECT Flight_Number, Departure_Airport
INTO New_Flights_Table
FROM Flights
WHERE Seats_Available < 50;

-- Create a new table to store details of flights that are delayed
 SELECT Flight_ID, Flight_Number, Arrival_Airport
INTO Delayed_Flights
FROM Flights
WHERE Status = 'Delayed';


-- 11. CASE Clause

-- Select flight numbers and provide a descriptive status message
SELECT Flight_Number,
CASE
	WHEN Status = 'On Tâyme'THEN 'THEN Fligh is on schedule'
	WHEN Status = 'Delayed' THEN 'Flight ás delayed'
	ELSE 'Flight is cancelled'
	END AS Flight_Status
FROM Flights;

-- Select flight numbers and categorize then based on duration
SELECT Flight_Number,
CASE
	WHEN Flight_Duration <90 THEN 'Short Flight'
	WHEN Flight_Duration BETWEEN 90 AND 150 THEN 'MediumFlights'
    ELSE 'Long Flight'
    END AS Flight_Category
    FROM Flights;


-- 12. IN CLAUSE..............
-- Select all flights arriving at Mumbai (BOM) or Delhi (DEL)
SELECT *
FROM Flights
WHERE Arrival_Airport IN ('Mumbai (BOM), Delhi (DEL)');

-- Select all flights departing from Delhi (DEL), Chennai (MAA), or Bangalore (BLR)
SELECT *
FROM Flights
WHERE Departure_Airport IN ('Delhi (DEL)', 'Chennai (MAA)', 'Bangalore (BLR)');


-- 13. BETWEEN Clause
-- Select all flights with a duration between 128 and 150 minutes
SELECT *
FROM Flights
WHERE Flight_Duration BETWEEN 120 AND 150;

-- Select flights that depart between 8 Al and 12 PM on October 1, 2023
 SELECT *
FROM Flights
WHERE Departure_Time BETWEEN '2013-10-01 18:00:09' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 18 AM and 2 PM on October 1, 2023
SELECT *
FROM Flights
WHERE Arrival_Time BETWEEN '13923-19-23 10:00'AND '2008-12-01 14-99-99';


-- 14. LIKE Clause
-- Select all flights where the flight number starts with "AI
SELECT *
FROM Flights
WHERE Flight_Number LIKE 'AI%';

-- Select all flights where the flight number ends with '101"
SELECT *
FROM Flights
WHERE Flight_Number LIKE '%101';

-- 15. EXISTS Clause
-- Select all flights where there exist at least one cancelled flight to the same arrival airport
SELECT *
FROM Flights f
WHERE EXISTS (
SELECT 1
FROM Flights
WHERE Status = 'Cancelled' AND Arrival_Airport = f.Arrival_Airport
);

-- 16. As Clause
-- Create a new table with flight details
CREATE TABLE Flight_Summary AS
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport FROM Flights;

-- Select flight numbers and give them a custom alias
SELECT Flight_Number AS FlightCode FROM Flights;

-- Select flight duration in hours and give it a custom alIAS
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours
FROM Flights;



-- ............................................................TASK................................................................................................................

-- add a column then write a query to enter all details at 1 time.
ALTER TABLE Flights ADD Flight_Status VARCHAR(10);

select * from Flights;

-- Insert same value in a table column
UPDATE Flights
SET Flight_Status = Scheduled
WHERE Flight_ID IN (1, 2, 3, 4, 5, 7, 8, 9, 10,11,12,13,14,15);

-- Insert different value in a cable column
UPDATE Flights SET Status =
CASE
WHEN Flight_ID IN (1,2,3) THEN 'Scheduled'
WHEN Flight_ID IN (4, 5) THEN 'Departed'
WHEN Flight_ID IN (6,11,13) THEN 'Arrived'
WHEN Flight_ID IN (7,12) THEN 'Delayed'
WHEN Flight_ID IN (8,14,15) THEN 'Cancelled'
WHEN Flight_ID IN (9) THEN 'Diverted'
WHEN Flight_ID IN (10) THEN 'Held'
ELSE 'Unknown'
END
-- WHERE Flight_ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);
WHERE Flight_ID BETWEEN 1 AND 15;


-- Operators
/*
In NySQL, operators are special symbols or keywords that are used to perform operations on one or more operands
 (values or variables). Operators are fundamental to constructing SQL queries, as they allow you to manipulate 
 data, compare values, and perform calculations, MySQ, supports several types of operators, which can be categorized as follows: */

-- Arithmetic operators: +,-,*,/,%

-- Calculate the total flight duration for Flight Al161, adding 30 minutes for a layover
SELECT Flight_Number, Flight_Duration + 38 AS Total_Duration
FROM Flights
WHERE Flight_Number = 'A1101';

-- Calculate the remaining seats after booking 10 seats for Flight A1102
SELECT Flight_Number, Seats_Available -10 AS Remaining_Seats
FROM Flights
WHERE Flight_Number = 'AI105';

-- Comparison operators: =, <, >, <=, >=, != or <> (not equal to)

-- Select all details for the flight with Flight Number 'A1101'
SELECT*
FROM Flights
WHERE Flight_Number = 'AI101'; -- Using '=' operator

-- Select all flights with a duration less than 120 minutes
SELECT*
FROM Flights
WHERE Flight_Duration < 120; -- Using "<" operator



-- Logical operators: AND, OR, NOT

-- Find flights from Delhi to Mumbai that are on time and have available seats.
 SELECT * FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
AND Arrival_Airport = 'Mumbar (BOM)'
AND Status = 'On Time'
AND Seats_Available > 0;

-- Find flights that either depart from Delhi or arrive in Delhi.
SELECT *FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
OR Arrival_Airport = 'Delhi (DEL)';

-- String Operators: LIKE, REGEXP (REGULAR EXPRATION), NOT LIKE

-- Find flights with flight numbers starting with 'AI'.
SELECT *FROM
 Flights WHERE Flight_Number LIKE 'AI%';

-- Find flights that have 'Delhi in either the departure or arrival airport.
SELECT* FROM
 Flights WHERE Departure_Airport REGEXP 'Delhi' 
OR Arrival_Airport REGEXP 'Delhi';

-- Find flights that do not go to Chennai.
SELECT* FROM Flights
WHERE Arrival_Airport NOT LIKE 'Chennai (MAA)';
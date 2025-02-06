-- Single line Comment--

#This is also a single line comment
/*
multipleline
Comment
*/
/*
usage of comment

1. Documentation: Comments cabn be used to document the purpose of a sql query or the logic behind the complex operation
2. Debugging: You Can temporarily disiable parts of your SQL cod by commeting them out, wich is useful for debugging
3. Collaboration: when working in teams, comments help communication the intent and functionality of the code tp other developers.
*/
# Note : SQL is not case sensitive language as create  & CREATE will be treater as same.

/* MySQL, commands are instructions that you use to interact with the database.
They allow you to perform various operations such as creating databases and tables,
inserting and updating data, querying data, and managing user permissions.
MySQL commands can be categorized into several types based on their functionality:

DDL(Data Definition Language): Defines database structures (CREATE, ALTER, DROP, TRUNCATE).
 DML(Data Manipulation Language): Manipulates data (INSERT, UPDATE, DELETE)
DQL(Data Query Language): Queries data (SELECT).
DCL(Data Control Language): Controls access (GRANT, REVOKE).
TCL(Transaction Control Language): Manages transactions (COMMIT, ROLLBACK, SAVEPOINT).*/


 -- create a Database--
 create database Schoolxyz;
 /*   This command is used fro preventing us from data base not exists */
 Create database if not exists Schoolxyz;
 
 -- use and work on any database
 use Schoolxyz;
 
 #delete any database (ctrl+enter to execute query)
 drop database Schoolxyz;
 
 /* This command is used fro preventing us from data base not exists */
  drop database if exists Schoolxyz;
  
  -- Show all databases that exists in our DBMS ---------------------
  show databases;
 
 
 -- ------------------------------------------------Table Queries--------------------------------------------------------------------------------------
 -- Create a student table
 create table student(
 id int primary key, -- primary key= unique + not null
 name varchar(50) not null,
 age int not null,
 standard varchar(10) not null,
 gender varchar(10),
 division varchar(5)
 );
 
 
 -- show table data
select * from student;

-- method-1 to insert values
insert into student (id,name,age,standard,gender,division)
values
(1,'Jitesh',5,'2nd','male','A');

-- method-2 to insert values
insert into student
values
(2,'Mayuresh',5,'2nd','male','A');


-- remove all existing records from a table
truncate student;

-- remove complete table structure including attributes
# drop table student;

-- method-3 to insert multiple values
insert into student
values
(1,'Mayuresh',5,'2nd','male','A'),
(2,'Mayuresh',5,'2nd','male','A'),
(3,'Mayuresh',5,'2nd','male','A'),
(4,'Mayuresh',5,'2nd','male','A'),
(5,'Mayuresh',5,'2nd','male','A');


-- Create a Teachers table
 create table Teachers(
 id int primary key, -- primary key= unique + not null
 name varchar(50) not null,
 age int not null,
 standard varchar(10) not null,
 gender varchar(10),
 division varchar(5)
 );
 
 select * from Teachers;
 drop database if exists Teachers;
-- method 3 to insert multiple value 
insert into Teachers
 value
 (1,'Shivam',21,'12TH','male','A'),
 (2,'Shiva',28,'11TH','male','B'),
 (3,'Shiv',23,'11TH','male','C'),
 (4,'Yash',35,'10TH','male','R'),
 (5,'Ritik',40,'9TH','male','A');
  
create table Shivam(
id int primary key,
name VARCHAR (15),
Address VARCHAR (50),
Gender VARCHAR (10),
RollNumber  VARCHAR (5)
);

insert into Shivam
 value
 (21,'Babu','Thane','Male',2341),
 (22,'Yash','Mulund','Male',2241),
 (23,'Shiva','Goa','Male',2343),
 (24,'Ram','Kalayan','Male',23221),
 (25,'Sam','bhiwandi','Male',2321);
 
 select * from Shivam;

 
 
 
 

/*Database Design & Creation

Create Your Database: Name it appropriately based on your chosen theme.

3Create 25 Tables with Attributes, Datatypes, and Constraints
Each table must have at least 10 attributes with appropriate data types.
Include meaningful validations and constraints:
Primary Key, Foreign Key, NOT NULL, UNIQUE, CHECK, DEFAULT constraints.*/




 -- Database Creation.....................................
CREATE DATABASE NationalSportsFederation;
USE NationalSportsFederation;

 
-- 1. Athlete....................................

CREATE TABLE Athlete (
    AthleteID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female')),
    Nationality VARCHAR(50) NOT NULL,
    Height DECIMAL(5,2),
    Weight DECIMAL(5,2),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Athlete (FirstName, LastName, DateOfBirth, Gender, Nationality, Height, Weight, ContactNumber, Email)
VALUES
('John', 'Doe', '1995-05-15', 'Male', 'USA', 180.5, 75.0, '1234567890', 'johndoe@example.com'),
('Jane', 'Smith', '1997-11-20', 'Female', 'Canada', 165.0, 60.5, '0987654321', 'janesmith@example.com'),
('Michael', 'Johnson', '1994-03-02', 'Male', 'USA', 185.0, 80.0, '1122334455', 'michaeljohnson@example.com'),
('Emily', 'Davis', '1996-07-25', 'Female', 'Australia', 170.0, 68.0, '6677889900', 'emilydavis@example.com'),
('Chris', 'Brown', '1992-12-12', 'Male', 'UK', 178.0, 72.5, '3344556677', 'chrisbrown@example.com'),
('Anna', 'Lee', '1995-06-10', 'Female', 'South Korea', 160.0, 55.0, '2233445566', 'annalee@example.com'),
('Carlos', 'Mendez', '1998-04-07', 'Male', 'Mexico', 182.0, 85.0, '3344778899', 'carlosmendez@example.com'),
('Sarah', 'Taylor', '1993-08-19', 'Female', 'USA', 167.5, 62.0, '5566778899', 'sarahtaylor@example.com'),
('David', 'Williams', '1996-02-14', 'Male', 'Australia', 175.0, 70.5, '9988776655', 'davidwilliams@example.com'),
('Sophia', 'Wilson', '1994-12-04', 'Female', 'Canada', 162.0, 58.0, '2233557788', 'sophiawilson@example.com'),
('Ethan', 'Moore', '1997-09-09', 'Male', 'UK', 188.0, 95.0, '6677889999', 'ethanmoore@example.com'),
('Olivia', 'Harris', '1995-03-13', 'Female', 'New Zealand', 169.0, 63.0, '3344992211', 'oliviaharris@example.com'),
('Lucas', 'Jackson', '1996-10-21', 'Male', 'USA', 180.0, 80.0, '8899001122', 'lucasjackson@example.com'),
('Ava', 'King', '1999-01-04', 'Female', 'South Africa', 171.0, 59.0, '7788993344', 'avaking@example.com'),
('Mason', 'Young', '1994-11-15', 'Male', 'Canada', 177.0, 74.0, '6655441122', 'masonyoung@example.com'),
('Isabella', 'Scott', '1998-05-22', 'Female', 'USA', 168.0, 62.5, '5566774455', 'isabellascott@example.com'),
('Logan', 'Adams', '1997-06-30', 'Male', 'Australia', 179.0, 77.5, '6677551122', 'loganadams@example.com'),
('Mia', 'Baker', '1995-09-17', 'Female', 'UK', 160.5, 55.5, '2233445577', 'miabaker@example.com'),
('Jackson', 'Carter', '1996-04-02', 'Male', 'New Zealand', 184.0, 82.0, '9988773322', 'jacksoncarter@example.com');

SELECT * FROM Athlete;

-- 2. Sport............................................
CREATE TABLE Sport (
    SportID INT PRIMARY KEY AUTO_INCREMENT,
    SportName VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL CHECK (Category IN ('Individual', 'Team')),
    Description TEXT
);

INSERT INTO Sport (SportName, Category, Description)
VALUES
('Football', 'Team', 'A team sport played with a spherical ball between two teams of 11 players'),
('Basketball', 'Team', 'A team sport in which two teams of five players each try to score by shooting a ball through the opponent\'s hoop'),
('Tennis', 'Individual', 'A racket sport that can be played individually or in doubles'),
('Swimming', 'Individual', 'An individual or team racing sport that requires using one\'s entire body to move through water'),
('Boxing', 'Individual', 'A combat sport where two people fight using their fists'),
('Baseball', 'Team', 'A bat-and-ball game played between two opposing teams'),
('Rugby', 'Team', 'A team sport played with an oval ball and two teams of 15 players'),
('Golf', 'Individual', 'A sport where players use clubs to hit a ball into a series of holes on a course'),
('Table Tennis', 'Individual', 'A sport played with a small ball and rackets on a table divided by a net'),
('Cycling', 'Individual', 'The use of bicycles for transport, recreation, exercise, or sport'),
('Volleyball', 'Team', 'A team sport in which two teams of six players try to score by sending a ball over a net'),
('Cricket', 'Team', 'A bat-and-ball game played between two teams of eleven players'),
('Badminton', 'Individual', 'A racket sport played with shuttlecocks on a rectangular court'),
('Hockey', 'Team', 'A team sport played with a ball or puck on ice or grass'),
('Skiing', 'Individual', 'A sport where participants glide over snow on skis'),
('Track and Field', 'Individual', 'A collection of sports events based on running, jumping, and throwing'),
('Wrestling', 'Individual', 'A combat sport involving grappling and fighting techniques'),
('Archery', 'Individual', 'A sport of shooting arrows with a bow at targets'),
('Judo', 'Individual', 'A Japanese martial art focusing on throws and grappling');

SELECT * FROM Sport;


-- 3. Event..............................................
CREATE TABLE Event (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    SportID INT NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(100),
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

INSERT INTO Event (SportID, EventName, EventDate, Location)
VALUES
(1, 'World Cup 2022', '2022-11-21', 'Qatar'),
(2, 'NBA Finals 2023', '2023-06-01', 'USA'),
(3, 'Wimbledon 2023', '2023-07-03', 'London'),
(4, 'Olympics 2024 Swimming', '2024-07-25', 'Paris'),
(5, 'World Boxing Championship', '2024-06-10', 'Tokyo'),
(6, 'MLB World Series', '2023-10-20', 'USA'),
(7, 'Rugby World Cup', '2023-09-08', 'France'),
(8, 'Masters Tournament 2024', '2024-04-10', 'Augusta'),
(9, 'ITTF World Cup 2023', '2023-11-03', 'China'),
(10, 'Tour de France 2023', '2023-07-01', 'France'),
(11, 'FIVB Volleyball World Cup 2024', '2024-06-01', 'Japan'),
(12, 'ICC World Cup 2023', '2023-10-12', 'India'),
(13, 'BWF World Championships', '2024-08-20', 'Denmark'),
(14, 'Hockey World Cup 2024', '2024-01-13', 'India'),
(15, 'Winter Olympics 2024', '2024-02-10', 'China'),
(16, 'IAAF World Championships 2023', '2023-08-15', 'Hungary'),
(17, 'Wrestling World Championship 2024', '2024-09-01', 'Belarus'),
(18, 'Archery World Cup 2024', '2024-06-10', 'France'),
(19, 'Judo World Championships 2023', '2023-10-22', 'Doha'),
(20, 'FIFA U-20 World Cup', '2024-05-24', 'Argentina');

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Event;


-- 4. Team..................................................................
CREATE TABLE Team (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(100) NOT NULL,
    SportID INT NOT NULL,
    CoachName VARCHAR(100),
    TeamCountry VARCHAR(50) NOT NULL,
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

INSERT INTO Team (TeamName, SportID, CoachName, TeamCountry)
VALUES
('Manchester United', 1, 'Erik ten Hag', 'England'),
('Los Angeles Lakers', 2, 'Darvin Ham', 'USA'),
('Miami Heat', 2, 'Erik Spoelstra', 'USA'),
('Australia Swim Team', 4, 'Michael Bohl', 'Australia'),
('USA Boxing Team', 5, 'Freddie Roach', 'USA'),
('New York Yankees', 6, 'Aaron Boone', 'USA'),
('All Blacks', 7, 'Ian Foster', 'New Zealand'),
('USA Cycling Team', 10, 'Jonathan Vaughters', 'USA'),
('Chicago Bulls', 2, 'Billy Donovan', 'USA'),
('Real Madrid', 1, 'Carlo Ancelotti', 'Spain'),
('Indian Cricket Team', 12, 'Rohit Sharma', 'India'),
('German Football Team', 1, 'Hansi Flick', 'Germany'),
('India Rugby Team', 7, 'Eddie Jones', 'India'),
('Spain Basketball Team', 2, 'Sergio Scariolo', 'Spain'),
('Australia Cricket Team', 12, 'Pat Cummins', 'Australia'),
('Brazil Football Team', 1, 'Tite', 'Brazil'),
('China Table Tennis Team', 9, 'Liu Guoliang', 'China'),
('France Handball Team', 8, 'Guillaume Gille', 'France'),
('Italy Cycling Team', 10, 'Davide Cassani', 'Italy');

SELECT * FROM Team;


-- 5. AthleteTeam.............................................................
CREATE TABLE AthleteTeam (
    AthleteID INT,
    TeamID INT,
    JoiningDate DATE,
    PRIMARY KEY (AthleteID, TeamID),
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

INSERT INTO AthleteTeam (AthleteID, TeamID, JoiningDate)
VALUES
(1, 1, '2020-01-15'),
(2, 2, '2022-02-10'),
(3, 3, '2021-05-20'),
(4, 4, '2023-03-12'),
(5, 5, '2020-11-08'),
(6, 6, '2021-04-05'),
(7, 7, '2020-09-30'),
(8, 8, '2021-12-15'),
(9, 9, '2022-03-10'),
(10, 10, '2021-08-25'),
(11, 11, '2020-11-22'),
(12, 12, '2022-02-28'),
(13, 13, '2021-06-18'),
(14, 14, '2020-07-04'),
(15, 15, '2021-10-10'),
(16, 16, '2020-05-17'),
(17, 17, '2021-01-30'),
(18, 18, '2021-11-13'),
(19, 19, '2022-01-07'),
(20, 20, '2021-09-25');

SELECT * FROM AthleteTeam;


-- 6. Result...............................................................
CREATE TABLE Result (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT NOT NULL,
    AthleteID INT NOT NULL,
    Position INT NOT NULL CHECK (Position BETWEEN 1 AND 3),
    Time DECIMAL(5,2),
    Score INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

INSERT INTO Result (EventID, AthleteID, Position, Time, Score)
VALUES
(1, 1, 1, 90.0, NULL),
(2, 2, 2, NULL, 105),
(3, 3, 1, NULL, 25),
(4, 4, 3, 50.0, NULL),
(5, 5, 1, NULL, 120),
(6, 6, 2, NULL, 50),
(7, 7, 1, 25.5, NULL),
(8, 8, 3, NULL, 68),
(9, 9, 2, 30.0, NULL),
(10, 10, 1, NULL, 21),
(11, 11, 1, NULL, 95),
(12, 12, 2, 72.5, NULL),
(13, 13, 1, 15.0, NULL),
(14, 14, 3, NULL, 130),
(15, 15, 2, 22.5, NULL),
(16, 16, 1, NULL, 105),
(17, 17, 3, NULL, 135),
(18, 18, 2, 52.5, NULL),
(19, 19, 1, NULL, 100),
(20, 20, 1, 65.0, NULL);

SELECT * FROM Result;


-- 7. Federation..............................................................
CREATE TABLE Federation (
    FederationID INT PRIMARY KEY AUTO_INCREMENT,
    FederationName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FoundedYear YEAR
);

INSERT INTO Federation (FederationName, Country, FoundedYear)
VALUES
('FIFA', 'Switzerland', 1904),
('NBA', 'USA', 1946),
('Wimbledon Tennis Association', 'UK', 1877),
('International Swimming Federation', 'Switzerland', 1908),
('World Boxing Association', 'USA', 1962),
('MLB', 'USA', 1869),
('International Rugby Board', 'France', 1886),
('PGA Tour', 'USA', 1929),
('ITTF', 'Switzerland', 1926),
('UCI', 'Switzerland', 1900),
('FIVB', 'Switzerland', 1947),
('ICC', 'England', 1909),
('BWF', 'Denmark', 1934),
('FIH', 'Belgium', 1924),
('IOC', 'Switzerland', 1894),
('IAAF', 'Switzerland', 1912),
('AIBA', 'Switzerland', 1946),
('WADA', 'Canada', 1999),
('FIFA U-20 World Cup', 'Switzerland', 1977);

SELECT * FROM Federation;


-- 8. Sponsorship......................................................................
CREATE TABLE Sponsorship (
    SponsorshipID INT PRIMARY KEY AUTO_INCREMENT,
    FederationID INT NOT NULL,
    SponsorName VARCHAR(100),
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    SponsorshipDate DATE,
    FOREIGN KEY (FederationID) REFERENCES Federation(FederationID)
);

INSERT INTO Sponsorship (FederationID, SponsorName, Amount, SponsorshipDate)
VALUES
(1, 'Adidas', 5000000.00, '2023-01-10'),
(2, 'Nike', 3000000.00, '2023-05-25'),
(3, 'Rolex', 2000000.00, '2023-03-30'),
(4, 'Speedo', 1500000.00, '2023-06-10'),
(5, 'Everlast', 1000000.00, '2023-02-20'),
(6, 'Under Armour', 2500000.00, '2023-07-05'),
(7, 'Nike', 1200000.00, '2023-08-15'),
(8, 'BMW', 1800000.00, '2023-09-01'),
(9, 'Puma', 1300000.00, '2023-10-03'),
(10, 'Louis Vuitton', 2200000.00, '2023-11-12'),
(11, 'Coca-Cola', 500000.00, '2023-05-06'),
(12, 'Pepsi', 800000.00, '2023-06-07'),
(13, 'Samsung', 1500000.00, '2023-08-22'),
(14, 'Audi', 2500000.00, '2023-09-17'),
(15, 'Gatorade', 700000.00, '2023-10-14'),
(16, 'Reebok', 1300000.00, '2023-11-25'),
(17, 'Nestle', 600000.00, '2023-12-01'),
(18, 'Intel', 2000000.00, '2023-01-19'),
(19, 'Apple', 3500000.00, '2023-03-05'),
(20, 'Amazon', 4000000.00, '2023-04-20');

SELECT * FROM Sponsorship;


-- 9. Coach............................................................................
CREATE TABLE Coach (
    CoachID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    SportID INT NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

-- Insert records into Coach table
INSERT INTO Coach (FirstName, LastName, Gender, DateOfBirth, SportID, ContactNumber, Email) VALUES
('John', 'Doe', 'Male', '1980-05-14', 1, '1234567890', 'john.doe@example.com'),
('Jane', 'Smith', 'Female', '1985-07-20', 2, '1234567891', 'jane.smith@example.com'),
('Mike', 'Johnson', 'Male', '1978-12-11', 3, '1234567892', 'mike.johnson@example.com'),
('Emily', 'Davis', 'Female', '1990-09-05', 4, '1234567893', 'emily.davis@example.com'),
('Robert', 'Brown', 'Male', '1982-04-22', 5, '1234567894', 'robert.brown@example.com'),
('Sarah', 'Wilson', 'Female', '1988-11-30', 6, '1234567895', 'sarah.wilson@example.com'),
('David', 'Martinez', 'Male', '1975-06-15', 7, '1234567896', 'david.martinez@example.com'),
('Laura', 'Anderson', 'Female', '1992-01-25', 8, '1234567897', 'laura.anderson@example.com'),
('James', 'Taylor', 'Male', '1986-08-19', 9, '1234567898', 'james.taylor@example.com'),
('Emma', 'Thomas', 'Female', '1993-03-10', 10, '1234567899', 'emma.thomas@example.com'),
('Daniel', 'Harris', 'Male', '1979-07-27', 11, '1234567800', 'daniel.harris@example.com'),
('Olivia', 'Clark', 'Female', '1984-02-14', 12, '1234567801', 'olivia.clark@example.com'),
('Matthew', 'Lewis', 'Male', '1991-05-09', 13, '1234567802', 'matthew.lewis@example.com'),
('Sophia', 'Young', 'Female', '1987-10-12', 14, '1234567803', 'sophia.young@example.com'),
('Andrew', 'Walker', 'Male', '1980-12-03', 15, '1234567804', 'andrew.walker@example.com'),
('Isabella', 'King', 'Female', '1995-06-18', 16, '1234567805', 'isabella.king@example.com'),
('Joshua', 'Wright', 'Male', '1983-09-28', 17, '1234567806', 'joshua.wright@example.com'),
('Charlotte', 'Scott', 'Female', '1989-04-15', 18, '1234567807', 'charlotte.scott@example.com'),
('Ethan', 'Green', 'Male', '1976-11-22', 19, '1234567808', 'ethan.green@example.com'),
('Amelia', 'Adams', 'Female', '1994-08-07', 20, '1234567809', 'amelia.adams@example.com');

SELECT * FROM Coach;



-- 10. TrainingSession...............................................................
CREATE TABLE TrainingSession (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    SportID INT NOT NULL,
    SessionDate DATE NOT NULL,
    Duration INT CHECK (Duration BETWEEN 1 AND 8),  -- duration in hours
    Location VARCHAR(100),
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

-- Insert records into TrainingSession table
INSERT INTO TrainingSession (SportID, SessionDate, Duration, Location) VALUES
(1, '2025-02-01', 2, 'Stadium A'),
(2, '2025-02-02', 3, 'Gym B'),
(3, '2025-02-03', 4, 'Field C'),
(4, '2025-02-04', 1, 'Arena D'),
(5, '2025-02-05', 2, 'Hall E'),
(6, '2025-02-06', 3, 'Ground F'),
(7, '2025-02-07', 4, 'Track G'),
(8, '2025-02-08', 5, 'Court H'),
(9, '2025-02-09', 6, 'Complex I'),
(10, '2025-02-10', 7, 'Center J'),
(11, '2025-02-11', 1, 'Park K'),
(12, '2025-02-12', 2, 'Dome L'),
(13, '2025-02-13', 3, 'Studio M'),
(14, '2025-02-14', 4, 'Zone N'),
(15, '2025-02-15', 5, 'Club O'),
(16, '2025-02-16', 6, 'Court P'),
(17, '2025-02-17', 7, 'Field Q'),
(18, '2025-02-18', 8, 'Rink R'),
(19, '2025-02-19', 2, 'Gym S'),
(20, '2025-02-20', 3, 'Stadium T');

SELECT * FROM TrainingSession;



-- 11. Venue.......................................................................
CREATE TABLE Venue (
    VenueID INT PRIMARY KEY AUTO_INCREMENT,
    VenueName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Capacity INT CHECK (Capacity > 0),
    SportID INT NOT NULL,
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

-- Insert data into Venue 
INSERT INTO Venue (VenueName, Location, Capacity, SportID) VALUES
('Stadium A', 'New York', 50000, 1),
('Stadium B', 'Los Angeles', 45000, 2),
('Arena C', 'Chicago', 30000, 3),
('Ground D', 'Houston', 20000, 4),
('Court E', 'Miami', 15000, 5),
('Field F', 'Dallas', 25000, 6),
('Stadium G', 'San Francisco', 55000, 7),
('Arena H', 'Boston', 35000, 8),
('Ground I', 'Seattle', 22000, 9),
('Court J', 'Denver', 17000, 10),
('Field K', 'Phoenix', 29000, 11),
('Stadium L', 'Atlanta', 52000, 12),
('Arena M', 'Philadelphia', 36000, 13),
('Ground N', 'Detroit', 21000, 14),
('Court O', 'San Diego', 18000, 15);


SELECT * FROM Venue;


-- 12. Media...................................................................
CREATE TABLE Media (
    MediaID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT NOT NULL,
    MediaType VARCHAR(20) CHECK (MediaType IN ('Video', 'Photo', 'Article')),
    MediaLink VARCHAR(200),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Insert data into Media 
INSERT INTO Media (EventID, MediaType, MediaLink) VALUES
(1, 'Video', 'https://media.com/video1.mp4'),
(2, 'Photo', 'https://media.com/photo1.jpg'),
(3, 'Article', 'https://media.com/article1.html'),
(4, 'Video', 'https://media.com/video2.mp4'),
(5, 'Photo', 'https://media.com/photo2.jpg'),
(6, 'Article', 'https://media.com/article2.html'),
(7, 'Video', 'https://media.com/video3.mp4'),
(8, 'Photo', 'https://media.com/photo3.jpg'),
(9, 'Article', 'https://media.com/article3.html'),
(10, 'Video', 'https://media.com/video4.mp4'),
(11, 'Photo', 'https://media.com/photo4.jpg'),
(12, 'Article', 'https://media.com/article4.html'),
(13, 'Video', 'https://media.com/video5.mp4'),
(14, 'Photo', 'https://media.com/photo5.jpg'),
(15, 'Article', 'https://media.com/article5.html');

SELECT * FROM Media;



-- 13. Referee................................................................
CREATE TABLE Referee (
    RefereeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE
);

-- Insert data into Referee 
INSERT INTO Referee (FirstName, LastName, Gender, DateOfBirth, Email) VALUES
('John', 'Smith', 'Male', '1980-01-15', 'john.smith@email.com'),
('Sarah', 'Johnson', 'Female', '1985-03-22', 'sarah.johnson@email.com'),
('Michael', 'Brown', 'Male', '1978-07-11', 'michael.brown@email.com'),
('Jessica', 'Williams', 'Female', '1983-09-05', 'jessica.williams@email.com'),
('David', 'Jones', 'Male', '1975-12-19', 'david.jones@email.com'),
('Emily', 'Davis', 'Female', '1990-02-10', 'emily.davis@email.com'),
('Robert', 'Miller', 'Male', '1979-06-30', 'robert.miller@email.com'),
('Olivia', 'Wilson', 'Female', '1988-05-15', 'olivia.wilson@email.com'),
('Daniel', 'Anderson', 'Male', '1982-08-25', 'daniel.anderson@email.com'),
('Sophia', 'Thomas', 'Female', '1991-11-07', 'sophia.thomas@email.com'),
('James', 'Martinez', 'Male', '1976-04-29', 'james.martinez@email.com'),
('Isabella', 'Taylor', 'Female', '1989-10-14', 'isabella.taylor@email.com'),
('William', 'Harris', 'Male', '1981-12-03', 'william.harris@email.com'),
('Mia', 'Clark', 'Female', '1992-07-18', 'mia.clark@email.com'),
('Benjamin', 'Rodriguez', 'Male', '1984-09-22', 'benjamin.rodriguez@email.com');

SELECT * FROM Referee;


-- 14. Match.....................................................................
CREATE TABLE Matchs (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT NOT NULL,
    Team1ID INT NOT NULL,
    Team2ID INT NOT NULL,
    RefereeID INT,
    MatchDate DATE NOT NULL,
    Score1 INT,
    Score2 INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (Team1ID) REFERENCES Team(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Team(TeamID),
    FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID)
);


-- Insert data into Matchs (15 records)
INSERT INTO Matchs (EventID, Team1ID, Team2ID, RefereeID, MatchDate, Score1, Score2) VALUES
(1, 1, 2, 1, '2025-02-01', 3, 2),
(2, 3, 4, 2, '2025-02-02', 1, 1),
(3, 5, 6, 3, '2025-02-03', 2, 0),
(4, 7, 8, 4, '2025-02-04', 4, 3),
(5, 9, 10, 5, '2025-02-05', 1, 3),
(6, 11, 12, 6, '2025-02-06', 2, 2),
(7, 13, 14, 7, '2025-02-07', 0, 1),
(8, 15, 16, 8, '2025-02-08', 5, 4),
(9, 17, 18, 9, '2025-02-09', 2, 3),
(10, 19, 20, 10, '2025-02-10', 1, 0),
(11, 21, 22, 11, '2025-02-11', 3, 3),
(12, 23, 24, 12, '2025-02-12', 0, 2),
(13, 25, 26, 13, '2025-02-13', 4, 1),
(14, 27, 28, 14, '2025-02-14', 3, 0),
(15, 29, 30, 15, '2025-02-15', 2, 2);

SELECT * FROM Matchs;



-- 15. Injury...............................................................
CREATE TABLE Injury (
    InjuryID INT PRIMARY KEY AUTO_INCREMENT,
    AthleteID INT NOT NULL,
    InjuryDate DATE NOT NULL,
    InjuryType VARCHAR(100),
    Treatment VARCHAR(200),
    RecoveryDate DATE,
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

-- Insert records into Injury table
INSERT INTO Injury (AthleteID, InjuryDate, InjuryType, Treatment, RecoveryDate)
VALUES
(1, '2024-01-15', 'Sprained Ankle', 'Rest and Ice', '2024-02-01'),
(2, '2023-12-10', 'Fractured Wrist', 'Cast and Therapy', '2024-03-10'),
(3, '2024-02-05', 'Knee Strain', 'Physical Therapy', '2024-03-20'),
(4, '2023-11-20', 'Shoulder Dislocation', 'Surgery and Rehab', '2024-04-15'),
(5, '2024-01-30', 'Concussion', 'Rest and Monitoring', '2024-02-20'),
(6, '2024-03-05', 'Muscle Tear', 'Strength Training', '2024-04-25'),
(7, '2023-10-10', 'Broken Rib', 'Rest', '2024-01-10'),
(8, '2024-01-12', 'Torn Ligament', 'Surgery', '2024-06-10'),
(9, '2023-09-22', 'Achilles Tendonitis', 'Rehab', '2024-03-15'),
(10, '2024-02-28', 'Elbow Injury', 'Compression and Therapy', '2024-05-01'),
(11, '2023-12-05', 'Hamstring Pull', 'Stretching and Ice', '2024-01-15'),
(12, '2024-01-18', 'Hip Fracture', 'Surgery', '2024-07-01'),
(13, '2023-11-15', 'Back Strain', 'Therapy', '2024-02-15'),
(14, '2024-02-10', 'Wrist Sprain', 'Immobilization', '2024-03-20'),
(15, '2024-03-01', 'Shin Splints', 'Rest and Compression', '2024-04-10');

SELECT * FROM Injury;

-- 16. Championship.....................................................
CREATE TABLE Championship (
    ChampionshipID INT PRIMARY KEY AUTO_INCREMENT,
    ChampionshipName VARCHAR(100),
    Year YEAR NOT NULL,
    Location VARCHAR(100),
    SportID INT NOT NULL,
    FOREIGN KEY (SportID) REFERENCES Sport(SportID)
);

-- Insert records into Championship table
INSERT INTO Championship (ChampionshipName, Year, Location, SportID)
VALUES
('World Athletics', 2024, 'New York', 1),
('National Swimming', 2023, 'Los Angeles', 2),
('Olympics', 2024, 'Paris', 3),
('Asian Games', 2022, 'Tokyo', 4),
('Football World Cup', 2023, 'London', 5),
('Tennis Open', 2024, 'Melbourne', 6),
('Basketball League', 2023, 'Chicago', 7),
('Cricket World Cup', 2023, 'Mumbai', 8),
('Formula 1 Grand Prix', 2024, 'Monaco', 9),
('Marathon Championship', 2023, 'Berlin', 10),
('Golf Masters', 2024, 'Augusta', 11),
('Cycling Tour', 2022, 'France', 12),
('Hockey Championship', 2024, 'Toronto', 13),
('Wrestling Tournament', 2023, 'Moscow', 14),
('Skiing World Cup', 2024, 'Oslo', 15);

SELECT * FROM Championship;


-- 17. SponsorshipEvent.........................................
CREATE TABLE SponsorshipEvent (
    SponsorshipID INT,
    EventID INT,
    PRIMARY KEY (SponsorshipID, EventID),
    FOREIGN KEY (SponsorshipID) REFERENCES Sponsorship(SponsorshipID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Insert records into SponsorshipEvent table
INSERT INTO SponsorshipEvent (SponsorshipID, EventID)
VALUES
(1, 101), (2, 102), (3, 103), (4, 104), (5, 105), (6, 106), (7, 107), (8, 108), (9, 109), (10, 110),
(11, 111), (12, 112), (13, 113), (14, 114), (15, 115);

SELECT * FROM SponsorshipEvent;


-- 18. AthletePerformance....................................
CREATE TABLE AthletePerformance (
    PerformanceID INT PRIMARY KEY AUTO_INCREMENT,
    AthleteID INT NOT NULL,
    EventID INT NOT NULL,
    Score INT CHECK (Score >= 0),
    PerformanceDate DATE NOT NULL,
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Insert records into AthletePerformance table
INSERT INTO AthletePerformance (AthleteID, EventID, Score, PerformanceDate)
VALUES
(1, 101, 95, '2024-01-01'),
(2, 102, 89, '2024-02-05'),
(3, 103, 92, '2024-03-10'),
(4, 104, 88, '2024-04-15'),
(5, 105, 91, '2024-05-20'),
(6, 106, 87, '2024-06-25'),
(7, 107, 94, '2024-07-30'),
(8, 108, 90, '2024-08-10'),
(9, 109, 85, '2024-09-15'),
(10, 110, 93, '2024-10-20'),
(11, 111, 88, '2024-11-25'),
(12, 112, 92, '2024-12-30'),
(13, 113, 96, '2025-01-05'),
(14, 114, 89, '2025-02-10'),
(15, 115, 95, '2025-03-15');

SELECT * FROM AthletePerformance;


-- 19. HealthRecord............................................
CREATE TABLE HealthRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    AthleteID INT NOT NULL,
    RecordDate DATE NOT NULL,
    Height DECIMAL(5,2),
    Weight DECIMAL(5,2),
    BloodPressure VARCHAR(20),
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

-- Inserting 15 records into HealthRecord
INSERT INTO HealthRecord (AthleteID, RecordDate, Height, Weight, BloodPressure) VALUES
(1, '2025-01-01', 5.9, 75.5, '120/80'),
(2, '2025-01-02', 6.1, 80.0, '130/85'),
(3, '2025-01-03', 5.8, 70.0, '115/75'),
(4, '2025-01-04', 6.2, 85.0, '125/80'),
(5, '2025-01-05', 5.7, 65.0, '118/78'),
(6, '2025-01-06', 6.0, 72.0, '120/78'),
(7, '2025-01-07', 5.9, 68.5, '122/80'),
(8, '2025-01-08', 6.3, 90.0, '128/82'),
(9, '2025-01-09', 5.5, 64.5, '115/70'),
(10, '2025-01-10', 5.8, 74.0, '121/79'),
(11, '2025-01-11', 6.1, 78.5, '130/83'),
(12, '2025-01-12', 5.6, 69.5, '117/75'),
(13, '2025-01-13', 6.2, 83.0, '125/80'),
(14, '2025-01-14', 5.9, 71.0, '119/77'),
(15, '2025-01-15', 6.0, 76.0, '124/79');

SELECT * FROM HealthRecord;


-- 20. EventCategory...............................................
CREATE TABLE EventCategory (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50),
    Description TEXT
);

-- Inserting 15 records into EventCategory
INSERT INTO EventCategory (CategoryName, Description) VALUES
('Sprint', 'Short-distance running event'),
('Marathon', 'Long-distance running event'),
('High Jump', 'Track and field event for jumping over a bar'),
('Long Jump', 'Track and field event for jumping for distance'),
('Pole Vault', 'Track and field event for jumping with a pole'),
('Discus Throw', 'Throwing a heavy disc to a distance'),
('Shot Put', 'Throwing a heavy spherical object to a distance'),
('Javelin Throw', 'Throwing a spear-like object to a distance'),
('Relay', 'Team-based running event'),
('Hurdles', 'Running event involving hurdles'),
('Decathlon', '10-event track and field competition'),
('Heptathlon', '7-event track and field competition'),
('Cross Country', 'Running event on natural terrains'),
('Weightlifting', 'Lifting weights for strength competition'),
('Swimming', 'Water-based athletic event');

SELECT * FROM EventCategory;


-- 21. EventCategoryMapping........................................
CREATE TABLE EventCategoryMapping (
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (EventID, CategoryID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (CategoryID) REFERENCES EventCategory(CategoryID)
);

-- Inserting 15 records into EventCategoryMapping
INSERT INTO EventCategoryMapping (EventID, CategoryID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

SELECT * FROM EventCategoryMapping;



-- 22. AthleteQualification.............................................
CREATE TABLE AthleteQualification (
    QualificationID INT PRIMARY KEY AUTO_INCREMENT,
    AthleteID INT NOT NULL,
    QualificationName VARCHAR(100),
    IssuedBy VARCHAR(100),
    DateIssued DATE,
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

-- Inserting 15 records into AthleteQualification
INSERT INTO AthleteQualification (AthleteID, QualificationName, IssuedBy, DateIssued) VALUES
(1, 'Certified Sprint Coach', 'USA Track and Field', '2024-06-10'),
(2, 'Certified Weightlifting Trainer', 'International Weightlifting Federation', '2024-07-12'),
(3, 'Marathon Runner Certificate', 'Marathon Association', '2024-08-22'),
(4, 'High Jump Specialist', 'World Athletics', '2024-09-15'),
(5, 'Certified Sports Nutritionist', 'National Sports Institute', '2024-10-03'),
(6, 'Advanced Training in CrossFit', 'CrossFit International', '2024-11-11'),
(7, 'Yoga and Flexibility Coach', 'Yoga Alliance', '2024-12-05'),
(8, 'Olympic Swimming Certificate', 'International Swimming Federation', '2024-01-20'),
(9, 'Certified Personal Trainer', 'National Academy of Sports Medicine', '2024-02-25'),
(10, 'Track and Field Official', 'Track and Field Association', '2024-03-15'),
(11, 'Certified Sports Therapist', 'American College of Sports Medicine', '2024-04-01'),
(12, 'Physical Education Degree', 'University of Sports Sciences', '2024-05-05'),
(13, 'Advanced Sports Psychology', 'Psychology of Sports Institute', '2024-06-14'),
(14, 'Master of Sports Science', 'University of Sports Excellence', '2024-07-08'),
(15, 'Sports Massage Specialist', 'Massage Therapy Institute', '2024-08-02');

SELECT * FROM AthleteQualification;


-- 23. EventParticipant...................................................
CREATE TABLE EventParticipant (
    EventID INT NOT NULL,
    AthleteID INT NOT NULL,
    PRIMARY KEY (EventID, AthleteID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

-- Inserting 15 records into EventParticipant
INSERT INTO EventParticipant (EventID, AthleteID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

SELECT * FROM EventParticipant;


-- 24. Reward...............................................................
CREATE TABLE Reward (
    RewardID INT PRIMARY KEY AUTO_INCREMENT,
    AthleteID INT NOT NULL,
    RewardType VARCHAR(100),
    Amount DECIMAL(10,2),
    DateAwarded DATE,
    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)
);

-- Inserting 15 records into Reward
INSERT INTO Reward (AthleteID, RewardType, Amount, DateAwarded) VALUES
(1, 'Gold Medal', 1000.00, '2024-07-15'),
(2, 'Silver Medal', 800.00, '2024-08-20'),
(3, 'Bronze Medal', 500.00, '2024-09-18'),
(4, 'Gold Medal', 1000.00, '2024-10-25'),
(5, 'Silver Medal', 800.00, '2024-11-10'),
(6, 'Gold Medal', 1000.00, '2024-12-15'),
(7, 'Bronze Medal', 500.00, '2024-01-01'),
(8, 'Silver Medal', 800.00, '2024-02-10'),
(9, 'Gold Medal', 1000.00, '2024-03-05'),
(10, 'Bronze Medal', 500.00, '2024-04-18'),
(11, 'Gold Medal', 1000.00, '2024-05-12'),
(12, 'Silver Medal', 800.00, '2024-06-30'),
(13, 'Bronze Medal', 500.00, '2024-07-02'),
(14, 'Gold Medal', 1000.00, '2024-08-22'),
(15, 'Silver Medal', 800.00, '2024-09-10');

SELECT * FROM Reward;

-- 25. MedicalStaff.............................................................
CREATE TABLE MedicalStaff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(15)
);

-- Inserting 15 records into MedicalStaff
INSERT INTO MedicalStaff (FirstName, LastName, Specialization, ContactNumber) VALUES
('John', 'Doe', 'Physician', '1234567890'),
('Jane', 'Smith', 'Physiotherapist', '2345678901'),
('David', 'Johnson', 'Orthopedic Surgeon', '3456789012'),
('Emily', 'Davis', 'Sports Psychologist', '4567890123'),
('Michael', 'Wilson', 'Sports Therapist', '5678901234'),
('Sarah', 'Moore', 'Massage Therapist', '6789012345'),
('Chris', 'Taylor', 'Chiropractor', '7890123456'),
('Laura', 'Anderson', 'Nutritionist', '8901234567'),
('Kevin', 'Martinez', 'Physical Therapist', '9012345678'),
('Olivia', 'Jackson', 'Podiatrist', '0123456789'),
('Ethan', 'Lee', 'Sports Medicine Specialist', '1231231234'),
('Ava', 'Harris', 'Athletic Trainer', '2342342345'),
('Liam', 'Clark', 'Sports Nutritionist', '3453453456'),
('Mason', 'Rodriguez', 'Neurologist', '4564564567'),
('Sophia', 'Lewis', 'General Practitioner', '5675675678');

SELECT * FROM MedicalStaff;

CREATE database School;
use School;

CREATE TABLE SchoolNames (
    SchoolID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each school
    SchoolName VARCHAR(255) NOT NULL,        -- Name of the school
    Location VARCHAR(255),                   -- Location of the school (optional)
    EstablishedYear INT,                     -- Year the school was established (optional)
    ContactNumber VARCHAR(15)                -- Contact number of the school (optional)
);

select * from SchoolNames;
insert into SchoolNames
values

(1,'Green Valley High School', 'Mumbai', 1995, '1234567890'),
(2,'Blue Ocean Academy', 'Pune', 2000, '9876543210'),
(3,'Silver Oak International', 'Delhi', 2010, '1122334455'),
(4,'Starlight Public School', 'Kolkata', 1985, '9988776655'),
(5,'Rainbow English School', 'Chennai', 1990, '8765432109'),
(6,'Mount Everest Academy', 'Hyderabad', 2005, '1122112211'),
(7,'Sunrise Global School', 'Ahmedabad', 1998, '2233445566'),
(8,'Maple Leaf High School', 'Bangalore', 2015, '3344556677'),
(9,'Harmony World School', 'Lucknow', 1988, '4455667788'),
(10,'Future Bright Academy', 'Jaipur', 2003, '5566778899');


CREATE TABLE SchoolTiming (
    TimingID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each timing record
    StartTime TIME NOT NULL,                 -- Start time of the school
    EndTime TIME NOT NULL,                   -- End time of the school
    ShiftType VARCHAR(50) NOT NULL           -- Shift type (e.g., Morning, Afternoon, Evening)
);

drop table SchoolTiming;

select * From SchoolTiming;

TRUNCATE TABLE SchoolTiming;


insert into SchoolTiming
values
(1, '08:00:00', '14:00:00', 'Morning'),
(2, '09:00:00', '15:30:00', 'Morning'),
(3, '08:30:00', '13:30:00', 'Morning'),
(4, '10:00:00', '16:00:00', 'Afternoon'),
(5, '07:30:00', '12:30:00', 'Morning'),
(6, '12:00:00', '18:00:00', 'Afternoon'),
(7, '08:45:00', '14:45:00', 'Morning'),
(8, '09:15:00', '15:15:00', 'Morning'),
(9, '10:30:00', '16:30:00', 'Afternoon'),
(10, '11:00:00', '17:00:00', 'Afternoon');





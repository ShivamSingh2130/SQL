Create database University;
use University;

create table MumbaiCollege(
MumbaiCollegeID VARCHAR(50) PRIMARY KEY,
MumbaiCollegeNaame VARCHAR(50),
MumbaiCollegeContactNO int,
MumbaiCollegeAddress VARCHAR(100),
MumbaiCollegeEmailID VARCHAR(20)
);

 -- Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES =0;
SET SQL_SAFE_UPDATES =1;
UPDATE MumbaiCollege
SET  MumbaiCollegeContactNO = 17000.0000,MumbaiCollegeAddress="Mulund West"
WHERE MumbaiCollegeID = 1;

UPDATE MumbaiCollege
SET  MumbaiCollegeContactNO = 13000.0000,MumbaiCollegeAddress="Thane(w) Wagela Estate"
WHERE MumbaiCollegeID = 2;


select * from MumbaiCollege;
drop table MumbaiCollege;

 UPDATE MumbaiCollege SET MumbaiCollegeID =11 WHERE MumbaiCollegeID =10;

DELETE FROM MumbaiCollege  -- This COndation is use to delete s Specific record
WHERE MumbaiCollegeID = 9;

/* SELECT * FROM MumbaiCollegeID WHERE MumbaiCollegeID = 9;
SHOW TABLES LIKE 'MumbaiCollegeID';   */



ALTER TABLE MumbaiCollege
 ADD CONSTRAINT uq_MumbaiCollege_Email UNIQUE (MumbaiCollegeEmailID);
 
 #mSHOW CREATE TABLE MumbaiCollegeEmailID;


insert into MumbaiCollege

values
(1,"Mulund College of Commerce",1800-2500,"Mulund","MulundCollege@120.com"),
(2,"RJ Thakur Degree College",1800-0000,"Wagela","RJThakur@001gmail.com"),
(3,"KB college",1800-1100,"kalayan","KB@10gmail.com"),
(4,"Sanket College",1800-500,"Thane","SanketCollege@19gmail.com"),
(5,"Birla College ",1800-700,"Mulund","BirlaCollege@11.com"),
(6,"AP Sha College ",1800-2500,"Thane","APShaCollege@15.com"),
(7,"Dayan Ganga College",1800-2500,"Thane","DayanGangaCollege@1200.com"),
(8,"Shetty College ",1800-500,"Sion","ShettyCollege@00.com"),
(9,"DAV College  ",1800-274,"Mulund","DAVCollege@55.com"),
(10,"Sri Ma College ",1800-00,"Thane","SriMaCollege@10.com");

-- Create the CollegeExam table
CREATE TABLE CollegeExam (
    ExamID INT PRIMARY KEY,
    CollegeName VARCHAR(100),
    ExamDate DATE,
    ExamType VARCHAR(50)
);
drop table CollegeExam;

select * from CollegeExam;

DELETE FROM MumbaiCollege  -- This COndation is use to delete s Specific record
WHERE MumbaiCollegeID = 9;

insert into CollegeExam
value
(1, "Mulund College of Commerce", '2025-01-15', "Semester"),
(2, "RJ Thakur Degree College", '2025-02-10', "Annual"),
(3, "KB College", '2025-01-20', "Internal"),
(4, "Sanket College", '2025-03-05', "Semester"),
(5, "Birla College", '2025-02-15', "Practical"),
(6, "AP Sha College", '2025-04-10', "Final"),
(7, "Dayan Ganga College", '2025-03-25', "Internal"),
(8, "Shetty College", '2025-02-28', "Annual"),
(9, "DAV College", '2025-01-30', "Practical"),
(10, "Sri Ma College", '2025-03-01', "Semester");



CREATE TABLE CollegeTiming (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(50),
    OpeningTime TIME,
    ClosingTime TIME,
    Location VARCHAR(50)
);

select * from CollegeTiming;

Drop table CollegeTiming;

UPDATE CollegeTiming
SET  OpeningTime = '08:00:00',ClosingTime="17:00:00"
WHERE CollegeID = 1;

INSERT INTO CollegeTiming
VALUES
(1, "Mulund College of Commerce", '09:00:00', '18:00:00', "Mulund"),
(2, "RJ Thakur Degree College", '07:00:00', '17:00:00', "Wagela"),
(3, "KB College", '08:30:00', '14:00:00', "Kalyan"),
(4, "Sanket College", '09:00:00', '15:00:00', "Thane"),
(5, "Birla College", '08:00:00', '14:30:00', "Mulund"),
(6, "AP Sha College", '10:00:00', '18:00:00', "Thane"),
(7, "Dayan Ganga College", '09:30:00', '16:00:00', "Thane"),
(8, "Shetty College", '08:00:00', '13:00:00', "Sion"),
(9, "DAV College", '08:00:00', '12:00:00', "Mulund"),
(10, "Sri Ma College", '09:30:00', '14:00:00', "Thane");

CREATE TABLE CollegeInfo (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(100),
    EstablishedYear INT,
    CoursesOffered INT,
    Location VARCHAR(50),
    ContactEmail VARCHAR(100)
);

drop table CollegeInfo;

select * from CollegeInfo;

ALTER TABLE CollegeInfo
 ADD CONSTRAINT uq_Contact_Email UNIQUE (ContactEmail);


INSERT INTO CollegeInfo
VALUES
(1, "Mulund College of Commerce", 1970, 25, "Mulund", "MulundCollegeInfo@120.com"),
(2, "RJ Thakur Degree College", 1985, 20, "Wagela", "RJThakurInfo@001gmail.com"),
(3, "KB College", 1995, 15, "Kalyan", "KBInfo@10gmail.com"),
(4, "Sanket College", 2000, 10, "Thane", "SanketCollegeInfo@19gmail.com"),
(5, "Birla College", 1980, 18, "Mulund", "BirlaCollegeInfo@11.com"),
(6, "AP Sha College", 1990, 22, "Thane", "APShaCollegeInfo@15.com"),
(7, "Dayan Ganga College", 2005, 12, "Thane", "DayanGangaCollegeInfo@1200.com"),
(8, "Shetty College", 2010, 8, "Sion", "ShettyCollegeInfo@00.com"),
(9, "DAV College", 1975, 30, "Mulund", "DAVCollegeInfo@55.com"),
(10, "Sri Ma College", 1998, 14, "Thane", "SriMaCollegeInfo@10.com");

Create database Hospital;
drop database Hospital;

use Hospital;
 create table 	Patients(
 id int primary key, -- primary key= unique + not null
 name varchar(50) not null,
 age int not null,
 contact VARCHAR(15),
 MedicalHistory VARCHAR (50)
 );
 drop table Patients;
 select * from 	Patients;
 insert into  Patients
values
(1,"Ramesh",21,5478946213,"Corona"),
(2,"Suresh",67,5478542113,"Corona"),
(3,"Hitesh",11,5478454462,"Corona"),
(4,"Ramu",54,547894621555,"Corona"),
(5,"Shamu",21,54789464543,"Corona");
 
 
 create table Docters 
 (                                                                              
 id int primary key, -- primary key= unique + not null
 Name varchar(50) not null,
Specialization VARCHAR (100) not null,
Contact VARCHAR(15),
Salary VARCHAR(20)
 );
 
 select * from Docters;
 drop table Docters;
 
  insert into  Docters
values
 
 (1,"Ram","Heart Surgeon",5478946213,250000),
(2,"Sam","Cancer",5478542113,"500000"),
(3,"Jitesh","Dermatologist",5478454462,"200000"),
(4,"Rama","Eye Surgeon",547894621555,"350000"),
(5,"Shama","Dentist",54789464543,"100000");


create table Appointments (
	AppointmentID int Primary Key,
	PatientID int ,
	DoctorID int ,
	Date int ,
	Time int
    );
    
    select * from Appointments;
insert into Appointments
values
(115,12,1,01-2025,"2.45pm"),
(116,12,1,01-2025,"1.29am"),
(117,12,1,01-2025,"2.00pm"),
(118,12,1,01-2025,"9.00pm"),
(119,12,1,01-2025,"3.45pm");

create table Medication (
	MedicationID int Primary Key,
    Name VARCHAR(50),
	Dosage int,
	SideEffects VARCHAR(50),
	Price VARCHAR(20)
    );

select * from Medication;

insert into Medication
values

(112,"Aspirin",1,0,2500),
(113,"Cisplatin",3,0,250),
(114,"Hydrocortisone",2,0,3000),
(115,"Atropine Eye Drops ",2,0,2),
(116,"Lidocaine",4,0,5000);

create table 	Departments(
	DepartmentID int Primary Key, 
	Name VARCHAR(15),
	Head VARCHAR(20),
	Contact int(12),
	Description VARCHAR(100)
    );
    drop table Departments;
select * from Departments;

insert  into DepartmentS
values
 (1,"Ram","Heart Surgeon",5478946213,"A heart surgeon specializes in performing surgical procedures on the heart and blood vessels to treat conditions such as coronary artery disease, valve disorders, and heart defects"),
(2,"Sam","Cancer",5478542113,"A **cancer specialist (oncologist)** is a medical professional trained to diagnose, treat, and manage various types of cancer using therapies like chemotherapy, radiation, surgery, and immunotherapy."),
(3,"Jitesh","Dermatologist",5478454462,"A dermatologist is a medical specialist focused on diagnosing and treating skin, hair, nail, and mucous membrane disorders, including conditions like acne, eczema, and skin cancer."),
(4,"Rama","Eye Surgeon",547894621555,"An eye surgeon, or ophthalmologist, specializes in diagnosing and surgically treating eye conditions, such as cataracts, glaucoma, and retinal disorders, to restore and preserve vision."),
(5,"Shama","Dentist",54789464543,"A **dentist** is a healthcare professional specializing in the diagnosis, prevention, and treatment of oral health issues, including teeth, gums, and mouth conditions.");

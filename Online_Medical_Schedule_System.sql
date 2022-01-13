CREATE TABLE Doctor 
(Doctor_License_No VARCHAR(12) NOT NULL PRIMARY KEY, 
 Doctor_Name VARCHAR(50) NOT NULL,
 Doctor_Gender ENUM('Male', 'Female'),
 Doctor_Email_ID CHAR(50) NOT NULL UNIQUE,
 Doctor_Phone CHAR(10) NOT NULL UNIQUE, 
 Doctor_Speciality VARCHAR(50) NOT NULL, 
 Doctor_Education VARCHAR(50) NOT NULL
 );
 INSERT INTO Doctor (Doctor_License_No,Doctor_Name,Doctor_Gender,Doctor_Email_ID,Doctor_Phone,Doctor_Speciality,Doctor_Education)
 VALUES
 ('9998','abc','Female','abcefrfgmail.com','999822','Skine','MBBS');
 
 CREATE TABLE Patient 
(Patient_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 Patient_Bill_Num INT UNSIGNED  NOT NULL UNIQUE,
 Patient_Name VARCHAR(50) NOT NULL,
 Patient_Gender ENUM('Male', 'Female','Other'),
 Patient_Email_ID CHAR(50) NOT NULL UNIQUE,
 Patient_Phone_Num CHAR(10) NOT NULL UNIQUE 
 );
 INSERT INTO Patient (Patient_ID,Patient_Bill_Num,Patient_Name,Patient_Gender,Patient_Email_ID,Patient_Phone_Num)
 VALUES
 (1168,345,'Bemale','Male','abc@gmail.com','99986722');

CREATE TABLE Appointment
(Appointment_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
Appointment_Date DATE NOT NULL, 
Appointment_Time TIME DEFAULT '13:59',
Appointment_Status VARCHAR(50) NOT NULL, 
Patient_ID INT UNSIGNED, 
Doctor_License_No VARCHAR(12),
CONSTRAINT Appointment1 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT Appointment2 FOREIGN KEY (Doctor_License_No) REFERENCES Doctor(Doctor_License_No) ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Appointment(Appointment_ID,Appointment_Date,Appointment_Time,Appointment_Status,Patient_ID,Doctor_License_No)
 VALUES
 (99,'2021-12-31','01:30','Active',1168,'9998');


 CREATE TABLE Doctor_Profile
(Doctor_ProfileMembership_ID INT PRIMARY KEY AUTO_INCREMENT,
 Doctor_License_No VARCHAR(12), 
 Doctor_language_Spoken SET('Nepali','Hindi','English','Maithili','Bhojpuri','Tharu') NOT NULL,
 Doctor_ProfileMembership VARCHAR(50),
 CONSTRAINT Doctor_Profile FOREIGN KEY (Doctor_License_No) REFERENCES Doctor(Doctor_License_No)ON DELETE RESTRICT ON UPDATE CASCADE
 );
 
 INSERT INTO Doctor_Profile (Doctor_ProfileMembership_ID,Doctor_License_No,Doctor_language_Spoken,Doctor_ProfileMembership)
 VALUES
 ('128','9998','Nepali,Hindi','abce');
 
 CREATE TABLE Medical_Record
(Record_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 Patient_ID INT UNSIGNED, 
 Appointment_ID INT UNSIGNED,
 CONSTRAINT Medical_Record1 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)ON DELETE RESTRICT ON UPDATE CASCADE,
 CONSTRAINT Medical_Record2 FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID)ON DELETE RESTRICT ON UPDATE CASCADE
 );
 INSERT INTO Medical_Record (Record_ID,Patient_ID,Appointment_ID)
 VALUES
 ('124','1168',99);
 
CREATE TABLE Doctor_Review
(Doctor_License_No VARCHAR(12) PRIMARY KEY,
Patient_ID INT UNSIGNED, 
Doctor_Reviews ENUM ('Improve','Visit Again','Refer') NOT NULL,
Reviews_Comment VARCHAR(50) DEFAULT 'Your Health is Good',
Reviews_Date DATETIME,
Reviews_Rating ENUM('A','B','C'),
CONSTRAINT Doctor_Review1 FOREIGN KEY (Doctor_License_No) REFERENCES Doctor(Doctor_License_No)ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT Doctor_Review2 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO Doctor_Review (Doctor_License_No,Patient_ID,Doctor_Reviews,Reviews_Comment,Reviews_Date,Reviews_Rating)
 VALUES
 ('9998','1168','Improve','you must be bed rest in 3 months.','2078-09-12 02:06:43','B');
TRUNCATE TABLE Doctor_Review  
  
CREATE TABLE Payment 
(Patient_Bill_Num INT UNSIGNED PRIMARY KEY,
 Total_Charge FLOAT UNSIGNED,
 Payment_Date DATETIME,
 Doctor_License_No VARCHAR(12),
 CONSTRAINT Payment1 FOREIGN KEY (Patient_Bill_Num) REFERENCES Patient(Patient_Bill_Num)ON DELETE RESTRICT ON UPDATE CASCADE,
 CONSTRAINT Payment2 FOREIGN KEY (Doctor_License_No) REFERENCES Doctor(Doctor_License_No)ON DELETE RESTRICT ON UPDATE CASCADE
 );
 INSERT INTO Payment (Patient_Bill_Num,Total_Charge,Payment_Date,Doctor_License_No)
 VALUES
 (345,'3498.74',NOW(),'9998');
 
 CREATE TABLE Visit 
(Doctor_Visit_ID INT UNSIGNED  PRIMARY KEY,
 Patient_ID INT UNSIGNED NOT NULL,
 Visit_Date DATETIME NOT NULL,
 Visit_Purpose VARCHAR(50) DEFAULT "Doctor Meet",
 Doctor_License_No VARCHAR(12),
 CONSTRAINT Visit1 FOREIGN KEY (Doctor_License_No) REFERENCES Doctor(Doctor_License_No)ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT Visit2 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)ON DELETE RESTRICT ON UPDATE CASCADE
 );
 INSERT INTO Visit (Doctor_Visit_ID,Patient_ID,Visit_Date,Visit_Purpose,Doctor_License_No)
 VALUES
 (345,'1168','2078-09-12 02:06:43','Sugesstion','9998');
 
 
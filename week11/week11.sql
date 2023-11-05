CREATE SCHEMA IF NOT EXISTS WEEK11_INHA_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE WEEK11_INHA_DB;

CREATE TABLE Building
( ID INT NOT NULL AUTO_INCREMENT,
    Bid             INT              NOT NULL,
  Bname           VARCHAR(20)      NOT NULL,
PRIMARY KEY   (ID));

CREATE TABLE Room
( ID INT NOT NULL AUTO_INCREMENT,
  Rid             VARCHAR(10)       NOT NULL,
  Rname           VARCHAR(100)       NOT NULL,
  capacity        INT,
  Bid			  INT               NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Bid) REFERENCES Building(ID));

CREATE TABLE Department
( ID INT NOT NULL AUTO_INCREMENT,
  Did             VARCHAR(10)       NOT NULL,
  Dname           VARCHAR(100)       NOT NULL,
  Demail		  VARCHAR(45),
  Dphonenum		  VARCHAR(10)       NOT NULL,
  Bid			  INT               NOT NULL,
  Rid			  INT       NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Bid) REFERENCES Building(ID),
FOREIGN KEY (Rid) REFERENCES Room(ID));

CREATE TABLE Class
( ID INT NOT NULL AUTO_INCREMENT,
  Cid             VARCHAR(10)       NOT NULL,
  Name           VARCHAR(45)       NOT NULL,
  Professor       VARCHAR(100)       NOT NULL,
  Number_of_participant	  INT,
  Bid             INT               NOT NULL,
  Did			  INT       NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Bid) REFERENCES Building(ID),
FOREIGN KEY (Did) REFERENCES Department(ID));

CREATE TABLE Student
( ID             INT    	        NOT NULL        AUTO_INCREMENT,
  Sname           VARCHAR(20)       NOT NULL,
  Semail          VARCHAR(45),
  Sphonenum		  VARCHAR(11),
  StudentId		  INT               NOT NULL,
  password		  VARCHAR(20)       NOT NULL,
  Did			  INT               NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Did) REFERENCES Department(ID));

CREATE TABLE class_student
(
  Student_Id INT NOT NULL,
  Class_Id INT NOT NULL,
  FOREIGN KEY (Student_Id) REFERENCES Student(ID),
  FOREIGN KEY (Class_Id) REFERENCES Class(ID)
);

INSERT INTO Building 
VALUES      (null, '5','Building 5'), (null, '10','High Tech Center');

INSERT INTO Room 
VALUES  (null, 'h-416','Office of Information Technology','10','2'),
            (null, 'h-232','Major Theory Classroom','80','2'),
            (null, 'h-424','Major Practicum Classroom','75','2');
            
INSERT INTO Department 
VALUES      (null, 'ICE','Information and Communication Engineering','','0328607431','2','2');

INSERT INTO Class 
VALUES     (null, 'ICE4016001','Database','Wonik Choi','74','2','1'),
		   (null, 'ICE3001003','Signals and Systems','Wonik Choi2','54','2','1'),
           (null, 'ICE3014001','Operating System','Wonik Choi3','47','2','1'),
           (null, 'ICE4010001','Telecommunications','Wonik Choi4','62','2','1E'),
           (null, 'ICE2004002','Data Structures','Wonik Choi','0','2','1');

INSERT INTO Student(ID, Sname, Semail, Sphonenum, StudentId, password, Did) 
VALUES      (null, 'Lee','jojo@naver.com','01011112222','12000000','1234', '1'),
            (null, 'Kim','yubi@naver.com','01022223333','12000001','1234', '1'),
            (null, 'Park','son@naver.com','01033334444','12000002','1234', '1');

INSERT INTO class_student 
VALUES      (1, 1);
SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS Colleges;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Faculties;
DROP TABLE IF EXISTS Courses;

create table Colleges (
    id int primary key,
    name varchar(100)
);

create table Departments (
    id int primary key,
    name varchar(100),
    college int,
    FOREIGN KEY (college)
        REFERENCES Colleges (id)
);


CREATE TABLE Students
(
sid int PRIMARY KEY,
first_name varchar(255),
last_name varchar(255),
major varchar(255),
department int,
FOREIGN KEY (department)
        REFERENCES Departments (id)
);

CREATE TABLE Faculties
(
id int PRIMARY KEY,
first_name varchar(255),
last_name varchar(255),
department int,
supervisor int,
salary double,
FOREIGN KEY (department)
        REFERENCES Departments (id),
FOREIGN KEY (supervisor)
        REFERENCES Faculties (id)
);

CREATE TABLE Courses
(
number varchar(10),
name varchar(50),
term varchar(10),
year int,
enrollment int,
instructor int,
room varchar(255),
PRIMARY KEY (number,term,year),
FOREIGN KEY (instructor)
        REFERENCES Faculties (id)
);
INSERT INTO Colleges (id,name) VALUES (1,'College of Aviation');
INSERT INTO Colleges (id,name) VALUES (2,'College of Engineering');
INSERT INTO Colleges (id,name) VALUES (3,'College of Business');
INSERT INTO Colleges (id,name) VALUES (4,'College of Art and Science');

INSERT INTO Departments (id,name,college) VALUES (1,'AE',1);
INSERT INTO Departments (id,name,college) VALUES (2,'ME',2);
INSERT INTO Departments (id,name,college) VALUES (3,'ECSSE',2);
INSERT INTO Departments (id,name,college) VALUES (4,'Civil',2);

INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (1,'Alice','Roy','CS',3);
INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (2,'Bob','Tina','SE',3);
INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (3,'Cindy','Tina','AE',1);
INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (4,'S4','SL4','CS',3);
INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (5,'S5','SL5','EE',3);
INSERT INTO Students (sid,first_name,last_name,major, department) VALUES (6,'S6','SL6','CS',3);

INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (1,'Dean','Ted',2,null,85000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (2,'Tim','Wilson',3,1,90000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (3,'Jack','White',3,1,60000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (4,'Jordan','Hill',3,2,120000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (5,'Ted','Bob',1,null,110000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (6,'F1','F1L',1,null,60000);
INSERT INTO Faculties (id,first_name,last_name, department,supervisor,salary) VALUES (7,'F2','F2L',1,null,80000);

INSERT INTO Courses (number,name,term,year,enrollment, instructor, room) VALUES ('cs317','Database and File Systems','spring',2017,14,4,'LB171');
INSERT INTO Courses (number,name,term,year,enrollment, instructor, room) VALUES ('cs538','Applied Cryptography','spring',2017,21,4,'LB131');
INSERT INTO Courses (number,name,term,year,enrollment, instructor, room) VALUES ('cs315','Data Structures and Algorithms','fall',2015,11,4,'LB217');
INSERT INTO Courses (number,name,term,year,enrollment, instructor, room) VALUES ('EE315','EE ABCD','fall',2016,11,3,'LB216');
INSERT INTO Courses (number,name,term,year,enrollment, instructor, room) VALUES ('EE318','HFH','fall',2015,9,3,'LB317');


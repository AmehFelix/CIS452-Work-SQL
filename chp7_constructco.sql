CREATE TABLE `JOB` (
  `JOB_CODE` int NOT NULL,
  `JOB_DESCRIPTION` varchar(255),
  `JOB_CHG_HOUR` float,
  `JOB_LAST_UPDATE` date ,
  PRIMARY KEY (`JOB_CODE`)
);

CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` int NOT NULL,
  `EMP_LNAME` varchar(255),
  `EMP_FNAME` varchar(255),
  `EMP_INITIAL` char(1),
  `EMP_HIREDATE` date,
  `JOB_CODE` int,
  `EMP_YEARS` int,
  PRIMARY KEY (`EMP_NUM`),
  FOREIGN KEY (`JOB_CODE`) REFERENCES `JOB` (`JOB_CODE`)
);

CREATE TABLE `PROJECT` (
  `PROJ_NUM` int NOT NULL,
  `PROJ_NAME` varchar(255),
  `PROJ_VALUE` float,
  `PROJ_BALANCE` float,
  `EMP_NUM` int,
  PRIMARY KEY (`PROJ_NUM`),
  FOREIGN KEY (`EMP_NUM`) REFERENCES `EMPLOYEE` (`EMP_NUM`)
);


CREATE TABLE `ASSIGNMENT` (
  `ASSIGN_NUM` int NOT NULL,
  `ASSIGN_DATE` date,
  `PROJ_NUM` int,
  `EMP_NUM` int,
  `ASSIGN_JOB` int,
  `ASSIGN_CHG_HR` float,
  `ASSIGN_HOURS` float,
  `ASSIGN_CHARGE` float,
  PRIMARY KEY (`ASSIGN_NUM`),
  FOREIGN KEY (`PROJ_NUM`) REFERENCES `PROJECT` (`PROJ_NUM`),
  FOREIGN KEY (`EMP_NUM`) REFERENCES `EMPLOYEE` (`EMP_NUM`)
);

INSERT INTO `JOB` (`JOB_CODE`, `JOB_DESCRIPTION`, `JOB_CHG_HOUR`, `JOB_LAST_UPDATE`) VALUES
(500, 'Programmer', 35.75, '2017-11-20'),
(501, 'Systems Analyst', 96.75, '2017-11-20'),
(502, 'Database Designer', 125, '2018-03-24'),
(503, 'Electrical Engineer', 84.5, '2017-11-20'),
(504, 'Mechanical Engineer', 67.9, '2017-11-20'),
(505, 'Civil Engineer', 55.78, '2017-11-20'),
(506, 'Clerical Support', 26.87, '2017-11-20'),
(507, 'DSS Analyst', 45.95, '2017-11-20'),
(508, 'Applications Designer', 48.1, '2018-03-24'),
(509, 'Bio Technician', 34.55, '2017-11-20'),
(510, 'General Support', 18.36, '2017-11-20');

INSERT INTO `EMPLOYEE` (`EMP_NUM`, `EMP_LNAME`, `EMP_FNAME`, `EMP_INITIAL`, `EMP_HIREDATE`, `JOB_CODE`, `EMP_YEARS`) VALUES
(101, 'News', 'John', 'G', '2000-11-08', 502, 14),
(102, 'Senior', 'David', 'H', '1989-07-12', 501, 25),
(103, 'Arbough', 'June', 'E', '1996-12-01', 500, 18),
(104, 'Ramoras', 'Anne', 'K', '1987-11-15', 501, 27),
(105, 'Johnson', 'Alice', 'K', '1993-02-01', 502, 22),
(106, 'Smithfield', 'William', '', '2004-06-22', 500, 10),
(107, 'Alonzo', 'Maria', 'D', '1993-10-10', 500, 21),
(108, 'Washington', 'Ralph', 'B', '1991-08-22', 501, 23),
(109, 'Smith', 'Larry', 'W', '1997-07-18', 501, 17),
(110, 'Olenko', 'Gerald', 'A', '1995-12-11', 505, 19),
(111, 'Wabash', 'Geoff', 'B', '1991-04-04', 506, 24),
(112, 'Smithson', 'Darlene', 'M', '1994-10-23', 507, 20),
(113, 'Joenbrood', 'Delbert', 'K', '1996-11-15', 508, 18),
(114, 'Jones', 'Annelise', '', '1993-08-20', 508, 21),
(115, 'Bawangi', 'Travis', 'B', '1992-01-25', 501, 23),
(116, 'Pratt', 'Gerald', 'L', '1997-03-05', 510, 18),
(117, 'Williamson', 'Angie', 'H', '1996-06-19', 509, 18),
(118, 'Frommer', 'James', 'J', '2005-01-04', 510, 10);



INSERT INTO `PROJECT` (`PROJ_NUM`, `PROJ_NAME`, `PROJ_VALUE`, `PROJ_BALANCE`, `EMP_NUM`) VALUES
(15, 'Evergreen', 1453500, 1002350, 103),
(18, 'Amber Wave', 3500500, 2110350, 108),
(22, 'Rolling Tide', 805000, 500345, 102),
(25, 'Starflight', 2650500, 2309880, 107);

INSERT INTO `ASSIGNMENT` (`ASSIGN_NUM`, `ASSIGN_DATE`, `PROJ_NUM`, `EMP_NUM`, `ASSIGN_JOB`, `ASSIGN_CHG_HR`, `ASSIGN_HOURS`, `ASSIGN_CHARGE`) VALUES
(1001, '2018-03-22', 18, 103, 503, 84.5, 3.5, 295.75),
(1002, '2018-03-22', 22, 117, 509, 34.55, 4.2, 145.11),
(1003, '2018-03-22', 18, 117, 509, 34.55, 2, 69.1),
(1004, '2018-03-22', 18, 103, 503, 84.5, 5.9, 498.55),
(1005, '2018-03-22', 25, 108, 501, 96.75, 2.2, 212.85),
(1006, '2018-03-22', 22, 104, 501, 96.75, 4.2, 406.35),
(1007, '2018-03-22', 25, 113, 508, 50.75, 3.8, 192.85),
(1008, '2018-03-22', 18, 103, 503, 84.5, 0.9, 76.05),
(1009, '2018-03-23', 15, 115, 501, 96.75, 5.6, 541.8),
(1010, '2018-03-23', 15, 117, 509, 34.55, 2.4, 82.92),
(1011, '2018-03-23', 25, 105, 502, 105, 4.3, 451.5),
(1012, '2018-03-23', 18, 108, 501, 96.75, 3.4, 328.95),
(1013, '2018-03-23', 25, 115, 501, 96.75, 2, 193.5),
(1014, '2018-03-23', 22, 104, 501, 96.75, 2.8, 270.9),
(1015, '2018-03-23', 15, 103, 503, 84.5, 6.1, 515.45),
(1016, '2018-03-23', 22, 105, 502, 105, 4.7, 493.5),
(1017, '2018-03-23', 18, 117, 509, 34.55, 3.8, 131.29),
(1018, '2018-03-23', 25, 117, 509, 34.55, 2.2, 76.01),
(1019, '2018-03-24', 25, 104, 501, 110.5, 4.9, 541.45),
(1020, '2018-03-24', 15, 101, 502, 125, 3.1, 387.5),
(1021, '2018-03-24', 22, 108, 501, 110.5, 2.7, 298.35),
(1022, '2018-03-24', 22, 115, 501, 110.5, 4.9, 541.45),
(1023, '2018-03-24', 22, 105, 502, 125, 3.5, 437.5),
(1024, '2018-03-24', 15, 103, 503, 84.5, 3.3, 278.85),
(1025, '2018-03-24', 18, 117, 509, 34.55, 4.2, 145.11);


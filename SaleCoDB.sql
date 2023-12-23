SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS CUSTOMER_2;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS LINE;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS VENDOR;
DROP TABLE IF EXISTS INVOICE;
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE `CUSTOMER` (
  `CUS_CODE` int NOT NULL,
  `CUS_LNAME` varchar(100),
  `CUS_FNAME` varchar(100),
  `CUS_INITIAL` char(1),
  `CUS_AREACODE` char(3),
  `CUS_PHONE` char(8),
  `CUS_BALANCE` float,
  PRIMARY KEY (`CUS_CODE`)
);

INSERT INTO `CUSTOMER` (`CUS_CODE`, `CUS_LNAME`, `CUS_FNAME`, `CUS_INITIAL`, `CUS_AREACODE`, `CUS_PHONE`, `CUS_BALANCE`) VALUES
(10010, 'Ramas', 'Alfred', 'A', '615', '844-2573', 0),
(10011, 'Dunne', 'Leona', 'K', '713', '894-1238', 0),
(10012, 'Smith', 'Kathy', 'W', '615', '894-2285', 345.86),
(10013, 'Olowski', 'Paul', 'F', '615', '894-2180', 536.75),
(10014, 'Orlando', 'Myron', '', '615', '222-1672', 0),
(10015, 'O\'Brian', 'Amy', 'B', '713', '442-3381', 0),
(10016, 'Brown', 'James', 'G', '615', '297-1228', 221.19),
(10017, 'Williams', 'George', '', '615', '290-2556', 768.93),
(10018, 'Farriss', 'Anne', 'G', '713', '382-7185', 216.55),
(10019, 'Smith', 'Olette', 'K', '615', '297-3809', 0);

CREATE TABLE `INVOICE` (
  `INV_NUMBER` int NOT NULL,
  `CUS_CODE` int,
  `INV_DATE` date,
  PRIMARY KEY (`INV_NUMBER`),
  FOREIGN KEY (`CUS_CODE`) REFERENCES `CUSTOMER` (`CUS_CODE`)
);

INSERT INTO `INVOICE` (`INV_NUMBER`, `CUS_CODE`, `INV_DATE`) VALUES
(1001, 10014, '2018-1-16'),
(1002, 10011, '2018-1-16'),
(1003, 10012, '2018-1-16'),
(1004, 10011, '2018-1-17'),
(1005, 10018, '2018-1-17'),
(1006, 10014, '2018-1-17'),
(1007, 10015, '2018-1-17'),
(1008, 10011, '2018-1-17');



CREATE TABLE `VENDOR` (
  `V_CODE` int NOT NULL,
  `V_NAME` varchar(255),
  `V_CONTACT` varchar(255),
  `V_AREACODE` int,
  `V_PHONE` char(8),
  `V_STATE` char(2),
  `V_ORDER` char(1),
  PRIMARY KEY (`V_CODE`)
);

INSERT INTO `VENDOR` (`V_CODE`, `V_NAME`, `V_CONTACT`, `V_AREACODE`, `V_PHONE`, `V_STATE`, `V_ORDER`) VALUES
(21225, 'Bryson, Inc.', 'Smithson', 615, '223-3234', 'TN', 'Y'),
(21226, 'SuperLoo, Inc.', 'Flushing', 904, '215-8995', 'FL', 'N'),
(21231, 'D&E Supply', 'Singh', 615, '228-3245', 'TN', 'Y'),
(21344, 'Gomez Bros.', 'Ortega', 615, '889-2546', 'KY', 'N'),
(22567, 'Dome Supply', 'Smith', 901, '678-1419', 'GA', 'N'),
(23119, 'Randsets Ltd.', 'Anderson', 901, '678-3998', 'GA', 'Y'),
(24004, 'Brackman Bros.', 'Browning', 615, '228-1410', 'TN', 'N'),
(24288, 'ORDVA, Inc.', 'Hakford', 615, '898-1234', 'TN', 'Y'),
(25443, 'B&K, Inc.', 'Smith', 904, '227-0093', 'FL', 'N'),
(25501, 'Damal Supplies', 'Smythe', 615, '890-3529', 'TN', 'N'),
(25595, 'Rubicon Systems', 'Orton', 904, '456-0092', 'FL', 'Y');


CREATE TABLE `PRODUCT` (
  `P_CODE` varchar(255) primary key,
  `P_DESCRIPT` varchar(255),
  `P_INDATE` date,
  `P_QOH` int,
  `P_MIN` int,
  `P_PRICE` float,
  `P_DISCOUNT` float,
  `V_CODE` int,
  `P_MIN_ORDER` int,
  `P_REORDER` int,
  FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE)
);

INSERT INTO `PRODUCT` (`P_CODE`, `P_DESCRIPT`, `P_INDATE`, `P_QOH`, `P_MIN`, `P_PRICE`, `P_DISCOUNT`, `V_CODE`, `P_MIN_ORDER`, `P_REORDER`) VALUES
('11QER/31', 'Power painter, 15 psi., 3-nozzle', '2017-11-03', 8, 5, 109.99, 0, 25595, 25, 0),
('13-Q2/P2', '7.25-in. pwr. saw blade', '2017-12-13', 32, 15, 14.99, 0.05, 21344, 50, 0),
('14-Q1/L3', '9.00-in. pwr. saw blade', '2017-11-13', 18, 12, 17.49, 0, 21344, 50, 0),
('1546-QQ2', 'Hrd. cloth, 1/4-in., 2x50', '2018-01-15', 15, 8, 39.95, 0, 23119, 35, 0),
('1558-QW1', 'Hrd. cloth, 1/2-in., 3x50', '2018-01-15', 23, 5, 43.99, 0, 23119, 25, 0),
('2232/QTY', 'B&D jigsaw, 12-in. blade', '2017-12-30', 8, 5, 109.92, 0.05, 24288, 15, 0),
('2232/QWE', 'B&D jigsaw, 8-in. blade', '2017-12-24', 6, 5, 99.87, 0.05, 24288, 15, 0),
('2238/QPD', 'B&D cordless drill, 1/2-in.', '2018-01-20', 12, 5, 38.95, 0.05, 25595, 12, 0),
('23109-HB', 'Claw hammer', '2018-01-20', 23, 10, 9.95, 0.1, 21225, 25, 0),
('23114-AA', 'Sledge hammer, 12 lb.', '2018-01-02', 8, 5, 14.4, 0.05, NULL, 12, 0),
('54778-2T', 'Rat-tail file, 1/8-in. fine', '2017-12-15', 43, 20, 4.99, 0, 21344, 25, 0),
('89-WRE-Q', 'Hicut chain saw, 16 in.', '2018-02-07', 11, 5, 256.99, 0.05, 24288, 10, 0),
('PVC23DRT', 'PVC pipe, 3.5-in., 8-ft', '2018-02-20', 188, 75, 5.87, 0, NULL, 50, 0),
('SM-18277', '1.25-in. metal screw, 25', '2018-03-01', 172, 75, 6.99, 0, 21225, 50, 0),
('SW-23116', '2.5-in. wd. screw, 50', '2018-02-24', 237, 100, 8.45, 0, 21231, 100, 0),
('WR3/TT3', 'Steel matting, mesh', '2018-01-17', 18, 5, 119.95, 0.1, 25595, 10, 0);



CREATE TABLE `LINE` (
  `INV_NUMBER` int NOT NULL,
  `LINE_NUMBER` int NOT NULL,
  `P_CODE` varchar(255),
  `LINE_UNITS` int,
  `LINE_PRICE` float,
  PRIMARY KEY (`INV_NUMBER`,`LINE_NUMBER`),
  FOREIGN KEY (`P_CODE`) REFERENCES `PRODUCT` (`P_CODE`),
  FOREIGN KEY (`INV_NUMBER`) REFERENCES `INVOICE` (`INV_NUMBER`)
);

INSERT INTO `LINE` (`INV_NUMBER`, `LINE_NUMBER`, `P_CODE`, `LINE_UNITS`, `LINE_PRICE`) VALUES
(1001, 1, '13-Q2/P2', 1, 14.99),
(1001, 2, '23109-HB', 1, 9.95),
(1002, 1, '54778-2T', 2, 4.99),
(1003, 1, '2238/QPD', 1, 38.95),
(1003, 2, '1546-QQ2', 1, 39.95),
(1003, 3, '13-Q2/P2', 5, 14.99),
(1004, 1, '54778-2T', 3, 4.99),
(1004, 2, '23109-HB', 2, 9.95),
(1005, 1, 'PVC23DRT', 12, 5.87),
(1006, 1, 'SM-18277', 3, 6.99),
(1006, 2, '2232/QTY', 1, 109.92),
(1006, 3, '23109-HB', 1, 9.95),
(1006, 4, '89-WRE-Q', 1, 256.99),
(1007, 1, '13-Q2/P2', 2, 14.99),
(1007, 2, '54778-2T', 1, 4.99),
(1008, 1, 'PVC23DRT', 5, 5.87),
(1008, 2, 'WR3/TT3', 3, 119.95),
(1008, 3, '23109-HB', 1, 9.95);

CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` int NOT NULL,
  `EMP_TITLE` varchar(255),
  `EMP_LNAME` varchar(255),
  `EMP_FNAME` varchar(255),
  `EMP_INITIAL` char(1),
  `EMP_DOB` date,
  `EMP_HIRE_DATE` date,
  `EMP_YEARS` int,
  `EMP_AREACODE` int,
  `EMP_PHONE` varchar(255),
  PRIMARY KEY (`EMP_NUM`)
); 
INSERT INTO `EMPLOYEE` (`EMP_NUM`, `EMP_TITLE`, `EMP_LNAME`, `EMP_FNAME`, `EMP_INITIAL`, `EMP_DOB`, `EMP_HIRE_DATE`, `EMP_YEARS`, `EMP_AREACODE`, `EMP_PHONE`) VALUES
(100, 'Mr.', 'Kolmycz', 'George', 'D', '1942-06-15', '1985-03-15', 18, 615, '324-5456'),
(101, 'Ms.', 'Lewis', 'Rhonda', 'G', '1965-03-19', '1986-04-25', 16, 615, '324-4472'),
(102, 'Mr.', 'VanDam', 'Rhett', '', '1958-11-14', '1990-12-20', 12, 901, '675-8993'),
(103, 'Ms.', 'Jones', 'Anne', 'M', '1974-10-16', '1994-08-28', 8, 615, '898-3456'),
(104, 'Mr.', 'Lange', 'John', 'P', '1971-11-08', '1994-10-20', 8, 901, '504-4430'),
(105, 'Mr.', 'Williams', 'Robert', 'D', '1975-03-14', '1998-11-08', 4, 615, '890-3220'),
(106, 'Mrs.', 'Smith', 'Jeanine', 'K', '1968-02-12', '1989-01-05', 14, 615, '324-7883'),
(107, 'Mr.', 'Diante', 'Jorge', 'D', '1974-08-21', '1994-07-02', 8, 615, '890-4567'),
(108, 'Mr.', 'Wiesenbach', 'Paul', 'R', '1966-02-14', '1992-11-18', 10, 615, '897-4358'),
(109, 'Mr.', 'Smith', 'George', 'K', '1961-06-18', '1989-04-14', 13, 901, '504-3339'),
(110, 'Mrs.', 'Genkazi', 'Leighla', 'W', '1970-05-19', '1990-12-01', 12, 901, '569-0093'),
(111, 'Mr.', 'Washington', 'Rupert', 'E', '1966-01-03', '1993-06-21', 9, 615, '890-4925'),
(112, 'Mr.', 'Johnson', 'Edward', 'E', '1961-05-14', '1983-12-01', 19, 615, '898-4387'),
(113, 'Ms.', 'Smythe', 'Melanie', 'P', '1970-09-15', '1999-05-11', 3, 615, '324-9006'),
(114, 'Ms.', 'Brandon', 'Marie', 'G', '1956-11-02', '1979-11-15', 23, 901, '882-0845'),
(115, 'Mrs.', 'Saranda', 'Hermine', 'R', '1972-07-25', '1993-04-23', 9, 615, '324-5505'),
(116, 'Mr.', 'Smith', 'George', 'A', '1965-11-08', '1988-12-10', 14, 615, '890-2984');

CREATE TABLE `CUSTOMER_2` (
  `CUS_CODE` int NOT NULL,
  `CUS_LNAME` varchar(255),
  `CUS_FNAME` varchar(255),
  `CUS_INITIAL` char(1),
  `CUS_AREACODE` int,
  `CUS_PHONE` char(8),
  PRIMARY KEY (`CUS_CODE`)
);

INSERT INTO `CUSTOMER_2` (`CUS_CODE`, `CUS_LNAME`, `CUS_FNAME`, `CUS_INITIAL`, `CUS_AREACODE`, `CUS_PHONE`) VALUES
(345, 'Terrell', 'Justine', 'H', 615, '322-9870'),
(347, 'Olowski', 'Paul', 'F', 615, '894-2180'),
(351, 'Hernandez', 'Carlos', 'J', 723, '123-7654'),
(352, 'McDowell', 'George', '', 723, '123-7768'),
(365, 'Tirpin', 'Khaleed', 'G', 723, '123-9876'),
(368, 'Lewis', 'Marie', 'J', 734, '332-1789'),
(369, 'Dunne', 'Leona', 'K', 713, '894-1238');


create table USERS (
ID INT  AUTO_INCREMENT PRIMARY KEY,
username varchar(100),
password varchar(255)
);

#Create an admin user with password mypass
INSERT INTO USERS(username,password) values('admin', 'e727d1464ae12436e899a726da5b2f11d8381b26');
SELECT sid FROM Students WHERE major = 'CS';
SELECT concat(first_name,' ', last_name) AS Full_Name, major AS Degree, department AS Junk FROM Students ;
SELECT DISTINCT department FROM students;
SELECT NAME,ROOM FROM COURSES WHERE ENROLLMENT > 10 AND YEAR <> 2017;
SELECT * FROM COURSES WHERE ROOM IN ('LB217', 'LB218', 'LB317');
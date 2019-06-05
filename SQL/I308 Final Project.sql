mysql -h db.soic.indiana.edu -u i308u18_team26 --pass=my+sql=i308u18_team26 -D i308u18_team26

mysql -h db.soic.indiana.edu -u i308_data --pass=my+sql=i308_data -D i308_dataset


Select distinct c.name, b.title
From book as b, customer as c, trans as t
select * from shift



Where c.id=t.id and t.bookid=b.bookid and (b.bookid = 'the code book' or b.price > 40);

CREATE VIEW ctb as
Select c.name, c.phone, b.title, b.price, t.tdate
From book as b, customer as c, trans as t
Where c.id=t.id and b.bookid=t.bookid;

Select c.name, c.phone
From customers as c, 
Where

Select distinct name, phone
from ctb
where  phone  like  "555-%";


Select distinct name, phone, date_format(tdate, ' %c/%d/%y') 
From ctb
Where date_format(tdate, ' %b %y') = ' Oct 2017';

ASSIGNMENT
CREATE TABLE artist(
	aid int auto_increment,
	fname varchar(50) NOT NULL,
	lname varchar(100),
	dob date,
	gender varchar (1),
	PRIMARY KEY(aid)
	)
Engine=INNODB;








CREATE TABLE band(
	bid int auto_increment,
	Name varchar(255) NOT NULL,
	year_formed year,
	PRIMARY KEY(bid)	
)
Engine=INNODB;

CREATE TABLE in_band(
	Aid int NOT NULL,
	Bid int NOT NULL,
	Date_in Date NOT NULL,
	Date_out Date,
	FOREIGN KEY(aid) REFERENCES artist (aid),
	FOREIGN KEY(bid) REFERENCES band (bid)
)
Engine=INNODB;

CREATE TABLE album(
	Albumid int auto_increment,
	Bid int NOT NULL,
	Published_year YEAR,
	Title varchar(255),
	Price decimal(10,2),
	Publisher varchar(255),
	Format varchar (255),
	PRIMARY KEY(albumid),
	FOREIGN KEY (bid) REFERENCES band (bid)
	)
ENGINE = INNODB;






INSERT INTO artist (dob, fname, lname, gender)
VALUES ("1946-07-25", "David", "Gilmour", "M"),
("1947-06-03", "Syd", "Barrett", "M"),
("1949-06-01", "Roger", "Waters", "F"),
("1943-06-10", "Nick", "Masont", "M"),
("1946-06-03", "Getty", "Lee", "M"),
("1948-09-01", "Neil", "Peart", "F"),
("1951-08-05", "Alex", "Lifeson", "M"),
("2003-05-29", "Kurt", "Kobain", "M"),
("2005-01-28", "Dave", "Grohl", "M"),
("2006-02-20", "Krist", "Novoselic", "M"),
("1994-06-18", "Freddie", "Mercury","M"),
("1962-03-01", "Brian", "May", "M"),
("1942-08-011", "Roger", "Taylor", "M"),
("1948-07-01", "Ann", "Wilson", "F"),
("1952-02-09", "Nancy", "Wilson", "F");


INSERT INTO band(name, year_formed) 
VALUES ("Pink Floyd", 1965), 
("Nirvana", 1987), 
("Rush", 1968),
("Queen",1977),
("Heart", 1970);

INSERT INTO album(published_year, title, price, publisher, format, bid)
VALUES (1982, "Pink Floyd album 1", 12, "Atlantic Records", "8-Track",1), 
(1989, "Queen album 1", 14.99, "Interscope Records", "CD", 4), 
(1987, "Nirvana album 1", 12.99, "Atlantic Records", "CD", 2), 
(1985, "Heart Album 1", 10, "Interscope Records", "8-Track", 5),
(1980, "Heart Album 2", 13.14, "Atlantic Records", "CD", 5),
(1987, "Heart Album 3", 12.93, "Interscope Records", "8-Track", 5),
(1987, "Heart Album 4", 12.43, "Atlantic Records", "CD", 5),
(1987, "Rush Album 1", 10.12, "Interscope Records", "8-Track", 3),
(1987, "Rush Album 2", 8.33, "Atlantic Records", "CD", 3),
(1987, "Rush Album 3", 9.31, "Interscope Records", "CD", 3),
(1987, "Rush Album 4", 14.32, "Atlantic Records", "8-Track", 3);






INSERT INTO in_band(aid, bid, date_in, date_out)
VALUES(1, 1, "2010-02-07",Null),
(2, 1, "2010-01-06",Null),
(3, 1, "2010-04-10",Null),
(4, 1, "2010-01-07",Null),
(5, 2, "2009-01-10",Null),
(6, 2, "2009-01-10","2011-02-09"),
(7, 2, "2009-01-09",Null),
(8, 3, "2008-01-11",Null),
(9, 3, "2008-01-09",Null),
(10, 3, "2008-01-19",Null),
(11, 4, "2011-03-12", "2012-01-12"),
(12, 4, "2012-10-09",Null),
(13, 4, "2012-05-10",Null),
(14, 5, "2012-03-09",Null),
(15, 5, "2012-05-07",Null),
(11, 4, "2018-01-12",Null),
(1, 3, "2011-02-09",Null);

(select statement 1)
SELECT CONCAT(a.fname, " ",a.lname) 
FROM band as b, artist as a, in_band as ib,
WHERE a.aid=b.bid AND b.name="Pink Floyd" AND ib.date_in="2010-01-11";
GROUP BY CONCAT(a.fname, " ", a.lname)

(select statement 2)
SELECT distinct b.name, CONCAT(a.fname, " ",a.lname) AS Artists_Name
FROM album as al, band as b, artist as a, in_band as ib
WHERE b.bid = al.bid AND a.aid = ib.aid AND b.bid = ib.bid AND title = "Pink Floyd album 1";

(select statement 3)
SELECT distinct CONCAT(a.fname," ",a.lname) AS FullName, a.gender, a.dob, b.name
FROM artist as a, band as b, in_band as ib
WHERE ib.bid=b.bid AND a.aid = ib.aid AND (round((datediff(curdate(),a.dob))/365,0)>21 OR a.gender="F")
GROUP BY FullName;

(select statement 4)
SELECT distinct b.name AS Bands_w_No_Female
FROM band as b, artist as a
WHERE b.bid IN  (
	SELECT b.bid
FROM in_band as ib
WHERE a.aid=ib.aid AND b.bid=ib.bid AND a.gender="M");

(select statement 5)
SELECT CONCAT(a.fname," ",a.lname) AS FullName, b.name AS BandName, COUNT(al.albumid) AS Number_of_Albums, round((datediff(curdate(),a.dob))/365,0) AS age
FROM artist as a, in_band as ib, album as al, band as b
WHERE a.aid=ib.aid AND al.bid=ib.bid AND a.gender="F" AND ib.bid=b.bid
GROUP BY a.aid
HAVING COUNT(al.albumid)>1; 

Select curdate();

(SELECT STATEMENT 6)
SELECT CONCAT (a.fname," ",a.lname) b.name 
FROM artists as a, bands as b, in_band as ib 
WHERE
____________________________________________________________________________


SELECT b.title
FROM book as b
WHERE b.bookid NOT IN  (
SELECT t.bookid
FROM trans as t, customer as c
WHERE t.id=c.id AND c.id=500
);


SELECT c.name, SUM(b.price)
FROM customer as c, trans as t, book as b
WHERE t.id=c.id AND b.bookid=t.bookid
GROUP BY c.name
HAVING SUM(b.price) > 50;




SELECT m.item_name, SUM(od.qty), SUM(m.price*od.qty)
FROM menu as m, order_detail as od, order_main as om
WHERE m.menuid = od.menuid AND od.orderid = om.orderid AND om.order_date Like "2003-11-08"
GROUP BY m.item_name;



SELECT CONCAT(e.fname," ",e.lname)AS FullName, COUNT(ws.empid)
FROM employee as e, works_shift as ws, shift as s
WHERE e.empid = ws.empid 
AND s.shiftid = ws.shiftid
AND date_format(ws.wdate, "%Y") = 2011
GROUP BY FullName
HAVING COUNT(ws.empid)>5;

SELECT CONCAT(e.fname," ",e.lname) AS FullName, ws.role
FROM employee as e, order_main as om, works_shift as ws
WHERE e.empid=ws.empid AND om.orderid=3902 AND om.order_date = ws.wdate AND om.time_in between ws.time_in and ws.time_out 

SELECT CONCAT(e.fname," ",e.lname), DATE_FORMAT(e.dob, '%M %D %Y') 
FROM employee as e
WHERE floor((datediff(curdate(),e.dob))/365);


*find full name of employees working lunch period and put in descending order 

SELECT CONCAT(e.fname," ",e.lname)AS FullName, COUNT(ws.empid)AS Total_shifts
FROM employee as e, works_shift as ws, shift as s
WHERE s.period="L" AND ws.shiftid=s.shiftid AND e.empid=ws.empid AND s.dayoftheweek
GROUP BY FullName
ORDER BY Total_shifts DESC;

SELECT CONCAT(e.fname," ",e.lname)AS FullName, COUNT(ws.empid)AS Total_shifts
FROM employee as e, works_shift as ws, shift as s
WHERE s.period="L" AND ws.shiftid=s.shiftid AND e.empid=ws.empid 
GROUP BY FullName
ORDER BY Total_shifts DESC;
SELECT m.item_name, SUM(od.qty)AS qty, ifnull(SUM(m.price * od.qty),"grand total") AS total_sales_amt
FROM menu as m, order_detail as od, order_main as om
WHERE od.menuid=m.menuid AND om.orderid=od.orderid AND om.order_date="2012-11-16"
GROUP BY item_name
WITH ROLLUP;



SELECT CONCAT(e.fname," ",e.lname) AS name, CONCAT(m.fname, " ", m.lname)AS Manager
FROM employee as e, employee as m
WHERE e.managerid=m.empid;

SELECT CONCAT(m.fname," ",m.lname)AS Manager, COUNT(e.empid)AS NumofSubordinates, GROUP_CONCAT(" ", e.fname) AS Subordinates
FROM employee as e, employee as m
WHERE e.managerid =m.empid 
GROUP BY Manager;
____________________________________________________________________________
FINAL PROJECT Statements

CREATE TABLE classroom (
	classroomid INT NOT NULL AUTO_INCREMENT,
	RoomNumber INT NOT NULL,
	Capacity INT NOT NULL,
	buildingid INT NOT NULL,
	PRIMARY KEY(classroomid),
	FOREIGN KEY(buildingid) REFERENCES building(buildingid)
)
Engine=INNODB;

CREATE TABLE building (
	Buildingid INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	AddressStreet VARCHAR(50) NOT NULL,
AddressCity VARCHAR(50) NOT NULL,
AddressState VARCHAR(50) NOT NULL,
AddressZip VARCHAR(50) NOT NULL,
	PRIMARY KEY(Buildingid)
)
Engine=INNODB;

CREATE TABLE classroom_feature (
	Classroomid INT NOT NULL,
	Feature VARCHAR(50),
	FOREIGN KEY(Classroomid) REFERENCES classroom(Classroomid)
)
Engine=INNODB;





CREATE TABLE Student_major (
	Studentid INT NOT NULL,
	Majorid INT NOT NULL,
	FOREIGN KEY(Studentid) REFERENCES student(Studentid),
	FOREIGN KEY(Majorid) REFERENCES major(majorid)
)
Engine=INNODB;

CREATE TABLE major (
	Majorid INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	Departmentid INT NOT NULL,
	PRIMARY KEY(Majorid),
	FOREIGN KEY(Departmentid) REFERENCES department(Departmentid)
)
Engine=INNODB;

CREATE TABLE Section_INFO (
	Section_num INT NOT NULL,
	Employeeid INT NOT NULL,
	Classroomid INT NOT NULL,
	Start_date DATE NOT NULL,
	End_date DATE NOT NULL,
	Start_time TIME NOT NULL,
	End_time TIME NOT NULL,
	FOREIGN KEY(Section_num) REFERENCES Section(Section_num),
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid)
)
Engine=INNODB;
	
CREATE TABLE studentsection(
	studentid INT,
	sectionid INT,
	semesterid varchar(5) NOT NULL,
	Letter_Grade VARCHAR(2),
	FOREIGN KEY(studentid) REFERENCES student(studentid),
	FOREIGN KEY(sectionid) REFERENCES section(sectionid),
FOREIGN KEY(semesterid) REFERENCES semester(semesterid)
)
Engine=INNODB;



CREATE TABLE Course (
	Courseid INT NOT NULL AUTO_INCREMENT,
	Title VARCHAR(50) NOT NULL,
	NumOfCreditHours INT NOT NULL,
	Subject VARCHAR(50),
	Departmentid INT NOT NULL,
	PRIMARY KEY(Courseid),
	FOREIGN KEY(Departmentid) REFERENCES Department(Departmentid)
)
Engine=INNODB;

CREATE TABLE Course_Prerequisite (
	Courseid INT NOT NULL,
	Prerequisiteid INT NOT NULL,
	FOREIGN KEY(Courseid) REFERENCES Course(Courseid),
	FOREIGN KEY(Prerequisiteid) REFERENCES Course(Courseid)
)
Engine=INNODB;

CREATE TABLE Department (
	Departmentid INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	AddressStreet VARCHAR(50) NOT NULL,
	AddressCity VARCHAR(50) NOT NULL,
	AddressState VARCHAR(50) NOT NULL,
	AddressZip VARCHAR(50) NOT NULL,
	PRIMARY KEY(Departmentid)
)
Engine=INNODB;

CREATE TABLE Section (
	Section_num INT NOT NULL AUTO_INCREMENT,
Capacity VARCHAR(50) NOT NULL,
	Courseid INT NOT NULL,
	PRIMARY KEY(Section_num),
	FOREIGN KEY(Courseid) REFERENCES Course(Courseid)
)
Engine=INNODB;
	



CREATE TABLE Department_Faculty (
	Employeeid INT NOT NULL,
	Departmentid INT NOT NULL,
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid),
	FOREIGN KEY(Departmentid) REFERENCES Department(Departmentid)
)
Engine=INNODB;

CREATE TABLE Advisors (
Employeeid INT NOT NULL,
	Expertise VARCHAR(50),
	FOREIGN KEY(Employeeid) REFERENCES faculty(Employeeid) 
)
Engine=INNODB;

CREATE TABLE Instructors (
	Employeeid INT NOT NULL,
	Subject VARCHAR(50) NOT NULL,
	Type VARCHAR(50),
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid)
)
Engine=INNODB;

CREATE TABLE Faculty (
	Employeeid INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	Rank VARCHAR(10) NOT NULL,
	HireDate DATE NOT NULL,
	PRIMARY KEY(Employeeid)
)
Engine=INNODB;

CREATE TABLE Faculty_Phone (
	Employeeid INT,
	Phone_num VARCHAR(15),
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid)
)
Engine=INNODB;


CREATE TABLE Faculty_Email (
	Employeeid INT NOT NULL,
Email VARCHAR(50),
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid)
)
Engine=INNODB;

CREATE TABLE student (
	Studentid INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	dob DATE,
	LocalAddressSt VARCHAR(50),
	LocalAddressCity VARCHAR(50),
LocalAddressState VARCHAR(50),
HomeAddressSt VARCHAR(50),
	HomeAddressCity VARCHAR(50),
HomeAddressState VARCHAR(50),
HomeAddressZip VARCHAR(50),
HomeAddressCountry VARCHAR(50),
	PRIMARY KEY(Studentid)
)
Engine=INNODB;

CREATE TABLE Student_email (
	Studentid INT NOT NULL,
	Email VARCHAR(50),
	FOREIGN KEY(Studentid) REFERENCES Student(Studentid)
)
Engine = INNODB;

CREATE TABLE Student_phone (
	Studentid INT NOT NULL,
	Phone VARCHAR(15),
	FOREIGN KEY(Studentid) REFERENCES Student(Studentid)
)
Engine = INNODB;

CREATE TABLE Student_parent(
	Parentid INT NOT NULL AUTO_INCREMENT,
Studentid INT NOT NULL,
	Parent_firstname VARCHAR(50),
	Parent_lastname VARCHAR(50),
	PRIMARY KEY(Parentid),
	FOREIGN KEY(Studentid) REFERENCES Student(Studentid)
)
Engine = INNODB;

CREATE TABLE Student_parent_phone(
	Parentid INT NOT NULL,
	Parent_phone_num VARCHAR(15),
	FOREIGN KEY(Parentid) REFERENCES Student_Parent(Parentid)
)
Engine = INNODB;

CREATE TABLE Student_Advisors (
	Studentid INT NOT NULL,
	Employeeid INT NOT NULL,
	FOREIGN KEY(Studentid) REFERENCES Student(Studentid),
	FOREIGN KEY(Employeeid) REFERENCES Faculty(Employeeid)
)
Engine = INNODB;

SELECT STATEMENTS:
1a: (Student Roster of students in Section 10) +5

SELECT s.first_name AS First, s.last_name AS Last
FROM student AS s, studentsection AS sh, section AS n
WHERE s.studentid=sh.studentid AND n.sectionid = sh.sectionid AND n.sectionid = $sansectionnumber
ORDER BY s.last_name, s.last_name ASC;

2b: (Classrooms that have Computer Features available at 10am) +10
SELECT DISTINCT c.RoomNumber, cf.Feature
FROM Classroom AS c, Classroom_feature AS cf, Section_INFO AS si
WHERE c.Classroomid=cf.Classroomid AND 10 NOT BETWEEN si.Start_time AND si.End_time AND cf.Feature="Computer" AND c.Classroomid=si.Classroomid

3b:
SELECT f.first_name, f.last_name, c.Title
FROM Faculty AS f, Section AS s, Section_INFO AS si, Course AS c
WHERE si.Section_num=s.Section_num AND s.Courseid=c.Courseid AND f.Employeeid=si.Employeeid




SELECT 
FROM
WHERE

2a: (WORKS I FIXED THIS-Max (as of 8am))
SELECT DISTINCT c.RoomNumber, cf.Feature
FROM classroom AS c, classroom_feature AS cf
WHERE c.classroomid=cf.classroomid AND cf.Feature ="TV";

5c
SELECT CONCAT (s.first_name," " ,s.last_name) AS FullName, ss.LetterGrade, SUM(c.NumOfCreditHours), SUM(c.NumOfCreditHours)/ ss.LetterGrade AS GPA 
FROM students AS s, Course AS c, studentsection AS ss
WHERE s.studentid= ss.LetterGrade AND s.studentid = c.courseid AND ss.LetterGrade != "F"
ORDER BY c.course ASC;



CUSTOM QUERY(show roomnumber, and title of class, when subject= math)

SELECT cl.RoomNumber, c.Title
FROM classroom AS cl, section AS s, course AS c
WHERE cl.classroomid = s.sectionid AND c.courseid= s.sectionid AND c.Subject = "Math"
ORDER BY c.Title ASC;


Custom Query (Show classroom number and what building it is located in when people > 50)

SELECT cl.RoomNumber, bu.Name
FROM classroom as cl, building as bu
WHERE cl.BuildingID=bu.BuildingID AND cl.Capacity >= 50
ORDER BY bu.Name


Drop table Advisors;
Drop table Building;
Drop table Classroom;
Drop table Classroom_feature;
Drop table Course;

Drop table Course_Prerequisite;
Drop table Department;
Drop table Department_Faculty;
Drop table Faculty;
Drop table Faculty_Email;
Drop table Faculty_Phone;
Drop table Instructors;
Drop table Major;
Drop table Section;
Drop table Section_INFO;
Drop table Student;
Drop table StudentSection;
Drop table Student_Advisors;
Drop table Student_email;
Drop table Student_major;
Drop table Student_parent;
Drop table Student_parent_phone;
Drop table Student_phone;

CREATE TABLE section (
	sectionid INT NOT NULL AUTO_INCREMENT,
	sectionnumber INT NOT NULL,
capacity VARCHAR(50) NOT NULL,
	courseid INT NOT NULL,
	semesterid varchar(5) NOT NULL,
	PRIMARY KEY(sectionid),
	FOREIGN KEY(courseid) REFERENCES course(courseid),
	FOREIGN KEY(semesterid) REFERENCES semester(semesterid)
)
Engine=INNODB;

CREATE TABLE course (
	Courseid INT NOT NULL AUTO_INCREMENT,
	Title VARCHAR(50) NOT NULL,
	NumOfCreditHours INT NOT NULL,
	Subject VARCHAR(50),
	Departmentid INT NOT NULL,
	PRIMARY KEY(Courseid),
	FOREIGN KEY(Departmentid) REFERENCES department(Departmentid)
)
Engine=INNODB;

CREATE TABLE department (
	Departmentid INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	AddressStreet VARCHAR(50) NOT NULL,
	AddressCity VARCHAR(50) NOT NULL,
	AddressState VARCHAR(50) NOT NULL,
	AddressZip VARCHAR(50) NOT NULL,
	PRIMARY KEY(Departmentid)
)
Engine=INNODB;

CREATE TABLE semester (
	semesterid varchar(5) NOT NULL,
	Start_date DATE NOT NULL,
	End_date DATE NOT NULL,
	PRIMARY KEY(semesterid)
)
Engine=INNODB;



s.first_name, s.last_name, m.name as major
from student as s, major as m, Student_major as sm, faculty as e, studentad as sa
where s.studentid=sm.studentid  AND sm.majorid=m.majorid AND sa.employeeid = e.employeeid AND sa.studentid = s.studentid AND sa.employeeid = $sanemployeeid order by s.last_name,s.first_name;


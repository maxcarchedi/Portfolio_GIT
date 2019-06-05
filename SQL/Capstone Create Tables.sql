CREATE TABLE Students (
	StudentID INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Scholastic Year VARCHAR(30) NOT NULL,
	Movein_date DATE,
	PRIMARY KEY(StudentID)
);
CREATE TABLE Dorms (
	DormID INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(30) NOT NULL,
	Neighborhood VARCHAR(30) NOT NULL,
Address VARCHAR(60) NOT NULL,
	Office_Phone INT,
	PRIMARY KEY(DormID)
);


OMITTED
_____________________________________________________________________
CREATE TABLE Buildings (
	BuildingID INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(30) NOT NULL,
	Address VARCHAR(30) NOT NULL,
	Office_Phone INT,
	PRIMARY KEY(BuildingID)
);
_____________________________________________________________________

CREATE TABLE Items (
	ItemID INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(30) NOT NULL,
	Category VARCHAR(30)NOT NULL,
Supplier VARCHAR(30) NOT NULL,
Price INT NOT NULL,
Length INT NOT NULL,
Width INT NOT NULL,
Height INT NOT NULL,
Image LONGBLOB,
	PRIMARY KEY(ItemID)
);

CREATE TABLE Designs (
	DesignID INT NOT NULL AUTO_INCREMENT,
Floor_Plan LONGBLOB,
FileSize_mb INT,
Total_Price INT,
	PRIMARY KEY(DesignID)
);
CREATE TABLE Saved_Design (
	DesignID INT NOT NULL,
	StudentID INT NOT NULL,
	Time_Saved DATETIME NOT NULL,
	FOREIGN KEY(DesignID) REFERENCES Designs(DesignID),
	FOREIGN KEY(StudentID)REFERENCES Students(StudentID)
);



INSERT DATA INTO THE DATABASE

______________________________________________________________________

insert into Dorms (DormID, Name, Neighborhood, Address, Office_Phone, City, Zipcode, State)
values (1, ‘Briscoe’, ‘Northwest’, ‘1225_N_Fee_Lane’, 8128555313, ‘Bloomington’ , 47406 , ‘IN’);



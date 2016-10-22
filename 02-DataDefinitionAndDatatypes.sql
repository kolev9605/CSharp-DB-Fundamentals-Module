--problem01
CREATE DATABASE Minions

--problem02
CREATE TABLE Minions
(
Id INT NOT NULL PRIMARY KEY,
Name VARCHAR(50),
Age INT
)

CREATE TABLE Towns
(
Id INT NOT NULL PRIMARY KEY,
Name VARCHAR(50),
)

--problem03
ALTER TABLE Minions
ADD TownId INT

ALTER TABLE Minions
DROP COLUMN TownId

ALTER TABLE Minions
ADD TownId INT
constraint fk_townid foreign key (TownId) references Towns (Id)

--problem04
INSERT INTO Minions(Id, Name, Age, TownId)
VALUES (1, 'Kevin', 22, 1),
(2,'Bob',15, 3),
(3,'Steward',NULL, 2)

INSERT INTO Towns (Id, Name)
VALUES(1,'Sofia'),
		(2,'Plovdiv'),
		(3,'Varna')

--problem05
TRUNCATE TABLE Minions

--problem06
DROP TABLE Minions
DROP TABLE Towns

--problem07
CREATE DATABASE People
USE People
DROP TABLE Users

--problem08
CREATE TABLE Users
(
Id BIGINT NOT NULL IDENTITY PRIMARY KEY,
Username VARCHAR(30) NOT NULL UNIQUE,
Password VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(8000),
LastLoginTime DATETIME,
IsDeleted VARCHAR(1)
)

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES 
('Asen1Asen1Asen1Asen', 'Asen1Asen1', null,null,'T'),
('Asen1Asen1Asen1Asen1', 'Asen1Asen1', null,null,'f'),
('Asen1Asen1Asen1Asen2', 'Asen1Asen1', null,null,'f'),
('Asen1Asen1Asen1Asen3', 'Asen1Asen1', null,null,'T'),
('Asen1Asen1Asen1Asen4', 'Asen1Asen1', null,null,'f')

--problem09
ALTER TABLE Users DROP CONSTRAINT PK__Users__3214EC07758824A7

ALTER TABLE Users ADD CONSTRAINT pk_userId PRIMARY KEY (Id, Username)

--problem10
ALTER TABLE Users
ADD CONSTRAINT passwordCheck CHECK (LEN(Password) >= 5);

--problem11
ALTER TABLE [dbo].[Users] ADD CONSTRAINT DF_DefaultDate DEFAULT GETDATE() FOR LastLoginTime;


--Problem 12. Set Unique Field
USE Minions
GO

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT uc_Username UNIQUE (Username)

ALTER TABLE Users
ADD CONSTRAINT uc_UsernameLength CHECK (LEN(Username) > 3)

--Problem 13. Movies Database
CREATE DATABASE Movies
GO
USE Movies
GO

--START Submition in Judge
CREATE TABLE Directors
(
Id INT IDENTITY NOT NULL,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(1000)
CONSTRAINT PK_Directors PRIMARY KEY (Id)
)

CREATE TABLE Genres
(
Id INT IDENTITY NOT NULL,
GenreName NVARCHAR(20) NOT NULL,
Notes NVARCHAR(1000)
CONSTRAINT PK_Genres PRIMARY KEY (Id)
)

CREATE TABLE Categories
(
Id INT IDENTITY NOT NULL,
CategoryName NVARCHAR(20) NOT NULL,
Notes NVARCHAR(1000)
CONSTRAINT PK_Categories PRIMARY KEY (Id)
)

CREATE TABLE Movies
(
Id INT IDENTITY NOT NULL,
Title NVARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear SMALLINT,
Length INT,
GenreId INT,
CategoryId INT,
Rating NUMERIC,
Notes NVARCHAR(1000)
CONSTRAINT PK_Movies PRIMARY KEY (Id)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES
('Ben Affleck', 'sample notes'),
('Woody Allen', 'sample notes'),
('Luc Besson', 'sample notes'),
('Cameron Crowe', 'sample notes'),
('Clint Eastwood', 'sample notes')

INSERT INTO Genres (GenreName, Notes)
VALUES
('Action', 'sample notes'),
('Comedy', 'sample notes'),
('Horror', 'sample notes'),
('Thriller', 'sample notes'),
('Drama', 'sample notes')

INSERT INTO Categories (CategoryName, Notes)
VALUES
('0-3', 'suitable for infants'),
('7-12', 'suitable for kids'),
('12-16', 'suitable for teenagers'),
('16-18', NULL),
('18+', 'suitable for adults')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
('Titanic', 1, 1998, 181, 1, 4, 8.2, 'sample notes'),
('Avatar', 4, 2008, 160, 2, 3, 9.22, 'sample notes'),
('Rocky 1', 2, 1980, 90, 3, 1, 9.99, 'sample notes'),
('Rocky 2', 3, 1983, 92, 5, 2, 10.1, 'sample notes'),
('Rocky 3', 1, 1986, 95, 1, 5, 6.2, 'sample notes')

SELECT COUNT(*) FROM Directors
SELECT COUNT(*) FROM Genres
SELECT COUNT(*) FROM Categories
SELECT COUNT(*) FROM Movies
--END Submission in Judge

--Problem 14. Car Rental Database
CREATE DATABASE CarRental
GO
USE CarRental
GO

--START Submission in Judge
CREATE TABLE Categories
(
Id INT IDENTITY NOT NULL,
Category NVARCHAR(20) NOT NULL,
DailyRate NUMERIC,
WeeklyRate NUMERIC,
MonthlyRate NUMERIC,
WeekendRate NUMERIC
CONSTRAINT PK_Categories PRIMARY KEY (Id)
)

CREATE TABLE Cars
(
Id INT IDENTITY NOT NULL,
PlateNumber NVARCHAR(8) NOT NULL,
Make NVARCHAR(20) NOT NULL,
Model NVARCHAR(20) NOT NULL,
CarYear INT,
CategoryId INT,
Doors INT,
Picture VARBINARY(MAX),
Condition NVARCHAR(20),
IsAvailable BIT
CONSTRAINT PK_Cars PRIMARY KEY (Id)
)

CREATE TABLE Employees
(
Id INT IDENTITY NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(20) NOT NULL,
Title NVARCHAR(20),
Notes NVARCHAR(200)
CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers
(
Id INT IDENTITY NOT NULL,
DriverLicenceNumber NVARCHAR(15) NOT NULL,
FullName NVARCHAR(100) NOT NULL,
Address NVARCHAR(500),
City NVARCHAR(50),
ZIPCode NVARCHAR(10),
Notes NVARCHAR(200)
CONSTRAINT PK_Customers PRIMARY KEY (Id)
)

CREATE TABLE RentalOrders
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
CarCondition NVARCHAR(20),
TankLevel NUMERIC(10,2),
KilometrageStart INT,
KilometrageEnd INT,
TotalKilometrage INT,
StartDate DATE,
EndDate DATE,
TotalDays INT,
RateApplied INT,
TaxRate NUMERIC,
OrderStatus NVARCHAR(10),
Notes NVARCHAR(200)
CONSTRAINT PK_RentalOrders PRIMARY KEY (Id)
)

INSERT INTO Categories (Category)
VALUES ('Car'), ('Truck'), ('Van')

INSERT INTO Cars (PlateNumber, Make, Model)
VALUES
('A1234AA', 'Opel', 'Omega'),
('A6542AB', 'Ford', 'Focus'),
('OB4444AP', 'Lada', 'Niva')

INSERT INTO Employees (FirstName, LastName)
VALUES
('Ivan', 'Ivanov'),
('Petar', 'Petrov'),
('Misha', 'Mishav')

INSERT INTO Customers (DriverLicenceNumber, FullName)
VALUES
('A12345', 'Ivan Ivanov Ivanov'),
('A12346', 'Ivan Ivanov Petrov'),
('A12342', 'Petar Ivanov Ivanov')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId)
VALUES
(1, 2, 3),
(2, 3, 1),
(2, 2, 2)

SELECT COUNT(*) FROM Categories
SELECT COUNT(*) FROM Cars
SELECT COUNT(*) FROM Employees
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM RentalOrders
--END Submission in Judge

--Problem 15. Hotel Database
CREATE DATABASE Hotel
GO
USE Hotel
GO

--START Submission in Judge
CREATE TABLE Employees
(
Id INT IDENTITY NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(20),
Notes NVARCHAR(200)
CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers
(
AccountNumber BIGINT NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(15) NOT NULL,
EmergencyName NVARCHAR(50),
EmergencyNumber NVARCHAR(15),
Notes NVARCHAR(200)
CONSTRAINT PK_Customers PRIMARY KEY (AccountNumber)
)

CREATE TABLE RoomStatus
(
RoomStatus NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus)
)

CREATE TABLE RoomTypes
(
RoomType NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes
(
BedType NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms
(
RoomNumber INT NOT NULL,
RoomType NVARCHAR(10) NOT NULL,
BedType NVARCHAR(10) NOT NULL,
Rate NUMERIC,
RoomStatus NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_Rooms PRIMARY KEY (RoomNumber)
)

CREATE TABLE Payments
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber BIGINT NOT NULL,
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays INT,
AmountCharged NUMERIC NOT NULL,
TaxRate NUMERIC,
TaxAmount NUMERIC,
PaymentTotal NUMERIC NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_Payments PRIMARY KEY (Id)
)

CREATE TABLE Occupancies
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
DateOccupied DATE,
AccountNumber BIGINT NOT NULL,
RoomNumber INT NOT NULL,
RateApplied NUMERIC,
PhoneCharge NUMERIC,
Notes NVARCHAR(200)
CONSTRAINT PK_Occupancies PRIMARY KEY (Id)
)

INSERT INTO Employees (FirstName, LastName)
VALUES
('Ivan', 'Ivanov'),
('Petar', 'Petrov'),
('Mitko', 'Dimitrov')

INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber)
VALUES
(34545674545, 'Ivan', 'Petrov', '+35988999999'),
(35436554234, 'Misho', 'Petrovanov', '+359889965479'),
(12480934333, 'Nikolay', 'Nikov', '+35988999919')

INSERT INTO RoomStatus (RoomStatus)
VALUES
('Occupied'),
('Available'),
('Cleaning')

INSERT INTO RoomTypes (RoomType)
VALUES
('Single'),
('Double'),
('Apartment')

INSERT INTO BedTypes (BedType)
VALUES
('Double'),
('Queen'),
('King')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, RoomStatus)
VALUES
(1, 'Single', 'Double', 'Available'),
(2, 'Double', 'King', 'Available'),
(12, 'Apartment', 'Queen', 'Occupied')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, AmountCharged, PaymentTotal, TaxRate)
VALUES
(1, GETDATE(), 34545675676, 10.20, 12.20, 2.4),
(3, GETDATE(), 34545675676, 220.20, 240.22, 2.1),
(2, GETDATE(), 34545675676, 190.20, 215.88, 1.1)

INSERT INTO Occupancies (EmployeeId, AccountNumber, RoomNumber)
VALUES
(1, 34545675676, 2),
(2, 34545675676, 1),
(2, 34545675676, 12)

SELECT COUNT(*) FROM Employees
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM RoomStatus
SELECT COUNT(*) FROM RoomTypes
SELECT COUNT(*) FROM BedTypes
SELECT COUNT(*) FROM Rooms
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Occupancies
--END Submission in Judge

--Problem 16. Create SoftUni Database
CREATE DATABASE SoftUni
GO  

USE SoftUni
GO

CREATE TABLE Towns
(
	Id INT IDENTITY,
	Name NVARCHAR(50)
	CONSTRAINT PK_TownsId PRIMARY KEY (Id)
)

CREATE TABLE Addresses
(
	Id INT IDENTITY,
	AddressText NVARCHAR(100),
	TownId INT
	CONSTRAINT PK_AdressesId PRIMARY KEY (Id)
	CONSTRAINT FK_Adresses_Towns FOREIGN KEY (TownId) REFERENCES Towns(Id)
)
CREATE TABLE Departments
(
	Id INT IDENTITY,
	Name NVARCHAR(50)
	CONSTRAINT PK_DepartmentsId PRIMARY KEY (Id)
)

CREATE TABLE Employees
(
	Id INT IDENTITY,
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50),
	JobTitle NVARCHAR(20),
	DepartmentId INT,
	HireDate DATE,
	Salary MONEY,
	AddressId INT
	CONSTRAINT PK_EmployeesID PRIMARY KEY (Id),
	CONSTRAINT FK_Employees_Deparments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	CONSTRAINT FK_Employees_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)

--Problem 17. Backup Database
BACKUP DATABASE SoftUni
	TO DISK = 'D:\softuni-backup.bak' --location where the backup file will be saved
		WITH FORMAT,
			MEDIANAME = '',
			NAME = 'Full Backup of SoftUni db';
GO

RESTORE DATABASE SoftUni
FROM DISK = 'D:\softuni-backup.bak' --location of the db on your hard drive
GO

--Problem 18. Basic Insert
USE SoftUni
GO

INSERT INTO Towns (Name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas')

INSERT INTO Departments (Name) 
VALUES ('Engineering'), ('Sales'), ('Marketing'), ('Software Development'), ('Quality Assurance')

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) 
VALUES 
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '01/02/2013', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '02/03/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '08/28/2016', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '09/12/2007', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '08/28/2016', 599.88)

--Problem 19. Basic Select All Fields
USE SoftUni
GO
--START Submission in Judge
SELECT * FROM Towns
SELECT * FROM Departments
SELECT * FROM Employees
--END Submission in Judge

--Problem 20. Basic Select All Fields and Order Them
USE SoftUni
GO
--START Submission in Judge
SELECT * FROM Towns ORDER BY Name
SELECT * FROM Departments ORDER BY Name
SELECT * FROM Employees ORDER BY Salary DESC
--END Submission in Judge

--Problem 21. Basic Select Some Fields
USE SoftUni
GO
--START Submission in Judge
SELECT Name FROM Towns ORDER BY Name
SELECT Name FROM Departments ORDER BY Name
SELECT FirstName, LastName, JobTitle, Salary FROM Employees ORDER BY Salary DESC
--END Submission in Judge

--Problem 22. Increase Employees Salary
USE Softuni
GO
--START Submission in Judge
UPDATE Employees
SET Salary += Salary * 0.1
SELECT Salary FROM Employees
--END Submission in Judge

--Problem 23. Decrease Tax Rate
USE Hotel
GO
--START Submission in Judge
UPDATE Payments
SET TaxRate -= TaxRate * 0.03
SELECT TaxRate FROM PAYMENTS
--END Submission in Judge

--Problem 24. Delete All Records
USE Hotel
GO

--START Submission in Judge
DELETE FROM Occupancies
SELECT COUNT(*) FROM Occupancies
--END Submission in Judge




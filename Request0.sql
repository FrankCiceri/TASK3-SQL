USE master;
GO
CREATE DATABASE Task4_DB; -- create the data base 
--GO is a keyword from SSMS allows me to send and execute the previous Statements into the SQL server engine, it is a batch separator.*/
--If I hadn't had the GO keyword, I would have gotten a syntax error because the CREATE DATABASE, USE, and other statements need to be executed in separate batches.*/
GO
USE Task4_DB;  --now that the database is already created, I can start using it. 
GO

CREATE TABLE dbo.position
(
    [id] int not NULL IDENTITY(1,1) PRIMARY KEY,
    [name] varchar(50),
    [rate] int
    
);

CREATE TABLE dbo.project
(
	[id] int not NULL IDENTITY(1,1) PRIMARY KEY,
    [name] varchar(50),
    [max_sum_rate] int
   
);

CREATE TABLE dbo.employee
(
    [id] int not NULL IDENTITY(1,1) PRIMARY KEY,
    [first_name] varchar(50),
    [last_name] varchar(50),
    [position_id] int FOREIGN KEY REFERENCES dbo.position(id),
    [project_id] int DEFAULT NULL FOREIGN KEY REFERENCES dbo.project(id)
);

CREATE TABLE dbo.equipment
(
    [id] int not NULL IDENTITY(1,1) PRIMARY KEY,
    [name] varchar(50),
    [price] int,
    [user_id] int  FOREIGN KEY REFERENCES dbo.employee(id)

);

CREATE TABLE dbo.vacancies
(
    [id] int not NULL IDENTITY(1,1) PRIMARY KEY,
    [position_id] int FOREIGN KEY REFERENCES dbo.position(id)
);
GO


INSERT INTO dbo.position (name, rate)
VALUES ('Project Manager', 66),
       ('Developer', 45),
       ('Tester', 40),
       ('Analyst', 35),
       ('Designer', 30);

INSERT INTO dbo.project (name, max_sum_rate)
VALUES ('FrontEnd Webpage', 150),
       ('HC System', 200),
       ('Automate Procedures', 100),
       ('Videogame Development', 250),
       ('Farm Management System', 175);

INSERT INTO dbo.employee (first_name, last_name, position_id, project_id)
VALUES ('Sheryll', 'Elvis', 1, 1),
       ('Lottie', 'Phil', 2, NUll),
       ('Alva', 'Alisya', 3, NULL ),
       ('Oleksandr', 'Kostyljev', 1, 4),
       ('David', 'Lee', 2, 5),
	   ('Davido', 'Martinez', 1, 1),
       ('Danielle', 'Park', 2, 3),
       ('Elvira', 'Gomez', 1, 3 ),
       ('Yeison', 'Maldonado', 1, 2),
       ('Rafael', 'Gamero', 2, 2);


INSERT INTO dbo.equipment (name, price, user_id)
VALUES ('Laptop', 2000, 1),
       ('Desktop', 340, 2),
       ('Tablet', 500, 3),
       ('Printer', 125, 4),
       ('Scanner', 150, 5),
	   ('Monitor', 120, 5),
	   ('UPS', 45, 5);

INSERT INTO dbo.vacancies (position_id)
VALUES (1),
       (2),
       (3),
       (4),
       (5)
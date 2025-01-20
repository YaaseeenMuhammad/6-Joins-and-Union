-- 6-Joins and Union

-- Consider the Country table and Persons table that you created earlier and perform the following:

#CREATING THE DATABASE AS POPULATION TABLE

CREATE DATABASE POPULATION;

#USING THE DATABASE POPULATION TABLE

USE POPULATION;

-- Insert 10 rows into both tables, as given below. 

-- Create a table named Country with fields: Id, Country_name, Population and Area

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);
-- Create another table named Persons with fields: Id, Fname, Lname, Population, Rating, Country_Id and Country_name

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

# INSERTING DATA INTO Country TABLE
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
	(1, 'USA', 331000000, 9833517),
	(2, 'Canada', 37742154, 9984670),
	(3, 'India', 1380004385, 3287263),
	(4, 'Australia', 25687041, 7692024),
	(5, 'UK', 67886011, 243610),
	(6, 'Germany', 83783942, 357022),
	(7, 'France', 67081000, 551695),
	(8, 'Italy', 60265000, 301340),
	(9, 'Japan', 126476461, 377975),
	(10, 'Mexico', 128933000, 1964375)
;

# INSERTING DATA INTO Persons TABLE
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
	(1, 'John', 'Doe', 200000, 4.2, 1, 'USA'),
	(2, 'Alice', 'Smith', 300000, 4.5, 2, 'Canada'),
	(3, 'Bob', 'Johnson', 130000, 3.8, 3, 'India'),
	(4, 'Charlie', 'Brown', 350000, 4.9, 4, 'Australia'),
	(5, 'Daisy', 'White', 300000, 3.5, 5, 'UK'),
	(6, 'Eve', 'Davis', 300000, 4.1, 6, 'Germany'),
	(7, 'Frank', 'Miller', 300000, 4.8, 7, 'France'),
	(8, 'Grace', 'Wilson', 400000, 4.3, 8, 'Italy'),
	(9, 'Hank', 'Moore', 600000, 5.0, 9, 'Japan'),
	(10, 'James', 'Bond', 700000, 4.6, 10, 'Mexico'),
	(11, 'Sasi', null, 100000, 4.2, 1, 'USA'),
	(12, 'Taylor', 'Smith', 300000, 4.5, 2, 'Canada'),
	(13, 'Baby', null, 150000, 3.8, 3, 'India'),
	(14, 'Chareles', null, 350000, 4.9, 4, 'Australia'),
	(15, 'Jessy', 'White', 400000, 3.5, 5, 'UK'),
	(16, 'Ram', 'Ramesh', 450000, 4.1, 6, 'Germany'),
	(17, 'Killer', 'Miller', 300000, 4.8, 7, 'France'),
	(18, 'James', null, 400000, 4.3, 8, 'Italy'),
	(19, 'Tom', null, 600000, 5.0, 9, 'Japan'),
	(20, 'Freddy', null, 700000, 4.6, 10, 'Mexico'),
    (21, 'Jane', NULL, 250000, 4.3, 3, 'India'),
	(22, 'Sam', NULL, 150000, 3.9, 10, 'Mexico');
;

SELECT * FROM Country;
SELECT * FROM Persons;

-- (1)Perform inner join, Left join, and Right join on the tables.

-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

#1. INNER JOIN

SELECT p.Id, p.Fname, p.Lname, p.Population AS Person_Population, p.Rating, c.Country_name AS Country, p.Country_Id
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;

SELECT c.Id, c.Country_name AS Country, c.Population, c.Area, p.Country_Id, p.Fname, p.Lname
FROM Country c
INNER JOIN Persons p ON p.Country_Id = c.Id;


-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

#2. LEFT JOIN

SELECT p.Id, p.Fname, p.Lname, p.Population AS Person_Population, p.Rating, c.Country_name AS Country, p.Country_Id
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

SELECT c.Id, c.Country_name AS Country, c.Population, c.Area, p.Country_Id, p.Fname, p.Lname
FROM Country c
LEFT JOIN Persons p ON p.Country_Id = c.Id;

-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

#3. RIGHT JOIN

SELECT p.Id, p.Fname, p.Lname, p.Population AS Person_Population, p.Rating, c.Country_name AS Country, p.Country_Id
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;

SELECT c.Id, c.Country_name AS Country, c.Population, c.Area, p.Country_Id, p.Fname, p.Lname
FROM Country c
RIGHT JOIN Persons p ON p.Country_Id = c.Id;

-- (2)List all distinct country names from both the Country and Persons tables.

-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

#UNION

SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;

SELECT DISTINCT Country_name, Id
FROM Country
UNION
SELECT DISTINCT Country_name, Country_Id
FROM Persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates. 

-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;

SELECT Country_name, Id
FROM Country
UNION ALL
SELECT Country_name, Country_Id
FROM Persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table.

-- Country(Id, Country_name, Population, Area)
-- Persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name)

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name,
CEIL(Rating) AS Ceil_Rating,
floor(Rating) AS floor_Rating from Persons;

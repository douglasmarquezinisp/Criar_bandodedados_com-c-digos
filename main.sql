-- Create a database
CREATE DATABASE myDatabase;

-- Use the created database
USE myDatabase;

-- Create tables
CREATE TABLE Customers (
    CustomerID int,
    CustomerName varchar(255),
    ContactName varchar(255),
    Country varchar(255),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders (
    OrderID int,
    CustomerID int,
    OrderDate date,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into tables
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country)
VALUES (1, 'Company A', 'Contact 1', 'Country A');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (1, 1, '2023-11-26');

-- Create a trigger that activates after an INSERT command on the Orders table
DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT
ON Orders FOR EACH ROW
BEGIN
   DECLARE msg VARCHAR(100);
   SET msg = CONCAT('New order inserted with OrderID: ', NEW.OrderID);
   SELECT msg AS 'Trigger Activated:';
END;//
DELIMITER ;

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);
-- Recharges Table
CREATE TABLE Recharges (
    Recharge_ID INT PRIMARY KEY,
    Customer_ID INT,
    Recharge_Date DATE,
    Plan_Name NVARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

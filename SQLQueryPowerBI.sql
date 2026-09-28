CREATE DATABASE Sneakers_PowerBI
GO

SELECT *
INTO Sneakers_PowerBI.dbo.Brands
FROM dbo.Brands

SELECT *
INTO Sneakers_PowerBI.dbo.Customers
FROM dbo.Customers

SELECT *
INTO Sneakers_PowerBI.dbo.Shoes
FROM dbo.Shoes

SELECT *
INTO Sneakers_PowerBI.dbo.Orders
FROM dbo.Orders


-- Allow missing colors
ALTER TABLE dbo.Shoes
ALTER COLUMN Color VARCHAR(250) NULL

-- Create missing values for the practice project
UPDATE dbo.Shoes
SET Color = NULL
WHERE ShoeID IN (5, 18, 32, 47, 63, 79)

-- Check the result
SELECT *
FROM dbo.Shoes
WHERE Color IS NULL

-- Set varied quantities for the practice dataset
UPDATE dbo.Orders
SET Quantity =
    CASE
        WHEN OrderID % 20 < 14 THEN 1 + OrderID % 3
        WHEN OrderID % 20 < 18 THEN 4 + OrderID % 3
        ELSE 7 + OrderID % 4
    END

-- Check how many orders have each quantity
SELECT Quantity, COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY Quantity
ORDER BY Quantity


ALTER TABLE dbo.Brands
ADD CONSTRAINT PK_Brands PRIMARY KEY (BrandID)

ALTER TABLE dbo.Customers
ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)

ALTER TABLE dbo.Shoes
ADD CONSTRAINT PK_Shoes PRIMARY KEY (ShoeID)

ALTER TABLE dbo.Orders
ADD CONSTRAINT PK_Orders PRIMARY KEY (OrderID)

ALTER TABLE dbo.Shoes
ADD CONSTRAINT FK_Shoes_Brands
FOREIGN KEY (BrandID) REFERENCES dbo.Brands(BrandID)

ALTER TABLE dbo.Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID)

ALTER TABLE dbo.Orders
ADD CONSTRAINT FK_Orders_Shoes
FOREIGN KEY (ShoeID) REFERENCES dbo.Shoes(ShoeID)




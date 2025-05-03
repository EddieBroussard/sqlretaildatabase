
-- Create and use database
CREATE DATABASE IF NOT EXISTS SportsRetailStore;
USE SportsRetailStore;

-- Categories table
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Brand VARCHAR(50),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Suppliers table
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- ProductSuppliers (Many-to-Many)
CREATE TABLE IF NOT EXISTS ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    SupplyPrice DECIMAL(10,2),
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert sample data
INSERT INTO Categories (CategoryName) VALUES 
    ('Footwear'), 
    ('Apparel'), 
    ('Accessories');

INSERT INTO Products (ProductName, CategoryID, Brand, Price, QuantityInStock) VALUES
    ('Nike Air Zoom Pegasus', 1, 'Nike', 120.00, 50),
    ('Adidas Running Shorts', 2, 'Adidas', 35.00, 100),
    ('Puma Gym Bag', 3, 'Puma', 45.00, 20);

INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email) VALUES
    ('Nike Inc.', 'John Doe', '123-456-7890', 'john@nike.com'),
    ('Adidas Corp.', 'Jane Smith', '234-567-8901', 'jane@adidas.com'),
    ('Puma LLC', 'Carlos Vega', '345-678-9012', 'carlos@puma.com');

INSERT INTO ProductSuppliers (ProductID, SupplierID, SupplyPrice) VALUES
    (1, 1, 90.00),
    (2, 2, 25.00),
    (3, 3, 30.00);

-- Sample Queries
-- Get all products with category and quantity
-- SELECT p.ProductName, c.CategoryName, p.Brand, p.Price, p.QuantityInStock FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID;

-- Low stock products
-- SELECT ProductName, QuantityInStock FROM Products WHERE QuantityInStock < 30;

-- Suppliers per product
-- SELECT p.ProductName, s.SupplierName, ps.SupplyPrice FROM ProductSuppliers ps JOIN Products p ON ps.ProductID = p.ProductID JOIN Suppliers s ON ps.SupplierID = s.SupplierID;

-- Total inventory value
-- SELECT SUM(Price * QuantityInStock) AS TotalInventoryValue FROM Products;

-- Products by specific supplier
-- SELECT p.ProductName FROM ProductSuppliers ps JOIN Products p ON ps.ProductID = p.ProductID WHERE ps.SupplierID = 1;

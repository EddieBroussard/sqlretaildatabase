SELECT 
    p.ProductName,
    c.CategoryName,
    p.Brand,
    p.Price,
    p.QuantityInStock
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;
#####################################################################
SELECT ProductName, QuantityInStock
FROM Products
WHERE QuantityInStock < 30;
#####################################################################
SELECT 
    p.ProductName,
    s.SupplierName,
    ps.SupplyPrice
FROM ProductSuppliers ps
JOIN Products p ON ps.ProductID = p.ProductID
JOIN Suppliers s ON ps.SupplierID = s.SupplierID;
#####################################################################
SELECT 
    SUM(Price * QuantityInStock) AS TotalInventoryValue
FROM Products;
#####################################################################
SELECT p.ProductName
FROM ProductSuppliers ps
JOIN Products p ON ps.ProductID = p.ProductID
WHERE ps.SupplierID = 1; 
#####################################################################
SELECT 
    p.ProductName, 
    ps.SupplyPrice, 
    p.Price, 
    ((p.Price - ps.SupplyPrice)/ps.SupplyPrice)*100 AS MarginPercent 
FROM ProductSuppliers ps
JOIN Products p ON ps.ProductID = p.ProductID
WHERE ((p.Price - ps.SupplyPrice)/ps.SupplyPrice)*100 > 25;
#####################################################################
SELECT 
    c.CategoryName, 
    SUM(p.QuantityInStock) AS TotalStock 
FROM Categories c
JOIN Products p ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
#####################################################################
SELECT 
    c.CategoryName, 
    AVG(p.Price) AS AvgPrice 
FROM Categories c
JOIN Products p ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
#####################################################################
SELECT DISTINCT 
    s.SupplierName, 
    s.ContactName, 
    s.Email 
FROM Suppliers s
JOIN ProductSuppliers ps ON s.SupplierID = ps.SupplierID
JOIN Products p ON ps.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Apparel';
#####################################################################
CREATE OR REPLACE VIEW ProductCatalogView AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    p.Brand,
    p.Price,
    p.QuantityInStock
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;
#####################################################################
CREATE OR REPLACE VIEW ProductSupplierInfoView AS
SELECT 
    p.ProductID,
    p.ProductName,
    s.SupplierName,
    ps.SupplyPrice,
    p.Price AS RetailPrice,
    (p.Price - ps.SupplyPrice) AS ProfitMargin
FROM Products p
JOIN ProductSuppliers ps ON p.ProductID = ps.ProductID
JOIN Suppliers s ON ps.SupplierID = s.SupplierID;
#####################################################################
CREATE OR REPLACE VIEW InventorySummaryView AS
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS TotalProducts,
    SUM(p.QuantityInStock) AS TotalStock,
    SUM(p.Price * p.QuantityInStock) AS TotalInventoryValue
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
#####################################################################
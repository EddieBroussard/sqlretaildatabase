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
WHERE ps.SupplierID = 1;  -- Change 1 to the desired supplier ID
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
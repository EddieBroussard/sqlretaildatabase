
USE SportsRetailStore;

INSERT INTO Categories (CategoryName) VALUES 
    ('Footwear'), 
    ('Apparel'), 
    ('Accessories'),
    ('Equipment'),
    ('Nutrition');

INSERT INTO Products (ProductName, CategoryID, Brand, Price, QuantityInStock) VALUES
    ('Nike Air Zoom Pegasus', 1, 'Nike', 120.00, 50),
    ('Adidas Running Shorts', 2, 'Adidas', 35.00, 100),
    ('Puma Gym Bag', 3, 'Puma', 45.00, 20),
    ('Wilson Tennis Racket', 4, 'Wilson', 150.00, 30),
    ('Yonex Badminton Shuttle', 4, 'Yonex', 20.00, 200),
    ('Gatorade Energy Drink', 5, 'Gatorade', 2.50, 500),
    ('Under Armour T-shirt', 2, 'Under Armour', 25.00, 80),
    ('Reebok Sports Cap', 3, 'Reebok', 18.00, 60),
    ('Asics Running Shoes', 1, 'Asics', 100.00, 40),
    ('Protein Bar Pack', 5, 'PowerBar', 10.00, 120);

INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email) VALUES
    ('Nike Inc.', 'John Doe', '123-456-7890', 'john@nike.com'),
    ('Adidas Corp.', 'Jane Smith', '234-567-8901', 'jane@adidas.com'),
    ('Puma LLC', 'Carlos Vega', '345-678-9012', 'carlos@puma.com'),
    ('Wilson Sporting Goods', 'Emily Watson', '456-789-0123', 'emily@wilson.com'),
    ('Gatorade Co.', 'Mark Johnson', '567-890-1234', 'mark@gatorade.com'),
    ('Under Armour Inc.', 'Laura Chen', '678-901-2345', 'laura@underarmour.com'),
    ('Yonex Ltd.', 'Kenji Ito', '789-012-3456', 'kenji@yonex.com'),
    ('Reebok Intl.', 'Sophie Martinez', '890-123-4567', 'sophie@reebok.com'),
    ('Asics Corp.', 'Taro Yamada', '901-234-5678', 'taro@asics.com'),
    ('PowerBar Inc.', 'Linda Moore', '012-345-6789', 'linda@powerbar.com');

INSERT INTO ProductSuppliers (ProductID, SupplierID, SupplyPrice) VALUES
    (1, 1, 90.00),
    (2, 2, 25.00),
    (3, 3, 30.00),
    (4, 4, 110.00),
    (5, 7, 12.00),
    (6, 5, 1.75),
    (7, 6, 18.00),
    (8, 8, 12.00),
    (9, 9, 70.00),
    (10, 10, 6.50);

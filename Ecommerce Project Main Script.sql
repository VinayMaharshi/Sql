CREATE DATABASE Ecommerce;

USE Ecommerce;

SELECT name
FROM sys.tables;

--Creating the User_details table
CREATE TABLE User_Details (
UserID INT IDENTITY(101,1) PRIMARY KEY,
First_Name VARCHAR(20),
Last_Name VARCHAR(20),
Email VARCHAR(50),
user_address VARCHAR(50),
Phone VARCHAR(20));

SELECT * FROM User_Details;

--Creating the Seller_Details table
CREATE TABLE Seller_Details (
SellerID VARCHAR(20) PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES User_Details(UserID),
Company_Name VARCHAR(20),
Business_Type VARCHAR(20),
Rating INT);

SELECT * FROM Seller_Details;

--Creating the Product Details Table
CREATE TABLE Product_Details (
ProductID VARCHAR(20) PRIMARY KEY,
SellerID VARCHAR(20) FOREIGN KEY REFERENCES Seller_Details(SellerID),
Product_Name VARCHAR(20),
Price INT,
Stock_Quantity INT);

SELECT * FROM Product_Details;

--Creating Product Category table
CREATE TABLE Product_Category (
Product_categoryID VARCHAR(20) PRIMARY KEY,
ProductID VARCHAR(20) FOREIGN KEY REFERENCES Product_Details(ProductID),
CategoryID VARCHAR(20) FOREIGN KEY REFERENCES Category(CategoryID));

SELECT * FROM Product_Category;

--Creating the Category Table.
CREATE TABLE Category(
CategoryID VARCHAR(20) PRIMARY KEY,
Category_name VARCHAR(30));

SELECT * FROM Category;

--Creating the order table
CREATE TABLE Orders(
OrderID INT IDENTITY(1000000001,1) PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES User_Details(UserID),
Order_Date Date,
Total_Amount INT);

SELECT * FROM Orders;


--Creating the order items table
CREATE TABLE Order_Items(
Order_itemID VARCHAR(20) PRIMARY KEY,
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ProductID VARCHAR(20) FOREIGN KEY REFERENCES Product_Details(ProductID),
Quantity INT,
Subtotal INT);


--Inserting data into the tables

--Inserting data into User_details
INSERT INTO User_Details (First_Name, Last_Name, Email, user_address, Phone)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '1234 Elm Street, Anytown, USA', '555-1234'),
    ('Jane', 'Smith', 'jane.smith@example.com', '5678 Oak Avenue, Somewhere City, USA', '555-5678'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', '9876 Maple Lane, Another Town, USA', '555-9876'),
    ('Emily', 'Williams', 'emily.williams@example.com', '4567 Birch Road, Someplace, USA', '555-4567'),
    ('Daniel', 'Brown', 'daniel.brown@example.com', '7890 Pine Street, Anytown, USA', '555-7890'),
    ('Olivia', 'Jones', 'olivia.jones@example.com', '2345 Cedar Avenue, Another Town, USA', '555-2345'),
    ('William', 'Garcia', 'william.garcia@example.com', '8765 Oak Avenue, Somewhere City, USA', '555-8765'),
    ('Ava', 'Martinez', 'ava.martinez@example.com', '6543 Elm Street, Someplace, USA', '555-6543'),
    ('James', 'Robinson', 'james.robinson@example.com', '4321 Pine Street, Another Town, USA', '555-4321'),
    ('Sophia', 'Miller', 'sophia.miller@example.com', '6789 Birch Road, Anytown, USA', '555-6789'),
    ('Benjamin', 'Davis', 'benjamin.davis@example.com', '8901 Cedar Avenue, Someplace, USA', '555-8901'),
    ('Mia', 'Gonzalez', 'mia.gonzalez@example.com', '3456 Oak Avenue, Another Town, USA', '555-3456'),
    ('Logan', 'Rodriguez', 'logan.rodriguez@example.com', '5678 Elm Street, Somewhere City, USA', '555-5678'),
    ('Ella', 'Wilson', 'ella.wilson@example.com', '7890 Pine Street, Anytown, USA', '555-7890'),
    ('Alexander', 'Lopez', 'alexander.lopez@example.com', '1234 Maple Lane, Another Town, USA', '555-1234'),
    ('Grace', 'Perez', 'grace.perez@example.com', '4567 Birch Road, Someplace, USA', '555-4567'),
    ('Daniel', 'Hall', 'daniel.hall@example.com', '8765 Oak Avenue, Somewhere City, USA', '555-8765'),
    ('Scarlett', 'Young', 'scarlett.young@example.com', '2345 Elm Street, Another Town, USA', '555-2345'),
    ('Jack', 'Harris', 'jack.harris@example.com', '6789 Pine Street, Anytown, USA', '555-6789'),
    ('Avery', 'Clark', 'avery.clark@example.com', '3456 Cedar Avenue, Someplace, USA', '555-3456'),
    ('Emma', 'Lewis', 'emma.lewis@example.com', '5678 Oak Avenue, Another Town, USA', '555-5678'),
    ('Liam', 'Lee', 'liam.lee@example.com', '7890 Birch Road, Somewhere City, USA', '555-7890'),
    ('Chloe', 'Walker', 'chloe.walker@example.com', '1234 Maple Lane, Anytown, USA', '555-1234'),
    ('Sebastian', 'Gonzalez', 'sebastian.gonzalez@example.com', '4567 Elm Street, Someplace, USA', '555-4567'),
    ('Zoe', 'Perez', 'zoe.perez@example.com', '6789 Pine Street, Another Town, USA', '555-6789'),
    ('Henry', 'Martin', 'henry.martin@example.com', '8901 Cedar Avenue, Anytown, USA', '555-8901'),
    ('Aria', 'White', 'aria.white@example.com', '3456 Oak Avenue, Somewhere City, USA', '555-3456'),
    ('Ethan', 'Jackson', 'ethan.jackson@example.com', '5678 Birch Road, Someplace, USA', '555-5678'),
    ('Luna', 'Miller', 'luna.miller@example.com', '7890 Elm Street, Another Town, USA', '555-7890'),
    ('Mason', 'Turner', 'mason.turner@example.com', '1234 Pine Street, Anytown, USA', '555-1234'),
    ('Willow', 'Harris', 'willow.harris@example.com', '4567 Cedar Avenue, Someplace, USA', '555-4567');

SELECT * FROM User_Details;

DELETE FROM User_Details
WHERE UserID = 131;	

--Inserting data into seller_details
INSERT INTO Seller_Details (SellerID, UserID, Company_Name, Business_Type, Rating)
VALUES
    ('S01', 101, 'ABC Electronics', 'Electronics', 4),
    ('S02', 102, 'XYZ Clothing', 'Apparel', 5),
    ('S03', 103, 'Globe Books', 'Books', 4),
    ('S04', 104, 'Fresh Groceries', 'Grocery', 4),
    ('S05', 105, 'Tech Haven', 'Electronics', 5),
    ('S06', 116, 'Cosmic Gadgets', 'Electronics', 4),
    ('S07', 127, 'Fashion Haven', 'Apparel', 5),
    ('S08', 118, 'Read and Relax', 'Books', 4),
    ('S09', 109, 'Healthy Bites', 'Grocery', 4),
    ('S10', 110, 'Digital World', 'Electronics', 5),
    ('S11', 121, 'Tech Solutions', 'Electronics', 4),
    ('S12', 112, 'Trendy Styles', 'Apparel', 5),
    ('S13', 117, 'Bookworm Emporium', 'Books', 4),
    ('S14', 114, 'Organic Harvest', 'Grocery', 4),
    ('S15', 116, 'Gizmo Galaxy', 'Electronics', 5),
    ('S16', 116, 'Innovative Tech', 'Electronics', 4),
    ('S17', 117, 'Chic Couture', 'Apparel', 5),
    ('S18', 118, 'Book Haven', 'Books', 4),
    ('S19', 119, 'Farm Fresh', 'Grocery', 4),
    ('S20', 120, 'Gadget Universe', 'Electronics', 5),
    ('S21', 102, 'Electro Emporium', 'Electronics', 4),
    ('S22', 107, 'Urban Trends', 'Apparel', 5),
    ('S23', 123, 'Novel Delights', 'Books', 4),
    ('S24', 123, 'Natures Basket', 'Grocery', 4),
    ('S25', 123, 'E-Tech Hub', 'Electronics', 5),
    ('S26', 110, 'Digital Dreams', 'Electronics', 4),
    ('S27', 112, 'City Styles', 'Apparel', 5),
    ('S28', 118, 'Literary Haven', 'Books', 4),
    ('S29', 130, 'Green Eats', 'Grocery', 4),
    ('S30', 130, 'Smart Gizmos', 'Electronics', 5);

SELECT * FROM Seller_Details;

--Inserting data into Product_details
INSERT INTO Product_Details (ProductID, SellerID, Product_Name, Price, Stock_Quantity)
VALUES
    ('P01', 'S01', 'Smartphone X', 699, 100),
    ('P02', 'S02', 'Classic T-Shirt', 20, 300),
    ('P03', 'S03', 'Mystery Novel', 15, 50),
    ('P04', 'S04', 'Organic Apples', 3, 200),
    ('P05', 'S05', 'Laptop Pro', 1299, 50),
    ('P06', 'S06', 'Wireless Earbuds', 49, 150),
    ('P07', 'S07', 'Summer Dress', 30, 250),
    ('P08', 'S08', 'Sci-Fi Book', 12, 80),
    ('P09', 'S09', 'Fresh Milk', 2, 300),
    ('P10', 'S10', 'Gaming Console', 399, 30),
    ('P11', 'S11', 'Bluetooth Speaker', 39, 100),
    ('P12', 'S12', 'Sneakers', 45, 200),
    ('P13', 'S13', 'Cookbook', 18, 70),
    ('P14', 'S14', 'Whole Wheat Bread', 2, 400),
    ('P15', 'S15', 'Tablet Mini', 299, 20),
    ('P16', 'S16', 'Fitness Tracker', 29, 120),
    ('P17', 'S17', 'Leather Jacket', 75, 150),
    ('P18', 'S18', 'Historical Fiction', 14, 60),
    ('P19', 'S19', 'Fresh Vegetables', 5, 250),
    ('P20', 'S20', 'VR Headset', 199, 40),
    ('P21', 'S21', 'Smart Watch', 89, 180),
    ('P22', 'S22', 'Designer Sunglasses', 60, 100),
    ('P23', 'S23', 'Romance Novel', 10, 90),
    ('P24', 'S24', 'Granola Bars', 1, 500),
    ('P25', 'S25', 'Camera Drone', 299, 25),
    ('P26', 'S26', 'Yoga Mat', 15, 200),
    ('P27', 'S27', 'Business Suit', 120, 80),
    ('P28', 'S28', 'Science Textbook', 25, 40),
    ('P29', 'S29', 'Fresh Fruits', 4, 300),
    ('P30', 'S30', 'Gaming Keyboard', 79, 70);

SELECT * FROM Product_Details;

--Inserting data into Category Table.
INSERT INTO Category (CategoryID, Category_name)
VALUES
    ('C01', 'Electronics'),
    ('C02', 'Apparel'),
    ('C03', 'Books'),
    ('C04', 'Grocery'),
    ('C05', 'Home Appliances'),
    ('C06', 'Beauty and Personal Care'),
    ('C07', 'Toys and Games'),
    ('C08', 'Furniture'),
    ('C09', 'Sports and Outdoors'),
    ('C10', 'Jewelry'),
    ('C11', 'Health and Wellness'),
    ('C12', 'Automotive'),
    ('C13', 'Baby and Kids'),
    ('C14', 'Pet Supplies'),
    ('C15', 'Tools and Hardware');

SELECT * FROM Category;

--Inserting data into product_category table.
INSERT INTO Product_Category (Product_categoryID, ProductID, CategoryID)
VALUES
    ('PC01', 'P01', 'C01'),
    ('PC02', 'P02', 'C02'),
    ('PC03', 'P03', 'C03'),
    ('PC04', 'P04', 'C04'),
    ('PC05', 'P05', 'C01'),
    ('PC06', 'P06', 'C01'),
    ('PC07', 'P07', 'C02'),
    ('PC08', 'P08', 'C03'),
    ('PC09', 'P09', 'C04'),
    ('PC10', 'P10', 'C01'),
    ('PC11', 'P11', 'C01'),
    ('PC12', 'P12', 'C02'),
    ('PC13', 'P13', 'C03'),
    ('PC14', 'P14', 'C04'),
    ('PC15', 'P15', 'C01'),
    ('PC16', 'P16', 'C01'),
    ('PC17', 'P17', 'C02'),
    ('PC18', 'P18', 'C03'),
    ('PC19', 'P19', 'C04'),
    ('PC20', 'P20', 'C01'),
    ('PC21', 'P21', 'C01'),
    ('PC22', 'P22', 'C02'),
    ('PC23', 'P23', 'C03'),
    ('PC24', 'P24', 'C04'),
    ('PC25', 'P25', 'C01'),
    ('PC26', 'P26', 'C01'),
    ('PC27', 'P27', 'C02'),
    ('PC28', 'P28', 'C03'),
    ('PC29', 'P29', 'C04'),
    ('PC30', 'P30', 'C01');

SELECT * FROM Product_Category;

--Inserting into Orders table.
INSERT INTO Orders (UserID, Order_Date, Total_Amount)
VALUES
    (104, '2023-08-15', 150),
    (108, '2023-07-22', 320),
    (109, '2023-06-10', 78),
    (110, '2023-08-02', 460),
    (113, '2023-07-18', 90),
    (116, '2023-06-28', 280),
    (117, '2023-08-09', 200),
    (118, '2023-07-01', 110),
    (120, '2023-06-15', 540),
    (121, '2023-07-30', 75),
    (125, '2023-08-14', 420),
    (126, '2023-06-20', 180),
    (128, '2023-08-08', 290),
    (129, '2023-07-05', 150),
    (129, '2023-08-10', 70),
    (130, '2023-06-25', 230),
    (105, '2023-08-05', 310),
    (105, '2023-07-19', 125),
    (105, '2023-06-09', 500),
    (103, '2023-08-01', 90),
    (104, '2023-07-16', 430),
    (105, '2023-06-27', 150),
    (110, '2023-08-12', 370),
    (115, '2023-07-23', 260),
    (118, '2023-06-05', 110),
    (121, '2023-08-03', 640),
    (125, '2023-07-21', 85),
    (126, '2023-06-14', 300),
    (127, '2023-08-07', 210),
    (128, '2023-07-03', 130),
    (129, '2023-06-17', 480),
    (101, '2023-07-25', 70),
    (102, '2023-08-11', 390),
    (103, '2023-06-22', 245),
    (105, '2023-07-27', 160),
    (107, '2023-08-04', 410),
    (109, '2023-07-17', 120),
    (113, '2023-06-08', 280),
    (115, '2023-08-13', 230),
    (118, '2023-07-26', 95),
    (119, '2023-06-12', 520),
    (122, '2023-08-06', 75),
    (123, '2023-07-29', 360),
    (125, '2023-06-19', 190),
    (126, '2023-08-14', 290),
    (128, '2023-07-02', 140),
    (129, '2023-06-24', 560),
    (130, '2023-08-09', 80),
    (105, '2023-07-20', 330),
    (105, '2023-06-10', 110),
    (105, '2023-08-15', 480),
    (102, '2023-07-31', 85),
    (103, '2023-06-16', 410);

SELECT * FROM Orders;

--Inserting into Order_items table.
INSERT INTO Order_Items (Order_itemID, OrderID, ProductID, Quantity, Subtotal)
VALUES
    ('OI01', 1000000001, 'P01', 2, 1398),
    ('OI02', 1000000002, 'P02', 3, 60),
    ('OI03', 1000000003, 'P03', 1, 15),
    ('OI04', 1000000004, 'P04', 5, 15),
    ('OI05', 1000000005, 'P05', 1, 1299),
    ('OI06', 1000000006, 'P06', 2, 98),
    ('OI07', 1000000007, 'P07', 2, 60),
    ('OI08', 1000000008, 'P08', 1, 12),
    ('OI09', 1000000009, 'P09', 4, 8),
    ('OI10', 1000000010, 'P10', 1, 399),
    ('OI11', 1000000011, 'P11', 3, 117),
    ('OI12', 1000000012, 'P12', 2, 90),
    ('OI13', 1000000013, 'P13', 1, 18),
    ('OI14', 1000000014, 'P14', 10, 20),
    ('OI15', 1000000015, 'P15', 1, 299),
    ('OI16', 1000000016, 'P16', 2, 58),
    ('OI17', 1000000017, 'P17', 1, 75),
    ('OI18', 1000000018, 'P18', 2, 28),
    ('OI19', 1000000019, 'P19', 3, 15),
    ('OI20', 1000000020, 'P20', 1, 199),
    ('OI21', 1000000021, 'P21', 2, 178),
    ('OI22', 1000000022, 'P22', 1, 60),
    ('OI23', 1000000023, 'P23', 2, 20),
    ('OI24', 1000000024, 'P24', 5, 5),
    ('OI25', 1000000025, 'P25', 1, 299),
    ('OI26', 1000000026, 'P26', 1, 15),
    ('OI27', 1000000027, 'P27', 1, 120),
    ('OI28', 1000000028, 'P28', 2, 50),
    ('OI29', 1000000029, 'P29', 4, 16),
    ('OI30', 1000000030, 'P30', 1, 79),
    ('OI31', 1000000031, 'P01', 3, 2097),
    ('OI32', 1000000032, 'P02', 1, 20),
    ('OI33', 1000000033, 'P03', 2, 30),
    ('OI34', 1000000034, 'P04', 7, 21),
    ('OI35', 1000000035, 'P05', 1, 1299),
    ('OI36', 1000000036, 'P06', 1, 49),
    ('OI37', 1000000037, 'P07', 3, 90),
    ('OI38', 1000000038, 'P08', 1, 12),
    ('OI39', 1000000039, 'P09', 5, 10),
    ('OI40', 1000000040, 'P10', 1, 399),
    ('OI41', 1000000041, 'P11', 2, 78),
    ('OI42', 1000000042, 'P12', 3, 135),
    ('OI43', 1000000043, 'P13', 1, 18),
    ('OI44', 1000000044, 'P14', 15, 30),
    ('OI45', 1000000045, 'P15', 2, 598),
    ('OI46', 1000000046, 'P16', 1, 29),
    ('OI47', 1000000047, 'P17', 2, 150),
    ('OI48', 1000000048, 'P18', 1, 14),
    ('OI49', 1000000049, 'P19', 4, 20),
    ('OI50', 1000000050, 'P20', 1, 199);

SELECT * FROM Order_Items;
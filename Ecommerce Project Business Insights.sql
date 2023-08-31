use Ecommerce;

SELECT name
FROM sys.tables;

SELECT * FROM Seller_Details;
SELECT * FROM Product_Details;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Product_Category;
SELECT * FROM Category;

--There is already a total column. The subtotal column in Order_Items table is not required.
ALTER TABLE Order_Items
DROP COLUMN Subtotal;

--1) What are the total sales for August?

SELECT SUM(Total_Amount) AS Total_Sales_for_August
FROM Orders
WHERE MONTH(Order_Date) = 8;


--2) Top 3 products (ProductId,Name and Sales amount) have the highest sales in August?

WITH ProductSales AS (
    SELECT TOP 3 PD.ProductID,
           PD.Product_Name,
           SUM(O.Total_Amount) AS Total_Sales,
           DENSE_RANK() OVER (ORDER BY SUM(O.Total_Amount) DESC) AS Rank
    FROM Orders O
    JOIN Order_Items OI ON O.OrderID = OI.OrderID
    JOIN Product_Details PD ON OI.ProductID = PD.ProductID
    WHERE MONTH(O.Order_Date) = 8
    GROUP BY PD.ProductID, PD.Product_Name
)
SELECT ProductID, Product_Name, Total_Sales
FROM ProductSales
WHERE Rank <= 3;

/*Using the rank method is more suitable for this scenario since it handles cases where multiple products 
share the same values in the top 3. When the TOP condition is used in the SELECT statement, 
only the first 3 values are displayed, and any additional values are ignored. 
However, when using dense_rank(), all the products that share the same top 3 values will be displayed.*/


-- A simpler way using Top 3
SELECT TOP 3
PD.ProductID, PD.Product_Name,SUM(O.Total_Amount) AS Total_Sales
FROM Orders O
JOIN Order_Items OI 
ON O.OrderID = OI.OrderID
JOIN Product_Details PD
ON OI.ProductID = PD.ProductID
WHERE MONTH(O.Order_Date) = 8
GROUP BY pd.ProductID, Pd.Product_Name
ORDER BY SUM(O.Total_Amount) DESC;

--3) Top 5 sellers and thier names total sales in August?

WITH SellerData AS
( SELECT S.SellerID,
	S.Company_Name,
	SUM(O.Total_amount) AS Total_Sales,
	DENSE_RANK() OVER (ORDER BY (SUM(O.Total_Amount)) DESC) AS Seller_Rank
	FROM Orders O
	JOIN Order_Items OI 
	ON O.OrderID = OI.OrderID
	JOIN Product_Details PD
	ON OI.ProductID = PD.ProductID
	JOIN Seller_Details S
	ON S.SellerID = PD.SellerID
	WHERE MONTH(O.Order_Date) = 8
	GROUP BY S.SellerID,S.Company_Name
	)
SELECT 
SellerID, Company_Name, Total_Sales
FROM SellerData
WHERE Seller_Rank <=5;

-- A simpler method using TOP
SELECT TOP 5
	S.SellerID,
	S.Company_Name,
	SUM(O.Total_amount) AS Total_Sales
FROM Orders O
JOIN Order_Items OI 
ON O.OrderID = OI.OrderID
JOIN Product_Details PD
ON OI.ProductID = PD.ProductID
JOIN Seller_Details S
ON S.SellerID = PD.SellerID
WHERE MONTH(O.Order_Date) = 8
GROUP BY S.SellerID,S.Company_Name
ORDER BY Total_Sales DESC;

--4) Which products are running low on stock? (Have less than 50 units remaining)

SELECT ProductID, Product_Name
FROM Product_Details
WHERE Stock_Quantity <= 50;

-- 5) How many units of the top 5 selling items are currently in stock?

WITH Top_5_Selling AS
( SELECT
	P.Product_Name,
	P.Stock_Quantity,
	SUM(O.Total_Amount) AS Total_Sales,
	DENSE_RANK() OVER (ORDER BY SUM(O.Total_Amount) DESC) AS Top_5
	FROM Orders O
	JOIN Order_items OI 
	ON O.OrderID = OI.OrderID
	JOIN Product_Details P
	ON OI.ProductID = P.ProductID
	GROUP BY P.Product_Name, P.Stock_Quantity
	)
SELECT Product_Name, Stock_Quantity, Total_Sales
FROM Top_5_Selling
WHERE Top_5 <=5;

-- A simpler way
SELECT TOP 5
	P.Product_Name,
	P.Stock_Quantity,
	SUM(O.Total_Amount) AS Total_Sales
FROM Orders O
JOIN Order_items OI 
ON O.OrderID = OI.OrderID
JOIN Product_Details P
ON OI.ProductID = P.ProductID
GROUP BY P.Product_Name, P.Stock_Quantity
ORDER BY SUM(O.Total_Amount) DESC;

-- 6) How many users have ordered and what is the total sum of products ordered in the month of August?

SELECT COUNT(DISTINCT(UserID)) AS Total_Number_Of_Users_Ordered,
SUM(Total_Amount) AS Total_Sales
FROM Orders
WHERE MONTH(Order_Date) = 8;

-- 7) What is the average number of orders per users?

SELECT AVG(OrdersPerUser) AS Avg_Orders_Per_User
FROM 
(SELECT UserID, COUNT(OrderID) AS OrdersPerUser
 FROM Orders
 GROUP BY UserID) AS Avg_Orders;

 -- 8) Top 3 users by the number of orders? 

SELECT UserID, No_of_Orders
FROM
 (SELECT UserID, COUNT(OrderID) AS No_of_Orders,
  DENSE_RANK() OVER(ORDER BY COUNT(OrderID) DESC) AS Rank
  FROM Orders
  GROUP BY UserID)
AS RankedUsers
WHERE Rank <=3;

-- A simpler way
SELECT TOP 3
UserID, COUNT(OrderID) AS No_of_Orders
FROM Orders
GROUP BY UserID
ORDER BY COUNT(OrderID) DESC;

-- 9) Top 3 sellers by the most sales in August?

WITH Top_Sellers AS
	(SELECT SD.SellerID, 
			SD.Company_Name, 
			SUM(O.Total_Amount) AS Total_Sales,
			DENSE_RANK() OVER (ORDER BY SUM(O.Total_Amount) DESC) AS Ranked_top_sellers
			FROM Orders O 
			JOIN User_Details UD
			ON O.UserID = UD.UserID
			JOIN Seller_Details SD
			ON UD.UserID = SD.UserID
			GROUP BY SD.SellerID, SD.Company_Name
			)
SELECT SellerID, Company_Name, Total_Sales
FROM Top_Sellers
WHERE Ranked_top_sellers <=3;

-- A Simpler Way
SELECT TOP 3
SD.SellerID, 
SD.Company_Name, 
SUM(O.Total_Amount) AS Total_Sales
FROM Orders O 
JOIN User_Details UD
ON O.UserID = UD.UserID
JOIN Seller_Details SD
ON UD.UserID = SD.UserID
GROUP BY SD.SellerID, SD.Company_Name
ORDER BY SUM(O.Total_Amount) DESC;

-- 10) How many products are there in each category?

SELECT C.CategoryID, C.Category_name, COUNT(P.ProductID) AS Total_Products
FROM Product_Category P
JOIN Category C 
ON P.CategoryID = C.CategoryID
GROUP BY C.Category_name,C.CategoryID;
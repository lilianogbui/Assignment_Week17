--CREATE INDEX _Customers_State
--ON KCC.dbo.Customers(State);
--SELECT*
--FROM KCC.dbo.Customers
--WHERE State='WA'
--/*This returns all customers in WA state*/

--CREATE INDEX _Customers_CustomerName
--ON KCC.dbo.Customers(CustomerName);



--SELECT*
--FROM KCC.dbo.Customers
--WHERE CustomerName='Tres Delicious' AND (Country='United State' 
--OR Country='France')

--SELECT*
--FROM KCC.dbo.Customers
--WHERE CustomerName NOT LIKE'A%' AND (Country='United State' 
--OR Country='France')

--CREATE INDEX _Customers_CustomerID
--ON KCC.dbo.Customers(CustomerID);
--SELECT OrderID,
--OrderDate,
--OrderTotal,
--CustomerName,
--Phone,
--c.CustomerID
--FROM dbo.Orders o LEFT OUTER JOIN dbo.Customers c  ON o.CustomerID=c.CustomerID
--Order by OrderTotal desc

--SELECT        Customers.CustomerName AS [Customer Name], SUM(Orders.OrderTotal) AS Expr1
--FROM            Customers INNER JOIN
--                         Orders ON Customers.CustomerID = Orders.CustomerID
--WHERE        (Orders.OrderDate >= CONVERT(DATETIME, '2022-02-18 00:00:00', 102))
--GROUP BY Customers.CustomerName


/* Restructured table to eliminate redundancy while ensuring efficiency*/
--CREATE TABLE CONSUMERS(
--CustomerID INT PRIMARY KEY,
--CustomerName VARCHAR(255)
--);
--CREATE TABLE SALES(
--OrderID INT PRIMARY KEY,
--CustomerID INT,
--OrderDate DATE,
--FOREIGN KEY (CustomerID)REFERENCES Customers(CustomerID)
--);

--CREATE TABLE SalesDetails(
--OrderID INT,
--CookieID VARCHAR(255),
--Quantity INT,
--FOREIGN KEY (OrderID)REFERENCES Orders(OrderID)
--);

--INSERT INTO Consumers(CustomerID,CustomerName)
--VALUES
--(1,'Tres Delicious'),
--(2,'Wholesomes Food');

--INSERT INTO Sales(OrderID,CustomerID,OrderDate)
--VALUES
--(1,1,'2022-01-01'),
--(2,1,'2022-01-02'),
--(3,2,'2022-01-04');

--INSERT INTO SalesDetails(OrderID,CookieID,Quantity)
--VALUES
--(1,1,229),
--(1,2,160),
--(1,3,44);

--SELECT c.CustomerName,s.OrderID,o.OrderDate,sd.CookieID,Quantity
--FROM Consumers c
--JOIN Sales s ON C.CustomerID=s.CustomerID
--JOIN OrderDetails sd ON s.OrderID=sd.OrderID;

/* Partitioning*/
--CREATE PARTITION FUNCTION
--pf_Orders_OrderDate(Date)
--AS RANGE RIGHT FOR VALUES ('2022-01-01','2022-02-28','2022-03-14')

--CREATE PARTITION SCHEME ps_Orders 
--AS PARTITION pf_Orders_OrderDate
--ALL TO ('PRIMARY')


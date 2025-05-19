-- 1)
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Products VARCHAR(255)
);


SELECT OrderID, CustomerName, 'Laptop' AS Product FROM ProductDetail WHERE FIND_IN_SET('Laptop', Products);
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' AS Product FROM ProductDetail WHERE FIND_IN_SET('Mouse', Products);
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' AS Product FROM ProductDetail WHERE FIND_IN_SET('Tablet', Products);
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product FROM ProductDetail WHERE FIND_IN_SET('Keyboard', Products);
UNION ALL
SELECT OrderID, CustomerName, 'Phone' AS Product FROM ProductDetail WHERE FIND_IN_SET('Phone', Products);


-- 2)
CREATE TABLE Customers (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);


INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM OrderDetails;


CREATE TABLE OrderDetails_Normalized (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product)
);


INSERT INTO OrderDetails_Normalized (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity FROM OrderDetails;


SET CMDSEP GO

DROP FUNCTION CustOrderHist
GO

CREATE FUNCTION CustOrderHist (ACustomerID nchar(5))
RETURNS TABLE
READS SQL DATA
AS
BEGIN
  RETURN 
    SELECT ProductName, SUM(Quantity) as Total
    FROM "Products" P, "Order Details" OD, "Orders" O, "Customers" C
    WHERE C.CustomerID = ACustomerID AND C.CustomerID = O.CustomerID AND 
          O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
    GROUP BY ProductName;
END
GO

DROP FUNCTION CustOrdersOrders
GO

CREATE FUNCTION CustOrdersOrders (ACustomerID nchar(5))
RETURNS TABLE
READS SQL DATA
AS
BEGIN
  RETURN
    SELECT OrderID, OrderDate, RequiredDate, ShippedDate
    FROM Orders
    WHERE CustomerID = ACustomerID
    ORDER BY OrderID;
END
GO

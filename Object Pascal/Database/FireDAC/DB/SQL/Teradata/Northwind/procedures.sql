SET CMDSEP /

DROP PROCEDURE CustOrderHist
/

CREATE PROCEDURE CustOrderHist (IN ACustomerID char(5))
  DYNAMIC RESULT SETS 1
BEGIN
  DECLARE cur1 CURSOR WITH RETURN ONLY FOR
          SELECT ProductName, SUM(Quantity) 
          FROM "Products" P, "Order Details" OD, "Orders" O, "Customers" C
          WHERE C.CustomerID = ACustomerID AND C.CustomerID = O.CustomerID AND 
                O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
          GROUP BY ProductName;
  OPEN cur1;
END;
/

DROP PROCEDURE CustOrdersOrders
/

CREATE PROCEDURE CustOrdersOrders (IN ACustomerID char(5))
  DYNAMIC RESULT SETS 1
BEGIN
  DECLARE cur1 CURSOR WITH RETURN ONLY FOR
          SELECT OrderID, OrderDate, RequiredDate, ShippedDate
          FROM "Orders"
          WHERE CustomerID = ACustomerID
          ORDER BY OrderID;
  OPEN cur1;
END;
/

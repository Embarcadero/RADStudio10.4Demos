SET CMDSEP /

DROP PROCEDURE CustOrderHist
/

CREATE PROCEDURE CustOrderHist (ACustomerID nchar(5))
RETURNING nvarchar (40), int;
  DEFINE cProdName nvarchar (40);
  DEFINE iTotal int;
  FOREACH SELECT ProductName, SUM(Quantity) 
          INTO cProdName, iTotal
          FROM "Products" P, "Order Details" OD, "Orders" O, "Customers" C
          WHERE C.CustomerID = ACustomerID AND C.CustomerID = O.CustomerID AND 
                O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
          GROUP BY ProductName
    RETURN cProdName, iTotal WITH RESUME;
  END FOREACH;
END PROCEDURE;
/

DROP PROCEDURE CustOrdersOrders
/

CREATE PROCEDURE CustOrdersOrders (ACustomerID nchar(5))
RETURNING int, date, date, date;
  DEFINE iOId int;
  DEFINE dODate, dRDate, dSDate date;
  FOREACH SELECT OrderID, OrderDate, RequiredDate, ShippedDate
          INTO iOId, dODate, dRDate, dSDate
          FROM Orders
          WHERE CustomerID = ACustomerID
          ORDER BY OrderID
    RETURN iOId, dODate, dRDate, dSDate WITH RESUME;
  END FOREACH;
END PROCEDURE;
/
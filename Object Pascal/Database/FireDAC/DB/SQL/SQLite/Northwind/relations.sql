CREATE INDEX I_Categories_CategoryName ON "Categories"(CategoryName)
;

CREATE INDEX I_Customers_City ON "Customers"(City)
;

CREATE INDEX I_Customers_CompanyName ON "Customers"(CompanyName)
;

CREATE INDEX I_Customers_PostalCode ON "Customers"(PostalCode)
;

CREATE INDEX I_Customers_Region ON "Customers"(Region)
;

CREATE INDEX I_Employees_LastName ON "Employees"(LastName)
;

CREATE INDEX I_Employees_PostalCode ON "Employees"(PostalCode)
;

CREATE INDEX I_OrderDetails_OrderID ON "Order Details"(OrderID)
;

CREATE INDEX I_OrderDetails_ProductID ON "Order Details"(ProductID)
;

CREATE INDEX I_Orders_CustomerID ON "Orders"(CustomerID)
;

CREATE INDEX I_Orders_EmployeeID ON "Orders"(EmployeeID)
;

CREATE INDEX I_Orders_OrderDate ON "Orders"(OrderDate)
;

CREATE INDEX I_Orders_ShippedDate ON "Orders"(ShippedDate)
;

CREATE INDEX I_Orders_ShipVia ON "Orders"(ShipVia)
;

CREATE INDEX I_Orders_ShipPostalCode ON "Orders"(ShipPostalCode)
;

CREATE INDEX I_Products_CategoryID ON "Products"(CategoryID)
;

CREATE INDEX I_Products_ProductName ON "Products"(ProductName)
;

CREATE INDEX I_Products_SupplierID ON "Products"(SupplierID)
;

CREATE INDEX I_Suppliers_CompanyName ON "Suppliers"(CompanyName)
;

CREATE INDEX I_Suppliers_PostalCode ON "Suppliers"(PostalCode)
;

CREATE INDEX I_CustCustDemo_CustomerID ON "CustomerCustomerDemo"(CustomerID)
;

CREATE INDEX I_CustCustDemo_CustomerTypeID ON "CustomerCustomerDemo"(CustomerTypeID)
;

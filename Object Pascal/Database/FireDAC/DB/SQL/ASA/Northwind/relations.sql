SET CMDSEP ;

ALTER TABLE "Categories" ADD
 CONSTRAINT "PK_Categories" PRIMARY KEY 
 (
  CategoryID
 );

ALTER TABLE "Customers" ADD
 CONSTRAINT "PK_Customers" PRIMARY KEY 
 (
  CustomerID
 );

ALTER TABLE "Employees" ADD
 CONSTRAINT "PK_Employees" PRIMARY KEY 
 (
  EmployeeID
 );

ALTER TABLE "Order Details" ADD
 CONSTRAINT "PK_Order_Details" PRIMARY KEY 
 (
  OrderID,
  ProductID
 );

ALTER TABLE "Orders" ADD
 CONSTRAINT "PK_Orders" PRIMARY KEY 
 (
  OrderID
 );

ALTER TABLE "Products" ADD
 CONSTRAINT "PK_Products" PRIMARY KEY 
 (
  ProductID
 );

ALTER TABLE "Shippers" ADD
 CONSTRAINT "PK_Shippers" PRIMARY KEY 
 (
  ShipperID
 );

ALTER TABLE "Suppliers" ADD
 CONSTRAINT "PK_Suppliers" PRIMARY KEY 
 (
  SupplierID
 );

ALTER TABLE "CustomerCustomerDemo" ADD
 CONSTRAINT "PK_CustomerCustomerDemo" PRIMARY KEY 
 (
  CustomerID,
  CustomerTypeID
 );

ALTER TABLE "CustomerDemographics" ADD
 CONSTRAINT "PK_CustomerDemographics" PRIMARY KEY 
 (
  CustomerTypeID
 );

ALTER TABLE "EmployeeTerritories" ADD
 CONSTRAINT "PK_EmployeeTerritories" PRIMARY KEY 
 (
  EmployeeID,
  TerritoryID
 );

ALTER TABLE "Region" ADD
 CONSTRAINT "PK_Region" PRIMARY KEY 
 (
  RegionID
 );

ALTER TABLE "Territories" ADD
 CONSTRAINT "PK_Territories" PRIMARY KEY 
 (
  TerritoryID
 );

CREATE INDEX "I_Categories_CategoryName" ON "Categories"(CategoryName);

CREATE INDEX "I_CustCustDemo_CustomerID" ON "CustomerCustomerDemo"(CustomerID);

CREATE INDEX "I_CustCustDemo_CustomerTypeID" ON "CustomerCustomerDemo"(CustomerTypeID);

CREATE INDEX "I_Customers_City" ON "Customers"(City);

CREATE INDEX "I_Customers_CompanyName" ON "Customers"(CompanyName);

CREATE INDEX "I_Customers_PostalCode" ON "Customers"(PostalCode);

CREATE INDEX "I_Customers_Region" ON "Customers"(Region);

CREATE INDEX "I_Employees_LastName" ON "Employees"(LastName);

CREATE INDEX "I_Employees_PostalCode" ON "Employees"(PostalCode);

CREATE INDEX "I_OrderDetails_OrderID" ON "Order Details"(OrderID);

CREATE INDEX "I_OrderDetails_ProductID" ON "Order Details"(ProductID);

CREATE INDEX "I_Orders_CustomerID" ON "Orders"(CustomerID);

CREATE INDEX "I_Orders_EmployeeID" ON "Orders"(EmployeeID);

CREATE INDEX "I_Orders_OrderDate" ON "Orders"(OrderDate);

CREATE INDEX "I_Orders_ShippedDate" ON "Orders"(ShippedDate);

CREATE INDEX "I_Orders_ShipVia" ON "Orders"(ShipVia);

CREATE INDEX "I_Orders_ShipPostalCode" ON "Orders"(ShipPostalCode);

CREATE INDEX "I_Products_CategoryID" ON "Products"(CategoryID);

CREATE INDEX "I_Products_ProductName" ON "Products"(ProductName);

CREATE INDEX "I_Products_SupplierID" ON "Products"(SupplierID);

CREATE INDEX "I_Suppliers_CompanyName" ON "Suppliers"(CompanyName);

CREATE INDEX "I_Suppliers_PostalCode" ON "Suppliers"(PostalCode);

ALTER TABLE "CustomerCustomerDemo" ADD 
 CONSTRAINT "FK_CustomerCustomerDemo_CustomerDemographics" FOREIGN KEY
 (
  CustomerTypeID
 ) REFERENCES "CustomerDemographics" (
  CustomerTypeID
 );

ALTER TABLE "CustomerCustomerDemo" ADD 
 CONSTRAINT "FK_CustomerCustomerDemo_Customers" FOREIGN KEY 
 (
  CustomerID
 ) REFERENCES "Customers" (
  CustomerID
 );

ALTER TABLE "EmployeeTerritories" ADD 
 CONSTRAINT "FK_EmployeeTerritories_Employees" FOREIGN KEY
 (
  EmployeeID
 ) REFERENCES "Employees" (
  EmployeeID
 );

ALTER TABLE "EmployeeTerritories" ADD
 CONSTRAINT "FK_EmployeeTerritories_Territories" FOREIGN KEY 
 (
  TerritoryID
 ) REFERENCES "Territories" (
  TerritoryID
 );

ALTER TABLE "Employees" ADD 
 CONSTRAINT "FK_Employees_Employees" FOREIGN KEY 
 (
  ReportsTo
 ) REFERENCES "Employees" (
  EmployeeID
 );

ALTER TABLE "Order Details" ADD 
 CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
 (
  OrderID
 ) REFERENCES "Orders" (
  OrderID
 );

ALTER TABLE "Order Details" ADD 
 CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
 (
  ProductID
 ) REFERENCES "Products" (
  ProductID
 );

ALTER TABLE "Orders" ADD 
 CONSTRAINT "FK_Orders_Customers" FOREIGN KEY 
 (
  CustomerID
 ) REFERENCES "Customers" (
  CustomerID
 );

ALTER TABLE "Orders" ADD 
 CONSTRAINT "FK_Orders_Employees" FOREIGN KEY 
 (
  EmployeeID
 ) REFERENCES "Employees" (
  EmployeeID
 );

ALTER TABLE "Orders" ADD
 CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
 (
  ShipVia
 ) REFERENCES "Shippers" (
  ShipperID
 );

ALTER TABLE "Products" ADD 
 CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
 (
  CategoryID
 ) REFERENCES "Categories" (
  CategoryID
 );

ALTER TABLE "Products" ADD 
 CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
 (
  SupplierID
 ) REFERENCES "Suppliers" (
  SupplierID
 );

ALTER TABLE "Territories" ADD 
 CONSTRAINT "FK_Territories_Region" FOREIGN KEY 
 (
  RegionID
 ) REFERENCES "Region" (
  RegionID
 );
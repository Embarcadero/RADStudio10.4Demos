DROP VIEW "FDQA_V_Test";
DROP TABLE "CustomerCustomerDemo";
DROP TABLE "CustomerDemographics";
DROP TABLE "Order Details";
DROP TABLE "Orders";
DROP TABLE "Customers";
DROP TABLE "Shippers";
DROP TABLE "EmployeeTerritories";
DROP TABLE "Employees"; 
DROP TABLE "Territories";
DROP TABLE "Region";
DROP TABLE "Products";
DROP TABLE "Suppliers";
DROP TABLE "Categories";

CREATE TABLE "Categories" (
  CategoryID INTEGER PRIMARY KEY AUTOINCREMENT ,
  CategoryName varchar (15) NOT NULL ,
  Description memo NULL ,
  Picture image NULL
);

CREATE TABLE "Suppliers" (
  SupplierID INTEGER PRIMARY KEY AUTOINCREMENT ,
  CompanyName varchar (40) NOT NULL ,
  ContactName varchar (30) NULL ,
  ContactTitle varchar (30) NULL ,
  Address varchar (60) NULL ,
  City varchar (15) NULL ,
  Region varchar (15) NULL ,
  PostalCode varchar (10) NULL ,
  Country varchar (15) NULL ,
  Phone varchar (24) NULL ,
  Fax varchar (24) NULL ,
  HomePage text NULL
);

CREATE TABLE "Products" (
  ProductID INTEGER PRIMARY KEY AUTOINCREMENT ,
  ProductName varchar (40) NOT NULL ,
  SupplierID INTEGER NULL ,
  CategoryID INTEGER NULL ,
  QuantityPerUnit varchar (20) NULL ,
  UnitPrice money NULL DEFAULT 0 CHECK (UnitPrice >= 0),
  UnitsInStock smallint NULL DEFAULT 0 CHECK (UnitsInStock >= 0),
  UnitsOnOrder smallint NULL DEFAULT 0 CHECK (UnitsOnOrder >= 0),
  ReorderLevel smallint NULL DEFAULT 0 CHECK (ReorderLevel >= 0),
  Discontinued bool NOT NULL DEFAULT 0,
  FOREIGN KEY (CategoryID) REFERENCES "Categories" (CategoryID),
  FOREIGN KEY (SupplierID) REFERENCES "Suppliers" (SupplierID)
);

CREATE TABLE "Region" (
  RegionID INTEGER NOT NULL PRIMARY KEY ,
  RegionDescription char (50) NOT NULL
);

CREATE TABLE "Territories" (
  TerritoryID varchar (20) NOT NULL PRIMARY KEY ,
  TerritoryDescription char (50) NOT NULL ,
  RegionID INTEGER NOT NULL,
  FOREIGN KEY (RegionID) REFERENCES "Region" (RegionID)
);

CREATE TABLE "Employees" (
  EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT ,
  LastName varchar (20) NOT NULL ,
  FirstName varchar (10) NOT NULL ,
  Title varchar (30) NULL ,
  TitleOfCourtesy varchar (25) NULL ,
  BirthDate datetime CHECK (BirthDate is null or BirthDate < date('now')),
  HireDate datetime NULL ,
  Address varchar (60) NULL ,
  City varchar (15) NULL ,
  Region varchar (15) NULL ,
  PostalCode varchar (10) NULL ,
  Country varchar (15) NULL ,
  HomePhone varchar (24) NULL ,
  Extension varchar (4) NULL ,
  Photo image NULL ,
  Notes memo NULL ,
  ReportsTo INTEGER NULL ,
  PhotoPath varchar (255) NULL,
  FOREIGN KEY (ReportsTo) REFERENCES "Employees"(EmployeeID)
);

CREATE TABLE "EmployeeTerritories" (
  EmployeeID INTEGER NOT NULL ,
  TerritoryID varchar (20) NOT NULL,
  PRIMARY KEY (EmployeeID, TerritoryID),
  FOREIGN KEY (TerritoryID) REFERENCES "Territories" (TerritoryID),
  FOREIGN KEY (EmployeeID) REFERENCES "Employees" (EmployeeID)
);

CREATE TABLE "Shippers" (
  ShipperID INTEGER PRIMARY KEY AUTOINCREMENT ,
  CompanyName varchar (40) NOT NULL ,
  Phone varchar (24) NULL 
);

CREATE TABLE "Customers" (
  CustomerID char (5) NOT NULL PRIMARY KEY ,
  CompanyName varchar (40) NOT NULL ,
  ContactName varchar (30) NULL ,
  ContactTitle varchar (30) NULL ,
  Address varchar (60) NULL ,
  City varchar (15) NULL ,
  Region varchar (15) NULL ,
  PostalCode varchar (10) NULL ,
  Country varchar (15) NULL ,
  Phone varchar (24) NULL ,
  Fax varchar (24) NULL
); 

CREATE TABLE "Orders" (
  OrderID INTEGER PRIMARY KEY AUTOINCREMENT ,
  CustomerID char (5) NULL ,
  EmployeeID INTEGER NULL ,
  OrderDate datetime NULL ,
  RequiredDate datetime NULL ,
  ShippedDate datetime NULL ,
  ShipVia INTEGER NULL ,
  Freight money NULL DEFAULT 0,
  ShipName varchar (40) NULL ,
  ShipAddress varchar (60) NULL ,
  ShipCity varchar (15) NULL ,
  ShipRegion varchar (15) NULL ,
  ShipPostalCode varchar (10) NULL ,
  ShipCountry varchar (15) NULL,
  FOREIGN KEY (EmployeeID) REFERENCES "Employees" (EmployeeID),
  FOREIGN KEY (CustomerID) REFERENCES "Customers" (CustomerID),
  FOREIGN KEY (ShipVia) REFERENCES "Shippers" (ShipperID)
);

CREATE TABLE "Order Details" (
  OrderID INTEGER NOT NULL ,
  ProductID INTEGER NOT NULL ,
  UnitPrice money NOT NULL DEFAULT 0 CHECK (UnitPrice >= 0),
  Quantity smallint NOT NULL DEFAULT 1 CHECK (Quantity > 0),
  Discount real NOT NULL DEFAULT 0 CHECK (Discount >= 0 and Discount <= 1),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES "Orders" (OrderID),
  FOREIGN KEY (ProductID) REFERENCES "Products" (ProductID)
);

CREATE TABLE "CustomerDemographics" (
  CustomerTypeID char (10) NOT NULL PRIMARY KEY ,
  CustomerDesc memo NULL
);

CREATE TABLE "CustomerCustomerDemo" (
  CustomerID char (5) NOT NULL ,
  CustomerTypeID char (10) NOT NULL,
  PRIMARY KEY (CustomerID, CustomerTypeID),
  FOREIGN KEY (CustomerTypeID) REFERENCES "CustomerDemographics"(CustomerTypeID),
  FOREIGN KEY (CustomerID) REFERENCES "Customers"(CustomerID)
);

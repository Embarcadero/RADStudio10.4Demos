SET CMDSEP ;

DROP VIEW "FDQA_V_Test";

DROP TABLE "Order Details";

CREATE TABLE "Order Details" (
  OrderID int NOT NULL ,
  ProductID int NOT NULL ,
  UnitPrice money NOT NULL DEFAULT 0,
  Quantity smallint NOT NULL DEFAULT 1,
  Discount real NOT NULL DEFAULT 0
);

DROP TABLE "Products";

CREATE TABLE "Products" (
  ProductID serial NOT NULL ,
  ProductName nvarchar (40) NOT NULL ,
  SupplierID int,
  CategoryID int,
  QuantityPerUnit nvarchar (20),
  UnitPrice money default 0,
  UnitsInStock smallint default 0,
  UnitsOnOrder smallint default 0,
  ReorderLevel smallint default 0,
  Discontinued boolean NOT NULL default 'f'
);

DROP TABLE "Categories";

CREATE TABLE "Categories" (
  CategoryID serial NOT NULL ,
  CategoryName nvarchar (15) NOT NULL ,
  Description text,
  Picture byte
);

DROP TABLE "Suppliers";

CREATE TABLE "Suppliers" (
  SupplierID serial NOT NULL ,
  CompanyName nvarchar (40) NOT NULL ,
  ContactName nvarchar (30),
  ContactTitle nvarchar (30),
  Address nvarchar (60),
  City nvarchar (15),
  Region nvarchar (15),
  PostalCode nvarchar (10),
  Country nvarchar (15),
  Phone nvarchar (24),
  Fax nvarchar (24),
  HomePage text
);

DROP TABLE "EmployeeTerritories";

CREATE TABLE "EmployeeTerritories" (
  EmployeeID int NOT NULL ,
  TerritoryID nvarchar (20) NOT NULL
);

DROP TABLE "Territories";

CREATE TABLE "Territories" (
  TerritoryID nvarchar (20) NOT NULL ,
  TerritoryDescription nchar (50) NOT NULL ,
  RegionID int NOT NULL
);

DROP TABLE "Region";

CREATE TABLE "Region" (
  RegionID int NOT NULL ,
  RegionDescription nchar (50) NOT NULL
);

DROP TABLE "Orders";

CREATE TABLE "Orders" (
  OrderID serial NOT NULL ,
  CustomerID nchar (5),
  EmployeeID int,
  OrderDate date,
  RequiredDate date,
  ShippedDate date,
  ShipVia int,
  Freight money default 0,
  ShipName nvarchar (40),
  ShipAddress nvarchar (60),
  ShipCity nvarchar (15),
  ShipRegion nvarchar (15),
  ShipPostalCode nvarchar (10),
  ShipCountry nvarchar (15)
);

DROP TABLE "Employees";

CREATE TABLE "Employees" (
  EmployeeID serial NOT NULL ,
  LastName nvarchar (20) NOT NULL ,
  FirstName nvarchar (10) NOT NULL ,
  Title nvarchar (30),
  TitleOfCourtesy nvarchar (25),
  BirthDate date,
  HireDate date,
  Address nvarchar (60),
  City nvarchar (15),
  Region nvarchar (15),
  PostalCode nvarchar (10),
  Country nvarchar (15),
  HomePhone nvarchar (24),
  Extension nvarchar (4),
  Photo byte,
  Notes text,
  ReportsTo int,
  PhotoPath nvarchar (255)
);

DROP TABLE "Shippers";

CREATE TABLE "Shippers" (
  ShipperID serial NOT NULL ,
  CompanyName nvarchar (40) NOT NULL ,
  Phone nvarchar (24)
);

DROP TABLE "CustomerCustomerDemo";

CREATE TABLE "CustomerCustomerDemo" (
  CustomerID nchar (5) NOT NULL ,
  CustomerTypeID nchar (10) NOT NULL
);

DROP TABLE "CustomerDemographics";

CREATE TABLE "CustomerDemographics" (
  CustomerTypeID nchar (10) NOT NULL ,
  CustomerDesc text
);

DROP TABLE "Customers";

CREATE TABLE "Customers" (
  CustomerID nchar (5) NOT NULL ,
  CompanyName nvarchar (40) NOT NULL ,
  ContactName nvarchar (30),
  ContactTitle nvarchar (30),
  Address nvarchar (60),
  City nvarchar (15),
  Region nvarchar (15),
  PostalCode nvarchar (10),
  Country nvarchar (15),
  Phone nvarchar (24),
  Fax nvarchar (24)
);

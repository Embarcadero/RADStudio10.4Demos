SET CMDSEP ;

DROP VIEW "FDQA_V_Test";

DROP TABLE "Order Details";

CREATE TABLE "Order Details" (
  OrderID int NOT NULL ,
  ProductID int NOT NULL ,
  UnitPrice numeric (19,4) NOT NULL ,
  Quantity smallint NOT NULL ,
  Discount real NOT NULL
);

DROP TABLE "Products";

CREATE TABLE "Products" (
  ProductID int IDENTITY NOT NULL ,
  ProductName varchar (40) NOT NULL ,
  SupplierID int NULL ,
  CategoryID int NULL ,
  QuantityPerUnit varchar (20) NULL ,
  UnitPrice numeric (19,4) NULL ,
  UnitsInStock smallint NULL ,
  UnitsOnOrder smallint NULL ,
  ReorderLevel smallint NULL ,
  Discontinued bit NOT NULL
);


DROP TABLE "Categories";


CREATE TABLE "Categories" (
  CategoryID int IDENTITY NOT NULL ,
  CategoryName varchar (15) NOT NULL ,
  Description long varchar NULL ,
  Picture long binary NULL
);

DROP TABLE "Suppliers";

CREATE TABLE "Suppliers" (
  SupplierID int IDENTITY NOT NULL ,
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
  HomePage long varchar NULL
);

DROP TABLE "EmployeeTerritories";


CREATE TABLE "EmployeeTerritories" (
  EmployeeID int NOT NULL ,
  TerritoryID varchar (20) NOT NULL
);

DROP TABLE "Territories";

CREATE TABLE "Territories" (
  TerritoryID varchar (20) NOT NULL ,
  TerritoryDescription char (50) NOT NULL ,
  RegionID int NOT NULL
);

DROP TABLE "Region";

CREATE TABLE "Region" (
  RegionID int NOT NULL ,
  RegionDescription char (50) NOT NULL
);

DROP TABLE "Orders";

CREATE TABLE "Orders" (
  OrderID int IDENTITY NOT NULL ,
  CustomerID char (5) NULL ,
  EmployeeID int NULL ,
  OrderDate timestamp NULL ,
  RequiredDate timestamp NULL ,
  ShippedDate timestamp NULL ,
  ShipVia int NULL ,
  Freight numeric (19,4) NULL ,
  ShipName varchar (40) NULL ,
  ShipAddress varchar (60) NULL ,
  ShipCity varchar (15) NULL ,
  ShipRegion varchar (15) NULL ,
  ShipPostalCode varchar (10) NULL ,
  ShipCountry varchar (15) NULL
);

DROP TABLE "Employees";
                     
CREATE TABLE "Employees" (
  EmployeeID int IDENTITY NOT NULL ,
  LastName varchar (20) NOT NULL ,
  FirstName varchar (10) NOT NULL ,
  Title varchar (30) NULL ,
  TitleOfCourtesy varchar (25) NULL ,
  BirthDate timestamp NULL ,
  HireDate timestamp NULL ,
  Address varchar (60) NULL ,
  City varchar (15) NULL ,
  Region varchar (15) NULL ,
  PostalCode varchar (10) NULL ,
  Country varchar (15) NULL ,
  HomePhone varchar (24) NULL ,
  Extension varchar (4) NULL ,
  Photo long binary NULL ,
  Notes long varchar NULL ,
  ReportsTo int NULL ,
  PhotoPath varchar (255) NULL
);

DROP TABLE "Shippers";

CREATE TABLE "Shippers" (
  ShipperID int IDENTITY NOT NULL ,
  CompanyName varchar (40) NOT NULL ,
  Phone varchar (24) NULL 
);

DROP TABLE "CustomerCustomerDemo";

CREATE TABLE "CustomerCustomerDemo" (
  CustomerID char (5) NOT NULL ,
  CustomerTypeID char (10) NOT NULL
);

DROP TABLE "CustomerDemographics";

CREATE TABLE "CustomerDemographics" (
  CustomerTypeID char (10) NOT NULL ,
  CustomerDesc long varchar NULL
); 

DROP TABLE "Customers";

CREATE TABLE "Customers" (
  CustomerID char (5) NOT NULL ,
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
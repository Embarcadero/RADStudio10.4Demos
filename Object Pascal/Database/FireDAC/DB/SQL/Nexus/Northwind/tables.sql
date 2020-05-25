DROP VIEW "FDQA_V_Test";

DROP TABLE "Order Details";

CREATE TABLE "Order Details" (
       OrderID              INTEGER NOT NULL,
       ProductID            INTEGER NOT NULL,
       UnitPrice            MONEY NOT NULL,
       Quantity             SMALLINT DEFAULT 1 NOT NULL,
       Discount             REAL DEFAULT 0 NOT NULL
);

DROP TABLE "Products";

CREATE TABLE "Products" (
       ProductID            AUTOINC NOT NULL,
       ProductName          NVARCHAR(40) NOT NULL,
       SupplierID           INTEGER,
       CategoryID           INTEGER,
       QuantityPerUnit      NVARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         SMALLINT DEFAULT 0,
       UnitsOnOrder         SMALLINT DEFAULT 0,
       ReorderLevel         SMALLINT DEFAULT 0,
       Discontinued         BOOLEAN DEFAULT FALSE NOT NULL
);

ALTER SEQUENCE "Products_productid_seq" RESTART WITH 78;

DROP TABLE "Categories";

CREATE TABLE "Categories" (
       CategoryID           AUTOINC NOT NULL,
       CategoryName         NVARCHAR(15) NOT NULL,
       Description          NCLOB,
       Picture              IMAGE
);

ALTER SEQUENCE "Categories_categoryid_seq" RESTART WITH 9;

DROP TABLE "Suppliers";

CREATE TABLE "Suppliers" (
       SupplierID           AUTOINC NOT NULL,
       CompanyName          NVARCHAR(40) NOT NULL,
       ContactName          NVARCHAR(30),
       ContactTitle         NVARCHAR(30),
       Address              NVARCHAR(60),
       City                 NVARCHAR(15),
       Region               NVARCHAR(15),
       PostalCode           NVARCHAR(10),
       Country              NVARCHAR(15),
       Phone                NVARCHAR(24),
       Fax                  NVARCHAR(24),
       HomePage             NCLOB
);

ALTER SEQUENCE "Suppliers_supplierid_seq" RESTART WITH 30;

DROP TABLE "EmployeeTerritories";

CREATE TABLE "EmployeeTerritories" (
       EmployeeID           INTEGER NOT NULL,
       TerritoryID          NVARCHAR(20) NOT NULL
);

DROP TABLE "Territories";

CREATE TABLE "Territories" (
       TerritoryID          NVARCHAR(20) NOT NULL,
       TerritoryDescription NCHAR(50) NOT NULL,
       RegionID             INTEGER NOT NULL
);

DROP TABLE "Region";

CREATE TABLE "Region" (
       RegionID             INTEGER NOT NULL,
       RegionDescription    NCHAR(50) NOT NULL
);

DROP TABLE "Orders";

CREATE TABLE "Orders" (
       OrderID              AUTOINC NOT NULL,
       CustomerID           NCHAR(5),
       EmployeeID           INTEGER,
       OrderDate            DATE,
       RequiredDate         DATE,
       ShippedDate          DATE,
       ShipVia              INTEGER,
       Freight              MONEY DEFAULT 0,
       ShipName             NVARCHAR(40),
       ShipAddress          NVARCHAR(60),
       ShipCity             NVARCHAR(15),
       ShipRegion           NVARCHAR(15),
       ShipPostalCode       NVARCHAR(10),
       ShipCountry          NVARCHAR(15)
);

ALTER SEQUENCE "Orders_orderid_seq" RESTART WITH 11078;

DROP TABLE "Employees";

CREATE TABLE "Employees" (
       EmployeeID           AUTOINC NOT NULL,
       LastName             NVARCHAR(20) NOT NULL,
       FirstName            NVARCHAR(10) NOT NULL,
       Title                NVARCHAR(30),
       TitleOfCourtesy      NVARCHAR(25),
       BirthDate            DATE,
       HireDate             DATE,
       Address              NVARCHAR(60),
       City                 NVARCHAR(15),
       Region               NVARCHAR(15),
       PostalCode           NVARCHAR(10),
       Country              NVARCHAR(15),
       HomePhone            NVARCHAR(24),
       Extension            NVARCHAR(4),
       Photo                IMAGE,
       Notes                NCLOB,
       ReportsTo            INTEGER,
       PhotoPath            NVARCHAR(255)
);

ALTER SEQUENCE "Employees_employeeid_seq" RESTART WITH 10;

DROP TABLE "Shippers";

CREATE TABLE "Shippers" (
       ShipperID            AUTOINC NOT NULL,
       CompanyName          NVARCHAR(40) NOT NULL,
       Phone                NVARCHAR(24)
);

ALTER SEQUENCE "Shippers_shipperid_seq" RESTART WITH 4;

DROP TABLE "CustomerCustomerDemo";

CREATE TABLE "CustomerCustomerDemo" (
       CustomerID           NCHAR(5) NOT NULL,
       CustomerTypeID       NCHAR(10) NOT NULL
);

DROP TABLE "CustomerDemographics";

CREATE TABLE "CustomerDemographics" (
       CustomerTypeID       NCHAR(10) NOT NULL,
       CustomerDesc         NCLOB
);

DROP TABLE "Customers";

CREATE TABLE "Customers" (
       CustomerID           NCHAR(5) NOT NULL,
       CompanyName          NVARCHAR(40) NOT NULL,
       ContactName          NVARCHAR(30),
       ContactTitle         NVARCHAR(30),
       Address              NVARCHAR(60),
       City                 NVARCHAR(15),
       Region               NVARCHAR(15),
       PostalCode           NVARCHAR(10),
       Country              NVARCHAR(15),
       Phone                NVARCHAR(24),
       Fax                  NVARCHAR(24)
);

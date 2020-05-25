SET TERM ;;

DROP VIEW "FDQA_V_Test";

DROP TABLE "Order Details";

CREATE TABLE "Order Details" (
       OrderID              INTEGER NOT NULL,
       ProductID            INTEGER NOT NULL,
       UnitPrice            NUMERIC(18,4),
       Quantity             SMALLINT DEFAULT 1 NOT NULL,
       Discount             FLOAT DEFAULT 0 NOT NULL
);

DROP TABLE "Products";

CREATE TABLE "Products" (
       ProductID            INTEGER NOT NULL,
       ProductName          VARCHAR(40) NOT NULL,
       SupplierID           INTEGER,
       CategoryID           INTEGER,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            NUMERIC(18,4),
       UnitsInStock         SMALLINT DEFAULT 0,
       UnitsOnOrder         SMALLINT DEFAULT 0,
       ReorderLevel         SMALLINT DEFAULT 0,
       Discontinued         SMALLINT DEFAULT 0 NOT NULL
);

DROP TABLE "Categories";

CREATE TABLE "Categories" (
       CategoryID           INTEGER NOT NULL,
       CategoryName         VARCHAR(15) NOT NULL,
       Description          BLOB(2000,1),
       Picture              BLOB(2000,0)
);

DROP TABLE "Suppliers";

CREATE TABLE "Suppliers" (
       SupplierID           INTEGER NOT NULL,
       CompanyName          VARCHAR(40) NOT NULL,
       ContactName          VARCHAR(30),
       ContactTitle         VARCHAR(30),
       Address              VARCHAR(60),
       City                 VARCHAR(15),
       Region               VARCHAR(15),
       PostalCode           VARCHAR(10),
       Country              VARCHAR(15),
       Phone                VARCHAR(24),
       Fax                  VARCHAR(24),
       HomePage             BLOB(2000,1)
);

DROP TABLE "EmployeeTerritories";

CREATE TABLE "EmployeeTerritories" (
       EmployeeID           INTEGER NOT NULL,
       TerritoryID          VARCHAR(20) NOT NULL
);

DROP TABLE "Territories";

CREATE TABLE "Territories" (
       TerritoryID          VARCHAR(20) NOT NULL,
       TerritoryDescription VARCHAR(50) NOT NULL,
       RegionID             INTEGER NOT NULL
);

DROP PROCEDURE FDQA_Zget_region;
DROP TABLE "Region";

CREATE TABLE "Region" (
       RegionID             INTEGER NOT NULL,
       RegionDescription    VARCHAR(50) NOT NULL
);

DROP TABLE "Orders";

CREATE TABLE "Orders" (
       OrderID              INTEGER NOT NULL,
       CustomerID           VARCHAR(5),
       EmployeeID           INTEGER,
       OrderDate            DATE,
       RequiredDate         DATE,
       ShippedDate          DATE,
       ShipVia              INTEGER,
       Freight              NUMERIC(18,4) DEFAULT 0,
       ShipName             VARCHAR(40),
       ShipAddress          VARCHAR(60),
       ShipCity             VARCHAR(15),
       ShipRegion           VARCHAR(15),
       ShipPostalCode       VARCHAR(10),
       ShipCountry          VARCHAR(15)
);

DROP TABLE "Employees";

CREATE TABLE "Employees" (
       EmployeeID           INTEGER NOT NULL,
       LastName             VARCHAR(20) NOT NULL,
       FirstName            VARCHAR(10) NOT NULL,
       Title                VARCHAR(30),
       TitleOfCourtesy      VARCHAR(25),
       BirthDate            DATE,
       HireDate             DATE,
       Address              VARCHAR(60),
       City                 VARCHAR(15),
       Region               VARCHAR(15),
       PostalCode           VARCHAR(10),
       Country              VARCHAR(15),
       HomePhone            VARCHAR(24),
       Extension            VARCHAR(4),
       Photo                BLOB(2000,0),
       Notes                BLOB(2000,1),
       ReportsTo            INTEGER,
       PhotoPath            VARCHAR(255)
);

DROP TABLE "Shippers";

CREATE TABLE "Shippers" (
       ShipperID            INTEGER NOT NULL,
       CompanyName          VARCHAR(40) NOT NULL,
       Phone                VARCHAR(24)
);

DROP TABLE "CustomerCustomerDemo";

CREATE TABLE "CustomerCustomerDemo" (
       CustomerID           VARCHAR(5) NOT NULL,
       CustomerTypeID       VARCHAR(10) NOT NULL
);

DROP TABLE "CustomerDemographics";

CREATE TABLE "CustomerDemographics" (
       CustomerTypeID       VARCHAR(10) NOT NULL,
       CustomerDesc         BLOB(2000,1)
);

DROP TABLE "Customers";

CREATE TABLE "Customers" (
       CustomerID           VARCHAR(5) NOT NULL,
       CompanyName          VARCHAR(40) NOT NULL,
       ContactName          VARCHAR(30),
       ContactTitle         VARCHAR(30),
       Address              VARCHAR(60),
       City                 VARCHAR(15),
       Region               VARCHAR(15),
       PostalCode           VARCHAR(10),
       Country              VARCHAR(15),
       Phone                VARCHAR(24),
       Fax                  VARCHAR(24)
);

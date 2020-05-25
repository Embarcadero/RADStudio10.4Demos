SET CMDSEP /

DROP VIEW "FDQA_V_Test"
/

DROP TABLE "Order Details"
/

CREATE TABLE "Order Details" (
       OrderID              NUMBER(10,0) NOT NULL,
       ProductID            NUMBER(10,0) NOT NULL,
       UnitPrice            NUMBER(19,4) NULL,
       Quantity             NUMBER(5,0) DEFAULT 1 NOT NULL,
       Discount             FLOAT DEFAULT 0 NOT NULL
)
/

DROP TABLE "Products"
/

CREATE TABLE "Products" (
       ProductID            NUMBER(10,0) NOT NULL,
       ProductName          NVARCHAR2(40) NOT NULL,
       SupplierID           NUMBER(10,0) NULL,
       CategoryID           NUMBER(10,0) NULL,
       QuantityPerUnit      NVARCHAR2(20) NULL,
       UnitPrice            NUMBER(19,4)  NULL,
       UnitsInStock         NUMBER (5,0) DEFAULT 0 NULL,
       UnitsOnOrder         NUMBER (5,0) DEFAULT 0 NULL,
       ReorderLevel         NUMBER (5,0) DEFAULT 0 NULL,
       Discontinued         NUMBER (1,0) DEFAULT 0 NOT NULL
)
/

DROP TABLE "Categories"
/

CREATE TABLE "Categories" (
       CategoryID           NUMBER(10,0) NOT NULL,
       CategoryName         NVARCHAR2(15) NOT NULL,
       Description          LONG NULL,
       Picture              BLOB NULL
)
/

DROP TABLE "Suppliers"
/

CREATE TABLE "Suppliers" (
       SupplierID           NUMBER(10,0) NOT NULL,
       CompanyName          NVARCHAR2(40) NOT NULL,
       ContactName          NVARCHAR2(30) NULL,
       ContactTitle         NVARCHAR2(30) NULL,
       Address              NVARCHAR2(60) NULL,
       City                 NVARCHAR2(15) NULL,
       Region               NVARCHAR2(15) NULL,
       PostalCode           NVARCHAR2(10) NULL,
       Country              NVARCHAR2(15) NULL,
       Phone                NVARCHAR2(24) NULL,
       Fax                  NVARCHAR2(24) NULL,
       HomePage             LONG NULL
)
/

DROP TABLE "EmployeeTerritories"
/

CREATE TABLE "EmployeeTerritories" (
       EmployeeID           NUMBER(10,0) NOT NULL,
       TerritoryID          NVARCHAR2(20) NOT NULL
)
/

DROP TABLE "Territories"
/

CREATE TABLE "Territories" (
       TerritoryID          NVARCHAR2(20) NOT NULL,
       TerritoryDescription nvarchar2(50) NOT NULL,
       RegionID             NUMBER(10,0) NOT NULL
)
/

DROP TABLE "Region"
/

CREATE TABLE "Region" (
       RegionID             NUMBER(10,0) NOT NULL,
       RegionDescription    nvarchar2(50) NOT NULL
)
/

DROP TABLE "Orders"
/

CREATE TABLE "Orders" (
       OrderID              NUMBER(10,0) NOT NULL,
       CustomerID           nvarchar2(5) NULL,
       EmployeeID           NUMBER(10,0) NULL,
       OrderDate            DATE NULL,
       RequiredDate         DATE NULL,
       ShippedDate          DATE NULL,
       ShipVia              NUMBER(10,0) NULL,
       Freight              NUMBER(19,4) DEFAULT 0 NULL,
       ShipName             NVARCHAR2(40) NULL,
       ShipAddress          NVARCHAR2(60) NULL,
       ShipCity             NVARCHAR2(15) NULL,
       ShipRegion           NVARCHAR2(15) NULL,
       ShipPostalCode       NVARCHAR2(10) NULL,
       ShipCountry          NVARCHAR2(15) NULL
)
/

DROP TABLE "Employees"
/

CREATE TABLE "Employees" (
       EmployeeID           NUMBER(10,0) NOT NULL,
       LastName             NVARCHAR2(20) NOT NULL,
       FirstName            NVARCHAR2(10) NOT NULL,
       Title                NVARCHAR2(30) NULL,
       TitleOfCourtesy      NVARCHAR2(25) NULL,
       BirthDate            DATE NULL,
       HireDate             DATE NULL,
       Address              NVARCHAR2(60) NULL,
       City                 NVARCHAR2(15) NULL,
       Region               NVARCHAR2(15) NULL,
       PostalCode           NVARCHAR2(10) NULL,
       Country              NVARCHAR2(15) NULL,
       HomePhone            NVARCHAR2(24) NULL,
       Extension            NVARCHAR2(4) NULL,
       Photo                BLOB NULL,
       Notes                LONG NULL,
       ReportsTo            NUMBER(10,0) NULL,
       PhotoPath            NVARCHAR2(255) NULL
)
/

DROP TABLE "Shippers"
/

CREATE TABLE "Shippers" (
       ShipperID            NUMBER(10,0) NOT NULL,
       CompanyName          NVARCHAR2(40) NOT NULL,
       Phone                NVARCHAR2(24) NULL
)
/

DROP TABLE "CustomerCustomerDemo"
/

CREATE TABLE "CustomerCustomerDemo" (
       CustomerID           nvarchar2(5) NOT NULL,
       CustomerTypeID       nvarchar2(10) NOT NULL
)
/

DROP TABLE "CustomerDemographics"
/

CREATE TABLE "CustomerDemographics" (
       CustomerTypeID       nvarchar2(10) NOT NULL,
       CustomerDesc         LONG NULL
)
/

DROP TABLE "Customers"
/

CREATE TABLE "Customers" (
       CustomerID           nvarchar2(5) NOT NULL,
       CompanyName          NVARCHAR2(40) NOT NULL,
       ContactName          NVARCHAR2(30) NULL,
       ContactTitle         NVARCHAR2(30) NULL,
       Address              NVARCHAR2(60) NULL,
       City                 NVARCHAR2(15) NULL,
       Region               NVARCHAR2(15) NULL,
       PostalCode           NVARCHAR2(10) NULL,
       Country              NVARCHAR2(15) NULL,
       Phone                NVARCHAR2(24) NULL,
       Fax                  NVARCHAR2(24) NULL
)
/

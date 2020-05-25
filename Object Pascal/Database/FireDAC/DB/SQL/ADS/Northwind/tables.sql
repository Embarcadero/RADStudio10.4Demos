execute procedure sp_DropReferentialIntegrity (
  'FK_CustCustDemo_CustDemogr');
execute procedure sp_DropReferentialIntegrity (
  'FK_CustCustDemo_Customers');
execute procedure sp_DropReferentialIntegrity (
  'FK_Employees_Employees');
execute procedure sp_DropReferentialIntegrity (
  'FK_EmployeeTerritories_Terr');
execute procedure sp_DropReferentialIntegrity (
  'FK_EmplTerrit_Employees');
execute procedure sp_DropReferentialIntegrity (
  'FK_OrderDetails_Orders');
execute procedure sp_DropReferentialIntegrity (
  'FK_OrderDetails_Products');
execute procedure sp_DropReferentialIntegrity (
  'FK_Orders_Employees');
execute procedure sp_DropReferentialIntegrity (
  'FK_Orders_Customers');
execute procedure sp_DropReferentialIntegrity (
  'FK_Orders_Shippers');
execute procedure sp_DropReferentialIntegrity (
  'FK_Products_Categories');
execute procedure sp_DropReferentialIntegrity (
  'FK_Products_Suppliers');
execute procedure sp_DropReferentialIntegrity (
  'FK_Territories_Region');

DROP VIEW "FDQA_V_Test";
DROP TABLE "Order Details";
DROP TABLE "Products";
DROP TABLE "Categories";
DROP TABLE "Suppliers";
DROP TABLE "EmployeeTerritories";
DROP TABLE "Territories";
DROP TABLE "Region";
DROP TABLE "Orders";
DROP TABLE "Employees";
DROP TABLE "Shippers";
DROP TABLE "CustomerCustomerDemo";
DROP TABLE "CustomerDemographics";
DROP TABLE "Customers";

CREATE TABLE "Order Details" (
       OrderID              INTEGER,
       ProductID            INTEGER,
       UnitPrice            MONEY,
       Quantity             INTEGER DEFAULT '1',
       Discount             DOUBLE DEFAULT '0',
       CONSTRAINT "PK_OrderDetails" PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE "Products" (
       ProductID            INTEGER,
       ProductName          VARCHAR(40),
       SupplierID           INTEGER,
       CategoryID           INTEGER,
       QuantityPerUnit      VARCHAR(20),
       UnitPrice            MONEY,
       UnitsInStock         INTEGER DEFAULT '0',
       UnitsOnOrder         INTEGER DEFAULT '0',
       ReorderLevel         INTEGER DEFAULT '0',
       Discontinued         LOGICAL DEFAULT 'FALSE',
       CONSTRAINT "PK_Products" PRIMARY KEY (ProductID)
);

CREATE TABLE "Categories" (
       CategoryID           INTEGER,
       CategoryName         VARCHAR(15),
       Description          MEMO,
       Picture              BLOB,
       CONSTRAINT "PK_Categories" PRIMARY KEY (CategoryID)
);

CREATE TABLE "Suppliers" (
       SupplierID           INTEGER,
       CompanyName          VARCHAR(40),
       ContactName          VARCHAR(30),
       ContactTitle         VARCHAR(30),
       Address              VARCHAR(60),
       City                 VARCHAR(15),
       Region               VARCHAR(15),
       PostalCode           VARCHAR(10),
       Country              VARCHAR(15),
       Phone                VARCHAR(24),
       Fax                  VARCHAR(24),
       HomePage             MEMO,
       CONSTRAINT "PK_Suppliers" PRIMARY KEY (SupplierID)
);

CREATE TABLE "EmployeeTerritories" (
       EmployeeID           INTEGER,
       TerritoryID          VARCHAR(20),
       CONSTRAINT "PK_EmployeeTerritories" PRIMARY KEY (EmployeeID, TerritoryID)
);

CREATE TABLE "Territories" (
       TerritoryID          VARCHAR(20),
       TerritoryDescription VARCHAR(50),
       RegionID             INTEGER,
       CONSTRAINT "PK_Territories" PRIMARY KEY (TerritoryID)
);

CREATE TABLE "Region" (
       RegionID             INTEGER,
       RegionDescription    VARCHAR(50),
       CONSTRAINT "PK_Region" PRIMARY KEY (RegionID)
);

CREATE TABLE "Orders" (
       OrderID              INTEGER,
       CustomerID           VARCHAR(5),
       EmployeeID           INTEGER,
       OrderDate            DATE,
       RequiredDate         DATE,
       ShippedDate          DATE,
       ShipVia              INTEGER,
       Freight              MONEY DEFAULT '0',
       ShipName             VARCHAR(40),
       ShipAddress          VARCHAR(60),
       ShipCity             VARCHAR(15),
       ShipRegion           VARCHAR(15),
       ShipPostalCode       VARCHAR(10),
       ShipCountry          VARCHAR(15),
       CONSTRAINT "PK_Orders" PRIMARY KEY (OrderID)
);

CREATE TABLE "Employees" (
       EmployeeID           INTEGER,
       LastName             VARCHAR(20),
       FirstName            VARCHAR(10),
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
       Photo                BLOB,
       Notes                MEMO,
       ReportsTo            INTEGER,
       PhotoPath            VARCHAR(255),
       CONSTRAINT "PK_Employees" PRIMARY KEY (EmployeeID)
);

CREATE TABLE "Shippers" (
       ShipperID            INTEGER,
       CompanyName          VARCHAR(40),
       Phone                VARCHAR(24),
       CONSTRAINT "PK_Shippers" PRIMARY KEY (ShipperID)
);

CREATE TABLE "CustomerCustomerDemo" (
       CustomerID           VARCHAR(5),
       CustomerTypeID       VARCHAR(10),
       CONSTRAINT "PK_CustomerCustomerDemo" PRIMARY KEY (CustomerID, CustomerTypeID)
);

CREATE TABLE "CustomerDemographics" (
       CustomerTypeID       VARCHAR(10),
       CustomerDesc         MEMO,
       CONSTRAINT "PK_CustomerDemographics" PRIMARY KEY (CustomerTypeID)
);

CREATE TABLE "Customers" (
       CustomerID           VARCHAR(5),
       CompanyName          VARCHAR(40),
       ContactName          VARCHAR(30),
       ContactTitle         VARCHAR(30),
       Address              VARCHAR(60),
       City                 VARCHAR(15),
       Region               VARCHAR(15),
       PostalCode           VARCHAR(10),
       Country              VARCHAR(15),
       Phone                VARCHAR(24),
       Fax                  VARCHAR(24),
       CONSTRAINT "PK_Customers" PRIMARY KEY (CustomerID)
);


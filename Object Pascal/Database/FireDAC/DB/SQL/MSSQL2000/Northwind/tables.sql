SET CMDSEP GO

DROP VIEW [FDQA_V_Test]
GO

DROP TABLE [Order Details]
GO

CREATE TABLE [Order Details] (
  [OrderID] [int] NOT NULL ,
  [ProductID] [int] NOT NULL ,
  [UnitPrice] [money] NOT NULL ,
  [Quantity] [smallint] NOT NULL ,
  [Discount] [real] NOT NULL
)
GO

DROP TABLE [Products]
GO

CREATE TABLE [Products] (
  [ProductID] [int] IDENTITY NOT NULL ,
  [ProductName] [nvarchar] (40) NOT NULL ,
  [SupplierID] [int] NULL ,
  [CategoryID] [int] NULL ,
  [QuantityPerUnit] [nvarchar] (20) NULL ,
  [UnitPrice] [money] NULL ,
  [UnitsInStock] [smallint] NULL ,
  [UnitsOnOrder] [smallint] NULL ,
  [ReorderLevel] [smallint] NULL ,
  [Discontinued] [bit] NOT NULL
)
GO

DROP TABLE [Categories]
GO

CREATE TABLE [Categories] (
  [CategoryID] [int] IDENTITY NOT NULL ,
  [CategoryName] [nvarchar] (15) NOT NULL ,
  [Description] [ntext] NULL ,
  [Picture] [image] NULL
)
GO

DROP TABLE [Suppliers]
GO

CREATE TABLE [Suppliers] (
  [SupplierID] [int] IDENTITY NOT NULL ,
  [CompanyName] [nvarchar] (40) NOT NULL ,
  [ContactName] [nvarchar] (30) NULL ,
  [ContactTitle] [nvarchar] (30) NULL ,
  [Address] [nvarchar] (60) NULL ,
  [City] [nvarchar] (15) NULL ,
  [Region] [nvarchar] (15) NULL ,
  [PostalCode] [nvarchar] (10) NULL ,
  [Country] [nvarchar] (15) NULL ,
  [Phone] [nvarchar] (24) NULL ,
  [Fax] [nvarchar] (24) NULL ,
  [HomePage] [ntext] NULL
)
GO

DROP TABLE [EmployeeTerritories]
GO

CREATE TABLE [EmployeeTerritories] (
  [EmployeeID] [int] NOT NULL ,
  [TerritoryID] [nvarchar] (20) NOT NULL
)
GO

DROP TABLE [Territories]
GO

CREATE TABLE [Territories] (
  [TerritoryID] [nvarchar] (20) NOT NULL ,
  [TerritoryDescription] [nchar] (50) NOT NULL ,
  [RegionID] [int] NOT NULL
)
GO

DROP TABLE [Region]
GO

CREATE TABLE [Region] (
  [RegionID] [int] NOT NULL ,
  [RegionDescription] [nchar] (50) NOT NULL
)
GO

DROP TABLE [Orders]
GO

CREATE TABLE [Orders] (
  [OrderID] [int] IDENTITY NOT NULL ,
  [CustomerID] [nchar] (5) NULL ,
  [EmployeeID] [int] NULL ,
  [OrderDate] [datetime] NULL ,
  [RequiredDate] [datetime] NULL ,
  [ShippedDate] [datetime] NULL ,
  [ShipVia] [int] NULL ,
  [Freight] [money] NULL ,
  [ShipName] [nvarchar] (40) NULL ,
  [ShipAddress] [nvarchar] (60) NULL ,
  [ShipCity] [nvarchar] (15) NULL ,
  [ShipRegion] [nvarchar] (15) NULL ,
  [ShipPostalCode] [nvarchar] (10) NULL ,
  [ShipCountry] [nvarchar] (15) NULL
)
GO

DROP TABLE [Employees]
GO 

CREATE TABLE [Employees] (
  [EmployeeID] [int] IDENTITY NOT NULL ,
  [LastName] [nvarchar] (20) NOT NULL ,
  [FirstName] [nvarchar] (10) NOT NULL ,
  [Title] [nvarchar] (30) NULL ,
  [TitleOfCourtesy] [nvarchar] (25) NULL ,
  [BirthDate] [datetime] NULL ,
  [HireDate] [datetime] NULL ,
  [Address] [nvarchar] (60) NULL ,
  [City] [nvarchar] (15) NULL ,
  [Region] [nvarchar] (15) NULL ,
  [PostalCode] [nvarchar] (10) NULL ,
  [Country] [nvarchar] (15) NULL ,
  [HomePhone] [nvarchar] (24) NULL ,
  [Extension] [nvarchar] (4) NULL ,
  [Photo] [image] NULL ,
  [Notes] [ntext] NULL ,
  [ReportsTo] [int] NULL ,
  [PhotoPath] [nvarchar] (255) NULL
)
GO

DROP TABLE [Shippers]
GO

CREATE TABLE [Shippers] (
  [ShipperID] [int] IDENTITY NOT NULL ,
  [CompanyName] [nvarchar] (40) NOT NULL ,
  [Phone] [nvarchar] (24) NULL 
)
GO

DROP TABLE [CustomerCustomerDemo]
GO

CREATE TABLE [CustomerCustomerDemo] (
  [CustomerID] [nchar] (5) NOT NULL ,
  [CustomerTypeID] [nchar] (10) NOT NULL
)
GO

DROP TABLE [CustomerDemographics]
GO

CREATE TABLE [CustomerDemographics] (
  [CustomerTypeID] [nchar] (10) NOT NULL ,
  [CustomerDesc] [ntext] NULL
)
GO

DROP TABLE [Customers]
GO

CREATE TABLE [Customers] (
  [CustomerID] [nchar] (5) NOT NULL ,
  [CompanyName] [nvarchar] (40) NOT NULL ,
  [ContactName] [nvarchar] (30) NULL ,
  [ContactTitle] [nvarchar] (30) NULL ,
  [Address] [nvarchar] (60) NULL ,
  [City] [nvarchar] (15) NULL ,
  [Region] [nvarchar] (15) NULL ,
  [PostalCode] [nvarchar] (10) NULL ,
  [Country] [nvarchar] (15) NULL ,
  [Phone] [nvarchar] (24) NULL ,
  [Fax] [nvarchar] (24) NULL
)
GO 

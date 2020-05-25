SET CMDSEP GO

ALTER TABLE [Categories] ADD
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED
 (
  [CategoryID]
 )
GO

ALTER TABLE [Customers] ADD 
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED
 (
  [CustomerID]
 )
GO

ALTER TABLE [Employees] ADD 
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED
 (
  [EmployeeID]
 )
GO

ALTER TABLE [Order Details] ADD 
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED
 (
  [OrderID],
  [ProductID]
 )
GO

ALTER TABLE [Orders] ADD 
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED
 (
  [OrderID]
 ) 
GO

ALTER TABLE [Products] ADD 
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
 (
  [ProductID]
 ) 
GO

ALTER TABLE [Shippers] ADD 
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED
 (
  [ShipperID]
 ) 
GO

ALTER TABLE [Suppliers] ADD 
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED
 (
  [SupplierID]
 ) 
GO

ALTER TABLE [CustomerCustomerDemo] ADD 
 CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY CLUSTERED
 (
  [CustomerID],
  [CustomerTypeID]
 ) 
GO

ALTER TABLE [CustomerDemographics] ADD 
 CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY CLUSTERED
 (
  [CustomerTypeID]
 ) 
GO

ALTER TABLE [EmployeeTerritories] ADD 
 CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY CLUSTERED
 (
  [EmployeeID],
  [TerritoryID]
 ) 
GO

ALTER TABLE [Employees] ADD 
 CONSTRAINT [CK_Birthdate] CHECK ([BirthDate] < getdate())
GO

ALTER TABLE [Order Details] ADD 
 CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT (0) FOR [UnitPrice],
 CONSTRAINT [DF_Order_Details_Quantity] DEFAULT (1) FOR [Quantity],
 CONSTRAINT [DF_Order_Details_Discount] DEFAULT (0) FOR [Discount],
 CONSTRAINT [CK_Discount] CHECK ([Discount] >= 0 and [Discount] <= 1),
 CONSTRAINT [CK_Quantity] CHECK ([Quantity] > 0),
 CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice] >= 0)
GO

ALTER TABLE [Orders] ADD 
 CONSTRAINT [DF_Orders_Freight] DEFAULT (0) FOR [Freight]
GO

ALTER TABLE [Products] ADD 
 CONSTRAINT [DF_Products_UnitPrice] DEFAULT (0) FOR [UnitPrice],
 CONSTRAINT [DF_Products_UnitsInStock] DEFAULT (0) FOR [UnitsInStock],
 CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT (0) FOR [UnitsOnOrder],
 CONSTRAINT [DF_Products_ReorderLevel] DEFAULT (0) FOR [ReorderLevel],
 CONSTRAINT [DF_Products_Discontinued] DEFAULT (0) FOR [Discontinued],
 CONSTRAINT [CK_Products_UnitPrice] CHECK ([UnitPrice] >= 0),
 CONSTRAINT [CK_ReorderLevel] CHECK ([ReorderLevel] >= 0),
 CONSTRAINT [CK_UnitsInStock] CHECK ([UnitsInStock] >= 0),
 CONSTRAINT [CK_UnitsOnOrder] CHECK ([UnitsOnOrder] >= 0)
GO

ALTER TABLE [Region] ADD 
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED
 (
  [RegionID]
 ) 
GO

ALTER TABLE [Territories] ADD 
 CONSTRAINT [PK_Territories] PRIMARY KEY CLUSTERED
 (
  [TerritoryID]
 ) 
GO

CREATE INDEX [I_Categories_CategoryName] ON [Categories]([CategoryName])
GO

CREATE INDEX [I_Customers_City] ON [Customers]([City])
GO

CREATE INDEX [I_Customers_CompanyName] ON [Customers]([CompanyName])
GO

CREATE INDEX [I_Customers_PostalCode] ON [Customers]([PostalCode])
GO

CREATE INDEX [I_Customers_Region] ON [Customers]([Region])
GO

CREATE INDEX [I_Employees_LastName] ON [Employees]([LastName])
GO

CREATE INDEX [I_Employees_PostalCode] ON [Employees]([PostalCode])
GO

CREATE INDEX [OrderID] ON [Order Details]([OrderID])
GO

CREATE INDEX [ProductID] ON [Order Details]([ProductID])
GO

CREATE INDEX [I_Orders_CustomerID] ON [Orders]([CustomerID])
GO

CREATE INDEX [I_Orders_EmployeeID] ON [Orders]([EmployeeID])
GO

CREATE INDEX [I_Orders_OrderDate] ON [Orders]([OrderDate])
GO

CREATE INDEX [I_Orders_ShippedDate] ON [Orders]([ShippedDate])
GO

CREATE INDEX [I_Orders_ShipVia] ON [Orders]([ShipVia])
GO

CREATE INDEX [I_Orders_ShipPostalCode] ON [Orders]([ShipPostalCode])
GO

CREATE INDEX [I_Products_CategoryID] ON [Products]([CategoryID])
GO

CREATE INDEX [I_Products_ProductName] ON [Products]([ProductName])
GO

CREATE INDEX [I_Products_SupplierID] ON [Products]([SupplierID])
GO

CREATE INDEX [I_Suppliers_CompanyName] ON [Suppliers]([CompanyName])
GO

CREATE INDEX [I_Suppliers_PostalCode] ON [Suppliers]([PostalCode])
GO

CREATE INDEX [I_CustCustDemo_CustomerID] ON [CustomerCustomerDemo]([CustomerID])
GO

CREATE INDEX [I_CustCustDemo_CustomerTypeID] ON [CustomerCustomerDemo]([CustomerTypeID])
GO

ALTER TABLE [CustomerCustomerDemo] ADD 
 CONSTRAINT [FK_CustomerCustomerDemo_CustomerDemographics] FOREIGN KEY
 (
  [CustomerTypeID]
 ) REFERENCES [CustomerDemographics] (
  [CustomerTypeID]
 ),
 CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY 
 (
  [CustomerID]
 ) REFERENCES [Customers] (
  [CustomerID]
 )
GO

ALTER TABLE [EmployeeTerritories] ADD 
 CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY
 (
  [EmployeeID]
 ) REFERENCES [Employees] (
  [EmployeeID]
 ),
 CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY 
 (
  [TerritoryID]
 ) REFERENCES [Territories] (
  [TerritoryID]
 )
GO

ALTER TABLE [Employees] ADD 
 CONSTRAINT [FK_Employees_Employees] FOREIGN KEY 
 (
  [ReportsTo]
 ) REFERENCES [Employees] (
  [EmployeeID]
 )
GO

ALTER TABLE [Order Details] ADD 
 CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY 
 (
  [OrderID]
 ) REFERENCES [Orders] (
  [OrderID]
 ),
 CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY 
 (
  [ProductID]
 ) REFERENCES [Products] (
  [ProductID]
 )
GO

ALTER TABLE [Orders] ADD 
 CONSTRAINT [FK_Orders_Customers] FOREIGN KEY 
 (
  [CustomerID]
 ) REFERENCES [Customers] (
  [CustomerID]
 ),
 CONSTRAINT [FK_Orders_Employees] FOREIGN KEY 
 (
  [EmployeeID]
 ) REFERENCES [Employees] (
  [EmployeeID]
 ),
 CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY 
 (
  [ShipVia]
 ) REFERENCES [Shippers] (
  [ShipperID]
 )
GO

ALTER TABLE [Products] ADD 
 CONSTRAINT [FK_Products_Categories] FOREIGN KEY 
 (
  [CategoryID]
 ) REFERENCES [Categories] (
  [CategoryID]
 ),
 CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY 
 (
  [SupplierID]
 ) REFERENCES [Suppliers] (
  [SupplierID]
 )
GO

ALTER TABLE [Territories] ADD 
 CONSTRAINT [FK_Territories_Region] FOREIGN KEY 
 (
  [RegionID]
 ) REFERENCES [Region] (
  [RegionID]
 )
GO

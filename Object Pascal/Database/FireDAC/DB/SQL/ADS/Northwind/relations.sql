ALTER TABLE "Products" ALTER COLUMN ProductID ProductID AutoInc;
ALTER TABLE "Categories" ALTER COLUMN CategoryID CategoryID AutoInc;
ALTER TABLE "Suppliers" ALTER COLUMN SupplierID SupplierID AutoInc;
ALTER TABLE "Orders" ALTER COLUMN OrderID OrderID AUTOINC;
ALTER TABLE "Employees" ALTER COLUMN EmployeeID EmployeeID AUTOINC;
ALTER TABLE "Shippers" ALTER COLUMN ShipperID ShipperID AUTOINC;

CREATE INDEX "I_CustCustDemo_CustomerID"
  ON "CustomerCustomerDemo" (
    CustomerID
  );

CREATE INDEX "I_CustCustDemo_CustomerTypeID"
  ON "CustomerCustomerDemo" (
    CustomerTypeID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_CustCustDemo_CustDemogr',
  'CustomerDemographics',
  'CustomerCustomerDemo',
  'I_CustCustDemo_CustomerTypeID',
  2, 2,
  NULL, NULL, NULL);
							 
execute procedure sp_CreateReferentialIntegrity (
  'FK_CustCustDemo_Customers',
  'Customers',
  'CustomerCustomerDemo',
  'I_CustCustDemo_CustomerID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Employees_ReportsTo"
  ON "Employees" (
    ReportsTo
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Employees_Employees',
  'Employees',
  'Employees',
  'I_Employees_ReportsTo',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_EmplTerrit_TerritoryID"
  ON "EmployeeTerritories" (
    TerritoryID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_EmployeeTerritories_Terr',
  'Territories',
  'EmployeeTerritories',
  'I_EmplTerrit_TerritoryID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_EmplTerrit_EmployeeID"
  ON "EmployeeTerritories" (
    EmployeeID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_EmplTerrit_Employees',
  'Employees',
  'EmployeeTerritories',
  'I_EmplTerrit_EmployeeID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_OrderDetails_OrderID"
  ON "Order Details" (
    OrderID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_OrderDetails_Orders',
  'Orders',
  'Order Details',
  'I_OrderDetails_OrderID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_OrderDetails_ProductID"
  ON "Order Details" (
    ProductID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_OrderDetails_Products',
  'Products',
  'Order Details',
  'I_OrderDetails_ProductID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_OrderDetails_EmployeeID"
  ON "Orders" (
    EmployeeID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Orders_Employees',
  'Employees',
  'Orders',
  'I_OrderDetails_EmployeeID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Orders_CustomerID"
  ON "Orders" (
    CustomerID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Orders_Customers',
  'Customers',
  'Orders',
  'I_Orders_CustomerID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Orders_ShipVia"
  ON "Orders" (
    ShipVia
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Orders_Shippers',
  'Shippers',
  'Orders',
  'I_Orders_ShipVia',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Products_CategoryID"
  ON "Products" (
    CategoryID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Products_Categories',
  'Categories',
  'Products',
  'I_Products_CategoryID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Products_SupplierID"
  ON "Products" (
    SupplierID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Products_Suppliers',
  'Suppliers',
  'Products',
  'I_Products_SupplierID',
  2, 2,
  NULL, NULL, NULL);
		 
CREATE INDEX "I_Territories_RegionID"
  ON "Territories" (
    RegionID
  );

execute procedure sp_CreateReferentialIntegrity (
  'FK_Territories_Region',
  'Region',
  'Territories',
  'I_Territories_RegionID',
  2, 2,
  NULL, NULL, NULL);

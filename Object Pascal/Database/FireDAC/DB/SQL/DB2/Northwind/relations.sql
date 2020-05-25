SET CMDSEP ;

ALTER TABLE "Products" ALTER COLUMN ProductID
       SET GENERATED ALWAYS RESTART WITH 78;
ALTER TABLE "Categories" ALTER COLUMN CategoryID
       SET GENERATED ALWAYS RESTART WITH 9;
ALTER TABLE "Suppliers" ALTER COLUMN SupplierID
       SET GENERATED ALWAYS RESTART WITH 30;
ALTER TABLE "Region" ALTER COLUMN RegionID
       SET GENERATED ALWAYS RESTART WITH 5;
ALTER TABLE "Orders" ALTER COLUMN OrderID
       SET GENERATED ALWAYS RESTART WITH 11078;
ALTER TABLE "Employees" ALTER COLUMN EmployeeID
       SET GENERATED ALWAYS RESTART WITH 10;
ALTER TABLE "Shippers" ALTER COLUMN ShipperID
       SET GENERATED ALWAYS RESTART WITH 4;

ALTER TABLE "Categories"
       ADD CONSTRAINT "PK_Categories" PRIMARY KEY (CategoryID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "PK_CustCustDemo" PRIMARY KEY (CustomerID, CustomerTypeID);

ALTER TABLE "CustomerDemographics"
       ADD CONSTRAINT "PK_CustDemogr" PRIMARY KEY (CustomerTypeID);

ALTER TABLE "Customers"
       ADD CONSTRAINT "PK_Customers" PRIMARY KEY (CustomerID);

ALTER TABLE "Employees"
       ADD CONSTRAINT "PK_Employees" PRIMARY KEY (EmployeeID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "PK_EmplTerrit" PRIMARY KEY (EmployeeID, TerritoryID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT "PK_OrderDetails" PRIMARY KEY (OrderID, ProductID);

ALTER TABLE "Orders"
       ADD CONSTRAINT "PK_Orders" PRIMARY KEY (OrderID);

ALTER TABLE "Products"
       ADD CONSTRAINT "PK_Products" PRIMARY KEY (ProductID);

ALTER TABLE "Region"
       ADD CONSTRAINT "PK_Region" PRIMARY KEY (RegionID);

ALTER TABLE "Shippers"
       ADD CONSTRAINT "PK_Shippers" PRIMARY KEY (ShipperID);

ALTER TABLE "Suppliers"
       ADD CONSTRAINT "PK_Suppliers" PRIMARY KEY (SupplierID);

ALTER TABLE "Territories"
       ADD CONSTRAINT "PK_Territories" PRIMARY KEY (TerritoryID);

CREATE INDEX "I_CustCustD_CsTyp"
       ON "CustomerCustomerDemo"(CustomerTypeID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustD_CustD" FOREIGN KEY (CustomerTypeID)
                             REFERENCES "CustomerDemographics"
                             ON DELETE RESTRICT;

CREATE INDEX "I_CustCustD_CsID"
       ON "CustomerCustomerDemo"(CustomerID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustD_Cust" FOREIGN KEY (CustomerID)
                             REFERENCES "Customers"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Employees_RepTo"
       ON "Employees"(ReportsTo);

ALTER TABLE "Employees"
       ADD CONSTRAINT "FK_Empl_Empl" FOREIGN KEY (ReportsTo)
                             REFERENCES "Employees"
                             ON DELETE RESTRICT;

CREATE INDEX "I_EmplTerr_TerrID"
       ON "EmployeeTerritories"(TerritoryID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmplTerr_Territ" FOREIGN KEY (TerritoryID)
                             REFERENCES "Territories"
                             ON DELETE RESTRICT;

CREATE INDEX "I_EmplTerr_EmplID"
       ON "EmployeeTerritories"(EmployeeID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmplTerr_EmplID" FOREIGN KEY (EmployeeID)
                             REFERENCES "Employees"
                             ON DELETE RESTRICT;

CREATE INDEX "I_OrdDet_OrderID"
       ON "Order Details"(OrderID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrdDet_Orders" FOREIGN KEY (OrderID)
                             REFERENCES "Orders"
                             ON DELETE RESTRICT;

CREATE INDEX "I_OrdDet_ProductID"
       ON "Order Details"(ProductID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrdDet_Products" FOREIGN KEY (ProductID)
                             REFERENCES "Products"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Orders_EmplID"
       ON "Orders"(EmployeeID);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Empl" FOREIGN KEY (EmployeeID)
                             REFERENCES "Employees"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Orders_CustID"
       ON "Orders"(CustomerID);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Cust" FOREIGN KEY (CustomerID)
                             REFERENCES "Customers"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Orders_ShipVia"
       ON "Orders"(ShipVia);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Shipp" FOREIGN KEY (ShipVia)
                             REFERENCES "Shippers"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Products_CategID"
       ON "Products"(CategoryID);

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Prod_Categ" FOREIGN KEY (CategoryID)
                             REFERENCES "Categories"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Products_SuppID"
       ON "Products"(SupplierID);

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Prod_Suppl" FOREIGN KEY (SupplierID)
                             REFERENCES "Suppliers"
                             ON DELETE RESTRICT;

CREATE INDEX "I_Territ_RegionID"
       ON "Territories"(RegionID);

ALTER TABLE "Territories"
       ADD CONSTRAINT "FK_Territ_Region" FOREIGN KEY (RegionID)
                             REFERENCES "Region"
                             ON DELETE RESTRICT;
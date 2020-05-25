SET CMDSEP ;

ALTER TABLE "Categories"
       ADD CONSTRAINT PRIMARY KEY (CategoryID) CONSTRAINT "PK_Categories";

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT PRIMARY KEY (CustomerID, CustomerTypeID) CONSTRAINT "PK_CustCustDemo";

ALTER TABLE "CustomerDemographics"
       ADD CONSTRAINT PRIMARY KEY (CustomerTypeID) CONSTRAINT "PK_CustDemogr";

ALTER TABLE "Customers"
       ADD CONSTRAINT PRIMARY KEY (CustomerID) CONSTRAINT "PK_Customers";

ALTER TABLE "Employees"
       ADD CONSTRAINT PRIMARY KEY (EmployeeID) CONSTRAINT "PK_Employees";

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT PRIMARY KEY (EmployeeID, TerritoryID) CONSTRAINT "PK_EmplTerrit";

ALTER TABLE "Order Details"
       ADD CONSTRAINT PRIMARY KEY (OrderID, ProductID) CONSTRAINT "PK_OrderDetails";

ALTER TABLE "Orders"
       ADD CONSTRAINT PRIMARY KEY (OrderID) CONSTRAINT "PK_Orders";

ALTER TABLE "Products"
       ADD CONSTRAINT PRIMARY KEY (ProductID) CONSTRAINT "PK_Products";

ALTER TABLE "Region"
       ADD CONSTRAINT PRIMARY KEY (RegionID) CONSTRAINT "PK_Region";

ALTER TABLE "Shippers"
       ADD CONSTRAINT PRIMARY KEY (ShipperID) CONSTRAINT "PK_Shippers";

ALTER TABLE "Suppliers"
       ADD CONSTRAINT PRIMARY KEY (SupplierID) CONSTRAINT "PK_Suppliers";

ALTER TABLE "Territories"
       ADD CONSTRAINT PRIMARY KEY (TerritoryID) CONSTRAINT "PK_Territories";

CREATE INDEX "I_CustCustD_CsTyp"
       ON "CustomerCustomerDemo"(CustomerTypeID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT FOREIGN KEY (CustomerTypeID)
       REFERENCES "CustomerDemographics" CONSTRAINT "FK_CustCustD_CustD";

CREATE INDEX "I_CustCustD_CsID"
       ON "CustomerCustomerDemo"(CustomerID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT FOREIGN KEY (CustomerID)
       REFERENCES "Customers" CONSTRAINT "FK_CustCustD_Cust";

CREATE INDEX "I_Employees_RepTo"
       ON "Employees"(ReportsTo);

ALTER TABLE "Employees"
       ADD CONSTRAINT FOREIGN KEY (ReportsTo)
       REFERENCES "Employees" CONSTRAINT "FK_Empl_Empl";

CREATE INDEX "I_EmplTerr_TerrID"
       ON "EmployeeTerritories"(TerritoryID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT FOREIGN KEY (TerritoryID)
       REFERENCES "Territories" CONSTRAINT "FK_EmplTerr_Territ";

CREATE INDEX "I_EmplTerr_EmplID"
       ON "EmployeeTerritories"(EmployeeID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT FOREIGN KEY (EmployeeID)
       REFERENCES "Employees" CONSTRAINT "FK_EmplTerr_EmplID";

CREATE INDEX "I_OrdDet_OrderID"
       ON "Order Details"(OrderID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT FOREIGN KEY (OrderID)
       REFERENCES "Orders" CONSTRAINT "FK_OrdDet_Orders";

CREATE INDEX "I_OrdDet_ProductID"
       ON "Order Details"(ProductID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT FOREIGN KEY (ProductID)
       REFERENCES "Products" CONSTRAINT "FK_OrdDet_Products";

CREATE INDEX "I_Orders_EmplID"
       ON "Orders"(EmployeeID);

ALTER TABLE "Orders"
       ADD CONSTRAINT FOREIGN KEY (EmployeeID)
       REFERENCES "Employees" CONSTRAINT "FK_Orders_Empl";

CREATE INDEX "I_Orders_CustID"
       ON "Orders"(CustomerID);

ALTER TABLE "Orders"
       ADD CONSTRAINT FOREIGN KEY (CustomerID)
       REFERENCES "Customers" CONSTRAINT "FK_Orders_Cust";

CREATE INDEX "I_Orders_ShipVia"
       ON "Orders"(ShipVia);

ALTER TABLE "Orders"
       ADD CONSTRAINT FOREIGN KEY (ShipVia)
       REFERENCES "Shippers" CONSTRAINT "FK_Orders_Shipp";

CREATE INDEX "I_Products_CategID"
       ON "Products"(CategoryID);

ALTER TABLE "Products"
       ADD CONSTRAINT FOREIGN KEY (CategoryID)
       REFERENCES "Categories" CONSTRAINT "FK_Prod_Categ";

CREATE INDEX "I_Products_SuppID"
       ON "Products"(SupplierID);

ALTER TABLE "Products"
       ADD CONSTRAINT FOREIGN KEY (SupplierID)
       REFERENCES "Suppliers" CONSTRAINT "FK_Prod_Suppl";

CREATE INDEX "I_Territ_RegionID"
       ON "Territories"(RegionID);

ALTER TABLE "Territories"
       ADD CONSTRAINT FOREIGN KEY (RegionID)
       REFERENCES "Region" CONSTRAINT "FK_Territ_Region";

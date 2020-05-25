SET CMDSEP ;

CREATE INDEX "I_CustCustD_CsTyp"
       ON "CustomerCustomerDemo"(CustomerTypeID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustD_CustD" FOREIGN KEY (CustomerTypeID)
                             REFERENCES WITH CHECK OPTION "CustomerDemographics";

CREATE INDEX "I_CustCustD_CsID"
       ON "CustomerCustomerDemo"(CustomerID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustD_Cust" FOREIGN KEY (CustomerID)
                             REFERENCES WITH CHECK OPTION "Customers";

CREATE INDEX "I_Employees_RepTo"
       ON "Employees"(ReportsTo);

ALTER TABLE "Employees"
       ADD CONSTRAINT "FK_Empl_Empl" FOREIGN KEY (ReportsTo)
                             REFERENCES WITH NO CHECK OPTION "Employees";

CREATE INDEX "I_EmplTerr_TerrID"
       ON "EmployeeTerritories"(TerritoryID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmplTerr_Territ" FOREIGN KEY (TerritoryID)
                             REFERENCES WITH CHECK OPTION "Territories";

CREATE INDEX "I_EmplTerr_EmplID"
       ON "EmployeeTerritories"(EmployeeID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmplTerr_EmplID" FOREIGN KEY (EmployeeID)
                             REFERENCES WITH CHECK OPTION "Employees";

CREATE INDEX "I_OrdDet_OrderID"
       ON "Order Details"(OrderID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrdDet_Orders" FOREIGN KEY (OrderID)
                             REFERENCES WITH CHECK OPTION "Orders";

CREATE INDEX "I_OrdDet_ProductID"
       ON "Order Details"(ProductID);

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrdDet_Products" FOREIGN KEY (ProductID)
                             REFERENCES WITH CHECK OPTION "Products";

CREATE INDEX "I_Orders_EmplID"
       ON "Orders"(EmployeeID);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Empl" FOREIGN KEY (EmployeeID)
                             REFERENCES WITH CHECK OPTION "Employees";

CREATE INDEX "I_Orders_CustID"
       ON "Orders"(CustomerID);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Cust" FOREIGN KEY (CustomerID)
                             REFERENCES WITH CHECK OPTION "Customers";

CREATE INDEX "I_Orders_ShipVia"
       ON "Orders"(ShipVia);

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Shipp" FOREIGN KEY (ShipVia)
                             REFERENCES WITH CHECK OPTION "Shippers";

CREATE INDEX "I_Products_CategID"
       ON "Products"(CategoryID);

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Prod_Categ" FOREIGN KEY (CategoryID)
                             REFERENCES WITH CHECK OPTION "Categories";

CREATE INDEX "I_Products_SuppID"
       ON "Products"(SupplierID);

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Prod_Suppl" FOREIGN KEY (SupplierID)
                             REFERENCES WITH CHECK OPTION "Suppliers";

CREATE INDEX "I_Territ_RegionID"
       ON "Territories"(RegionID);

ALTER TABLE "Territories"
       ADD CONSTRAINT "FK_Territ_Region" FOREIGN KEY (RegionID)
                             REFERENCES WITH CHECK OPTION "Region";

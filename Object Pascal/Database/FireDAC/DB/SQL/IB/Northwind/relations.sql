SET TERM ;;

ALTER TABLE "Categories"
       ADD CONSTRAINT "PK_Categories" PRIMARY KEY (CategoryID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "PK_CustomerCustomerDemo" PRIMARY KEY (CustomerID, CustomerTypeID);

ALTER TABLE "CustomerDemographics"
       ADD CONSTRAINT "PK_CustomerDemographics" PRIMARY KEY (CustomerTypeID);

ALTER TABLE "Customers"
       ADD CONSTRAINT "PK_Customers" PRIMARY KEY (CustomerID);

ALTER TABLE "Employees"
       ADD CONSTRAINT "PK_Employees" PRIMARY KEY (EmployeeID);

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "PK_EmployeeTerritories" PRIMARY KEY (EmployeeID, TerritoryID);

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

CREATE INDEX "I_CustCustDemo_CustomerID"
  ON "CustomerCustomerDemo" (
    CustomerID
  );

CREATE INDEX "I_CustCustDemo_CustomerTypeID"
  ON "CustomerCustomerDemo" (
    CustomerTypeID
  );

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustDemo_CustDemogr" FOREIGN KEY (CustomerTypeID)
                             REFERENCES "CustomerDemographics"(CustomerTypeID);

ALTER TABLE "CustomerCustomerDemo"
       ADD CONSTRAINT "FK_CustCustDemo_Customers" FOREIGN KEY (CustomerID)
                             REFERENCES "Customers"(CustomerID);

CREATE INDEX "I_Employees_ReportsTo"
  ON "Employees" (
    ReportsTo
  );

ALTER TABLE "Employees"
       ADD CONSTRAINT "FK_Employees_Employees" FOREIGN KEY (ReportsTo)
                             REFERENCES "Employees"(EmployeeID);

CREATE INDEX "I_EmplTerrit_TerritoryID"
  ON "EmployeeTerritories" (
    TerritoryID
  );

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmployeeTerritories_Terr" FOREIGN KEY (TerritoryID)
                             REFERENCES "Territories" (TerritoryID);

CREATE INDEX "I_EmplTerrit_EmployeeID"
  ON "EmployeeTerritories" (
    EmployeeID
  );

ALTER TABLE "EmployeeTerritories"
       ADD CONSTRAINT "FK_EmplTerrit_Employees" FOREIGN KEY (EmployeeID)
                             REFERENCES "Employees" (EmployeeID);

CREATE INDEX "I_OrderDetails_OrderID"
  ON "Order Details" (
    OrderID
  );

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrderDetails_Orders" FOREIGN KEY (OrderID)
                             REFERENCES "Orders" (OrderID);

CREATE INDEX "I_OrderDetails_ProductID"
  ON "Order Details" (
    ProductID
  );

ALTER TABLE "Order Details"
       ADD CONSTRAINT "FK_OrderDetails_Products" FOREIGN KEY (ProductID)
                             REFERENCES "Products" (ProductID);

CREATE INDEX "I_OrderDetails_EmployeeID"
  ON "Orders" (
    EmployeeID
  );

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Employees" FOREIGN KEY (EmployeeID)
                             REFERENCES "Employees" (EmployeeID);

CREATE INDEX "I_Orders_CustomerID"
  ON "Orders" (
    CustomerID
  );

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Customers" FOREIGN KEY (CustomerID)
                             REFERENCES "Customers" (CustomerID);

CREATE INDEX "I_Orders_ShipVia"
  ON "Orders" (
    ShipVia
  );

ALTER TABLE "Orders"
       ADD CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY (ShipVia)
                             REFERENCES "Shippers" (ShipperID);

CREATE INDEX "I_Products_CategoryID"
  ON "Products" (
    CategoryID
  );

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Products_Categories" FOREIGN KEY (CategoryID)
                             REFERENCES "Categories" (CategoryID);

CREATE INDEX "I_Products_SupplierID"
  ON "Products" (
    SupplierID
  );

ALTER TABLE "Products"
       ADD CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY (SupplierID)
                             REFERENCES "Suppliers" (SupplierID);

CREATE INDEX "I_Territories_RegionID"
  ON "Territories" (
    RegionID
  );

ALTER TABLE "Territories"
       ADD CONSTRAINT FK_Territories_Region FOREIGN KEY (RegionID)
                             REFERENCES "Region" (RegionID);

DROP GENERATOR GEN_SEQ;
CREATE GENERATOR GEN_SEQ;
SET GENERATOR GEN_SEQ TO 0;

SET TERM ^;
DROP TRIGGER "TR_employees"^

CREATE TRIGGER "TR_employees" FOR "Employees"
ACTIVE BEFORE INSERT POSITION 0
as
BEGIN
  IF (NEW.EMPLOYEEID IS NULL) THEN
    NEW.EMPLOYEEID = GEN_ID( GEN_SEQ, 1);
END^

DROP TRIGGER "TR_Categories"^

CREATE TRIGGER "TR_Categories" FOR "Categories"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.CATEGORYID IS NULL) THEN
    NEW.CATEGORYID = GEN_ID( GEN_SEQ, 1);
END^

DROP TRIGGER "TR_Orders"^

CREATE TRIGGER "TR_Orders" FOR "Orders"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ORDERID IS NULL) THEN
    NEW.ORDERID = GEN_ID( GEN_SEQ, 1);
END^

DROP TRIGGER "TR_Products"^

CREATE TRIGGER "TR_Products" FOR "Products"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.PRODUCTID IS NULL) THEN
    NEW.PRODUCTID = GEN_ID( GEN_SEQ, 1);
END^

DROP TRIGGER "TR_Shippers"^

CREATE TRIGGER "TR_Shippers" FOR "Shippers"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.SHIPPERID IS NULL) THEN
    NEW.SHIPPERID = GEN_ID( GEN_SEQ, 1);
END^

DROP TRIGGER "TR_Suppliers"^

CREATE TRIGGER "TR_Suppliers" FOR "Suppliers"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.SUPPLIERID IS NULL) THEN
    NEW.SUPPLIERID = GEN_ID( GEN_SEQ, 1);
END^

SET TERM ;^
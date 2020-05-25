SET CMDSEP ;

ALTER TABLE `Employees`
      ADD KEY `I_Employees_ReportsTo` (`ReportsTo`);

rem ALTER TABLE `Employees`
rem       ADD CONSTRAINT `FK_Employees_Employees` FOREIGN KEY (`ReportsTo`)
rem       REFERENCES `Employees` (`ReportsTo`);

ALTER TABLE `Territories`
      ADD KEY `I_Territories_RegionID` (`RegionID`);

ALTER TABLE `Territories`
      ADD CONSTRAINT `FK_Territories_Region` FOREIGN KEY (`RegionID`)
      REFERENCES `Region` (`RegionID`);

ALTER TABLE `CustomerCustomerDemo`
      ADD KEY `I_CustCustDemo_CustomerID` (`CustomerID`);

ALTER TABLE `CustomerCustomerDemo`
      ADD CONSTRAINT `FK_CustCustDemo_Customers` FOREIGN KEY (`CustomerID`)
      REFERENCES `Customers` (`CustomerID`);

ALTER TABLE `CustomerCustomerDemo`
      ADD KEY `I_CustCustDemo_CustomerTypeID` (`CustomerTypeID`);

ALTER TABLE `CustomerCustomerDemo`
      ADD CONSTRAINT `FK_CustCustDemo_CustDemog` FOREIGN KEY (`CustomerTypeID`)
      REFERENCES `CustomerDemographics` (`CustomerTypeID`);

ALTER TABLE `EmployeeTerritories`
      ADD KEY `I_EmployeeTerritories_TerritoryID` (`TerritoryID`);

ALTER TABLE `EmployeeTerritories`
      ADD KEY `I_EmployeeTerritories_EmployeeID` (`EmployeeID`);

ALTER TABLE `EmployeeTerritories`
      ADD CONSTRAINT `FK_EmployeeTerritories_Territories` FOREIGN KEY (`TerritoryID`)
      REFERENCES `Territories` (`TerritoryID`);

ALTER TABLE `EmployeeTerritories`
      ADD CONSTRAINT `FK_EmployeeTerritories_Employees` FOREIGN KEY (`EmployeeID`)
      REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `Orders`
      ADD KEY `I_Orders_ShipVia` (`ShipVia`);

ALTER TABLE `Orders`
      ADD KEY `I_Orders_CustomerID` (`CustomerID`);

ALTER TABLE `Orders`
      ADD KEY `I_Orders_EmployeeID` (`EmployeeID`);

ALTER TABLE `Orders`
      ADD CONSTRAINT `FK_Orders_Customers` FOREIGN KEY (`CustomerID`)
      REFERENCES `Customers` (`CustomerID`);

ALTER TABLE `Orders`
      ADD CONSTRAINT `FK_Orders_Employees` FOREIGN KEY (`EmployeeID`)
      REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `Orders`
      ADD CONSTRAINT `FK_Orders_Shippers` FOREIGN KEY (`ShipVia`)
      REFERENCES `Shippers` (`ShipperID`);

ALTER TABLE `Products`
      ADD KEY `I_Products_CategoryID` (`CategoryID`);

ALTER TABLE `Products`
      ADD KEY `I_Products_SupplierID` (`SupplierID`);

ALTER TABLE `Products`
      ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`)
      REFERENCES `Categories` (`CategoryID`);

ALTER TABLE `Products`
      ADD CONSTRAINT `FK_Products_Suppliers` FOREIGN KEY (`SupplierID`)
      REFERENCES `Suppliers` (`SupplierID`);

ALTER TABLE `Order Details`
      ADD KEY `I_OrderDetails_OrderID` (`OrderID`);

ALTER TABLE `Order Details`
      ADD KEY `I_OrderDetails_ProductID` (`ProductID`);

ALTER TABLE `Order Details`
      ADD CONSTRAINT `FK_OrderDetails_Orders` FOREIGN KEY (`OrderID`)
      REFERENCES `Orders` (`OrderID`);

ALTER TABLE `Order Details`
      ADD CONSTRAINT `FK_OrderDetails_Products` FOREIGN KEY (`ProductID`)
      REFERENCES `Products` (`ProductID`); 

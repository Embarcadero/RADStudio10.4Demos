Dim oWorkspace
Dim oDatabase
Dim oTableDef
Dim oQueryDef
Dim oIndex
Dim oField
Dim oFieldIn
Dim oRelation
Dim oDAO
Dim sFile
Dim i

if WScript.Arguments.Count <> 1 then
  WScript.Echo "usage: tables.vbs <path to FDDemo.mdb>"
  WScript.Quit
end if

sFile = WScript.Arguments.Item(0) & "\" & "FDDemo.mdb"

Set oDAO = CreateObject("DAO.DbEngine.36")
oDAO.CreateDatabase sFile, ";LANGID=0x0409;CP=1252;COUNTRY=0"

Set oWorkspace = oDAO.WorkSpaces(0)
Set oDatabase = oWorkspace.OpenDatabase(sFile)

'  CREATE TABLE "Categories"
Set oTableDef = oDatabase.CreateTableDef("Categories")
Set oField = oTableDef.CreateField("CategoryID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CategoryName", 10, 15)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Description", 12)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Picture", 11)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q1", "alter table Categories add constraint [PK_Categories] primary key (CategoryId);")
oQueryDef.Execute
Set oQueryDef = oDatabase.CreateQueryDef("north_q2", "alter table Categories alter column CategoryId counter;")
oQueryDef.Execute

'  CREATE TABLE "CustomerCustomerDemo"
Set oTableDef = oDatabase.CreateTableDef("CustomerCustomerDemo")
Set oField = oTableDef.CreateField("CustomerID", 10, 5)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CustomerTypeID", 10, 10)
oField.Required = True
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q3", "alter table CustomerCustomerDemo add constraint [PK_CustomerCustomerDemo] primary key (CustomerId,CustomerTypeID);")
oQueryDef.Execute

'  CREATE TABLE "CustomerDemographics"
Set oTableDef = oDatabase.CreateTableDef("CustomerDemographics")
Set oField = oTableDef.CreateField("CustomerTypeID", 10, 10)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CustomerDesc", 10, 18)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q4", "alter table CustomerDemographics add constraint [PK_CustomerDemographics] primary key (CustomerTypeID);")
oQueryDef.Execute

'  CREATE TABLE "Customers"
Set oTableDef = oDatabase.CreateTableDef("Customers")
Set oField = oTableDef.CreateField("CustomerID", 10, 5)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CompanyName", 10, 40)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ContactName", 10, 30)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ContactTitle", 10, 30)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Address", 10, 60)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("City", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Region", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("PostalCode", 10, 10)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Country", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Phone", 10, 24)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Fax", 10, 24)
oTableDef.Fields.Append oField

oDatabase.TableDefs.Append oTableDef
Set oQueryDef = oDatabase.CreateQueryDef("north_q5", "alter table Customers add constraint [PK_Customers] primary key (CustomerID);")
oQueryDef.Execute

'  CREATE TABLE "Employees"
Set oTableDef = oDatabase.CreateTableDef("Employees")
Set oField = oTableDef.CreateField("EmployeeID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("LastName", 10, 20)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("FirstName", 10, 10)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Title", 10, 30)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("TitleOfCourtesy", 10, 25)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("BirthDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("HireDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Address", 10, 60)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("City", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Region", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("PostalCode", 10, 10)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Country", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("HomePhone", 10, 24)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Extension", 10, 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Photo", 11)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Notes", 10, 18)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ReportsTo", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("PhotoPath", 10, 255)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q6", "alter table Employees add constraint [PK_Employees] primary key (EmployeeID);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("north_q7", "alter table Employees alter column EmployeeID counter;")
oQueryDef.Execute

'  CREATE TABLE "EmployeeTerritories"
Set oTableDef = oDatabase.CreateTableDef("EmployeeTerritories")
Set oField = oTableDef.CreateField("EmployeeID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("TerritoryID", 10, 20)
oField.Required = True
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q8", "alter table EmployeeTerritories add constraint [PK_EmployeeTerritories] primary key (EmployeeID, TerritoryID);")
oQueryDef.Execute

'  CREATE TABLE "Order Details"
Set oTableDef = oDatabase.CreateTableDef("Order Details")
Set oField = oTableDef.CreateField("OrderID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ProductID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("UnitPrice", 5)
oField.Required = True
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Quantity", 3)
oField.Required = True
oField.DefaultValue = "1"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Discount", 6)
oField.Required = True
oField.DefaultValue = "0"
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q9", "alter table [Order Details] add constraint [PK_OrderDetails] primary key (OrderID, ProductID);")
oQueryDef.Execute

'  CREATE TABLE "Orders"
Set oTableDef = oDatabase.CreateTableDef("Orders")
Set oField = oTableDef.CreateField("OrderID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CustomerID", 10, 5)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("EmployeeID", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("OrderDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("RequiredDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShippedDate", 8)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipVia", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Freight", 5)
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipName", 10, 40)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipAddress", 10, 60)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipCity", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipRegion", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipPostalCode", 10, 10)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ShipCountry", 10, 15)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q10", "alter table Orders add constraint [PK_Orders] primary key (OrderID);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("north_q11", "alter table Orders alter column OrderID counter;")
oQueryDef.Execute

'  CREATE TABLE "Products"
Set oTableDef = oDatabase.CreateTableDef("Products")
Set oField = oTableDef.CreateField("ProductID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ProductName", 10, 40)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("SupplierID", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CategoryID", 4)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("QuantityPerUnit", 10, 20)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("UnitPrice", 5)
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("UnitsInStock", 3)
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("UnitsOnOrder", 3)
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ReorderLevel", 3)
oField.DefaultValue = "0"
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Discontinued", 1)
oField.Required = True
oField.DefaultValue = "0"
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q12", "alter table Products add constraint [PK_Products] primary key (ProductID);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("north_q13", "alter table Products alter column ProductID counter;")
oQueryDef.Execute

'  CREATE TABLE "Region"
Set oTableDef = oDatabase.CreateTableDef("Region")
Set oField = oTableDef.CreateField("RegionID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("RegionDescription", 10, 50)
oField.Required = True
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q14", "alter table Region add constraint [PK_Region] primary key (RegionID);")
oQueryDef.Execute

'  CREATE TABLE "Shippers"
Set oTableDef = oDatabase.CreateTableDef("Shippers")
Set oField = oTableDef.CreateField("ShipperID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CompanyName", 10, 40)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Phone", 10, 24)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q15", "alter table Shippers add constraint [PK_Shippers] primary key (ShipperID);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("north_q16", "alter table Shippers alter column ShipperID counter;")
oQueryDef.Execute

'  CREATE TABLE "Suppliers"
Set oTableDef = oDatabase.CreateTableDef("Suppliers")
Set oField = oTableDef.CreateField("SupplierID", 4)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("CompanyName", 10, 40)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ContactName", 10, 30)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("ContactTitle", 10, 30)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Address", 10, 60)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("City", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Region", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("PostalCode", 10, 10)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Country", 10, 15)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Phone", 10, 24)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("Fax", 10, 24)
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("HomePage", 10, 18)
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q17", "alter table Suppliers add constraint [PK_Suppliers] primary key (SupplierID);")
oQueryDef.Execute

Set oQueryDef = oDatabase.CreateQueryDef("north_q18", "alter table Suppliers alter column SupplierID counter;")
oQueryDef.Execute

'  CREATE TABLE "Territories"
Set oTableDef = oDatabase.CreateTableDef("Territories")
Set oField = oTableDef.CreateField("TerritoryID", 10, 20)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("TerritoryDescription", 10, 50)
oField.Required = True
oTableDef.Fields.Append oField

Set oField = oTableDef.CreateField("RegionID", 4)
oField.Required = True
oTableDef.Fields.Append oField
oDatabase.TableDefs.Append oTableDef

Set oQueryDef = oDatabase.CreateQueryDef("north_q19", "alter table Territories add constraint [PK_TerritoriesD] primary key (TerritoryID);")
oQueryDef.Execute

i = 1
Do While i < 20
 oDatabase.QueryDefs.Delete("north_q" & i)
 i = i + 1
Loop


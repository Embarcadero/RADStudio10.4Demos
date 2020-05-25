Dim oWorkspace
Dim oDatabase
Dim oField
Dim oRelation
Dim oQueryDef
Dim oDAO
Dim sFile
Dim i

if WScript.Arguments.Count <> 1 then
  WScript.Echo "usage: relations.vbs <path to FDDemo.mdb>"
  WScript.Quit
end if
sFile = WScript.Arguments.Item(0) & "\" & "FDDemo.mdb"

set oDAO=CreateObject("DAO.DbEngine.36")

Set oWorkspace = oDAO.WorkSpaces(0)
Set oDatabase = oWorkspace.OpenDatabase(sFile)

'  CREATE RELATIONSHIP "FK_CustomerCustomerDemo"
Set oRelation = oDatabase.CreateRelation("FK_CustomerCustomerDemo_Demogr", "CustomerDemographics", "CustomerCustomerDemo")
Set oField = oRelation.CreateField("CustomerTypeID")
oField.ForeignName = "CustomerTypeID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q1", "create index [I_CustCustD_CustomerTypeID] on [CustomerCustomerDemo](CustomerTypeID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_CustomerCustomerDemo_Customers"
Set oRelation = oDatabase.CreateRelation("FK_CustomerCustomerDemo_Customers", "Customers", "CustomerCustomerDemo")
Set oField = oRelation.CreateField("CustomerID")
oField.ForeignName = "CustomerID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q2", "create index [I_CustCustD_CustomerID] on [CustomerCustomerDemo](CustomerID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Employees_Employees"
Set oRelation = oDatabase.CreateRelation("FK_Employees_Employees", "Employees", "Employees")
Set oField = oRelation.CreateField("EmployeeID")
oField.ForeignName = "ReportsTo"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q3", "create index [I_Empl_ReportsTo] on Employees(ReportsTo)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_EmployeeTerritories_Territories"
Set oRelation = oDatabase.CreateRelation("FK_EmployeeTerritories_Territories", "Territories", "EmployeeTerritories")
Set oField = oRelation.CreateField("TerritoryID")
oField.ForeignName = "TerritoryID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q4", "create index [I_EmplTerrit_TerrID] on EmployeeTerritories(TerritoryID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_EmployeeTerritories_Employees"
Set oRelation = oDatabase.CreateRelation("FK_EmployeeTerritories_Employees", "Employees", "EmployeeTerritories")
Set oField = oRelation.CreateField("EmployeeID")
oField.ForeignName = "EmployeeID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q5", "create index [I_EmplTerr_EmplID] on EmployeeTerritories(EmployeeID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Order_Details_Orders"
Set oRelation = oDatabase.CreateRelation("FK_Order_Details_Orders", "Orders", "Order Details")
Set oField = oRelation.CreateField("OrderID")
oField.ForeignName = "OrderID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q6", "create index [I_OrdDetails_OrdID] on [Order Details](OrderID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Order_Details_Products"
Set oRelation = oDatabase.CreateRelation("FK_Order_Details_Products", "Products", "Order Details")
Set oField = oRelation.CreateField("ProductID")
oField.ForeignName = "ProductID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q7", "create index [I_OrdDetails_ProdID] on [Order Details](ProductID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Orders_Employees"
Set oRelation = oDatabase.CreateRelation("FK_Orders_Employees", "Employees", "Orders")
Set oField = oRelation.CreateField("EmployeeID")
oField.ForeignName = "EmployeeID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q8", "create index [I_Orders_EmplID] on Orders(EmployeeID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Orders_Customers"
Set oRelation = oDatabase.CreateRelation("FK_Orders_Customers", "Customers", "Orders")
Set oField = oRelation.CreateField("CustomerID")
oField.ForeignName = "CustomerID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q9", "create index [I_Orders_CustomerID] on Orders(CustomerID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Orders_Shippers"
Set oRelation = oDatabase.CreateRelation("FK_Orders_Shippers", "Shippers", "Orders")
Set oField = oRelation.CreateField("ShipperID")
oField.ForeignName = "ShipVia"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q10", "create index [I_Orders_ShipVia] on Orders(ShipVia)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Products_Categories"
Set oRelation = oDatabase.CreateRelation("FK_Products_Categories", "Categories", "Products")
Set oField = oRelation.CreateField("CategoryID")
oField.ForeignName = "CategoryID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q11", "create index [I_Prod_CategoryID] on Products(CategoryID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Products_Suppliers"
Set oRelation = oDatabase.CreateRelation("FK_Products_Suppliers", "Suppliers", "Products")
Set oField = oRelation.CreateField("SupplierID")
oField.ForeignName = "SupplierID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q12", "create index [I_Prod_SupplID] on Products(SupplierID)")
oQueryDef.Execute

'  CREATE RELATIONSHIP "FK_Territories_Region"
Set oRelation = oDatabase.CreateRelation("FK_Territories_Region", "Region", "Territories")
Set oField = oRelation.CreateField("RegionID")
oField.ForeignName = "RegionID"
oRelation.Fields.Append oField
oDatabase.Relations.Append oRelation

Set oQueryDef = oDatabase.CreateQueryDef("north_rel_q13", "create index [I_Territ_RegionID] on Territories(RegionID)")
oQueryDef.Execute

i = 1
Do While i < 13
 oDatabase.QueryDefs.Delete("north_rel_q" & i)
 i = i + 1
Loop

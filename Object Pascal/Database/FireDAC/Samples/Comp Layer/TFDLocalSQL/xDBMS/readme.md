FireDAC.TFDLocalSQL.xDBMS Sample[]()
# FireDAC.TFDLocalSQL.xDBMS Sample 


This sample demonstrates how to use [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) to implement a SQLite-based [Local SQL engine](http://docwiki.embarcadero.com/RADStudio/en/Local_SQL_(FireDAC)) for a cross-DBMS query application (queryable datasets from different databases).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **xDBMS** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDLocalSQL\xDBMS`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/xDBMS](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/xDBMS)

## Description 

The **xDBMS** sample shows you how use the [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) class to implement a cross-DBMS query application. To this end, each queryable dataset must be registered with the [Local SQL engine](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) using the [DataSets](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.DataSets) collection property.**Note**: The Local SQL feature allows [executing SQL commands](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC)), where the [TDataSet](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet) descendants are used instead of the database tables.
## How to Use the Sample 


1.  Navigate to the location given above and open `xDBMS.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi         | Contains          |
|------------------------|-------------------|
|`xDBMS.dproj``xDBMS.dpr`|The project itself.|
|`fMain.pas``fMain.fmx`  |The main form.     |


## Implementation 

To setup [Local SQL engine](http://docwiki.embarcadero.com/RADStudio/en/Local_SQL_(FireDAC)) for a cross-DBMS query application, the sample has to perform the following steps:
*  Set up an in-memory SQLite local connection (**FDConnection1**) as a query source from the Local SQL engine (**FDLocalSQL1**).
*  Perform a local SQL query (**FDQuery1**).
*  Connect the datasets (**qOrders** and **qDetails**) to the Local SQL engine.
To this end, the sample implement the following steps:
1.  Setup connection and query to "Orders" table in SQLite database and link the dataset to the Local SQL engine. To this end, the following components are needed:

*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **cnSQLite**.

*  The [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property is set to `SQLite_Demo`.

*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qOrders**.

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `cnSQLite`.
*  The [LocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDAdaptedDataSet.LocalSQL) property is set to `FDLocalSQL1`.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property is set to `select * from Orders`.

2.  Setup connection and query to "Orders Details" table in MSAccess database and link the dataset to the Local SQL engine. To this end, the sample uses the following components:

*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **cnMSAccess**.

*  The [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property is set to `Access_Demo`.

*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qDetails**.

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `cnMSAccess`.
*  The [LocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDAdaptedDataSet.LocalSQL) property set to `FDLocalSQL1`.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property set to `select * from "Order Details"`

3.  Setup SQLite in-memory connection. To this end, the sample sets up the following components:

*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **FDCOnnection1**.

*  The [DriverName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection.DriverName) property set to `SQLite`.

*  A [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) object named **FDLocalSQL1**

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL.Connection) property set to `FDConnection1`.
*  The [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.Active) property set to `True`.

4.  Execute a SELECT query on above datasets using:

*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **FDQuery1**.

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `FDConnection1`.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property set to `SELECT QO.*, QD.* FROM qOrders QO LEFT JOIN qDetails QD ON QO.OrderID = QD.OrderID ORDER BY QO.OrderID`
**Note**: All the configuration of these components is done using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** at design time. When you run the application, click on the **Open/Close** button in order to set the [Active](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Active) property of **FDQuery1** to `True`. It executes the SELECT query on the datasets registered with this Local SQL engine. Then, the records from the registered datasets are displayed on a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component.
## Uses 


* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [TFDPhysMSAccessDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDPhysMSAccessDriverLink)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Local SQL engine](http://docwiki.embarcadero.com/RADStudio/en/Local_SQL_(FireDAC))
* [Using SQLite with FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Using_SQLite_with_FireDAC)
* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))

### Samples 


* [FireDAC Getting Started SQLite](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.SQLite_Sample) sample
* [FireDAC TFDLocalSQL in Memory DB](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL_InMemDB_Sample) sample
* [FireDAC TFDLocalSQL MegaFMX](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL_MegaFMX_Sample) sample






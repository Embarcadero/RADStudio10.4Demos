FireDAC.TFDLocalSQL InMemDB Sample[]()
# FireDAC.TFDLocalSQL InMemDB Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 MemTab1](#MemTab1)
* [4.2 MemTab2](#MemTab2)
* [4.3 Query](#Query)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

* [6.1 Samples](#Samples)

The Local SQL uses TDataSet descendants as query sources. It is based on the SQLite engine and supports most of the SQLite SQL dialect. FireDAC uses the SQLite driver to implement the Local SQL engine.The sample shows how to use the [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) component to execute SQL commands on in-memory database, represented by several TFDMemTables.

## Location 

You can find the **In-memory DB** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDLocalSQL\InMemDB**.

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/InMemDB](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/InMemDB).

## Description 

This sample uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the SQLite in-memory database (with empty **Database** parameter value). The [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) component is for the Local SQL engine. The [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) components are used to load and show the **Brands** and **Models** information. The **Brands** and **Models** TFDMemTables are in-memory tables loaded on the form creation. The [FieldDefs](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.FieldDefs) is filled on code, so there are no external tables or database. The [Active](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Active) property is set to **True** to open the dataset. The [LocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDAdaptedDataSet.LocalSQL) property is set to **FDLocalSQL1** to register the dataset with the Local SQL engine.
[TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) serves as a central hub to the Local SQL engine and provides the registered datasets. The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.Connection) property is set to **FDConnection1** SQLite connection, which will be used to query the datasets.
The [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) connects to **FDConnection1** and executes a query over the [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) connection and shows the result of the SQL query on the TDBGrid.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **InMemDB.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Move to the different tabs and navigate through the records with the TDBNavigators.

## Implementation 

The sample is divided on tabs. The TFDMemTables are defined and filled with data by code.
### MemTab1 

It shows on the TDBGrid the result of the **Brands**[TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable).To show the content from the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) on the TDBGrid it uses the **DataSource1**[TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource). The DataSet property of the **DataSource1** specifies **Brands** and the TDBGrid has **DataSource1** as the DataSource property. 

### MemTab2 

It shows on the TDBGrid the result of the **Models**[TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable).To show the content from the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) on the TDBGrid it uses the **DataSource2**[TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource). The DataSet property of the **DataSource2** specifies **Models** and the TDBGrid has **DataSource2** as the DataSource property.

### Query 

It shows on the TDBGrid the result on the **FDQuery1**[TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery): ` Select * from Brands B left join Models M on B.Code = M.Brand `To show the content from the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) on the TDBGrid it uses the **DataSource3**[TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource). The DataSet property of the **DataSource3** specifies **FDQuery1** and the TDBGrid has **DataSource3** as the DataSource property.

## Uses 


* [FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL)
* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Local SQL (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Local_SQL_(FireDAC))

### Samples 


* [FireDAC TFDLocalSQL cross-DBMS](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL.xDBMS_Sample) sample
* [FireDAC TFDLocalSQL MegaFMX](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL_MegaFMX_Sample) sample






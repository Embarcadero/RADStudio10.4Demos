FireDAC.TFDMemTable.IncFetchingMSSQL Sample[]()
# FireDAC.TFDMemTable.IncFetchingMSSQL Sample 


This sample demonstrates how to use the [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Fetch) and [FetchAll](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.FetchAll) methods in order to[fetch rows](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC)) from the current command cursor.
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

You can find the **IncFetchingMSSQL** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\IncFetching_MSSQL`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/IncFetching_MSSQL](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/IncFetching_MSSQL)

## Description 

The **IncFetchingMSSQL** sample shows you how to [fetch rows](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC)) from the current command cursor. To this end, the sample connects to the desired database using the `MSSQL_Demo`[connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). Then, the sample uses [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Fetch) and [FetchAll](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.FetchAll) methods in order to fetch the rows that match with a given selection made by the user.
## How to Use the Sample 


1.  Navigate to the location given above and open `IncFetching.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                     | Contains          |
|------------------------------------|-------------------|
|`IncFetching.dproj``IncFetching.dpr`|The project itself.|
|`Unit30.pas``Unit30.fmx`            |The main form.     |


## Implementation 

This sample uses the following main components that are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**:
*  A [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) object named **FDCommand1**.
 It uses [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the desired database. In the **CommandText** property of [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) there is a SQL command that, in this sample, is used for selecting the desired data from the desired database. In the sample, the **CommandText** property is set to: `select * from Orders where EmployeeID = :ID`, which means that, in this sample, the user can fetch the rows with a given value of the **EmployeeID** field from the **Orders** table. You can check it on the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector).
*  A [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) object named **FDTableAdapter1**.
 It provides communication between the application and the database. It is a mediator between [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). To this end, the **SelectCommand** property is set to `FDCommand1` at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**.
*  A [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) object named **FDmemTable1**.
 It retrieves data from database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). To this end, the **Adapter** property is set to `FDTableAdapter1` at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**.Moreover, the goal of the sample is to fetch the desired rows from a given database table. First, the sample sets the condition that have to meet the rows in order to be selected; then, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Open) method to open the dataset and finally, calls the [FetchAll](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.FetchAll) method to fetch all rows that match with the desired selection. See the code below:
```
  FDCommand1.Params[0].AsInteger := 1;
  FDMemTable1.Open;
  FDMemTable1.FetchAll;

```


**Note**: This piece of code fetches all rows from the **Orders** table that have the value of the **EmployeeID** field set to `1`.Then, this process is repeated in order to make an incremental fetch of rows that match the desired selection for each case. See the code below:
```
  FDCommand1.Params[0].AsInteger := 2;
  // Fetching process

  FDCommand1.Params[0].AsInteger := 3;
  // Fetching process

  // ...

```



## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)

* [Open](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Open)
* [FetchAll](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.FetchAll)

* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand)

* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Open)
* [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Close)
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Fetch)
* [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Params)

* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Fetching Rows (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC))

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDMemTable Clone Cursor](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CloneCursor_Sample) sample
* [FireDAC IFDPhysCommand Fetch Tables](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.FetchTables_Sample) sample






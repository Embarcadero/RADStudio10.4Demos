FireDAC.TFDLocalSQL MegaFMX Sample[]()
# FireDAC.TFDLocalSQL MegaFMX Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 CSV DB (dyna)](#CSV_DB_.28dyna.29)
* [4.2 Heterogeneous Query (dyna)](#Heterogeneous_Query_.28dyna.29)
* [4.3 Different DAC's (stat)](#Different_DAC.27s_.28stat.29)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

* [6.1 Samples](#Samples)

The sample shows different [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) applications.
## Location 

You can find the **MegaFMX** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDLocalSQL\MegaFMX**.

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/MegaFMX](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDLocalSQL/MegaFMX).

## Description 

This sample is divided in three tabs where each tab demonstrates single Local SQL usage case.Each tab has dedicated SQLite in-memory connection established using the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) with only single parameter **DriverID=SQLite**. When no **Database** parameter value is specified then FireDAC SQLite driver opens an in-memory connection. It will be used as a Local SQL engine.
The [TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL) component for each page serves as a hub to Local SQL engine, allowing to register datasets with the Local SQL engine. Also there is a TMemo where the Local SQL query is defined before executing it using a [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) component. The [TFDLocalSQL.Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.Connection) and [TFDQuery.Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) properties are set to the same SQLite in-memory TFDConnection.
Visual components such as the [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) and the [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) are bind to the TFDQuery using Live Bindings.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **LSQLMega.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Move to the different tabs.
4.  Click **Open** to open the connection and see the content on the grid.
**Note:** You can navigate through the records with the TDBNavigators.
## Implementation 

The sample is divided in tabs. The TFDMemTables are defined and filled with data by code.
### CSV DB (dyna) 

The first page represents the Comma-Separated Values (CSV) text file database with SQL query capabilities. The text files are stored in **C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\Object Pascal\Database\FireDAC\DB\Data** folder.The [FDConnection1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) provides SQLite in-memory connection. For that DriverName property is set to **SQLite**. The [FDLocalSQL1.Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.Connection) and the [FDQuery1.Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) are set to the [FDConnection1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection).
The [FDLocalSQL1.OnGetDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.OnGetDataSet) event handler is used to dynamically resolve a reference to an unknown table name and to provide a dataset with the data. For that event handler creates [TFDBatchMove](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.TFDBatchMove) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) components. TFDBatchMove recognizes and reads a CSV file into TFDMemTable. Then the event handler returns TFDMemTable:

```
 
procedure TfrmMain.FDLocalSQL1GetDataSet(ASender: TObject; const ASchemaName,
  AName: String; var ADataSet: TDataSet; var AOwned: Boolean);
var
  oTab: TFDMemTable;
  oBM: TFDBatchMove;
begin
  oTab := TFDMemTable.Create(nil);
  oBM := TFDBatchMove.Create(nil);
  try
    try
      oBM.Analyze := [taDelimSep, taHeader, taFields];
      with TFDBatchMoveTextReader.Create(oBM) do
        FileName := GetPathToCSV + AName + '.csv';
      with TFDBatchMoveDataSetWriter.Create(oBM) do
        DataSet := oTab;
      oBM.Execute;
    except
      oTab.Free;
      raise;
    end;
  finally
    oBM.Free;
  end;
  oTab.Name := AName;
  ADataSet := oTab;
  AOwned := True;
end;

```


Clicking **Open**, inserts the lines of the Memo1 on the [FDQuery1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) and executes the Local SQL query:
```
 
procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL := Memo1.Lines;
  FDQuery1.Open;
end;

```


Is shows the result on the [Grid1](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) grid.
### Heterogeneous Query (dyna) 

The second page represents the ability to perform a heterogeneous SQL query, where several joined tables are prefixed by a schema name. There a schema name corresponds to a FireDAC connection definition name. The connection definitions are stored in the **C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionsDefs.ini** file. So, the tables with different schema names will be obtained from the different (heterogeneous) database connections. The basic setup is similar to first page. Each schema name is handled by a dedicated TFDLocalSQL component. For that the property [TFDLocalSQL.SchemaName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL.SchemaName) is used:

*  FDLocalSQL2 = **SQLite_Demo**
*  FDLocalSQL3 = **Access_Demo**.
The FDLocalSQL2 and FDLocalSQL3 [OnGetDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomLocalSQL.OnGetDataSet) event handlers are used to dynamically resolve a reference to an unknown table name and to provide a dataset with the data. For that event handler creates [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) component and sets it [ConnectionName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.ConnectionName) to the schema name and SQL property to **select * from table** query:
```
 
procedure TfrmMain.FDLocalSQL2GetDataSet(ASender: TObject; const ASchemaName,
  AName: String; var ADataSet: TDataSet; var AOwned: Boolean);
var
  oQry: TFDQuery;
begin
  oQry := TFDQuery.Create(nil);
  try
    oQry.Name := AName;
    oQry.ConnectionName := ASchemaName;
    oQry.SQL.Text := 'select * from ' + AName;
    oQry.Open;
  except
    oQry.Free;
    raise;
  end;
  ADataSet := oQry;
  AOwned := True;
end;

```


Clicking **Open**, inserts the lines of the Memo2 on the [FDQuery2](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) and executes the SQL command.
### Different DAC's (stat) 

The third page represents the ability to perform a Local SQL query to different data access components in the same SQL query.Before executing a query the **TfrmMain.Button3Click** event handler statically registers 3 datasets:

* [Data.Win.ADODB.TADOQuery](http://docwiki.embarcadero.com/Libraries/en/Data.Win.ADODB.TADOQuery) to load **region**.
* [Datasnap.DBClient.TClientDataSet](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet) to load **employees**.
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) to load **orders**.
Finally inserts the lines of the Memo3 on the [FDQuery3](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) and opens the connection.
## Uses 


* [FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLiteVDataSet.TFDLocalSQL)
* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Comp.BatchMove.TFDBatchMove](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.TFDBatchMove)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [FireDAC.Phys.MSAcc.TFDPhysMSAccessDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDPhysMSAccessDriverLink)
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [Datasnap.DBClient.TClientDataSet](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet)
* [Data.Win.ADODB.TADOConnection](http://docwiki.embarcadero.com/Libraries/en/Data.Win.ADODB.TADOConnection)
* [Data.Win.ADODB.TADOQuery](http://docwiki.embarcadero.com/Libraries/en/Data.Win.ADODB.TADOQuery)
* [FMX.Grid.TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid)
* [Fmx.Bind.Navigator.TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Local SQL (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Local_SQL_(FireDAC))

### Samples 


* [FireDAC TFDLocalSQL cross-DBMS](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL.xDBMS_Sample) sample
* [FireDAC TFDLocalSQL in Memory DB](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDLocalSQL_InMemDB_Sample) sample






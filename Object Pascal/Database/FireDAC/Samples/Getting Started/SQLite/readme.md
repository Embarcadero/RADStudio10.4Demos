FireDAC.SQLite Sample[]()
# FireDAC.SQLite Sample 


This sample demonstrates how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) to work with [SQLite](http://en.wikipedia.org/wiki/SQLite) databases.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Creating temporary connection definition](#Creating_temporary_connection_definition)
* [5.2 Master Details](#Master_Details)
* [5.3 Executing queries](#Executing_queries)
* [5.4 Management of SQLite database](#Management_of_SQLite_database)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **SQLite** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Getting Started\SQLite`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/SQLite](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/SQLite)

## Description 

The **SQLite** getting started sample shows how to use FireDAC with SQLite databases. This sample allows the user to do:
*  Temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) at run time.
*  Master-details relationship between datasets using [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
*  Custom SQLite functions using [TFDSQLiteFunction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteFunction).
*  Management of [SQLite](http://docwiki.embarcadero.com/RADStudio/en/SQLite_support_in_RAD_Studio) database such as: encrypting and validating a database or creating database backup.

## How to Use the Sample 


1.  Navigate to the location given above and open `GettingStarted.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Connection** combo box and select `<Open database…>`. Open the following database: **C:\Users\Public\Documents\Embarcadero\Studio\21.0\Samples\data\FDDemo.sdb**.
4.  Interact with the sample.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`GettingStarted.dproj``GettingStarted.dpr`|The project itself.|
|`fGettingStarted.pas``fGettingStarted.fmx`|The main form.     |


## Implementation 

The sample implements the following features.
### Creating temporary connection definition 

The simplest way to [configure connection](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_SQLite_database_(FireDAC)) to SQLite database at run time is to build a temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)):
```
with dbMain do begin
  Close;
  // create temporary connection definition
  with Params do begin
    Clear;
    Add('DriverID=SQLite');
    Add('Database=x:\path_to_database\db.sdb');
  end;
  Open;
end;

```


In the sample, the temporary definition is created when the `<Open database…>` item is selected in the **Connection** combo box.
### Master Details 

In the demo database, the **Categories** and **Products** tables have one-to-many relation by `CategoryID` field. The **qryCategories.SQL** property is set up as follows:
```
select * from Categories

```


In addition, the **qryProducts.SQL** property is set up as follows:
```
select *,
StockPrice(UnitPrice, UnitsInStock) as StockCost
from Products
where CategoryId = :CategoryID

```


Finally, the **qryProducts.MasterSource** property is set to `dsCategories`, while the **MasterFields** property is set to `CategoryID`. This creates a [master-details](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) relationship between the datasets.StockPrice function is a custom function defined using the [TFDSQLiteFunction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteFunction) component. The calculation is configured using a [OnCalculate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteFunction.OnCalculate) event:

```
  sqlFunction.DriverLink := FDPhysSQLiteDriverLink1;
  sqlFunction.FunctionName := 'StockPrice';
  sqlFunction.ArgumentsCount := 2;
  sqlFunction.Active := True;
  sqlFunction.OnCalculate := sqlFunctionCalculate;
  …
procedure TfrmGettingStarted.sqlFunctionCalculate(AFunc: TSQLiteFunction;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsCurrency := AInputs[0].AsCurrency * AInputs[1].AsInteger;
end;

```


The event occurs when fetching records from the database. It returns the calculated value.
### Executing queries 

Simple queries execution is demonstrated via [ExecSQL](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC)) method of [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection).Inserting a record providing parameters of various types:

```
dbMain.ExecSQL('insert into Categories(CategoryName, Description, Picture) ' +
               'values(:N, :D, :P)', ['New category', 'New descr', $0334]);

```


Updating records:
```
 dbMain.ExecSQL('update Products set UnitPrice = UnitPrice * :P1 + :P2 ' +
                'where ProductID < 3', [Random(5), Random(3)]);

```


Deleting a record:
```
dbMain.ExecSQL('delete from Categories where CategoryName like :N', ['New category']);

```


Getting a scalar value from the database:
```
iID := dbMain.ExecSQLScalar('select MAX(CategoryID) from Categories');

```



### Management of SQLite database 

The sample shows how to perform several Management of databases such as:
*  Database management
*  Validating database
*  Creating database backup
*  Using custom collations and functions
All this Management of databases is done using the following components: [TFDSQLiteBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteBackup), [TFDSQLiteSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity), [TFDSQLiteValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteValidate), [TFDSQLiteCollation](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteCollation) and [TFDSQLiteFunction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteFunction).This demo demonstrates managing database encryption, validating database and creating database backup:

```
with sqlSecurity do begin
  Database := 'x:\path_to_database\db.sdb';
  Password := 'p@ssword';
  ToPassword := 'p@ssword_changed';
  case rgSecActions.ItemIndex of
  C_SET_PASSWORD:    SetPassword;
  C_REMOVE_PASSWORD: RemovePassword;
  C_CHANGE_PASSWORD: ChangePassword;
  end;
end;
…
with sqlValidate do begin
  Database := 'x:\path_to_database\db.sdb';
  Password := 'p@ssword';
  case rgValActions.ItemIndex of
  C_ANALYZE: Analyze;
  C_CHECKONLY:
    if not CheckOnly then
       Memo1.Lines.Add('Database has problems !')
    else
       Memo1.Lines.Add('Database is valid');
  C_SWEEP: Sweep;
  end;
end;
…
with sqlBackup do begin
  Database := 'x:\path_to_database\db.sdb';
  DestDatabase := 'x:\path_to_database\db.backup';
  Password := 'p@ssword';
  DestPassword := 'dest_p@ssword';
  Backup;
end;

```



## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDSQLiteFunction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteFunction)
* [TFDSQLiteBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteBackup)
* [TFDSQLiteSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity)
* [TFDSQLiteValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteValidate)
* [TFDSQLiteCollation](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteCollation)

## See Also 


* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [SQLite support in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/SQLite_support_in_RAD_Studio)
* [Using SQLite with FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Using_SQLite_with_FireDAC)
* [Connect to SQLite database (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_SQLite_database_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [Mobile Tutorial: Using FireDAC and SQLite (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_and_SQLite_(iOS_and_Android))
* [Tutorial: Connecting to a SQLite Database Using FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Connecting_to_a_SQLite_Database_Using_FireDAC)
* [SQLite Database Questions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/SQLite_Database_Questions_(FireDAC))

### Samples 


* [FireDAC InterBase](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InterBase_Sample) sample
* [FireDAC MSAccess](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSAccess_Sample) sample
* [FireDAC MSSQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSSQL_Sample) sample
* [FireDAC MySQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MySQL_Sample) sample
* [FireDAC Firebird](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Firebird_Sample) sample






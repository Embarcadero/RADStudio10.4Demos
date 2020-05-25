FireDAC.MSAccess Sample[]()
# FireDAC.MSAccess Sample 


This sample demonstrates how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) to work with [MS Access](http://en.wikipedia.org/wiki/Microsoft_Access) databases.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Creating Temporary Connection Definition](#Creating_Temporary_Connection_Definition)
* [5.2 Master Details](#Master_Details)
* [5.3 Executing Queries](#Executing_Queries)
* [5.4 Management of MS Access database](#Management_of_MS_Access_database)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **MSAccess** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Getting Started\MSAccess`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/MSAccess](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/MSAccess)

## Description 

The **MSAccess** getting started sample shows how to use FireDAC with MS Access databases. This application sample provides the following features to the user:
*  Temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) at run time.
*  Master-details relationship between datasets using [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
*  Management of MS Access databases, such as: creating and compacting a database.

## How to Use the Sample 


1.  Navigate to the location given above and open `GettingStarted.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Connection** combo box and select `<Open database…>`. Open the following database: **C:\Users\Public\Documents\Embarcadero\Studio\21.0\Samples\data\FDDemo.mdb**.
4.  Interact with the sample.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`GettingStarted.dproj``GettingStarted.dpr`|The project itself.|
|`fGettingStarted.pas``fGettingStarted.fmx`|The main form.     |


## Implementation 

The sample implements the following features:
### Creating Temporary Connection Definition 

The simplest way to [configure connection](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Microsoft_Access_Database_(FireDAC)) to MS Access database at run time is to build a temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)):
```
with dbMain do begin
  Close;
  // create temporary connection definition
  with Params do begin
    Clear;
    Add('DriverID=MSAcc');
    Add('Database=x:\path_to_db\db.fdb');
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
select * from Products
where CategoryID = :CategoryID

```


Finally, the **qryProducts.MasterSource** property is set to `dsCategories`, while the **MasterFields** property is set to `CategoryID`. This creates a [master-details](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) relationship between the datasets.
### Executing Queries 

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



### Management of MS Access database 

The management of databases, such as: creating, dropping, compacting/repairing, and setting a password is done using [TFDMSAccessService](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService) component.This demo demonstrates how to [create](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService.CreateDB) and [compact](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService.Compact) the user database:

```
with accService do begin
  Password := 'p@ssword';
  Database := 'x:\path_to_database\db.mdb';
  CreateDB;
end;
…
with accService do begin
  Password := 'p@ssword';
  Database := 'x:\path_to_database\db.mdb';
  Compact;
end;

```



## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDMSAccessService](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService)

* [CreateDB](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService.CreateDB)
* [Compact](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MSAcc.TFDMSAccessService.Compact)

## See Also 


* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Connect to Microsoft Access Database (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Microsoft_Access_Database_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [Mobile Tutorial: Using FireDAC and SQLite](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_and_SQLite_(iOS_and_Android))
* [MS Access Questions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/MS_Access_Questions_(FireDAC))

### Samples 


* [FireDAC InterBase](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InterBase_Sample) sample
* [FireDAC MS SQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSSQL_Sample) sample
* [FireDAC MySQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MySQL_Sample) sample
* [FireDAC SQLite](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.SQLite_Sample) sample
* [FireDAC Firebird](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Firebird_Sample) sample






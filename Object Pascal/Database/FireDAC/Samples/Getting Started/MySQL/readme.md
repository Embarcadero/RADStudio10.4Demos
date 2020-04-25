FireDAC.MySQL Sample[]()
# FireDAC.MySQL Sample 


This sample demonstrates how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) to work with [MySQL](http://en.wikipedia.org/wiki/MySQL) databases.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Creating temporary connection definition](#Creating_temporary_connection_definition)
* [5.2 Master Details](#Master_Details)
* [5.3 Executing queries](#Executing_queries)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **MySQL** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Getting Started\MySQL`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/MySQL](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/MySQL)

## Description 

The **MySQL** getting started sample shows how to use FireDAC with MySQL databases. This sample allows the user to create temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) at run time and master-details relationship between datasets using [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to work with MySQL databases.
## How to Use the Sample 


1.  Navigate to the location given above and open `GettingStarted.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`GettingStarted.dproj``GettingStarted.dpr`|The project itself.|
|`fGettingStarted.pas``fGettingStarted.fmx`|The main form.     |


## Implementation 

The sample implements the following features.
### Creating temporary connection definition 

The simplest way to [configure connection](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MySQL_Server_(FireDAC)) to MySQL database at run time is to build a temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)):
```
with dbMain do begin
  Close;
  // create temporary connection definition
  with Params do begin
    Clear;
      Add('DriverID=MySQL');
      Add('Server=127.0.0.1');
      Add('Port=3306');        
      Add('Database=FDDemo');  
  end;
  Open;
end;

```


In the sample, the temporary definition is created when clicking the **Connect** button.
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



## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

## See Also 


* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Connect to MySQL Server (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MySQL_Server_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [MySQL Server Questions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/MySQL_Server_Questions_(FireDAC))

### Samples 


* [FireDAC InterBase](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InterBase_Sample) sample
* [FireDAC MSAccess](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSAccess_Sample) sample
* [FireDAC MSSQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSSQL_Sample) sample
* [FireDAC SQLite](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.SQLite_Sample) sample
* [FireDAC Firebird](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Firebird_Sample) sample






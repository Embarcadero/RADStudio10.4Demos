FireDAC.InterBase Sample[]()
# FireDAC.InterBase Sample 


This sample demonstrates how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) to establish a temporary connection definition at run-time with [InterBase](http://docwiki.embarcadero.com/RADStudio/en/InterBase) database.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Creating temporary connection definition](#Creating_temporary_connection_definition)
* [5.2 Master Details](#Master_Details)
* [5.3 Transaction handling](#Transaction_handling)
* [5.4 Executing queries](#Executing_queries)
* [5.5 Management of InterBase database](#Management_of_InterBase_database)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **InterBase** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Getting Started\InterBase`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/InterBase](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started/InterBase)

## Description 

The **InterBase** getting started sample shows how to create a temporary connection definition at run-time with InterBase database. This sample allows the user to do:
*  Temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) at run-time.
*  Master-details relationship between datasets using [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
*  Transactions handling with [TFDTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTransaction).
*  Management of [InterBase](http://docwiki.embarcadero.com/RADStudio/en/InterBase) database such as: managing users, creating database backup/restoring database from backup and validating a database.

## How to Use the Sample 


1.  Navigate to the location given above and open `GettingStarted.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  To use FireDAC Demo Applications, you should install a Demo Database, following the instructions here: http://docwiki.embarcadero.com/RADStudio/Sydney/en/Demo_Databases_(FireDAC)

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`GettingStarted.dproj``GettingStarted.dpr`|The project itself.|
|`fGettingStarted.pas``fGettingStarted.fmx`|The main form.     |


## Implementation 

The sample implements the following features.
### Creating temporary connection definition 

The simplest way to [configure connection](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_InterBase_(FireDAC)) to InterBase database at run-time is to build a temporary [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)):
```
with dbMain do begin
  Close;
  // create temporary connection definition
  with Params do begin
    Clear;
    Add('DriverID=IB');
    Add('Server=localhost');
    Add('Database=x:\path_to_db\db.fdb');
    Add('User_Name=sysdba');
    Add('Password=masterkey');
  end;
  Open;
end;

```


In the sample the temporary definition is created when the **Connect** button is clicked.
### Master Details 

In this sample, the **Categories** and **Products** tables have one-to-many relation by `CategoryID` field. The **qryCategories.SQL** property is set up as follows:
```
select * from Categories

```


In addition, the **qryProducts.SQL** property is set up as follows:
```
select * from Products
where CategoryID = :CategoryID

```


Finally, the **qryProducts.MasterSource** property is set to `dsCategories`, while the **MasterFields** property is set to `CategoryID`. This creates a [master-details](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) relationship between the datasets.
### Transaction handling 

The handling of InterBase transactions is demonstrated using [TFDTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTransaction) + [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) components. Both are configured as follows: **trnMain.Connection** property is set to `dbMain connection` and **dbMain.Transaction** property is set to `trnMain`.Starting a transaction:

```
trnMain.StartTransaction;

```


Committing the transaction:
```
trnMain.Commit;

```


Rolling back the transaction:
```
trnMain.Rollback;

```



### Executing queries 

Simple queries execution is demonstrated via [ExecSQL](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC)) method of [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection).Updating records:

```
dbMain.ExecSQL('update {id Products} set UnitPrice = UnitPrice * :P1 + :P2 ' +
               'where ProductID < 3', [Random(5), Random(3)]);

```


Getting a scalar value from the database:
```
dMaxPrice := dbMain.ExecSQLScalar('select MAX(UnitPrice) from {id Products}');

```



### Management of InterBase database 

The sample application provides the following features:
*  Security management.
*  Database maintenance.
*  Tracing server activity
The management of databases is done using the following components [TFDIBBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBBackup), [TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore), [TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore), [TFDIBSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBSecurity), [TFDIBTrace](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.FB.TFDFBTrace) and [TFDIBValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBValidate).This demo demonstrates how to manage database with [TFDIBBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBBackup), [TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore), [TFDIBSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBSecurity) and [TFDIBValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBValidate) components:

```
with ibSecurity do begin
  Host := 'localhost';
  UserName := 'sysdba';
  Password := 'masterkey';
  AUserName := 'John_Doe';
  case rgSecActions.ItemIndex of
  C_ADD_USER:
    begin
      APassword := 'p@ssword';
      AddUser;
    end;
  C_DELETE_USER:
    begin
      DeleteUser;
    end;
  C_DISPLAY_USER:
    begin
      DisplayUser;
      with Memo1.Lines do begin
        Add('First name: ' + AFirstName);
        Add('Middle name: ' + AMiddleName);
        Add('Last name: ' + ALastName);
      end;
    end;
  C_MODIFY_USER:
    begin
      APassword := 'p@ssword_changed';
      ModifyUser;
    end;
  end;
end;
…
with ibBackup do begin
  Host := 'localhost';
  UserName := 'sysdba';
  Password := 'masterkey';
  AUserName := 'John_Doe';
  BackupFiles.Clear;
  BackupFiles.Add('x:\path_to_backup\db.backup');
  Backup;
end;
…
with ibRestore do begin
  Host := 'localhost';
  UserName := 'sysdba';
  Password := 'masterkey';
  AUserName := 'John_Doe';
  BackupFiles.Clear;
  BackupFiles.Add('x:\path_to_backup\db.backup');
  Restore;
end;
…
with ibValidate do begin
  Host := 'localhost';
  UserName := 'sysdba';
  Password := 'masterkey';
  AUserName := 'John_Doe';
  case rgValActions.ItemIndex of
  C_ANALYZE:   Analyze;
  C_CHECKONLY: CheckOnly;
  C_REPAIR:    Repair;
  C_SWEEP:     Sweep;
  end;
end;

```



## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTransaction)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDIBBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBBackup)
* [TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore)
* [TFDIBSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBSecurity)
* [TFDIBTrace](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.FB.TFDFBTrace)
* [TFDIBValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBValidate)

## See Also 


* [InterBase](http://docwiki.embarcadero.com/RADStudio/en/InterBase)
* [Connect to InterBase](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_InterBase_(FireDAC))
* [Master-Detail Relationship](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [InterBase ToGo](http://docwiki.embarcadero.com/RADStudio/en/InterBase_ToGo)
* [Mobile Tutorial: Using InterBase ToGo with FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_InterBase_ToGo_with_FireDAC_(iOS_and_Android))
* [Mobile Tutorial: Using FireDAC and SQLite](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_and_SQLite_(iOS_and_Android))
* [Firebird and Interbase Servers Questions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Firebird_and_Interbase_Servers_Questions_(FireDAC))

### Samples 


* [IBX InterBase ToGo](http://docwiki.embarcadero.com/CodeExamples/en/IBX.InterBase_ToGo_Sample) sample
* [FireDAC InterBase Admin Utility](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InterBase_AdminUtility_Sample) sample
* [FireDAC MS Access](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSAccess_Sample) sample
* [FireDAC MS SQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MSSQL_Sample) sample
* [FireDAC MySQL](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MySQL_Sample) sample
* [FireDAC SQLite](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.SQLite_Sample) sample
* [FireDAC Firebird](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Firebird_Sample) sample






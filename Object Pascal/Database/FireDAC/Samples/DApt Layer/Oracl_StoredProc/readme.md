FireDAC.OraclStoredProc Sample[]()
# FireDAC.OraclStoredProc Sample 


This sample demonstrates how to work with Oracle [stored procedures](http://docwiki.embarcadero.com/RADStudio/en/Executing_Stored_Procedures_(FireDAC)).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create table adapter](#Create_table_adapter)
* [5.2 Assign command](#Assign_command)
* [5.3 Set the DatSTable name](#Set_the_DatSTable_name)
* [5.4 Set up the SelectCommand property](#Set_up_the_SelectCommand_property)
* [5.5 Fetch rows](#Fetch_rows)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **OraclStoredProc** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DApt Layer\Oracl_StoredProc`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Oracl_StoredProc](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Oracl_StoredProc)

## Description 

The **OraclStoredProc** sample shows you how to work with Oracle [stored procedures](http://docwiki.embarcadero.com/RADStudio/en/Executing_Stored_Procedures_(FireDAC)).**Note**: This demo requires [Oracle](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Oracle_Server_(FireDAC)) Demo connection definition. See [Demo Databases](http://docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC)).
## How to Use the Sample 


1.  Navigate to the location given above and open `Ora_StoredProc.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`Ora_StoredProc.dproj``Ora_StoredProc.dpr`|The project itself.|
|`fOra_StoredProc.pas``fOra_StoredProc.fmx`|The main form.     |


## Implementation 

The sample implements the following features.
### Create table adapter 


```
  var
    oAdapt: IFDDAptTableAdapter;
    // ...
  begin
    // create table adapter
    FDCreateInterface(IFDDAptTableAdapter, oAdapt);

```



### Assign command 


```
  var
    oComm: IFDPhysCommand;
    // ...
  begin
    // ...
    with oAdapt do begin
      FConnIntf.CreateCommand(oComm);
      SelectCommand := oComm;

```



### Set the DatSTable name 

To set the DatSTable name where the rows are fetched, type the following:
```
      DatSTableName := 'StoredProc';

```



### Set up the SelectCommand property 

The **SelectCommand** property is set up by setting the following properties:
* **BaseObjectName** to set the package name.
* **CommandText** to set the procedure name.
* **Command Kind** to set the kind of content of the **CommandText** property. It is set to stored procedure with cursor.
Once the parameters are set up, the sample calls the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Prepare) method.
```
      with SelectCommand do begin
        // set package name
        BaseObjectName := 'FDQA_testpack';
        // set porcedure's name
        CommandText := 'SelectShippers';
        // we have stored procedure with cursor
        CommandKind := skStoredProcWithCrs;
        Prepare;
      end;

```



### Fetch rows 


```
      Define;
      Fetch;

```



## Uses 


* [FDCreateInterface](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Factory.FDCreateInterface)
* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [CommandText](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.CommandText)
* [CommandKind](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.CommandKind)

* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomCommand.Prepare)
*  The sample also uses some methods such as **Define** or **Fetch** of the following units:

* **FireDAC.DApt.Intf**
* **FireDAC.DApt**

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [FireDAC Data Adapter [DApt]](http://docwiki.embarcadero.com/RADStudio/en/General_(FireDAC))
* [Demo Databases (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC))
* [Using Stored Procedure-type Datasets](http://docwiki.embarcadero.com/RADStudio/en/Using_Stored_Procedure-type_Datasets)
* [Executing Stored Procedures (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Stored_Procedures_(FireDAC))
* [Connect to Oracle Server (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Oracle_Server_(FireDAC))
* [Using Oracle with FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Using_Oracle_with_FireDAC)

### Samples 


* [FireDAC DAptLayer GettingStarted](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerGettingStarted_Sample) sample
* [FireDAC DApt Layer Commands](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerCommands_Sample) sample
* [FireDAC Mapping Columns](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MappingColumns_Sample) sample






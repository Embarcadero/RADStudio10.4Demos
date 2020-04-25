FireDAC.DAptLayerGettingStarted Sample[]()
# FireDAC.DAptLayerGettingStarted Sample 


This sample shows how to work with table adapters.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create schema manager](#Create_schema_manager)
* [5.2 Create and assign DatSManager to schema adapter](#Create_and_assign_DatSManager_to_schema_adapter)
* [5.3 Create table adapter](#Create_table_adapter)
* [5.4 Map result set columns to DatSTable columns](#Map_result_set_columns_to_DatSTable_columns)
* [5.5 Create and assign command to table adapter](#Create_and_assign_command_to_table_adapter)
* [5.6 Create DatSTable to fetch result set](#Create_DatSTable_to_fetch_result_set)
* [5.7 Fetch result set](#Fetch_result_set)
* [5.8 Get DatSTable and print it](#Get_DatSTable_and_print_it)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **GettingStarted** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DApt Layer\GettingStarted`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/GettingStarted](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/GettingStarted)

## Description 

The **GettingStarted** sample implements some functionalities working with table adapters using the [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) and the [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) classes.
## How to Use the Sample 


1.  Navigate to the location given above and open `GettingStarted.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`GettingStarted.dproj``GettingStarted.dpr`|The project itself.|
|`fGettingStarted.pas``fGettingStarted.fmx`|The main form.     |


## Implementation 

The sample implements the following features related with table adapters.
### Create schema manager 

It is not required, you can create stand-alone table adapter.
```
  FDCreateInterface(IFDDAptSchemaAdapter, oSchAdapt);

```



### Create and assign DatSManager to schema adapter 

It is not required. If it is not assigned, FireDAC automatically allocates [DatSManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.DatSManager). Moreover, you may assign the already existing [DatSManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.DatSManager).
```
  var
    oSchAdapt: IFDDAptSchemaAdapter;  
  begin
    // create and assign DatSManager to schema adapter
    oSchAdapt.DatSManager := TFDDatSManager.Create;
    // ...

```



### Create table adapter 

It will handle **hippers** result set and put it into **MappedShippers**[DatSTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.DatSTable).
```
  var
    oAdapt: IFDDAptTableAdapter;
  begin
    // create table adapter
    oAdapt := oSchAdapt.TableAdapters.Add(EncodeName('Shippers'), 'MappedShippers');
    // ...

```



### Map result set columns to DatSTable columns 

It is not required. By default, FireDAC handles all result set columns using their names.
```
  oAdapt.ColumnMappings.Add('ShipperID',   'MappedShipperID');
  oAdapt.ColumnMappings.Add('CompanyName', 'MappedCompanyName');
  oAdapt.ColumnMappings.Add('Phone',       'MappedPhone');

```



### Create and assign command to table adapter 

To this end, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) and [SelectCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.SelectCommand) properties.
```
  FConnIntf.CreateCommand(oComm);
  oAdapt.SelectCommand := oComm;
  oAdapt.SelectCommand.Prepare('select * from {id Shippers}');

```



### Create DatSTable to fetch result set 

The sample uses the [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.Define) method to create a **DatSTable**.
```
  oAdapt.Define;

```



### Fetch result set 

The sample uses the [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.Fetch) method.
```
  oAdapt.Fetch(True);

```



### Get DatSTable and print it 


```
  var
    oTab: TFDDatSTable;  
  begin  
    // ...
    oTab := oAdapt.DatSTable;
    PrintRows(oTab, Console.Lines);
    // ...

```



## Uses 


* [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter)

* [DatSManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.DatSManager)

* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)

* [DatSTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.DatSTable)
* [SelectCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.SelectCommand)
* [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.Define)
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.Fetch)

* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)

### Samples 


* [FireDAC DApt Layer Commands](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerCommands_Sample) sample
* [FireDAC DAptLayer Mapping Columns](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MappingColumns_Sample) sample
* [FireDAC Oracle Stored Procedures](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.OraclStoredProc_Sample) sample
* [FireDAC Autoinc Fields](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.AutoincFields_Sample) sample






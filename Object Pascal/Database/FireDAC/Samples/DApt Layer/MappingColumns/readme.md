FireDAC.MappingColumns Sample[]()
# FireDAC.MappingColumns Sample 


This sample demonstrates how to map columns.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create table adapter](#Create_table_adapter)
* [5.2 Assign command](#Assign_command)
* [5.3 Set source result set name](#Set_source_result_set_name)
* [5.4 Set the DatSTable name](#Set_the_DatSTable_name)
* [5.5 Set the UpdateTable name](#Set_the_UpdateTable_name)
* [5.6 Set the UpdateTable name](#Set_the_UpdateTable_name_2)
* [5.7 Setup column mappings](#Setup_column_mappings)
* [5.8 Fetch rows](#Fetch_rows)
* [5.9 Update changes to RDBMS](#Update_changes_to_RDBMS)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **MappingColumns** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DApt Layer\MappingColumns`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/MappingColumns](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/MappingColumns)

## Description 

The **Commands** sample shows you how to set up column mappings.
## How to Use the Sample 


1.  Navigate to the location given above and open `MappingColumns.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`MappingColumns.dproj``MappingColumns.dpr`|The project itself.|
|`fMappingColumns.pas``fMappingColumns.fmx`|The main form.     |


## Implementation 

To set up the columns mapping, the sample implements the following steps.
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
      SelectCommand.Prepare('select * from {id FDQA_map1}');

```



### Set source result set name 


```
      SourceRecordSetName := EncodeName('FDQA_map1');

```



### Set the DatSTable name 

Set the DatSTable name where the rows are fetched.
```
      DatSTableName := 'mapper';

```



### Set the UpdateTable name 


```
      UpdateTableName := EncodeName('FDQA_map2');

```



### Set the UpdateTable name 


```
      UpdateTableName := EncodeName('FDQA_map2');

```



### Setup column mappings 


```
      ColumnMappings.Add('id1', 'num', 'id2');
      ColumnMappings.Add('name1', 'title', 'name2');

```



### Fetch rows 


```
      Define;
      Fetch;

```



### Update changes to RDBMS 

To append rows, implement the following code:
```
      for i := 0 to 9 do
        DatSTable.Rows.Add([i, 'first' + IntToStr(i)]); // Note that new rows will be added to the FDQA_map2(id2, name2) table.

```


Then, the sample updates the changes to the RDBMS.
```
      Update;

```



## Uses 

The sample uses the following units:
* **FireDAC.DApt.Intf**
* **FireDAC.DApt**

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [FireDAC Data Adapter [DApt]](http://docwiki.embarcadero.com/RADStudio/en/General_(FireDAC))
* [Demo Databases (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC))

### Samples 


* [FireDAC DAptLayer GettingStarted](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerGettingStarted_Sample) sample
* [FireDAC DApt Layer Commands](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerCommands_Sample) sample
* [FireDAC Oracle Stored Procedures](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.OraclStoredProc_Sample) sample
* [FireDAC Autoinc Fields](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.AutoincFields_Sample) sample






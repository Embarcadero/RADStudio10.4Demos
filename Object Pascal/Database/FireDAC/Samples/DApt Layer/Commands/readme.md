FireDAC.DAptLayerCommands Sample[]()
# FireDAC.DAptLayerCommands Sample 


This sample demonstrates how to use standalone table adapter to redirect inserting, deleting and updating records.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create table adapter](#Create_table_adapter)
* [5.2 Selecting data](#Selecting_data)
* [5.3 Redirect records](#Redirect_records)
* [5.4 Add new rows](#Add_new_rows)
* [5.5 Post changes to RDBMS](#Post_changes_to_RDBMS)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **Commands** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DApt Layer\Commands`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Commands](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Commands)

## Description 

The **Commands** sample shows how to redirect inserting, deleting and updating records using standalone table adapter.
## How to Use the Sample 


1.  Navigate to the location given above and open `Commands.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi               | Contains          |
|------------------------------|-------------------|
|`Commands.dproj``Commands.dpr`|The project itself.|
|`fCommands.pas``fCommands.fmx`|The main form.     |


## Implementation 

The sample implements the following standalone table adapter features.
### Create table adapter 


```
  var
    oAdapt: IFDDAptTableAdapter;
  begin
    // create table adapter
    FDCreateInterface(IFDDAptTableAdapter, oAdapt);

```



### Selecting data 


```
  with oAdapt do begin
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;
    SelectCommand.Prepare('select * from {id FDQA_map1}');
    Define;
    Fetch;
  //...

```



### Redirect records 

Redirect all record inserts into FDQA_map2 table instead FDQA_map1:
```
  FConnIntf.CreateCommand(oComm);
    InsertCommand := oComm;
    InsertCommand.CommandText := 'insert into {id FDQA_map2}(id2, name2) values(:NEW_id1, :NEW_name1)';

```


Redirect all record deletes into FDQA_map3 table instead FDQA_map1:
```
    FConnIntf.CreateCommand(oComm);
    DeleteCommand := oComm;
    DeleteCommand.CommandText := 'delete from {id FDQA_map3} where id3 = :OLD_id1';

```


Redirect all record updates into FDQA_map4 table instead FDQA_map1:
```
  FConnIntf.CreateCommand(oComm);
    UpdateCommand := oComm;
    UpdateCommand.CommandText := 'update {id FDQA_map4} set id4 = :NEW_id1, name4 = :NEW_name1 where id4 = :OLD_id1';

```



### Add new rows 


```
  for i := 0 to 4 do
      DatSTable.Rows.Add([i, 'string' + IntToStr(i)]);

```



### Post changes to RDBMS 


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


* [FireDAC DAptLayer Getting Started](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerGettingStarted_Sample) sample
* [FireDAC DAptLayer Mapping Columns](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MappingColumns_Sample) sample
* [FireDAC Oracle Stored Procedures](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.OraclStoredProc_Sample) sample
* [FireDAC Autoinc Fields](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.AutoincFields_Sample) sample






FireDAC.AutoincFields Sample[]()
# FireDAC.AutoincFields Sample 


This sample demonstrates how to implement [auto-incremental fields](http://docwiki.embarcadero.com/RADStudio/en/Auto-Incremental_Fields_(FireDAC)) using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create schema adapter](#Create_schema_adapter)
* [5.2 Add master table adapter](#Add_master_table_adapter)
* [5.3 Add detail table adapter](#Add_detail_table_adapter)
* [5.4 Add constraints to the DatSManager](#Add_constraints_to_the_DatSManager)
* [5.5 Add new row to the master table](#Add_new_row_to_the_master_table)
* [5.6 Post changes to RDBMS](#Post_changes_to_RDBMS)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **AutoincFields** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DApt Layer\Autoinc fields`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Autoinc%20fields](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DApt%20Layer/Autoinc%20fields)

## Description 

The **AutoincFields** sample shows you how to work with [auto-incremental fields](http://docwiki.embarcadero.com/RADStudio/en/Auto-Incremental_Fields_(FireDAC)) using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC). To this end, the sample uses the **TFDDatSColumn** class to control the client-side and the server-side auto-incrementing fields. Concretely, the sample uses the **TFDDatSColumn.ServerAutoIncrement** property of **TFDDatSColumn** to specify when the DBMS generates an auto-incrementing value for the new record column.
## How to Use the Sample 


1.  Navigate to the location given above and open `AutoInc.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi             | Contains          |
|----------------------------|-------------------|
|`AutoInc.dproj``AutoInc.dpr`|The project itself.|
|`fAutoInc.pas``fAutoInc.fmx`|The main form.     |


## Implementation 

The sample implements the following features.
### Create schema adapter 

To this end, the sample uses [FDCreateInterface](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Factory.FDCreateInterface). See the following code:
```
  var
    oSchAdapt:  IFDDAptSchemaAdapter;
    // ...
  begin
    // create schema adapter
    FDCreateInterface(IFDDAptSchemaAdapter, oSchAdapt);

```



### Add master table adapter 

The sample adds the master table adapter and sets some configuration properties, such as the **ServerAutoIncrement** property. See the following code:
```
  var
    oMastAdapt:  IFDDAptTableAdapter;
    // ...
  begin  
    oMastAdapt := oSchAdapt.TableAdapters.Add(EncodeName('FDQA_master_autoinc'), 'master');
    with oMastAdapt do begin
      // ...
      with DatSTable.Columns[0] do
        ServerAutoIncrement := True;
      // ...
    end
    // ...

```


**Note**: setting the **ServerAutoIncrement** property to `True` automatically assigns the **AutoIncrementSeed** and **AutoIncrementStep** properties to `-1`.
### Add detail table adapter 

The sample adds a detail table adapter and sets up some features. To this end, the sample adds the following code:
```
  var
    oDetAdapt:  IFDDAptTableAdapter;
    // ...
  begin
    // ...
    oDetAdapt := oSchAdapt.TableAdapters.Add(EncodeName('FDQA_details_autoinc'), 'details');
    with oDetAdapt do begin
      // ...
      with DatSTable.Columns[0] do
        ServerAutoIncrement := True;
      // ...
    end
    //  ...

```



### Add constraints to the DatSManager 

To this end, the sample uses the **Constraints** property of **TFDDatSTable**. See the following code:
```
  with oSchAdapt.DatSManager.Tables.ItemsS['master'] do
    Constraints.AddUK('master_pk',  'parent_id', True);
  with oSchAdapt.DatSManager.Tables.ItemsS['details'] do begin
    Constraints.AddUK('details_pk', 'child_id',  True);
    with Constraints.AddFK('details_fk_master', 'master', 'parent_id', 'fk_parent_id') do begin
      UpdateRule := crCascade;
      DeleteRule := crCascade;
      AcceptRejectRule := arCascade;
    end;
  end;

```



### Add new row to the master table 


```
  oMastRow := oMastAdapt.DatSTable.Rows.Add([Unassigned, 'Master ' + IntToStr(Random(1000000000))]); // Set Unassigned for identity fields

```



### Post changes to RDBMS 

Finally, the sample updates the changes with the **Update** method. Then, the sample uses the **Reconcile** method to obtain the error information for each record that could not be applied.
```
  oSchAdapt.Update;
  oSchAdapt.Reconcile;

```



## Uses 


* [FDCreateInterface](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Factory.FDCreateInterface)
* [TFDAutoIncField](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDAutoIncField)

* [ServerAutoIncrement](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDAutoIncField.ServerAutoIncrement)
* [AutoIncrementSeed](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDAutoIncField.AutoIncrementSeed)
* [AutoIncrementStep](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDAutoIncField.AutoIncrementStep)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [SelectCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomTableAdapter.SelectCommand)

*  The sample also uses some properties such as **Constraints** of the following unit:

* **FireDAC.DatS**

*  The sample also uses some methods such as **Update** or **Reconcile** and some properties such as **ColumnMapping** of the following units:

* **FireDAC.DApt**
* **FireDAC.DApt.Intf**

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [FireDAC Data Adapter [DApt]](http://docwiki.embarcadero.com/RADStudio/en/General_(FireDAC))
* [Auto-Incremental Fields (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Auto-Incremental_Fields_(FireDAC))

### Samples 


* [FireDAC DAptLayer GettingStarted](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerGettingStarted_Sample) sample
* [FireDAC DApt Layer Commands](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.DAptLayerCommands_Sample) sample
* [FireDAC Mapping Columns](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.MappingColumns_Sample) sample






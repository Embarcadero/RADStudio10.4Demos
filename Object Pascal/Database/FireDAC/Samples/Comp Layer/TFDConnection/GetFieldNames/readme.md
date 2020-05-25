FireDAC.GetFieldNames Sample[]()
# FireDAC.GetFieldNames Sample 


This sample shows how to populate a string list with some data from a database.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Define a connection to a database](#Define_a_connection_to_a_database)
* [5.2 Get the table names](#Get_the_table_names)
* [5.3 Get the field names](#Get_the_field_names)
* [5.4 Get the key field names](#Get_the_key_field_names)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **GetFieldNames** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDConnection\GetFieldNames`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/GetFieldNames](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/GetFieldNames)

## Description 

The **GetFieldNames** sample shows how to populate a string list with some metadata from a database. To this end, the sample uses the following methods of the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component:
* [GetTableNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetTableNames) populates a string list with the names of tables in a database.
* [GetFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetFieldNames) populates a string list with the names of fields in a table.
* [GetKeyFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetKeyFieldNames) populates a string list with the names of the key fields in a table.

## How to Use the Sample 


1.  Navigate to the location given above and open `GetFieldNames.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select a database.

*  It populates the list box component labeled as **Tables** with the names of tables contained in this database.
*  The first item of the **Tables** list is automatically selected, which fills the list box components labeled as **Fields** and **Key Fields**.
*  Click on a different item of the **Tables** list to see the list of fields and key fields contained in the selected table.

## Files 



| File in Delphi                         | Contains          |
|----------------------------------------|-------------------|
|`GetFieldNames.dproj``GetFieldNames.dpr`|The project itself.|
|`fGetFieldNames.pas``fGetFieldNames.fmx`|The main form.     |


## Implementation 

The sample implements the following database related features.
### Define a connection to a database 

To connect to a database, click on the combo box labeled as **Use Connection Definition** and choose a database.
### Get the table names 

The sample populates the list box named **lbxTables** with the name of the tables of the chosen database. The first item of the **lbxTables** list is automatically selected. To this end, the sample uses a [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox.OnClick) event and the [GetTableNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetTableNames) method. See the following code:
```
//...
dmlMainComp.dbMain.GetTableNames('', '', '', lbxTables.Items);
lbxTables.ItemIndex := 0;

```



### Get the field names 

When you select an item (a table) of the **lbxTables** list box, the sample populates the list box named **lbxFields** with the fild names contained on the selected table. To do this, the sample use an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox.OnClick) event ant the [GetFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetFieldNames) method. See the following code:
```
//...
with lbxTables do begin
  dmlMainComp.dbMain.GetFieldNames('', '', Items[ItemIndex], '', lbxFields.Items);

```



### Get the key field names 

When you select an item (a table) of the **lbxTables** list box, the sample populates the list box named **lbxKeyFields** with the key field names contained on the selected table. To do this, the sample use an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox.OnClick) event and the [GetKeyFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetKeyFieldNames) method. See the following code:
```
//...
with lbxTables do begin
  dmlMainComp.dbMain.GetKeyFieldNames('', '', Items[ItemIndex], '', lbxKeyFields.Items);

```



## Uses 


* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [GetTableNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetTableNames)
* [GetFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetFieldNames)
* [GetKeyFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.GetKeyFieldNames)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Obtaining Metadata](http://docwiki.embarcadero.com/RADStudio/en/Obtaining_Metadata)
* [Retrieving Information About a Session](http://docwiki.embarcadero.com/RADStudio/en/Retrieving_Information_About_a_Session)

### Samples 


* [FireDAC Info Report](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InfoReport_Sample) sample
* [FireDAC Pooling](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Pooling_Sample) sample
* [FireDAC Transactions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Transactions_Sample) sample






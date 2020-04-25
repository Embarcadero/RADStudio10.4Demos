FireDAC.TFDMemTable.CachedUpdates Sample[]()
# FireDAC.TFDMemTable.CachedUpdates Sample 


This sample demonstrates how to use the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) class to retrieve data from database and manage the cached updates.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **CachedUpdates** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\CachedUpdates`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/CachedUpdates](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/CachedUpdates)

## Description 

The **CachedUpdates** sample shows you how to work with the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) class. To this end, [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) retrieves data from a database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). Then, the sample uses some methods and properties of [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) in order to implement some features related with the management of [Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)).
## How to Use the Sample 


1.  Navigate to the location given above and open `CDS_CachedUpdates.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

*  Modify the tables and interact with the provided buttons.

## Files 



| File in Delphi                                 | Contains          |
|------------------------------------------------|-------------------|
|`CDS_CachedUpdates.dproj``CDS_CachedUpdates.dpr`|The project itself.|
|`fCachedUpdates.pas``fCachedUpdates.fmx`        |The main form.     |


## Implementation 

This sample uses three main components:
* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). It uses [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the desired database. In the **commandText** property of [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) there is a SQL command for selecting data from DB: `select * from {id Orders}`. You can check it on the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector).
* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter). It provides communication between the application and the database. It is a mediator between [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable).
* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). It retrieves data from database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand).
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active) property is set to `True` in order to open a dataset and read data from a database. Then, the sample displays a [table](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) is filled, you can interact with the sample. Each of the following buttons implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick) event to do what is described below:
*  The **RevertRecord** button uses the [RevertRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.RevertRecord) method to undo changes to the current record and remove it from the dataset changes log.
*  The **UndoLastChange** button uses the [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.UndoLastChange) method to undo the last modification to the dataset records and remove the change from the dataset change log.
*  The **CancelUpdates** button uses the [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelUpdates) method to remove all records from the change log and restore the dataset rows to their prior editing state.
*  The **ApplyUpdates** button uses the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates) method to apply changes for all records in the dataset change journal to the database.
**Note**: These methods may be used only when the **CachedUpdates** property is set to `True`. To check it, select the **DataSource1** object attached to the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) named **cdsOrders** and see the **CachedUpdates** property of the **DataSet** property on the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector).
## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)

* [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active)
* [RevertRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.RevertRecord)
* [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.UndoLastChange)
* [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelUpdates)
* [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates)

* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand)
* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Caching Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC))
* [Overriding Posting Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Overriding_Posting_Updates_(FireDAC))

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC Schema Adapter MemTable](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.SchemaAdapterMemTable_Sample) sample
* [FireDAC TFDMemTable Clone Cursor](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CloneCursor_Sample) sample
* [FireDAC TFDMemTable Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.Main_Sample) sample






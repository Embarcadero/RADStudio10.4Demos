FireDAC.SchemaAdapterMemTable Sample[]()
# FireDAC.SchemaAdapterMemTable Sample 


This sample demonstrates how to use the [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) class to manage the [Centralized Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)).
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

You can find the **SchemaAdapterMemTable** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDSchemaAdapter\MemTable`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDSchemaAdapter/MemTable](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDSchemaAdapter/MemTable)

## Description 

The **SchemaAdapterMemTable** sample shows you how to work with the [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) class. The sample uses some methods and properties of [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) in order to implement some features related with the management of [Centralized Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)).
## How to Use the Sample 


1.  Navigate to the location given above and open `SchemaAdapter.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

*  Modify the tables and interact with the provided buttons.

## Files 



| File in Delphi                         | Contains          |
|----------------------------------------|-------------------|
|`SchemaAdapter.dproj``SchemaAdapter.dpr`|The project itself.|
|`fSchemaAdapter.pas``fSchemaAdapter.fmx`|The main form.     |


## Implementation 

When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.Open) method is called to open all datasets associated with the schema adapter related to this connection. Then, you will see two [tables](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable), one in each [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid). Both [TDBGrids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) are used to display and manipulate records from a dataset in a tabular grid. Once the [TDBGrids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) are filled, you can interact with the sample. Each of the following buttons implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick) event to do what is described below:
*  Change or edit any data record. Then an [OnDataChange](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource.OnDataChange) event uses the [ChangeCount](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ChangeCount) property to display the number of changes in the changes log.
*  Interact with the buttons that provide the sample:

*  The **SavePoint** button uses the [SavePoint](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.SavePoint) property to return the current position in the changes log.
*  The **RevertPoint** button makes the changes log returns to the state when the value of [SavePoint](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.SavePoint) was obtained.
*  The **UndoLastChange** button uses the [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.UndoLastChange) method to cancel the last record change in the schema adapter changes log and to remove the record from the changes log.
*  The **CancelUpdates** button uses the [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.CancelUpdates) method to cancel changes for all records in this schema adapter changes log and to remove them from the changes log.
*  The **ApplyUpdates** button uses:

*  The [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ApplyUpdates) method to apply changes for all records in the centralized change journal to the database.
*  The [CommitUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.CommitUpdates) method to mark all the records in this schema adapter changes log as unmodified and to remove them from the changes log.

## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter)

* [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.Close)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.Open)
* [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.CancelUpdates)
* [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ApplyUpdates)
* [CommitUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.CommitUpdates)
* [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.UndoLastChange)
* [SavePoint](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.SavePoint)
* [ChangeCount](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ChangeCount)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

* [OnDataChange](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource.OnDataChange)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Caching Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC))
* [Overriding Posting Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Overriding_Posting_Updates_(FireDAC))

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDQuery Centralized Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.CentralizedCachedUpdates_Sample) sample






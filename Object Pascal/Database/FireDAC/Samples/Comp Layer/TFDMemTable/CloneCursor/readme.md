FireDAC.TFDMemTable.CloneCursor Sample[]()
# FireDAC.TFDMemTable.CloneCursor Sample 


This sample demonstrates how to use the [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor) method to share the data belonging to another dataset.
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

You can find the **CloneCursor** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\CloneCursor`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/CloneCursor](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/CloneCursor)

## Description 

The **CloneCursor** sample shows you how to [clone a dataset](http://docwiki.embarcadero.com/RADStudio/en/Cloning_a_Client_Dataset_Cursor). To this end, the sample uses the [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor) method of the [TFDDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet) class. Moreover, the sample uses other methods to determine whether the current record is within a specified range.
## How to Use the Sample 


1.  Navigate to the location given above and open `CDS_CachedUpdates.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

*  Click on the **CloneCursor** button to clone the dataset.
*  Modify the **Start range (OrderID)** and **End range (OrderID)** labels.
*  Click on the **CheckRange** button.

## Files 



| File in Delphi                                 | Contains          |
|------------------------------------------------|-------------------|
|`CDS_CachedUpdates.dproj``CDS_CachedUpdates.dpr`|The project itself.|
|`fCachedUpdates.pas``fCachedUpdates.fmx`        |The main form.     |


## Implementation 

This sample uses three main components:
* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). It uses [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the desired database. In the **commandText** property of [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) there is a SQL command for selecting data from database: `select * from {id Orders}`. You can check it on the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector).
* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter). It provides communication between the application and the database. It is a mediator between [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable).
* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). It retrieves data from database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). The sample uses two [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable): one for the original dataset, which is named **cdsOrders** and the other for the cloned dataset, which is named **cdsClone**.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active) property of the **cdsOrders** table is set to `True` in order to open the dataset and read data from the database. Then, the sample displays a [table](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) is filled, you can interact with the sample. Each of the following buttons implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick) event to do what is described below:
*  When you click on the **CloneCursor** button, the sample clones the **cdsOrders** table using the [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor) method and sets the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active) property of the **cdsClone** table to `True` in order to populate the table with the cloned data.
*  When you click on the **CheckRange** button, the sample uses the **Start range (OrderID)** and **End range (OrderID)** labels as the starting and ending values of the [SetRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SetRange) method. Then the sample applies the range to the **cdsClone** table using the [GotoCurrent](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.GotoCurrent) method.
*  When you click on the **CancelRange** button, the sample uses the [CancelRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelRange) to remove the current range.

## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)

* [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active)
* [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor)
* [SetRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SetRange)
* [GotoCurrent](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.GotoCurrent)
* [CancelRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelRange)

* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand)
* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Cloning a Client Dataset Cursor](http://docwiki.embarcadero.com/RADStudio/en/Cloning_a_Client_Dataset_Cursor)

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDMemTable Master Detail](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.MasterDetail_Sample) sample
* [FireDAC TFDMemTable Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.Main_Sample) sample






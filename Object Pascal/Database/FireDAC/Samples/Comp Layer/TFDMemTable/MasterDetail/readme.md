FireDAC.TFDMemTable.MasterDetail Sample[]()
# FireDAC.TFDMemTable.MasterDetail Sample 


This sample demonstrates how to set up [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
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

You can find the **MasterDetail** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\MasterDetail`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/MasterDetail](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/MasterDetail)

## Description 

The **MasterDetail** sample shows you how to set up [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets. The sample uses the master-detail relationship to automatically filter a detail dataset based on a current master dataset record. In this sample, the master dataset has "Order" records, and the detail dataset shows only lines for the current order. Moreover, the sample uses the [Mode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Mode) property of [TFDFetchOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions) to control how the result set records must be fetched into the FireDAC internal data storage. 
## How to Use the Sample 


1.  Navigate to the location given above and open `CDS_MasterDetail.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                               | Contains          |
|----------------------------------------------|-------------------|
|`CDS_MasterDetail.dproj``CDS_MasterDetail.dpr`|The project itself.|
|`fMasterDetail.pas``fMasterDetail.fmx`        |The main form.     |


## Implementation 

To set up a master-detail relationship, this sample uses the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** to configure the following components at design time as follows:
*  Two [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) objects named **cmOrders** and **cmOrderDetails**.
 Both objects uses [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the desired database. Moreover, both [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) objects use their **CommandText** property to write a SQL command to select data from a database. In order to set up a master-detail relationship, both **CommandText** properties have to be set up using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) at design time as follows:
The **CommandText** property of **cmOrders** is set to `select * from {id Orders}` in order to select "Order" records.
The **CommandText** property of **cmOrderDetails** is set to `select * from {id Order Details}` in order to select "Order Details" records.

*  Two [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) objects named **adOrders** and **adOrderDetails**.
 This component provides communication between the application and the database. The [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) object is a mediator between [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). To this end, the **SelectCommand** property of **adOrders** is set to `cmOrders` while the **SelectCommand** property of **adOrderDetails** is set to `cmOrderDetails`.
*  Two [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) objects named **cdsOrders** and **cdsOrdDetails**.
 This component retrieves data from database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). To this end, the **Adapter** property of **cdsOrders** is set to `adOrders` while the **Adapter** property of **cdsOrdDetails** is set to `adOrderDetails`.
*  Two [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) objects named **dsOrders** and **dsOrdDetails**.
 This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the datasets and the [grids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the datasets are displayed. To this end, the following properties are set up at design time using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector): 
The **DataSet** property of **dsOrders** is set to `cdsOrders` and the **DataSource** property of **DBGrid1** is set to `dsOrder`.
The **DataSet** property of **dsOrdDetails** is set to `cdsOrdDetails` and the **DataSource** property of **DBGrid2** is set to `dsOrdDetails`.

*  Both [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) objects are linked in a range based master-detail relationship, where **cdsOrders** is a master dataset and **cdsOrdDetails** is a detail dataset. To this end, the following properties of **cdsOrdDetails** are set up at design time using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector):

**MasterFields** is set to `ORDERID`.
**IndexFieldNames** is set to `ORDERID`.
**MasterSource** is set to `dsOrders`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active) properties of **cdsOrders** and **cdsOrdDetails** are set to `True` in order to open the datasets and read data from the database. Then, you will see two [tables](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable), one in each [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid). The **DBGrid1** is used to display and manipulate records from the master dataset, while the **DBGrid2** is used to display and manipulate records from the detail dataset. Once the grids are filled, you can interact with the **Fetch On Demand**[check box](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) and the **Apply updates** and **Cancel updates** buttons. These components have events attached to them to do the following:
*  The **Fetch On Demand** check box implements an OnClick event to implement an [automatic fetching](http://docwiki.embarcadero.com/RADStudio/en/Requesting_Data_from_the_Source_Dataset_or_Document#Fetch-on-demand) of records:

*  If the check box is checked, it sets the [Mode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Mode) property of **cdsOrders** and **cdsOrdDetails** to `fmOnDemand`.
*  If the check box is unchecked, it sets the [Mode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Mode) property of **cdsOrders** and **cdsOrdDetails** to `fmManual`.

*  The **Cancel updates** button uses the [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelUpdates) method to remove all records from the change log and restore both the master and the detail dataset rows to their prior editing state.
*  The **Apply updates** button uses the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates) method to apply changes for all records in both the master and the detail datasets change log to the database.

## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand)
* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [Fetching Rows (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC))
* [Fetch on Demand](http://docwiki.embarcadero.com/RADStudio/en/Requesting_Data_from_the_Source_Dataset_or_Document#Fetch-on-demand)

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDQuery Master-Detail Relationship](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.MasterDetail_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDMemTable Clone Cursor](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CloneCursor_Sample) sample
* [FireDAC TFDMemTable Incremental Fetching](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.IncFetchingMSSQL_Sample) sample
* [FireDAC TFDMemTable Nested DataSet](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.NestedDataSet_Sample) sample
* [FireDAC TFDMemTable Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.Main_Sample) sample






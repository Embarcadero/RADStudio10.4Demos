FireDAC.TFDQuery.Blobs Sample[]()
# FireDAC.TFDQuery.Blobs Sample 


This sample shows the [support for BLOB (Binary Large Object) streaming in FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC) using the [CreateBlobStream](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CreateBlobStream) method of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
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

You can find the **Blobs** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\Blobs`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Blobs](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Blobs)

## Description 

The **Blobs** sample shows you how to create a BLOB stream for reading and/or writing the value of a specific [BLOB field](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField) on a specific record. To this end, the sample uses the [CreateBlobStream](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CreateBlobStream) method of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to create a read-only BLOB stream. In this sample, the BLOB stream is used to read the picture contained on each [BLOB field](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField) of each record of the **Categories** table.
## How to Use the Sample 


1.  Navigate to the location given above and open `Blobs.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi         | Contains          |
|------------------------|-------------------|
|`Blobs.dproj``Blobs.dpr`|The project itself.|
|`fBlobs.pas``fBlobs.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qCategories**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to specify the FireDAC connection object that is used to connect to a DBMS.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property to `select * from {id Categories}`. It specifies the SQL statement to execute for the query.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **dsCategories**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the following setup is needed:

*  The **DataSet** property of **dsCategories** is set to `qCategories`.
*  The **DataSource** property of **DBGrid1** is set to `dsCategories`.

*  A [TDBMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBMemo) object named **DBMemo1**. This component is used to display the **Description** field of the dataset. The following setup is needed:

*  Set the **DataSource** property of **DBMemo1** to `dsCategories`.
*  Set the **DataField** property of **DBMemo1** to `Description`.
When you run the application, the sample uses the [CreateBlobStream](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CreateBlobStream) method of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) with its mode set to `bmRead` in order to create a read-only BLOB stream. The BLOB stream is used to read the picture contained on the [BLOB field](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField) of each record. Click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qCategories** in order to execute the SQL statement that retrieves the **Categories** table from the database. Then, the sample displays the **Categories** table using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample in the following ways:
*  Click on any record of the **DBGrid1**. The **Description** field of this record will be displayed on the **DBMemo1**. Moreover, the **Picture** field of the record is displayed on the **Image1** component using the [LoadFromStream](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap.LoadFromStream) method.
*  Use the [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator) object to [view and manipulate records](http://docwiki.embarcadero.com/RADStudio/en/Navigating_and_Manipulating_Records). To this end, the database navigator is linked with the **dsCategories** dataset by setting the **DataSource** property of **DBNavigator1** to `dsCategories`.
*  Click on the **Clear Picture** button to clear the picture of the current record. To this end the sample uses the [Clear](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TField.Clear) method.
*  Click on the **Save Picture** button to save the picture contained on the BLOB field to a file. To this end, the sample uses the [SaveToFile](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField.SaveToFile) method and the [TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.TSaveDialog) object.
*  Click on the **Load Picture** button to load a picture from a file into the BLOB field of the current record. To this end, the sample uses the [LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField.LoadFromFile) method and the [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.TOpenDialog) object.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open)
* [CreateBlobStream](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CreateBlobStream)
* [Clear](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TField.Clear)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [TDBMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBMemo)
* [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator)
* [TBlobField](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField)

* [SaveToFile](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField.SaveToFile)
* [LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobField.LoadFromFile)

* [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage)

* [LoadFromStream](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap.LoadFromStream)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))
* [Navigating and Manipulating Records](http://docwiki.embarcadero.com/RADStudio/en/Navigating_and_Manipulating_Records)
* [support for BLOB streaming in FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC)

### Samples 


* [FireDAC TFDQuery BlobStreams](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.BlobStreams_Sample) Sample






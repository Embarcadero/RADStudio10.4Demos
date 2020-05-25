FireDAC.TFDMemTable.Main Sample[]()
# FireDAC.TFDMemTable.Main Sample 


This sample demonstrates how to use the main functionalities of the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) class.
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

You can find the **Main** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\Main`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/Main](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/Main)

## Description 

The **Main** sample shows you how to use different database functionalities related with the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) class. To this end, the sample uses different properties and methods of the cited class. The following dataset features are implemented:
* [Save](http://docwiki.embarcadero.com/RADStudio/en/Saving_Data_to_a_File_or_Stream) a dataset data to a file.
* [Load](http://docwiki.embarcadero.com/RADStudio/en/Loading_Data_from_a_File_or_Stream) a dataset data from a file.
* [Modify the fields](http://docwiki.embarcadero.com/RADStudio/en/Displaying,_Converting,_and_Accessing_Field_Values) and the indexes of the fields in a dataset.
*  Define the client-side [aggregating](http://docwiki.embarcadero.com/RADStudio/en/Calculated_and_Aggregated_Fields_(FireDAC)) formulas.
* [Filter](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC)) a dataset to search for specific records.
*  Set the beginning and ending [range values](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC)#Filtering_by_Range_of_Values) for the dataset and apply the range.
* [Clone](http://docwiki.embarcadero.com/RADStudio/en/Cloning_a_Client_Dataset_Cursor) a dataset.

## How to Use the Sample 


1.  Navigate to the location given above and open `CDS_main.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi               | Contains          |
|------------------------------|-------------------|
|`CDS_main.dproj``CDS_main.dpr`|The project itself.|
|`fMainDemo.pas``fMainDemo.fmx`|The main form.     |


## Implementation 

The goal of this sample is to show how to implement different functionalities related with the [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) class. To this end, the sample first configures the main components:
*  A [TFDTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTable) object named **FDTable1**
 This component is used to browse a database table and edit its records. To this end, the **ConnectionName** property is set to `SQLite_Demo` using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** at design time.
*  A [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) object named **MT**.
 This component retrieves data from database through [TFDTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTable). To this end, the sample implements a **FormCreate** event that uses the [CopyDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CopyDataSet) method to copy on run time the records from **FDTable1** to **MT**.
*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**.
 This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `MT` and the **DataSource** property of **DBGrid1** is set to `DataSource1`. This set up is done at design time using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector).When you run the application, you see a [multiple page dialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TPageControl) and a [table](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) displayed on **DBGrid1**. The grid is used to display and manipulate records from **MT**. Once the grid is filled, you can interact with the sample by using the features that are implemented in each tab:
* **Content**
 This tab uses the following four buttons to implement some [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) features:
*  The **Save to file** button uses the [SaveToFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SaveToFile) method to save the dataset data to an external file for later use by this or other datasets.
*  The **Load from file** button uses the [LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.LoadFromFile) method to populate the dataset with data stored in an external file. The data is not moved to a database, it is just loaded into a dataset in-memory storage.**Note**: Both methods could work with three different file format: `binary`, `XML` and `JSON`. The cited methods can work with the three file formats adding the following objects to the form: [TFDStanStorageXMLLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageXML.TFDStanStorageXMLLink), [TFDStanStorageJSONLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink) and [TFDStanStorageBinLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageBin.TFDStanStorageBinLink).
*  The **Reset** button sets the [Active](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Active) property of **MT** to `False` and clears the **Fields**, the **Indexes** and the **Aggregates** of the dataset.
*  The **Get SQLite Customers** button [opens](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTable.Open) the **FDTable1** and uses the [CopyDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CopyDataSet) method to copy the records from **FDTable1** to **MT**.

* **Fields**
 This tab shows the lists of all [non-aggregate field components](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Fields) of the dataset. Moreover, the tab implements other functionalities related to the fields.
* **Indexes**
 This tab shows the list of all client [indexes](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Indexes) that apply to the dataset. Moreover, the tab uses different labels and buttons to implement other indexes related features.
* **Aggregates**
 The sample implements this tab to **Add**, **Delete** or **Modify** aggregate fields to the collection of client-side [aggregates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Aggregates) defined for the dataset.
* **Filter**
 This tab uses the **Filter** label to specify the text of the current filter for a dataset. For example: type `country='Spain'` in the label and then check the **Active** check box to see displayed only those records that meet the **Country** field condition.
* **Ranges**
 This tab implements four buttons to set and edit the starting and ending values of a range. Moreover, it also implements two more buttons to apply or clear the range. To this end the sample uses the following properties attached to the corresponding button: [SetRangeStart](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SetRangeStart), [EditRangeStart](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.EditRangeStart),[SetRangeEnd](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SetRangeEnd), [EditRangeEnd](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.EditRangeEnd), [ApplyRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyRange) and [CancelRange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelRange). Perform the following steps to apply a range:
*  Click on the **SSt** button.
*  Type the **CustomerID** field of the starting value of your range.
*  Click on the **SEn** button.
*  Type the **CustomerID** field of the ending value of your range.
*  Click on the **Apply** button.

* **Clone**
 The clone tab is used to clone the **MT** table using the [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor) method. Moreover, the **reset** and **KeepSettings** check boxes are used to determine the `AReset` and `AKeepSettings` parameters of [CloneCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CloneCursor).
## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [TFDTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTable)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TFDStanStorageXMLLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageXML.TFDStanStorageXMLLink)
* [TFDStanStorageJSONLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink)
* [TFDStanStorageBinLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageBin.TFDStanStorageBinLink)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))

* [Sorting Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Sorting_Records_(FireDAC))
* [Finding a Record (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Finding_a_Record_(FireDAC))
* [Writing Expressions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Writing_Expressions_(FireDAC))
* [Filtering Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC))
* [Sorting Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Sorting_Records_(FireDAC))
* [Calculated and Aggregated Fields (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Calculated_and_Aggregated_Fields_(FireDAC))

* [Working with Field Component Methods at Runtime](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Field_Component_Methods_at_Runtime)
* [Displaying, Converting, and Accessing Field Values](http://docwiki.embarcadero.com/RADStudio/en/Displaying,_Converting,_and_Accessing_Field_Values)

* [Accessing Field Values with the Default Dataset Property](http://docwiki.embarcadero.com/RADStudio/en/Accessing_Field_Values_with_the_Default_Dataset_Property)
* [Accessing Field Values with a Dataset's Fields Property](http://docwiki.embarcadero.com/RADStudio/en/Accessing_Field_Values_with_a_Dataset%27s_Fields_Property)
* [Accessing Field Values with a Dataset's FieldByName Method](http://docwiki.embarcadero.com/RADStudio/en/Accessing_Field_Values_with_a_Dataset%27s_FieldByName_Method)

* [Displaying and Editing a Subset of Data Using Filters](http://docwiki.embarcadero.com/RADStudio/en/Displaying_and_Editing_a_Subset_of_Data_Using_Filters)
* [Cloning a Client Dataset Cursor](http://docwiki.embarcadero.com/RADStudio/en/Cloning_a_Client_Dataset_Cursor)
* [TFDMemTable Questions](http://docwiki.embarcadero.com/RADStudio/en/TFDMemTable_Questions)

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDMemTable Clone Cursor](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CloneCursor_Sample) sample
* [FireDAC TFDMemTable Master-Detail Relationship](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.MasterDetail_Sample) sample
* [FireDAC TFDMemTable Nested DataSet](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.NestedDataSet_Sample) sample
* [FireDAC TFDTableAdapter Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDTableAdapter.Main_Sample) sample






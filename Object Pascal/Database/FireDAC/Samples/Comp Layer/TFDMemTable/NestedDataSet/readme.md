FireDAC.TFDMemTable.NestedDataSet Sample[]()
# FireDAC.TFDMemTable.NestedDataSet Sample 


This sample demonstrates how to store data in a [nested dataset](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Dataset_Fields#Accessing_data_in_a_nested_dataset) using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
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

You can find the **NestedDataSet** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable\NestedDataSet`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/NestedDataSet](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDMemTable/NestedDataSet)

## Description 

The **NestedDataSet** sample shows you how to set a [nested dataset](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Dataset_Fields#Accessing_data_in_a_nested_dataset) in a dataset field . To this end, the sample uses the [NestedDataSet](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSetField.NestedDataSet) property. Moreover, the sample implements the following functionalities that are attached to three different button events:
*  Copy the dataset data to another [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable).
*  Save the dataset data to a file.
*  Read the dataset data from a file.

## How to Use the Sample 


1.  Navigate to the location given above and open `NestedDataSet.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                         | Contains                |
|----------------------------------------|-------------------------|
|`NestedDataSet.dproj``NestedDataSet.dpr`|The project itself.      |
|`fNested.pas``fnested.fmx`              |The main form.           |
|`fNestedCopy.pas``fnestedCopy.fmx`      |The copied datasets form.|


## Implementation 

The goal of this sample is to demonstrate how to set [nested datasets](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Dataset_Fields#Accessing_data_in_a_nested_dataset) in dataset fields. To this end, the sample implements the following steps at run time:
*  The sample uses a [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) object named **FDMemTable1** to implement an in-memory dataset. Therefore, **FDMemTable1** manages data in the client memory. The sample defines **FDMemTable1** as follows:

1.  The sample uses the [AddFieldDef](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TFieldDefs.AddFieldDef) method to add field definitions to **FDMemTable1**. The sample adds three fields named: **f1**, **f2** and **f3**. The sample configures the **f1** field with the [TFieldType](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TFieldType) set to `ftInteger`. Moreover, the [TFieldType](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TFieldType) property of **f2** is set to `ftString` and the **f3** field is set to `ftDataSet`, which means that this field contains a nested dataset.
2.  The sample adds two child fields to the **f3** and names them as: **f31** and **f32**. Both child fields are configured with the [TFieldType](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TFieldType) set to `ftInteger`.

*  The sample fills **FDMemTable1** using the [Append](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Append) method with 100 records as follows:

1. **f1** is set to integer values from 1 to 100.
2. **f2** is set to string values from qqq1 to qqq100.
3. **f3** is filled by nested datasets, each consisting of two records. The sample uses the [NestedDataSet](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSetField.NestedDataSet) property to store data in each nested dataset.
When you run the application, you see a [table](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) displayed in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid). The grid is used to display and manipulate records from **FDMemTable1**. Once the grid is filled, you can interact with the sample. Each of the following buttons implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick) event to do what is described below:
*  The **Save to file** button uses the [SaveToFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SaveToFile) method to save the dataset data to an external file for later use by this or other datasets.
*  The **Read file** button uses the [LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.LoadFromFile) method to populate the dataset with data stored in an external file. The data is not moved to a database, it is just loaded into a dataset in-memory storage.
**Note**: Both methods could work with three different file formats: `binary`, `XML` and `JSON`. The cited methods can work with the three file formats adding the following objects to the form: [TFDStanStorageXMLLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageXML.TFDStanStorageXMLLink), [TFDStanStorageJSONLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink) and [TFDStanStorageBinLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageBin.TFDStanStorageBinLink).
*  The **Show copy** button copies the datasets from **FDMemTable1** to **FDMemTable2** and uses the [ShowModal](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TCustomForm.ShowModal) property to show the copied dataset on the grid of the **fNestedCopy** form.
**Note**: The [ShowModal](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TCustomForm.ShowModal) property shows the **fNestedCopy** form as a modal form, which means that the application cannot continue to run until the modal form is closed.
## Uses 


* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)

* [AddFieldDef](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TFieldDefs.AddFieldDef)
* [SaveToFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.SaveToFile)
* [LoadFromFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.LoadFromFile)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

* [Append](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Append)
* [NestedDataSet](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSetField.NestedDataSet)

* [ShowModal](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TCustomForm.ShowModal)
* [TFDStanStorageXMLLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageXML.TFDStanStorageXMLLink)
* [TFDStanStorageJSONLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink)
* [TFDStanStorageBinLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageBin.TFDStanStorageBinLink)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Nested dataset](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Dataset_Fields#Accessing_data_in_a_nested_dataset)

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDMemTable Clone Cursor](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CloneCursor_Sample) sample
* [FireDAC TFDMemTable Master-Detail Relationship](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.MasterDetail_Sample) sample
* [FireDAC TFDMemTable Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.Main_Sample) sample






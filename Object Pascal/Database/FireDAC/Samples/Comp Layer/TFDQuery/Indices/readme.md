FireDAC.TFDQuery.Indices Sample[]()
# FireDAC.TFDQuery.Indices Sample 


This sample demonstrates how to use the index related features of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) in order to [define views](http://docwiki.embarcadero.com/RADStudio/en/Sorting_Records_(FireDAC)#Dataset_Views) of the dataset records.
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

You can find the **Indices** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\Indices`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Indices](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Indices)

## Description 

The **Indices** sample shows you how to use the [Indexes](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Indexes) property of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) in order to specify a collection of indexes at design time and determine the data view of each index, including a sort order of the records. Moreover, you can sort the records on a specific field using the [IndexFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.IndexFieldNames) property. Click on a grid column title to sort its records at run time.
## How to Use the Sample 


1.  Navigate to the location given above and open `Indices.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.
4.  Interact with the sample:

*  Click on the **OrderBy** combo box and select an option.
*  Click on any column title.

## Files 



| File in Delphi             | Contains          |
|----------------------------|-------------------|
|`Indices.dproj``Indices.dpr`|The project itself.|
|`fIndices.pas``fIndices.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryMain**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to specify the FireDAC connection object that is used to connect to a DBMS.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property to `select * from {id Orders}`. It specifies the SQL statement to execute for the query.
*  Set the [Indexes](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Indexes) property to define a collection of indexes with different properties. The sample configures five predefined views of the dataset records:

*  The **Indexes[0]** implements a sorting of records by the **CustormerID**[field](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDIndex.Fields).
*  The **Indexes[1]** implements a [case-insensitive sorting](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDIndex.CaseInsFields) of records by the **ShipName** field.
*  The **Indexes[2]** sorts the records by the **CustomerID** field in [descending order](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDIndex.DescFields).
*  The **Indexes[3]** applies the [filter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDIndex.Filter)`EmployeeID=8` to the dataset and then sorts the records by the **CustormerID** field.
*  The **Indexes[4]** sorts the records using the [expression](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDIndex.Expression)`year(orderDate)`.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `qryMain` and the **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryMain** in order to execute the SQL statement that retrieves the "Orders" table from the database. Then, the sample displays the "Orders" table using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample in the following ways:
1.  Choose a predefined index from the **OrderBy** combo box to set the predefined view of the dataset records.
2.  Click on a grid column title to sort its records:

*  One click sorts the records in an ascending order.
*  If the records are sorted in an ascending order and you click again, the sample sorts the records in a descending order.
*  If the records are sorted in a descending order, click again to undo the sorting of the dataset records.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Indexes](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Indexes)
* [IndexFieldNames](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.IndexFieldNames)
* [IndexName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.IndexName)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))

* [Sorting Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Sorting_Records_(FireDAC))
* [Filtering Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC))
* [Writing Expressions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Writing_Expressions_(FireDAC))

### Samples 


* [FireDAC TFDQuery Filter](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Filter_Sample) sample






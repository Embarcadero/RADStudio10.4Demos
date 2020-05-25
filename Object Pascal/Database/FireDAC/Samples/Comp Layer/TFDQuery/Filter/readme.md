FireDAC.TFDQuery.Filter Sample[]()
# FireDAC.TFDQuery.Filter Sample 


This sample demonstrates how to use the filter feature of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
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

You can find the **Filter** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\Filter`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Filter](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Filter)

## Description 

The **Filter** sample shows you how to use the [Filter](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Filter) property of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to specify a dataset filter. To this end, the sample implements different preset filters. Moreover, you can edit your own filtering condition and [apply the filter to a dataset](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC)) in order to search for specific records.**Note**: When filtering is applied to a dataset, only those records that meet the filtering conditions are available. The [Filter](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Filter) property describes the filtering condition.
## How to Use the Sample 


1.  Navigate to the location given above and open `Filter.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi           | Contains          |
|--------------------------|-------------------|
|`Filter.dproj``Filter.dpr`|The project itself.|
|`fFilter.pas``fFilter.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryWithFilter**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to specify the FireDAC connection object that is used to connect to a DBMS.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property to `select * from {id Orders}`. It specifies the SQL statement to execute for the query.
*  Set the [Filtered](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Filtered) property to `True` in order to active the filtering for the dataset.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `qryWithFilter`, and the **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryWithFilter** in order to execute the SQL statement that retrieves the "Orders" table from the database. Then, the sample displays the "Orders" table using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample in the following ways:
1. **Set a filter**. Type your filter condition on the edit box and click on the **Set** button to apply the filter to the current dataset. For example: type `ShipCountry='Spain'` and press **Set** in order to see the records from the "Orders" table whose **ShipCountry** field is set to `Spain`.
2. **Use a preset filter**. Click on the other buttons to see the results for different preset filters. For example: click on the **Using BETWEEN** button to see the records whose **OrderID** field is set between `10270` and `10280`.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Filter](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Filter)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))

* [Filtering Records (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Filtering_Records_(FireDAC))

* [Displaying and Editing a Subset of Data Using Filters](http://docwiki.embarcadero.com/RADStudio/en/Displaying_and_Editing_a_Subset_of_Data_Using_Filters)

* [Enabling and Disabling Filtering](http://docwiki.embarcadero.com/RADStudio/en/Enabling_and_Disabling_Filtering)
* [Creating Filters](http://docwiki.embarcadero.com/RADStudio/en/Creating_Filters)

* [Setting the Filter Property](http://docwiki.embarcadero.com/RADStudio/en/Setting_the_Filter_Property)

* [Navigating Records in a Filtered Dataset](http://docwiki.embarcadero.com/RADStudio/en/Navigating_Records_in_a_Filtered_Dataset)

### Samples 


* [FireDAC TFDQuery Aggregates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Aggregates_Sample) sample
* [FireDAC TFDQuery Indices](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Indices_Sample) sample
* [FireDAC TFDQuery Macros](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Macros_Sample) sample






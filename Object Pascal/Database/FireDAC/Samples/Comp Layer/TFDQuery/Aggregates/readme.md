FireDAC.TFDQuery.Aggregates Sample[]()
# FireDAC.TFDQuery.Aggregates Sample 


This sample demonstrates how to define the client-side aggregating formulas with [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
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

You can find the **Aggregates** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\Aggregates`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Aggregates](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Aggregates)

## Description 

The **Aggregates** sample shows you how to use the [Aggregates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Aggregates) property of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to define the client-side aggregating formulas. To this end, the sample implements different preset aggregate expressions that contains the following aggregating functions: `AVG` , `SUM` and `MAX`. Moreover, you can edit your own aggregate expressions and apply them to the records of a dataset in order to evaluate the expression.
## How to Use the Sample 


1.  Navigate to the location given above and open `Aggregates.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                   | Contains          |
|----------------------------------|-------------------|
|`Aggregates.dproj``Aggregates.dpr`|The project itself.|
|`fAggregates.pas``fAggregates.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryAggregates**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to specify the FireDAC connection object that is used to connect to a DBMS.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property to `select * from {id Orders}`. It specifies the SQL statement to execute for the query.
*  Edit the [Aggregates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Aggregates) property with 4 aggregate expressions:

1. `AVG(Freight)`
2. `SUM(Freight)`
3. `MAX(OrderID)`
4.  Typed by the user using the edit box.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `qryAggregates` and the **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryAggregates** in order to execute the SQL statement that retrieves the "Orders" table from the database. Then, the sample displays the "Orders" table using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample in the following ways:
1. **Set an aggregate expression**. Type your own aggregate expression on the **Try** edit box and press **Enter** for evaluation. For example: type `MAX(Freight)` and press **Enter** to see the maximum value of the **Freight** field on the **Result** edit box.
2. **Preset aggregate expressions**. See the evaluation of the preset aggregate expressions.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Aggregates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Aggregates)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))

* [Calculated and Aggregated Fields (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Calculated_and_Aggregated_Fields_(FireDAC))
* [Writing Expressions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Writing_Expressions_(FireDAC))

### Samples 


* [FireDAC TFDQuery Filter](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Filter_Sample) sample






FireDAC.TFDQuery.Async Sample[]()
# FireDAC.TFDQuery.Async Sample 


This sample shows you how to configure the [ResourceOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ResourceOptions).[CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to control the [asynchronous execution mode](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC)) using FireDAC.
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

You can find the **Async** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\ExecSQL\Async`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/Async](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/Async)

## Description 

The **Async** sample demonstrates how to configure the [ResourceOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ResourceOptions).[CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to configure the different SQL command execution modes. To this end, the sample implements three buttons that execute three [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) statements with different execution modes: `amBlocking`, `amCancelDialog`, and `amAsync`.**Note**: See [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) to notice the difference between the execution modes.
## How to Use the Sample 


1.  Navigate to the location given above and open `Async.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi         | Contains          |
|------------------------|-------------------|
|`Async.dproj``Async.dpr`|The project itself.|
|`fAsync.pas``fAsync.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryExecSQL**. This component is used to implement a dataset capable of executing SQL queries. The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is configured to specify the FireDAC connection object that is used to connect to a DBMS.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the following properties are set:

*  The **DataSet** property of **DataSource** is set to `qryExecSQL`.
*  The **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryProducts** to execute the SQL statement that retrieves the datasets from the database. Then, the sample displays the data from the datasets using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample by clicking on the different buttons. Each button implements a on click event to do the following:
*  The **Exec sql comand** button. This button implements an event that:

1.  Sets the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) command to `'delete from {id Orders} where OrderID > 1000000'`.
2.  Calls the [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL) method to execute the SQL query.**Note**: The default execution mode is `amBlocking`.

*  The **Execute/Open with CancelDialog** button. This button implements an event that:

1.  Sets the [ResourceOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ResourceOptions).[CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property of **qryExecSQL** to `amCancelDialog`.**Note**: With this execution mode, FireDAC shows a dialog with a **Cancel** button that allows to cancel the action.
2.  Sets the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) command to `'select count(*) from {id Order Details} a, {id Order Details} b group by a.OrderID'`.
3.  Calls the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method to execute the SQL statement.

*  The **Async executing/opening** button. This button implements an event that:

1.  Sets the [ResourceOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ResourceOptions).[CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property of **qryExecSQL** to `amAsync`.**Note**: With the `amAsync` execution mode, the application can get a notification about the termination of the action by using the appropriate event handler or callback. This sample uses an [AfterOpen](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.AfterOpen) event.
2.  Sets the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) command to `'select count(*) from {id Order Details} a, {id Order Details} b group by a.OrderID'`.
3.  Calls the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method to execute theSQL statement.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL)
* [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open)
* [AfterOpen](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.AfterOpen)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Asynchronous Execution (FireDAC)|](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC))
* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))

### Samples 


* [FireDAC TFDQuery Batch](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Batch_Sample) sample
* [FireDAC IFDPhysCommand Async](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.Async_Sample) sample






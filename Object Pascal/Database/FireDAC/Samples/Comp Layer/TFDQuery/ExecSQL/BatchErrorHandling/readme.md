FireDAC.TFDQuery.BatchErrorHandling Sample[]()
# FireDAC.TFDQuery.BatchErrorHandling Sample 


This sample demonstrates two ways of [handling errors](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)#Error_handling) in an [array DML execution](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)).
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

You can find the **BatchErrorHandling** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\ExecSQL\BatchErrorHandling`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/BatchErrorHandling](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/BatchErrorHandling)

## Description 

The **BatchErrorHandling** sample shows you how to handle errors when executing SQL [Command Batches](http://docwiki.embarcadero.com/RADStudio/en/Command_Batches_(FireDAC)) to execute multiple SQL commands. To this end, the sample implements two ways of handling the errors:
1.  Implementing an [OnError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.OnError) event.
2.  Using the [EFDDBEngineException](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBEngineException) class on a loop.

## How to Use the Sample 


1.  Navigate to the location given above and open `BatchErrorHandling.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                   | Contains          |
|--------------------------------------------------|-------------------|
|`BatchErrorHandling.dproj``BatchErrorHandling.dpr`|The project itself.|
|`Unit1.pas``unit1.fmx`                            |The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **FDConnection1**. This is FireDAC connection object that the sample uses to connect to a DBMS. The sample sets the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property to `Oracle_Demo`.

*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **FDQuery1**. This component implements a dataset capable of executing SQL queries. To this end, the sample configures the following properties of the object:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `FDConnection1` in order to specify the FireDAC connection object.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **FDQuery1** is set to `insert into batch_demo values (:id, :name)`.
When you run the application, you see two buttons labeled as: **Using handler** and **Using loop**. Both buttons implement two different ways of handling errors when executing SQL [Command Batches](http://docwiki.embarcadero.com/RADStudio/en/Command_Batches_(FireDAC)). Click on any of the buttons to execute the corresponfing error handling technique. Both error handling techniques are implemented as follows: Using handler The sample uses the [OnError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.OnError) event of **FDQuery1**. This event fires when an error happens while the dataset is communicating with a DBMS. The event checks if the `AException` parameter is an instance of [EFDDBArrayExecuteError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBArrayExecuteError). Then, the sample uses the [Offset](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBArrayExecuteError.Offset) and [Action](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBArrayExecuteError.Action) properties of [EFDDBArrayExecuteError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBArrayExecuteError) to fix the error.**Note**: After the execution, the property [RowsAffected](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.RowsAffected) of **FDQuery1** shows the number of successful executions. Using loop The sample uses the [Errors](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBEngineException.Errors) property of the [EFDDBEngineException](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBEngineException) class to read [TFDDBError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.TFDDBError) objects, where each object corresponds to an error, warning, or message returned by a DBMS. This property is used in a loop in order to fix all the errors of the parameters array.
## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL)
* [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL)
* [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute)
* [OnError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.OnError)
* [RowsAffected](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.RowsAffected)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [EFDDBArrayExecuteError](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBArrayExecuteError)

* [Errors](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Error.EFDDBEngineException.Errors)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))
* [Command Batches (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Command_Batches_(FireDAC))
* [Array DML (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC))

### Samples 


* [FireDAC TFDQuery Async](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Async_Sample) sample
* [FireDAC TFDQuery Batch](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Batch_Sample) sample
* [FireDAC TFDQuery Array DML](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.ArrayDML_Sample) sample






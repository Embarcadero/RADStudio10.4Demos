FireDAC.TFDQuery.ArrayDML Sample[]()
# FireDAC.TFDQuery.ArrayDML Sample 


This sample demonstrates how to use [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) in FireDAC and compares its performance for different aray sizes.
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

You can find the **ArrayDML** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\ExecSQL\ArrayDML`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/ArrayDML](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/ArrayDML)

## Description 

The **ArrayDML** sample shows you how to use [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) to execute multiple SQL INSERT commands in a single step to optimize database population performance. The sample also compares the Array DML performance for different array sizes.
## How to Use the Sample 


1.  Navigate to the location given above and open `FireDACArrayDML.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                             | Contains          |
|--------------------------------------------|-------------------|
|`FireDACArrayDML.dproj``FireDACArrayDML.dpr`|The project itself.|
|`fMain.pas``fMain.fmx`                      |The main form.     |


## Implementation 

Instead of configuring the main components of this sample at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**, this sample configures the setup of the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) and the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) in run time. When you run the application, you see the following components on the form:
*  A [memo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object.
*  Two [edit](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TEdit) objects named **DML ArraySize** and **No of Records**. The default value of both objects is `100` and `100000`, respectively.
*  A [check box](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) object labeled as **Use Transactions**. It is unchecked by default.
*  Three [buttons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) objects labeled as **Run Single Test**, **Run Array Size Test**, and **Delete all Rows**.
Once the sample is running, you can interact with the sample by changing the edit boxes or clicking on the aforementioned buttons:
*  Click on the **Run Single Test** button to run an [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) test code using the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute) method in [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) mode. To this end, the sample takes the length of the DML array from the value of the **DML ArraySize** edit object. Using the default values of the edit boxes, the sample runs the test for `100000` records using chunks, where each chunk is a DML array of length `100`. This mean that for each DML array, the test executes `100` SQL `INSERT` commands in a single step in order to optimize database population performance. Moreover, as it is done for `100000` records, the sample uses `1000` DML arrays. To implement the test, the sample configures the following:

*  The connection is set to an Oracle demo database.**Note**: Change the connection parameters according to your environment. For further details, see [Database Connectivity (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Database_Connectivity_(FireDAC)).
*  The `INSERT` command is the following: `'insert into {id FDQA_Batch_test}(tint, tstring) values(:f1, :f2)'`.
*  If you check the **Use Transactions** check box, the sample uses:

*  The [StartTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.StartTransaction) method to start the database transaction before [executing](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute) the `INSERT` command.
*  The [Commit](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Commit) method to permanently store the modifications made by the `INSERT` command execution.

*  Click on the **Run Array Size Test** button to launch a loop that executes nine times the previous test. Each execution uses a different DML array length. The lengths are the following: `1`, `2`, `5`, `10`, `50`,`100`, `500`, `1000`, `5000` and `10000`.
*  Click on the **Delete all Rows** button to delete all the records from the test table. To this end, the sample uses the [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ExecSQL) method with the following `DELETE` command: `'delete from {id FDQA_Batch_test}'`.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL)
* [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

* [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ExecSQL)
* [StartTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.StartTransaction)
* [Commit](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Commit)

* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TEdit)
* [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))
* [Command Batches (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Command_Batches_(FireDAC))
* [Array DML (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC))

### Samples 


* [FireDAC TFDQuery Async](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Async_Sample) sample
* [FireDAC TFDQuery Batch](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Batch_Sample) sample
* [FireDAC TFDQuery Batch Error Handling](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.BatchErrorHandling_Sample) sample
* [FireDAC IFDPhysCommand Batch](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.Batch_Sample) sample






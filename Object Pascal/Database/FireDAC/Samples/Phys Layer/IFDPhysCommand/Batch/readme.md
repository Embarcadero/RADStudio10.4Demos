FireDAC.IFDPhysCommand.Batch Sample[]()
# FireDAC.IFDPhysCommand.Batch Sample 


This sample demonstrates the use of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to implement the [Array DML execution](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) technique in FireDAC.
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

You can find the **Batch** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysCommand\Batch`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Batch](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Batch)

## Description 

The **Batch** sample shows you how to use the [Array DML execution](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) technique to execute multiple SQL `INSERT` commands in a single step to optimize database population performance. To this end, the sample uses the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to set an array of values for each parameter and the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) method in [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) mode to populate the database in a single step.**Note**: In this demo the "batch" and "Array DML" terms are interchangeable.
## How to Use the Sample 


1.  Navigate to the location given above and open `IFDPhys_Batch.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                         | Contains          |
|----------------------------------------|-------------------|
|`IFDPhys_Batch.dproj``IFDPhys_Batch.dpr`|The project itself.|
|`fBatch.pas``fBatch.fmx`                |The main form.     |


## Implementation 

When you run the application, you see the following components on the form:
*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) object labeled as **Insert blobs**. It is unchecked by default. This sample executes multiple SQL `INSERT` commands. First, the sample executes the SQL `INSERT` commands using an ordinary execution mode. Then, the sample executes the SQL statements using an [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) execution mode. The state of the **Insert blobs** check box changes the SQL statement:

*  If **Insert blobs** is unchecked, the SQL statement is set to `'insert into {id FDQA_Batch_test}(tint, tstring) values(:f1, :f2)'`.
*  If **Insert blobs** is checked, the SQL statement is set to `'insert into {id FDQA_Batch_test}(tint, tstring, tblob) values(:f1, :f2, :f3)'`.

*  A [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) object named **Records to insert**. This label represents the number of SQL `INSERT` commands that are executed in a single step. The preset value is `10000`.
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. When you click the **Use Connection Definition** combo box, the menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. Select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. When the connection is defined, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command interface. Then, the sample uses this command interface to execute multiple SQL `INSERT` commands in run time. The sample implements the execution of the multiple SQL `INSERT` commands using two different execution modes: the ordinary execution and the batch execution.

1. **Ordinary execution** The sample calls 10000 times the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) method to execute the 10000 SQL `INSERT` statement.
2. **Batch execution** The sample calls the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) method in [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) mode to execute the 10000 SQL `INSERT` statement in a single step. The [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) method is called only once as follows: `Execute(iBatchSize, 0)`, where `iBatchSize` is the length of the DML array. In this sample, `iBatchSize` is set with the value of the **Records to insert** label.

*  A [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object. The sample uses this object to report the execution time of both execution methods.

## Uses 


* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)
* [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Params)
* [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute)

* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox)
* [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))
* [Command Batches (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Command_Batches_(FireDAC))
* [Array DML (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC))

### Samples 


* [FireDAC TFDQuery Batch DML](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Batch_Sample) sample
* [FireDAC TFDQuery Array DML](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.ArrayDML_Sample) sample






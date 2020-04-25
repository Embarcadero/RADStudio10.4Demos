FireDAC.TFDQuery.Batch Sample[]()
# FireDAC.TFDQuery.Batch Sample 


This sample demonstrates how to use [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) in FireDAC.
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

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\ExecSQL\Batch`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/Batch](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/ExecSQL/Batch)

## Description 

The **Batch** sample shows you how to use [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) to execute multiple SQL INSERT commands in a single step to optimize database population performance. In this demo the "batch" and "Array DML" terms are interchangeable.
## How to Use the Sample 


1.  Navigate to the location given above and open `Batch.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi         | Contains          |
|------------------------|-------------------|
|`Batch.dproj``Batch.dpr`|The project itself.|
|`fBatch.pas``fBatch.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  Two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects named **qrySelect** and **qryBacth**. These components implement a dataset capable of executing SQL queries: **qryBacth** is responsible for the `INSERT` query of data into the database while **qrySelect** is responsible for the `SELECT` query of data from the database in order to display the datasets. To this end, the sample configures the following properties of both objects:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is configured to specify the FireDAC connection object that is used to connect to a DBMS.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qrySelect** is set to `select * from {id FDQA_Batch_test}`.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qryInsert** is set to `insert into {id FDQA_Batch_test}(tint, tstring, tblob) values(:f1, :f2, :f3)`.**Note**: You can change the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qryInsert** at run time by checking the **insert blob** checkbox.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the sample sets the following properties:

*  The **DataSet** property of **DataSource** is set to `qryExecSQL`.
*  The **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, you see the following components on the form:
*  A [combo box](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) labeled as **Use Connection Definition**.
*  A [label](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) named **Array size**. The preset value is `10000`.
*  Two [check box](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) labeled as **insert blob** (unchecked) and **batch executing** (checked).
*  Two [buttons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) labeled as **ExecSQL** and **Disconnect**. Both buttons are disabled.
To [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database, click on the **Use Connection Definition** combo box and select an option. When you select an item of the combo box, the sample enables the **ExecSQL** and **Disconnect** buttons and unchecks the **insert blob** check box. Then, if you click on the **ExecSQL** button, the sample executes the SQL statement of **qryBatch**. The execution of the SQL statement varies depending on the state of the check boxes and the value of the **Arraysize** value:
*  The **qryBatch** SQL statement depends on the state of the **insert blob** check box:

*  If it is unchecked, the **qryBatch** SQL statement is set to `'insert into {id FDQA_Batch_test}(tint, tstring) values(:f1, :f2)'`.
*  If it is checked, the SQL statement is set to `'insert into {id FDQA_Batch_test}(tint, tstring, tblob) values(:f1, :f2, :f3)'`.

*  When clicking on the **EcecSQL** button with **batch executing** checked, the sample uses the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute) method in [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) mode, where the value of the **Array size** label specifies the size of each parameter array. Change the **Array size** value to change the length of the parameters array. On the other hand, if **batch executing** is unchecked, the sample uses the [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL) method to execute the SQL statement.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL)
* [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL)
* [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.Execute)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit)
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
* [FireDAC TFDQuery Batch Error Handling](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.BatchErrorHandling_Sample) sample
* [FireDAC TFDQuery Array DML](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.ArrayDML_Sample) sample
* [FireDAC IFDPhysCommand Batch](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.Batch_Sample) sample






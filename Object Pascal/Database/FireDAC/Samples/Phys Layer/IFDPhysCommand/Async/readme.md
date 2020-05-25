FireDAC.IFDPhysCommand.Async Sample[]()
# FireDAC.IFDPhysCommand.Async Sample 


This sample demonstrates the use of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to control the [asynchronous execution mode](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC)) using FireDAC.
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

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysCommand\Async`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Async](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Async)

## Description 

The **Async** sample shows you how to use the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to configure the different [asynchronous execution modes](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC)). To this end, the sample uses a group of four radio buttons. Each radio button sets the [Options](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.IFDStanOptions).[ResourceOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions).[CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to one of the following execution modes: `amBlocking`, `amNonBlocking`, `amCancelDialog`, and `amAsync`. Then, the sample executes the SQL statement using the selected asynchronous execution mode.**Note**: To see the differences between the execution modes, click [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode)
## How to Use the Sample 


1.  Navigate to the location given above and open `IFDPhys_Async.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                         | Contains          |
|----------------------------------------|-------------------|
|`IFDPhys_Async.dproj``IFDPhys_Async.dpr`|The project itself.|
|`fAsync.pas``fAsync.fmx`                |The main form.     |


## Implementation 

When you run the application, you can interact with the sample using the following objects:
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. Click the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. The menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. When the connection is defined, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command interface. Then, the sample enables the **Execute** button. If you click the **Execute** button, the sample uses this command interface to execute some SQL commands at run time.
*  A [TRadioGroup](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TRadioGroup) object labeled as **Async execution mode**. The sample implements a group of radio buttons in order to select the [asynchronous execution mode](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC)). The options are the following:

*  Select **Blocking** to set the [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to `amBlocking`.**Note**: This is the default execution mode. It blocks the GUI until the action is finished.
*  Select **Non Blocking** to set the [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to `amNonBlocking`.**Note**: The application continues to process GUI messages, but it ignores mouse and keyboard events.
*  Select **Cancel Dialog** to set the [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to `amCancelDialog`.**Note**: With this execution mode, FireDAC shows a dialog with a **Cancel** button that allows to cancel the action.
*  Select **Async** to set the [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property to `amAsync`. **Note**: With the `amAsync` execution mode, the application can get a notification about the termination of the action by using the appropriate event handler or callback.

*  A [TEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TEdit) object labeled as **Timeout**. The sample uses the value of the edit component to set the [CmdExecTimeout](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecTimeout) property. The [CmdExecTimeout](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecTimeout) property controls the execution timeout of the database action.
*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) object labeled as **Execute**. When you click the **Execute** button, the sample implements the following command interface related features:

1.  First, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare) and [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) methods to execute the following SQL command: `'delete from {id FDQA_ForAsync}'`. The goal is to clear the table.
2.  Secondly, the sample fills the table using an [Array DML execution](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)#Example_1). To this end, the sample:

1.  Sets the [CommandText](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.CommandText) method to `'insert into {id FDQA_ForAsync}(id, name) values(:id, :name)'`.
2.  Configures the [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Params) properties.
3.  Uses the [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute) method in [Array DML](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)) mode.

3.  Thirdly, the sample sets up the [asynchronous execution mode](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC)). It uses the selected radio button to set up the [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode) property.
4.  Finally, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare) and [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) methods to execute the following `SELECT` statement: `'SELECT Count(*) FROM {id FDQA_ForAsync} a, {id FDQA_ForAsync} b GROUP BY a.name, b.name'`. The sample executes the SQL statement according to the selected asynchronous execution mode.

## Uses 


* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)
* [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Params)
* [Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Execute)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open)

* [IFDStanOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.IFDStanOptions)

* [CmdExecMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.CmdExecMode)

* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))
* [Asynchronous Execution (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Asynchronous_Execution_(FireDAC))
* [Array DML (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC))

### Samples 


* [FireDAC TFDQuery Async Transactions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Async_Sample) sample






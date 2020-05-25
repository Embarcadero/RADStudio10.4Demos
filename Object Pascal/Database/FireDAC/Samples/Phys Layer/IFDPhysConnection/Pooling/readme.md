FireDAC.IFDPhysConnection.Pooling Sample[]()
# FireDAC.IFDPhysConnection.Pooling Sample 


This sample describes how to use FireDAC in a multithreaded environment. This sample implements a multithreaded application, where each thread uses the [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) interface to establish a connection. The multiple [connection establishments](http://docwiki.embarcadero.com/RADStudio/en/Establishing_Connection_(FireDAC)) may lead to performance degradation across the whole system. To avoid this, you can enable the [Pooled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams.Pooled) property to use the [connection pooling](http://docwiki.embarcadero.com/RADStudio/en/Multithreading_(FireDAC)#Connection_Pooling). 
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

You can find the **Pooling** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysConnection\Pooling`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysConnection/Pooling](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysConnection/Pooling)

## Description 

The **Pooling** sample shows you how to use the [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) interface together with the [TThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread) class in order to establish connections to a database in a multithreaded application. To this end, the sample launches 10 threads. Each thread connects to the database and performs 50 SQL queries. In multithreaded applications, each thread starts and establishes a connection, performs a certain short task and then releases the connection. The repetitive connection establishments in multithreaded aplications may lead to performance degradation across the whole system. To avoid this, the application allows you to make use of the [connection pooling](http://docwiki.embarcadero.com/RADStudio/en/Multithreading_(FireDAC)#Connection_Pooling). To show the benefits of the connection pooling, the sample compares and shows the time used to run the application with or without enabling the connection pooling.
## How to Use the Sample 


1.  Navigate to the location given above and open `IFDPhys_Pooling.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Interact with the sample:

1.  Select an option from the **Use Connection Definition** combo box.
2.  Click the **Run** button and see the execution time.
3.  Select the **Run Pooled** check box, click the **Run** button and see the execution time.
4.  Compare both execution times.

## Files 



| File in Delphi                             | Contains          |
|--------------------------------------------|-------------------|
|`IFDPhys_Pooling.dproj``IFDPhys_Pooling.dpr`|The project itself.|
|`fPooling.pas``fPooling.fmx`                |The main form.     |


## Implementation 

When you run the application, you can interact with the sample using the following objects:
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. Click the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. The menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. Once you select a connection definition, the sample enables the **Run** button and the **Run Pooled** check box.
*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) object labeled as **Run**.  If you click the **Run** button, the sample launches 10 threads. Each thread uses the [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection) method of [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager) to create a connection to the database. Moreover, each thread uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command for each connection. Finally, each thread uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare) method of [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) to execute 50 SQL queries. The executed SQL query is the following `SELECT` command: `'select count(*) from {id Region}'`. Therefore, in this case, each thread creates and uses a dedicated connection object working with the database.
*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) object labeled as **Run Pooled**. If you select this check box, the [Pooled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams.Pooled) property of the connection setting is set to `True`. The database [connection pooling](http://docwiki.embarcadero.com/RADStudio/en/Multithreading_(FireDAC)#Connection_Pooling) is a method used to keep database connections open so they can be reused by others. Therefore, if you select the option, the threads can reuse the current opened connection.**Note**: The connection pooling can be enabled only for a persistent or private connection definition.
*  A [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object. The sample uses the memo object to display the type of connection. If you select the [Pooled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams.Pooled) property, the memo displays the following message: `'Run pooled...'`. On the other hand, if you uncheck the [Pooled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams.Pooled) property, the memo displays the following message: `'Run non  pooled...'`.

## Uses 


* [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager)

* [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection)
* [Pooled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams.Pooled)

* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Open)
* [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Close)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)

* [TThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread)
* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Establishing Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Establishing_Connection_(FireDAC))
* [Multithreading (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Multithreading_(FireDAC)).

### Samples 


* [FireDAC Connection Definitions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDConnection Pooling](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Pooling_Sample) sample






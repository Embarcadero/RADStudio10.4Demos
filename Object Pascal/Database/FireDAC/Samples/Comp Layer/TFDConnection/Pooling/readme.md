FireDAC.Pooling Sample[]()
# FireDAC.Pooling Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

* [6.1 Sample](#Sample)

This sample describes how to use FireDAC in a multithreaded environment. In a multithreaded application, where each thread starts, establishes a connection, performs a certain short task, and releases the connection, the repetitive connection establishments may lead to performance degradation across the whole system. To avoid this, the application can use the connection pooling. This application shows the difference of time used when using pooling to establish many connections to a database.

## Location 

You can find the **TFDConnection\Pooling** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDConnection\Pooling**.

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/Pooling](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/Pooling).

## Description 

This sample uses the **Use Connection Definition** drop-down menu to select a connection definition.Click **Run** to execute mutiple threads that establish a connection to the database and perform SQL queries on it. To enable pooling, select **Run pooled** before clicking **Run**. 
The **Total executions** and the **Total time** labels show the number of executed SQL queries and the amount of time used. The time is considerably inferior when using pooling.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **Pooling.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select a connection definition from the **Use Connection Definition** drop-down menu. Once a connection is selected the **Run** button is enabled.
4.  Select **Run pooled** to use pooling.

*  Click **Run** to start creating the connections to the database. It executes 10 threads to the database.

## Implementation 


* **Use Connection Definition** drop-down menu:
The menu shows all the connections defined on the file at **C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionsDefs.ini**.
* **Run** button:
When clicked, the sample starts 10 threads connecting to the database. It uses the [TFDCustomManager.ConnectionDefs](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefs) property from a [TFDManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDManager) to access the connection definition selected from the **Use Connection Definition** drop-down menu.For each thread, 50 SQL queries are performed. It creates a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) and a [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) on each thread.
The standard simplification is to create and use for each thread a dedicated connection object working with the database. In this case, no additional serialization is required.

* **Run pooled** check box:
When this option is selected, the **Pooled** argument of the connection setting is set to **True**. The connection pooling can be enabled only for a persistent or private connection definition by setting Pooled to **True**.Database connection pooling is a method used to keep database connections open so they can be reused by others. Opening a database connection is an expensive operation, so pooling keeps the connections active so that, when a connection is later requested, one of the active ones is used in preference to opening another one.

## Uses 


* [FireDAC.Comp.Client.TFDManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDManager)
* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Multithreading (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Multithreading_(FireDAC))
* [TFDManager and TFDConnection Questions](http://docwiki.embarcadero.com/RADStudio/en/TFDManager_and_TFDConnection_Questions)

### Sample 


* [FireDAC IFDPhysConnection Pooling](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysConnection.Pooling_Sample) sample






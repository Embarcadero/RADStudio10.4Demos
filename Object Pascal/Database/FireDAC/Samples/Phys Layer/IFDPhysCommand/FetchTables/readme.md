FireDAC.IFDPhysCommand.FetchTables Sample[]()
# FireDAC.IFDPhysCommand.FetchTables Sample 


This sample demonstrates how to use the [Phys Layer command interface](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) of FireDAC to [fetch](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC)) data from a database.
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

You can find the **FetchTables** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysCommand\FetchTables`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/FetchTables](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/FetchTables)

## Description 

The **FetchTables** sample shows you how to use the [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) property of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interace. The sample uses the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interace to [fetch rows](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC)) from the current command cursor in the **DatS** table. To this end, the sample [creates a command](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) interface to:
* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare) a `SELECT` command.
* [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define) the structure of the **DatS** table.
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) the command interface.
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) the table.
*  Print the fetched rows

## How to Use the Sample 


1.  Navigate to the location given above and open `FetchTables.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

## Files 



| File in Delphi                     | Contains          |
|------------------------------------|-------------------|
|`FetchTables.dproj``FetchTables.dpr`|The project itself.|
|`fFetchTables.pas``fFetchTables.fmx`|The main form.     |


## Implementation 

When you run the application, you see the following components that are configured on run time:
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. When you click the **Use Connection Definition** combo box, the menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. Select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. When the connection is defined, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command interface. Then, the sample use some methods of this command interface to fetch rows from a table. Finally, the sample displays the fetched data using a [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object.To fetch data from a table, the sample implements the following steps:

1.  First, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare) method in ordert to prepare the following SQL `SELECT` command: `'select * from {id Shippers}'`.
2.  Secondly, the sample uses the [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define) method in order to define the structure of the **DatS** table.
3.  Thirdly, the sample calls the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) method to open the command interface created by the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection).
4.  Finally, the sample calls the [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) method in order to fetch rows from the **DatS** table.

*  A [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object named **Console**. The sample uses this object to display the data fetched from the table.

## Uses 


* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)
* [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open)
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch)

* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Fetching Rows (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC))

### Samples 


* [FireDAC TFDMemTable Incremental Fetching](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.IncFetchingMSSQL_Sample) sample






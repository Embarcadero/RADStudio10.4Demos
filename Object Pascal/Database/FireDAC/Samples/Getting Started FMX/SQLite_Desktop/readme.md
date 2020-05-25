FireDAC.SQLite Desktop Sample[]()
# FireDAC.SQLite Desktop Sample 


This sample shows the use of **FireDAC** database connection using [SQLite](http://www.sqlite.org). 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)
* [8 Tutorials](#Tutorials)


## Location 

You can find the **FMGettingStarted** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\Database\FireDAC\Samples\Getting Started FMX\SQLite_Desktop**

* **GitHub Repository for Delphi:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started%20FMX/SQLite_Desktop/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Getting%20Started%20FMX/SQLite_Desktop/)

## Description 


*  The demo shows how to connect to a database using **FireDAC** and **LiveBindings**. Also, it shows how to use a [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) control.

> **Note:** The default database has no password.


## How to Use the Sample 


1.  Navigate to the location given above and open **FMGettingStarted.dproj.**
2.  Press **F9** or choose **Run > Run**.
3.  Click the **Open** button and the database's data will appear in the grid.
4.  Choose a database and enter your password **or** use the default database which has no password.
5.  Navigate through the data using the [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator).

## Files 



|**File**                  |**Contains**                             |
|--------------------------|-----------------------------------------|
|**FMGettingStarted.dproj**|Contains the project itself.             |
|**MainFrm.fmx**           |Contains the main form code.             |
|**MainFrm.pas**           |contains the main form and the main code.|


## Implementation 


*  The project uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) that establishes a connection with a database. In this case _FDDemo.sdb_ which can be found at **Samples > data > FDDemo.sdb**. In order to navigate through the data, the project uses [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery), [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource), [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink), [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog), [TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor) and [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator).

*  The [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) executes a SELECT query against the _Territories_ table.

*  The application also uses a [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) to display the database's data.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Fmx.Bind.Navigator.TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator)
* [FMX.Grid.TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid)

## See Also 


* [Connect to SQLite database (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_SQLite_database_(FireDAC))
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)

## Tutorials 


* [Tutorial: Using FireDAC from a Multi-Device Application on Desktop Platforms](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_FireDAC_from_a_Multi-Device_Application_on_Desktop_Platforms)
* [Mobile Tutorial: Using FireDAC in Mobile Applications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_in_Mobile_Applications_(iOS_and_Android))






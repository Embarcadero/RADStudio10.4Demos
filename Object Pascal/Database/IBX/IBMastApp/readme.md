IBX.IBMastApp Sample[]()
# IBX.IBMastApp Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This demo is a system with functionality to add, modify, browse, and report on orders, customers, parts, and items. It also demonstrates how to access a help file from a Delphi application and how to apply VCL Styles. It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the example. 

## Location 

You can find the **IBMastApp** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\DataBase\IBX\IBMastApp**
* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/IBMastApp/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/IBMastApp/)

## Description 

This sample shows how to add, modify, browse, and report on orders, customers, parts, and items. It also demonstrates how to access a help file from a Delphi application and how to apply VCL Styles. 
## How to Use the Sample 


1.  Navigate to the location given above and open **mastapp.dproj**.
2.  Press **F9** or choose **Run > Run**.
The following table describes the functionality of the buttons on this demo.

|**Item**     |**Description**                                                                                                                                                                                                                                                                                                                                                                                                      |
|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|**New Order**|Opens the **Order Form** window where you can navigate through all the records in the **Orders** table. It shows an order from a particular **CustNo** and it displays all the items related to this order in a TDBgrid component. This window is defined in the **EDOrders** form.                                                                                                                                  |
|**Browse**   |Opens the **Orders By Customer** window. In one grid it shows some fields from the **Customer** table, in the second grid it displays the orders associated to the selected customer. Use the **Define Query** button to define a filter for the Customers by the Last Invoice Date, and click **Activate Query** to activate the filter. Click **Edit** to open the **Order Form** window for the selected Customer.|
|**Parts**    |Opens the **Browse Parts** window. It shows the content of the **Parts** table on a grid. You can navigate through the records. Click **Edit** to open a dialog box where you can edit the part information.                                                                                                                                                                                                         |
|**Help**     |Opens the Offline Help for the application.                                                                                                                                                                                                                                                                                                                                                                          |
|**Close**    |Closes the application.                                                                                                                                                                                                                                                                                                                                                                                              |


## Implementation 

This sample uses [TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase) to specify the database. In this case: C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Data\MASTSQL.GDB. The location to the database is specified in the **DatabaseName** property.The database components for this sample are placed on the **DataMod** form, and the code to give the functionality to the sample is placed on the **Main.pas/cpp** file.

## Uses 


* [IBX.IBDatabase.TIBTransaction](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBTransaction)
* [IBX.IBDatabase.TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase)
* [Vcl.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.TOpenDialog)
* [IBX.IBQuery.TIBQuery](http://docwiki.embarcadero.com/Libraries/en/IBX.IBQuery.TIBQuery)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [IBX.IBCustomDataSet.TIBDataSet](http://docwiki.embarcadero.com/Libraries/en/IBX.IBCustomDataSet.TIBDataSet)
* [lib_en:Vcl.Menus.TMainMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TMainMenu)
* [Vcl.Dialogs.TPrinterSetupDialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.TPrinterSetupDialog)

## See Also 


* [Getting Started with InterBase Express](http://docwiki.embarcadero.com/RADStudio/en/Getting_Started_with_InterBase_Express)
* [View Various Tables (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/View_Various_Tables_(IBX_General_Tutorial))
* [Add a Data Module (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_a_Data_Module_(IBX_General_Tutorial))
* [Add Database Components (IBX No Code Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_Database_Components_(IBX_No_Code_Tutorial))
* [IBX.AdminTool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.AdminTool_Sample)
* [IBX.MtsPool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.MtsPool_Sample)






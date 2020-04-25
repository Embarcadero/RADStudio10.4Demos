IBX.MtsPool Sample[]()
# IBX.MtsPool Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

This sample shows the use of object pooling. The application measures the amount of time needed to open and close a database connection a number of times. The "MTS Pooling checkbox" enables and disables the database objects pooling. There is a difference in elapsed time when running the test with and without MTS Pooling enabled.This sample requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the example. 

## Location 

You can find the **MtsPool** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\DataBase\IBX\MtsPool**
* **CPP\Database\IBX\mstPool**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/MtsPool/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/MtsPool/)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/mstPool/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/mstPool/)

## Description 

This sample shows the elapsed time for a defined number of consecutive connections to a database. Enabling the **MTS Pooling** sets the "MTS POOLING" Registry key to **TRUE** in [HKEY_LOCAL_MACHINE\Software\Borland\Database Engine\Settings\SYSTEM\INIT].
## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **mtspool.dproj**
*  C++: **mstpool.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Edit **Open/Close Count** with the number of connections you want to test.
4.  Select **MTS Pooling** to activate the setting.
5.  Click **Test Pooling** to start and stop the timer in order to calculate the elapsed time.

## Files 



|**File in Delphi**  |**File in C++**    |**Contains**                                                  |
|--------------------|-------------------|--------------------------------------------------------------|
|**mtspool.dproj**   |**mstpool.cbproj** |The project itself.                                           |
|**Pooling.pas/dfm** |**Pooling.cpp/dfm**|The main form and the code to turn on the MTS Pooling setting.|
|**mtspool_Icon.ico**|                   |The favicon of the application.                               |
|**Readme.html**     |                   |Basic information about this sample.                          |


## Implementation 

This sample implements a method to turn on the MTS Pooling setting when selecting the **MTS Pooling** option.It uses [TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase) to specify the database. In this case: C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Data\EMPLOYEE.GDB. The location to the database is specified in the **DatabaseName** property.
It uses [TIBQuery](http://docwiki.embarcadero.com/Libraries/en/IBX.IBQuery.TIBQuery) to define the SQL Query. Right-clicking on the visual component and click **Edit SQL** to open the **CommandText Editor** where the SQL sentence is defined.

## Uses 


* [IBX.IBDatabase.TIBTransaction](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBTransaction)
* [IBX.IBDatabase.TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase)
* [IBX.IBQuery.TIBQuery](http://docwiki.embarcadero.com/Libraries/en/IBX.IBQuery.TIBQuery)

## See Also 


* [Getting Started with InterBase Express](http://docwiki.embarcadero.com/RADStudio/en/Getting_Started_with_InterBase_Express)
* [View Various Tables (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/View_Various_Tables_(IBX_General_Tutorial))
* [Add a Data Module (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_a_Data_Module_(IBX_General_Tutorial))
* [Add Database Components (IBX No Code Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_Database_Components_(IBX_No_Code_Tutorial))
* [IBX.AdminTool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.AdminTool_Sample)
* [IBX.IBMastApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.IBMastApp_Sample)






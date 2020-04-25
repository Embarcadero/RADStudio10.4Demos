IBX.AdminTool Sample[]()
# IBX.AdminTool Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample shows you how to administer InterBase using InterBase components. It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the example.
## Location 

You can find the **AdminTool** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\DataBase\IBX\Admin**
* **CPP\Database\IBX\Admin**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/Admin/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/IBX/Admin/)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/Admin/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/Admin/)

## Description 

This sample consists of a TPageControl used to create multiple TTabSheets to organize different actions over an InterBase Server and database.There are several tabs:

* **Users**: it shows user accounts from the InterBase server. You can also add new users, edit users, and delete users.
* **Backup**: it backs up a database selecting the input and output file. It allows you to configure many options for the backup.
* **Restore**: it allows you to restore a database from a backup. You can configure many restore options.
* **Validate**: it checks the integrity of a database file.
* **Certificates**: it allows you to manage the certificates of your InterBase server. You can add and remove certificates from here.
* **Statistics**: it shows the statistics of the selected database. You can show the data in different ways.
* **Properties**: it allows you to change some properties of the database.
* **Log**: It shows the server's log.
* **Aliases**: It allows you to manage the database aliases.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **AdminTool.dproj**
*  C++: **AdminTool.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Click **Login** in the menu bar to connect to the server.
**Note:** You can use the **user** = sysdba and **password** = masterkey.
## Implementation 

This sample uses many InterBase components to give the functionality to the different tabs:
* **Users**: It uses the [TIBSecurityService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBSecurityService) to manage user accounts: add, edit, and delete users.
* **Backup**: It uses the [TIBBackupService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBBackupService) to allow you to back up your database. It uses the Backup options defined in the [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.Grids.TStringGrid) to configure the backup.
* **Restore**: It uses the [TIBRestoreService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBRestoreService) to restore a selected database. It uses a [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.TOpenDialog) to select the path or alias of the database. You can select the options from the TStringGrid.
* **Validate**: It uses [TIBValidationService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBValidationService) to validate the integrity of the database with the parameters from the TStringGrid.
* **Certificates**: It uses [TIBLicensingService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBLicensingService) to configure the licensing parameters. You can add and remove Certificates.
* **Statistics**: It uses [TIBStatisticalService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBStatisticalService) to show database statistics.
* **Properties**: It uses [TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase) and [TIBConfigService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBConfigService) to show information of the selected database.
* **Log**: It uses [TIBLogService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBLogService) to return the contents of the interbase.log file from the server.
* **Aliases**: It uses [TIBServerProperties](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBServerProperties) to return information about the database server. In this case it returns the aliases.

## Uses 


* [IBX.IBServices.TIBSecurityService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBSecurityService)
* [IBX.IBServices.TIBBackupService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBBackupService)
* [IBX.IBServices.TIBRestoreService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBRestoreService)
* [IBX.IBServices.TIBValidationService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBValidationService)
* [IBX.IBServices.TIBLicensingService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBLicensingService)
* [IBX.IBServices.TIBStatisticalService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBStatisticalService)
* [IBX.IBDatabase.TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase)
* [IBX.IBServices.TIBConfigService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBConfigService)
* [IBX.IBServices.TIBLogService](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBLogService)
* [IBX.IBServices.TIBServerProperties](http://docwiki.embarcadero.com/Libraries/en/IBX.IBServices.TIBServerProperties)
* [Vcl.Grids.TStringGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.Grids.TStringGrid)
* [IBX.IBDatabase.TIBTransaction](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBTransaction)
* [IBX.IBDatabaseInfo.TIBDatabaseInfo](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabaseInfo.TIBDatabaseInfo)

## See Also 


* [Getting Started with InterBase Express](http://docwiki.embarcadero.com/RADStudio/en/Getting_Started_with_InterBase_Express)
* [View Various Tables (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/View_Various_Tables_(IBX_General_Tutorial))
* [Add a Data Module (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_a_Data_Module_(IBX_General_Tutorial))
* [Add Database Components (IBX No Code Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_Database_Components_(IBX_No_Code_Tutorial))
* [IBX.IBMastApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.IBMastApp_Sample)
* [IBX.MtsPool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.MtsPool_Sample)






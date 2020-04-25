FireDAC.InterBase AdminUtility Sample[]()
# FireDAC.InterBase AdminUtility Sample 


This is an InterBase demo to show how to implement admin tasks using FireDAC.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **AdminUtility** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\Database\FireDAC\Samples\DBMS Specific\InterBase\Admin**

* **GitHub Repository for Delphi:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/InterBase/Admin](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/InterBase/Admin)

## Description 

The demo establishes a connection to the Interbase localhost server by default, using the `SYSDBA` user. You can change these parameters to connect to a different InterBase server using a valid user name and password. The sample also admits authentication.
Apart from the parameters to connect to an InterBase server, the sample has four tabs to perform administrative tasks:

* **Server Users** Tab:

*  Click **Refresh Users** to get all the users from the InterBase server.

* **Backup** Tab:

*  Use this tab to backup a database. Introduce the **Database Path** to specify the InterBase database and the **Backup Path** to specify the backup destination file (`*.ibk`). You can also select several options to perform the backup.
*  Click **Backup** to start the backup.

* **Restore** Tab:

*  Use this tab to restore a database from a backup. Introduce the **Backup Path** to specify the backup source file (`*.ibk`) and the **Restore Path** to specify the InterBase database. You can also select several options to restore the backup.
*  Click **Restore** to start the restoration.

* **Validate** Tab:

*  Use this tab to validate the integrity of an InterBase database.
*  Click **Validate** to start the validation.

## How to Use the Sample 


1.  Navigate to the location given above and open **IBAdminTool.dproj.**
2.  Press **F9** or choose **Run > Run**.
3.  Use the parameters by default to connect to the local InterBase server with the default `SYSDBA` user.
4.  You can perform administrative tasks with the functionality of the four tabs.

## Files 



|**File**                |**Contains**                                                                  |
|------------------------|------------------------------------------------------------------------------|
|**IBAdminTool.dproj**   |The project itself.                                                           |
|**dmAdmin.pas/dfm**     |The data module containing the components and code for the admin tasks.       |
|**AdminUtility.pas/fmx**|The main form and code calling the data module methods to perform admin tasks.|


## Implementation 

The main functionality of the project is implemented on **dmAdmin** where the FireDAC components are placed. It uses [TFDPhysIBDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IB.TFDPhysIBDriverLink) and [TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor) to connect to the InterBase server.The sample uses a [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) from **dmAdmin** to display the table with the InterBase server users on the [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) of the main form.
The [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) component is used to open a dialog to select the paths on the admin tasks filtering the InterBase Backups: `*.ibk`.
The InterBase components on **dmAdmin** are used to perform the admin tasks:

* [TFDIBSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBSecurity): Service to load the InterBase users.
* [TFDIBBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBBackup): Service to execute a backup.
* [TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore): Service to restore a backup.
* [TFDIBValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBValidate): Service to validate a database.

## Uses 


* [FireDAC.Phys.IB.TFDPhysIBDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IB.TFDPhysIBDriverLink)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [FireDAC.Phys.IBBase.TFDIBSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBSecurity)
* [FireDAC.Phys.IBBase.TFDIBBackup](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBBackup)
* [FireDAC.Phys.IBBase.TFDIBRestore](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBRestore)
* [FireDAC.Phys.IBBase.TFDIBValidate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IBBase.TFDIBValidate)
* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)

## See Also 


* [Connect to InterBase (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_InterBase_(FireDAC))
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






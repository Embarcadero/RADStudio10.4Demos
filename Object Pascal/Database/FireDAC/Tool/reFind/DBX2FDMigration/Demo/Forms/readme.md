FireDAC.DBX2FDMigration Demo Sample[]()
# FireDAC.DBX2FDMigration Demo Sample 


This page provides step-by-step instructions on how to migrate the Delphi demo application (**MeetingOrganizer**) to FireDAC.For more information about migration from dbExpress to FireDAC, see [Migrating dbExpress Applications to FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Migrating_dbExpress_Applications_to_FireDAC).

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Run Migrate.bat Utility](#Run_Migrate.bat_Utility)
* [3.2 Creating the new FireDAC Connection Definition](#Creating_the_new_FireDAC_Connection_Definition)
* [3.3 Adding some Components to Your Application Form](#Adding_some_Components_to_Your_Application_Form)
* [3.4 Setting Up the FireDAC Connection Parameters](#Setting_Up_the_FireDAC_Connection_Parameters)
* [3.5 Running This Demo Application](#Running_This_Demo_Application)

* [4 See Also](#See_Also)


## Location 

You can find the **DBX2FDMigration** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\Database\FireDAC\Tool\reFind\DBX2FDMigration\Demo\Forms**

* **GitHub Repository for Delphi:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Tool/reFind/DBX2FDMigration/Demo/Forms](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Tool/reFind/DBX2FDMigration/Demo/Forms)

## Description 

This sample project demonstrates how to migrate the project **MeetingOrganizer** from dbExpress to FireDAC using the reFind.exe tool.
## How to Use the Sample 

**To use this sample project**
1.  Run the migrate.bat utility.
2.  Create the new FireDAC connection definition.
3.  Add some additional components to your application form.
4.  Set up the FireDAC connection parameters.
5.  Run this demo application.
The following sections detail the steps of this procedure. 
### Run Migrate.bat Utility 

The **migrate.bat** utility is located in the `C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Database\FireDAC\Tool\reFind\DBX2FDMigration\Demo` folder. The **migrate.bat** utility creates a new subdirectory **FireDAC_MeetingOrg** under **Forms**, and copies the source files of your dbExpress application to the **FireDAC_MeetingOrg** folder. It keeps the original source files.
The utility runs the RAD Studio [reFind](http://docwiki.embarcadero.com/RADStudio/en/reFind.exe,_the_Search_and_Replace_Utility_Using_Perl_RegEx_Expressions) tool in order to [replace the dbExpress terms](http://docwiki.embarcadero.com/RADStudio/en/dbExpress_Name_Counterparts_(FireDAC)) of the application with their FireDAC counterparts.
Example of reFind.exe usage:

```
reFind.exe FireDAC_MeetingOrg\*.pas FireDAC_MeetingOrg\*.dfm FireDAC_MeetingOrg\*.fmx /X:..\..\FireDAC_Migrate_DBX.txt

```

You can find the "reFind.exe" utility in "`C:\Program Files (x86)\Embarcadero\Studio\\bin\reFind.exe`".To run **Migrate.bat**: 

1.  Go to `C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Database\FireDAC\Tool\reFind\DBX2FDMigration\Demo` folder.
2.  Double-click the **migration.bat** application to start the migration process.

### Creating the new FireDAC Connection Definition 


1.  Open the project **MeetingOrganizer.dproj** located at `C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Database\FireDAC\Tool\reFind\DBX2FDMigration\Demo\Forms\FireDAC_MeetingOrg`
2.  Create a FireDAC [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) using the [FireDAC Explorer](http://docwiki.embarcadero.com/RADStudio/en/FDExplorer).

1.  Go to **Tools > FireDAC Explorer**.SYSDBA
2.  In the FireDAC Explorer tool, go to **File > New > Connection Definition**.
3.  Setup the connection definition parameters.
This is the simplest connection definition for the **MeetingOrganizer** application: 
```
 [MO]
 Database=C:\Users\Public\Documents\Embarcadero\Studio\21.0\Samples\Object Pascal\Database\FireDAC\Tool\reFind\DBX2FDMigration\Demo\Database\MEETINGORGANIZER.GDB
 User_Name=SYSDBA
 Server=127.0.0.1
 DriverID=IB
 Password=masterkey

```


You can find the configuration file in `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`
### Adding some Components to Your Application Form 

You need to add the following components to your application form: 
*  A [TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor) component.
*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component.

### Setting Up the FireDAC Connection Parameters 


1.  In the Structure view, select **FDConnection1**.
2.  In the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector), specify the following parameters:

1.  Fill the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection.ConnectionDefName) property with the name of the connection defined using the FireDAC Explorer.
2.  Use the [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Params) property to define the path to the database.
In the [Code Editor](http://docwiki.embarcadero.com/RADStudio/en/Code_Editor), comment the part that is pointing to the dbxconnections.ini file:
```
procedure TMainDM.SQLConnectionBeforeConnect(Sender: TObject);
begin
//  SQLConnection.LoadParamsFromIniFile
//    (IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
//    'dbxconnections.ini');
end;

```



### Running This Demo Application 


1.  Press **F9** or choose **Run > Run**.
2.  When prompted, type in the **User Login** and the **Password**: **borland**, **borland**.

## See Also 


* [reFind.exe, the Search and Replace Utility Using Perl RegEx Expressions](http://docwiki.embarcadero.com/RADStudio/en/reFind.exe,_the_Search_and_Replace_Utility_Using_Perl_RegEx_Expressions)
* [Additional dbExpress Migration Hints (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Additional_dbExpress_Migration_Hints_(FireDAC))
* [DbExpress Connection Migration (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/DbExpress_Connection_Migration_(FireDAC))






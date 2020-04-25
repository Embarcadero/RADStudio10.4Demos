FireDAC.SQLiteIniFile Demo Sample[]()
# FireDAC.SQLiteIniFile Demo Sample 


This sample uses **FireDAC** to connect to an [SQLite](http://www.sqlite.org) database that emulates the structure and the operations of an [INI File](http://en.wikipedia.org/wiki/INI_file).
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

You can find the **SQLiteIniDemo** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\Database\FireDAC\Samples\AddOn\SQLiteIniFile\Demo**

* **GitHub Repository for Delphi:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/AddOn/SQLiteIniFile/Demo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/AddOn/SQLiteIniFile/Demo/)

## Description 


*  This application reads and writes data to an **INI file** using a **FireDAC** database connection as its storage medium, instead of a plain text file.

> **Note:** The connection to the database does not require authentication.


## How to Use the Sample 


1.  Navigate to the location given above and open **SQLiteIniDemo.dproj**.
2.  Press **F9** or choose **Run > Run**.
3.  Click the **Write to IniFile** button and the program will create a database (_IniFile.db_) and fill it with data.
4.  The data from the database that was just created is displayed in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid).
5.  You can manipulate the data with a [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator).
6.  Click the **Read from IniFile** button to display the data from the database in a [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) and the image from the database in a [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage).

## Files 



|**File**                          |**Contains**                                                                                                             |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------|
|**Demo\data\ winmacmachine.bmp**  |Contains the image that is diplayed in the [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage).|
|**Demo\SQLiteIniDemo.dproj**      |Contains the project itself.                                                                                             |
|**Demo\Unit1.dfm**                |Contains the code of the main form.                                                                                      |
|**Demo\Unit1.pas**                |Contains the main form and the main code.                                                                                |
|**FireDAC.Phys.SQLiteIniFile.pas**|Contains the code for the _SQLiteIniFile_ class used for writting/reading to/from the _IniFile.db_.                      |
|**ReadMe.txt**                    |Contains information about FireDAC.Phys.SQLiteIniFile.pas.                                                               |


## Implementation 


*  The project uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to establish a connection with a database (_IniFile.db_), which will be used to write or read data.

*  In order to display the data from the database, the project uses a [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery), a [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource), and a [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink).
*  The data will be displayed in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid).
*  You can navigate through the data with a [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator).

*  The [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) uses the following query:

```
 SELECT
   B.SECTION_NAME AS "Section::varchar(32)",
   A.KEY_NAME AS "Name::varchar(32)",
   CASE WHEN LENGTH(A.KEY_VALUE) <= 32 THEN A.KEY_VALUE
   ELSE '(blob)' END AS "Value::varchar(32)"
 FROM KEYS A
 LEFT JOIN SECTIONS B ON B.SECTION_ID = A.SECTION_ID

```


*  In the **FireDAC.Phys.SQLiteIniFile.pas** unit, several classes (_TFDSQLiteIniFileDB_ and _TFDSQLiteIniFile_) are defined for interacting with the _database_.

*  Click the **Write to IniFile** button on the main form to create and initialize a **TFDSQLiteIniFile** instance (the _oIniFile_ code variable) and to create the _"IniFile.db"_ database. After this, a string (_abcd..._), an integer (_123_), a float (_567.89_), a date time (_Now_), and an image (_the image from the **data** folder_) are added to the database. The data that was just inserted in the database is displayed in a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid).
> **Note:** As shown by the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) SQL command, when _"LENGTH(A.KEY_VALUE) > 32"_, [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) will display _"(blob)"_ instead of the actual value.


*  Click the **Read from Inifile** button on the main form to read from the database and display the string, the integer, the float, and the date time in a [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) and the image will be displayed in a [TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage).

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [Vcl.DBCtrls.TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator)
* [Vcl.ExtCtrls.TImage](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage)
* [Vcl.StdCtrls.TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## See Also 


* [Using TIniFile and TMemIniFile](http://docwiki.embarcadero.com/RADStudio/en/Using_TIniFile_and_TMemIniFile)

## Tutorials 


* [Tutorial: Using FireDAC from a Multi-Device Application on Desktop Platforms](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_FireDAC_from_a_Multi-Device_Application_on_Desktop_Platforms)






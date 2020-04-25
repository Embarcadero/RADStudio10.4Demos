FireDAC.TFDGUIxLoginDialog Sample[]()
# FireDAC.TFDGUIxLoginDialog Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Use Connection Definition](#Use_Connection_Definition)
* [4.2 Connect](#Connect)
* [4.3 Disconnect](#Disconnect)
* [4.4 FireDAC Login Dialog properties](#FireDAC_Login_Dialog_properties)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample describes how to use TFDGUIxLoginDialog in FireDAC GUI applications to allow users to enter their database credentials to connect to a DBMS. The same component also allows users to manage their passwords.The sample connects to a database using a TFDConnection.

## Location 

You can find the **TFDGUIxLoginDialog** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDGUIxLoginDialog\Main**.

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDGUIxLoginDialog/Main](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDGUIxLoginDialog/Main).

## Description 

This sample uses the **Use Connection Definition** drop-down menu to select a connection definition. If the database requires login credentials and the **Login prompt** check-box is selected, the **FireDAC Login** window appears where the user can input the **User name**, **Password** and other optional parameters. The set of parameters depends on the database type. The **Profile** combo-box allows choosing one of the previously successfully used credentials.
## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **LoginDialog.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select a connection definition from the **Use Connection Definition** drop-down menu.
4.  Click **Connect** to connect to the database.
5.  The **FireDAC Login** appears, allowing to input the login credentials.
6.  Click **Disconnect** to disconnect from the database.

## Implementation 

This project uses the **dmMainComp** unit where the [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog) component is placed.
### Use Connection Definition 

The menu shows all the connections defined on the file at **C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionsDefs.ini**.The connection to the database is established using a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component placed at the **dmMainComp** unit. It uses the [LoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.LoginDialog) property from the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to select the [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog) component.
If the **Login prompt** of the main form is checked then it checks the [LoginPrompt](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.LoginPrompt) option from the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to show the **FireDAC Login** window when trying to connect to the database.
When selecting the connection, it updates the [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog) properties with the values selected for the options on the **FireDAC Login Dialog properties** TPanel.

### Connect 

It updates the [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog) properties with the values selected for the options on the **FireDAC Login Dialog properties** TPanel.Opens the connection to the database by setting to **True** the [Connected](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TCustomConnection.Connected) property for the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection).

### Disconnect 

Closes the connection to the database by setting to **False** the [Connected](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TCustomConnection.Connected) property for the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection).
### FireDAC Login Dialog properties 

Values by default for the [TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog) properties:[ChangeExpiredPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.ChangeExpiredPassword): **True**.

*  It allows the user to change an expired password.
[HistoryEnabled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryEnabled): **True**
*  It allows the login history storage.
[HistoryWithPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryWithPassword): **True**
*  It allows the password storage in the login history.
[LoginRetries](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.LoginRetries): `3`
*  Specifies the number of allowed login tries for the user. An exception is raised when the defined number is reached.
[VisibleItems](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.VisibleItems): ` Database, User_Name and Password `
*  Specifies the fields shown on the **FireDAC Login** window. You can also set the name to be shown. For example ` Database = My Database Connection `.

## Uses 


* [FireDAC.Comp.UI.TFDGUIxLoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog)
* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDCustomConnection.LoginDialog](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.LoginDialog)
* [FireDAC.Comp.Client.TFDCustomConnection.LoginPrompt](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.LoginPrompt)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog.ChangeExpiredPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.ChangeExpiredPassword)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryEnabled](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryEnabled)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryWithPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.HistoryWithPassword)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog.LoginRetries](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.LoginRetries)
* [FireDAC.Comp.UI.TFDGUIxLoginDialog.VisibleItems](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxLoginDialog.VisibleItems)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Establishing Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Establishing_Connection_(FireDAC))






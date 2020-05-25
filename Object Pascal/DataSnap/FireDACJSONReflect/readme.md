DataSnap.FireDACJSONReflect REST Server Client Sample[]()
# DataSnap.FireDACJSONReflect REST Server Client Sample 


This sample demonstrates the use of the **Data.FireDACJSONReflect** unit to pass FireDAC datasets and deltas between a DataSnap client and a DataSnap REST server.
## Location 

You can find the **FireDACJSONReflect** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\DataSnap\FireDACJSONReflect**.
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/FireDACJSONReflect](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/FireDACJSONReflect)

## Contents



* [1 Location](#Location)
* [2 Description](#Description)

* [2.1 Server](#Server)
* [2.2 Client](#Client)

* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Server Project](#Server_Project)
* [3.2 Client Project](#Client_Project)

* [4 Files](#Files)

* [4.1 Server Files](#Server_Files)
* [4.2 Client Files](#Client_Files)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Description 

This sample demonstrates how to build a multi-tier application with DataSnap framework. The server and the client communicate using the HTTP protocol to exchange JSON data through a REST interface.

### Server 


*  The server is a DataSnap REST web application that accesses data from an InterBase database.
*  The sample adds FireDAC components to the Server Module to connect to an Interbase database.
*  The sample adds new methods in **ServerMethodsUnit1** to retrieve JSON data from the underlying InterBase EMPLOYEE sample database, and to expose these server methods to the client.

### Client 


*  The client is a multi-device application that includes a DataSnap REST Client Module.
*  The client calls the server methods to retrieve the data from the server.
*  The client also calls a method to apply changes to the database storing and passing data through TFDMemTable components.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\FireDACJSONReflect**.
2.  Select **DepartmentsClientProject.dproj** and **DepartmentsServerProject.dproj**.
3.  Open the client and the server.

### Server Project 


1.  Select **DepartmentServerProject.exe** on the Project Manager.
2.  Run the application by clicking **Run > Run Without Debugging** in the IDE or by pressing **Shift+Ctrl+F9**.
3.  The Server's interface opens. Click **Start** to start the server and then minimize it.

### Client Project 


1.  Select **DepartamentClientProject.exe** on the Project Manager.
2.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
3.  The Client application enables you to test the server method classes.

*  Click **Get Departments** to display a list of department names and numbers.
*  Click on a department to see department details and employees.
*  Modify a value in the department details and/or employee and then click **Apply Updates** to send changes to the server.

## Files 

The files used by this sample are:
* [Server Files](#Server_Files)
* [Client Files](#Client_Files)

### Server Files 



|**File**                          |**Contains**                                  |
|----------------------------------|----------------------------------------------|
|**WebModuleUnit1.pas/dfm**        |The DataSnap Server Components.               |
|**ServerMethodsUnit1.pas/dfm**    |The Server module with the FireDAC components.|
|**DepartmentsServerProject.dproj**|The project itself.                           |
|**DepartmentsServerFormU.pas/dfm**|The Server form.                              |


### Client Files 



|**File**                          |**Contains**                                                                      |
|----------------------------------|----------------------------------------------------------------------------------|
|**DepartmentsClientProject.dproj**|The project itself.                                                               |
|**DepartmentClientFormU.pas/fmx** |The main form that is the user interface for the DataSnap Client application.     |
|**ClientModuleUnit2.pas/dfm**     |The module with the TDSRestConnection component.                                  |
|**ClientClassesUnit2.pas**        |The client classes from the server generated with the TDSRestConnection component.|


## Uses 


* [Datasnap.DSServer.TDSServer](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSServer.TDSServer)
* [Datasnap.DSServer.TDSServerClass](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSServer.TDSServerClass)
* [DSHTTPWebBroker.TDSHTTPWebDispatcher](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSHTTPWebBroker.TDSHTTPWebDispatcher)
* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Phys.IB.TFDPhysIBDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IB.TFDPhysIBDriverLink)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [Datasnap.DSClientRest.TDSRestConnection](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSClientRest.TDSRestConnection)

## See Also 


* [Tutorial: Using a REST DataSnap Server with an Application and FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_a_REST_DataSnap_Server_with_an_Application_and_FireDAC)
* [Tutorial: Using a REST DataSnap Server with an Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_a_REST_DataSnap_Server_with_an_Application)
* [Developing DataSnap Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_DataSnap_Applications)
* [DataSnap Server Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Server_Application)
* [DataSnap Client Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Client_Application)
* [DataSnap REST Application Wizard](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_REST_Application_Wizard)
* [DataSnap REST](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_REST)






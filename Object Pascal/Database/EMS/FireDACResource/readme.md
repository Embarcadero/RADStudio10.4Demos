EMS.FireDACResource Sample[]()
# EMS.FireDACResource Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Run the EMS Package](#Run_the_EMS_Package)
* [3.2 Run the FireDAC Client Application](#Run_the_FireDAC_Client_Application)

* [4 Implementation](#Implementation)

* [4.1 EMS Package](#EMS_Package)
* [4.2 FireDAC Client](#FireDAC_Client)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample is a server-client EMS demo that uses FireDAC components. The sample accesses an SQLite database. The connection parameters are defined in the TFDConnection component. If you experience problems with the connection verify these parameters.It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the example. InterBase is used to store the information about the server connections. You can use the [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console) to display the statistics.

## Location 

You can find the **FireDACResource** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\DataBase\EMS\FireDACResource**
* **CPP\Database\EMS\FireDACResource**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/FireDACResource/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/FireDACResource/)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/FireDACResource/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/FireDACResource/)

## Description 

This sample demonstrates how to use an EMS package to extend the EMS Server to connect to an SQLite database using FireDAC components. The first part consists of creating an EMS Package with a TDataModule where the FireDAC components are placed. It uses the TFDConnection component to establish the connection to the SQLite database. Once you run the package, the resource is registered on the EMS server and can be accessed by a client application using REST. 
The FireDAC client needs a TEMSFireDACClient and a TEMSProvider to connect to the EMS Server and to retrieve the JSON data.

## How to Use the Sample 


### Run the EMS Package 

When you run the SampleEMSFireDACResourcePackage project, the EMSDevServer starts automatically. If the configuration file is missing, a wizard launches.
1.  Navigate to the location given above and open:

*  Delphi: **SampleEMSFireDACResourcePackage.dpk**
*  C++: **SampleEMSFireDACResourcePackageCpp.cbproj**

2.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.
3.  The **EMS Development Server** opens. If it is the first time you are using EMS on the machine, you need to run the configuration wizard in order to create the EMS server configuration file.

1.  When the **Confirm** dialog opens, click **Yes**.
2.  Leave all the parameters by default and go through the different windows clicking **Next**.
3.  Click **Finish** to close the wizard.
4.  An **Information** window appears. Click **OK**.

4.  The server starts automatically. Minimize it.

### Run the FireDAC Client Application 

The client expects the EMSDevServer to be running at localhost:8080. If you are running the server at a different address, modify the properties of the TEMSProvider component.
1.  On the Project Manager, right-click on **ProjectGroup1**.
2.  Click **Add Existing Project...**.
3.  Navigate to:

*  Delphi: **Start | Programs | Embarcadero RAD Studio Rio | Samples****\Object Pascal\DataBase\EMS\FireDACResource\SampleEMSFireDACClient.dproj**
*  C++: **Start | Programs | Embarcadero RAD Studio Rio | Samples****\CPP\Database\EMS\FireDACResource\SampleEMSFireDACClientCpp.cbproj**

4.  Press **F9** or choose **Run > Run**.
5.  Click **Get Tables** to load the data from the SQLite database.
6.  Do some changes on the records and click **Post Updates** to commit the changes.

## Implementation 


### EMS Package 

The Resource Module has code to register a [REST](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview) API resource. The resource is called "test". The resource defines a GET and a POST method. Once you run the package and have the EMS server running, as a test, you can invoke the GET method using the browser `http://localhost:8080/test`.

### FireDAC Client 

The client application has a [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) component. This component identifies the address of the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) (<code>http://localhost:8080</code>).The client application also has a [TEMSFireDACClient](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSFireDAC.TEMSFireDACClient). This component identifies the name of a resource (**test**).

*  EMSFireDACClient1.GetData accesses `http://localhost:8080/test` with HTTP GET. JSON is returned by the GET.

*  EMSFireDACClient1.PostUpdates accesses `http://localhost:8080/test` with HTTP POST. JSON is sent with the POST.
The [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) is able to load from JSON and save to JSON.On the client side, [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) is responsible for loading JSON into [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable), and for saving delta packages into JSON. 
On the server side, [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) is responsible for saving query results to JSON and for loading a JSON delta and applying inserts, updates, and deletes to the database. 

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Comp.Client.TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [FireDAC.Comp.Client.TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [FireDAC.Comp.Client.TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [Vcl.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList.TActionList)
* [REST.Backend.EMSProvider.TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider)
* [REST.Backend.EMSFireDAC.TEMSFireDACClient](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSFireDAC.TEMSFireDACClient)

## See Also 


* [RAD Server (EMS)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_(EMS))
* [Installing a RAD Server Package](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_RAD_Server_Package)
* [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console)
* [Tutorial: Implementing a FireDAC RAD Server Resource](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Implementing_a_FireDAC_RAD_Server_Resource)
* [Tutorial: Implementing a FireDAC RAD Server Client Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Implementing_a_FireDAC_RAD_Server_Client_Application)
* [REST Overview](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview)
* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [JSON](http://docwiki.embarcadero.com/RADStudio/en/JSON)
* [EMS.NotesResource Sample](http://docwiki.embarcadero.com/CodeExamples/en/EMS.NotesResource_Sample)






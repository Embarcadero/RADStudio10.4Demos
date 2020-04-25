EMS.NotesResource Sample[]()
# EMS.NotesResource Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Run the EMS Package](#Run_the_EMS_Package)
* [3.2 Run the Client Application](#Run_the_Client_Application)

* [4 Implementation](#Implementation)

* [4.1 EMS Package](#EMS_Package)
* [4.2 Client Application](#Client_Application)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample is a server-client EMS demo. It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the sample. InterBase is used to store the information with the server connections. Use the [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console) to display the statistics.

## Location 

You can find the **NotesResource** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Multi-Device Samples\EMS\NotesResource`
* `CPP\Multi-Device Samples\EMS\NotesResource`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/EMS/NotesResource/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/EMS/NotesResource/)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/EMS/NotesResource/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/EMS/NotesResource/)

## Description 

This sample demonstrates how to use an EMS package to extend the EMS Server creating a new resource (**Notes**).The first part consists of creating an EMS Package with a new ResourceName (**Notes**). Once you run the package, the resource is registered on the EMS server and can be accessed by a client application using REST. 
The client needs a TEMSProvider to connect to the EMS Server and to retrieve the JSON data.

## How to Use the Sample 


### Run the EMS Package 

When you run the NotesResourcePackage project, the EMSDevServer starts automatically. If the configuration file is missing, a wizard launches.
1.  Navigate to the location given above and open:

*  Delphi: **NotesResourcePackage.dpk**
*  C++: **NotesResourcePackageCpp.cbproj**

2.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.
3.  The **EMS Development Server** opens. If it is the first time you are using EMS on the machine, you need to run the configuration wizard in order to create the EMS server configuration file.

1.  When the **Confirm** dialog opens, click **Yes**.
2.  Leave all the parameters by default and go through the different windows by clicking **Next**.
3.  Click **Finish** to close the wizard.
4.  An **Information** window appears. Click **OK**.

4.  The server starts automatically. Minimize it.

### Run the Client Application 

The client expects the EMSDevServer to be running at localhost:8080. If you are running the server at a different address, modify the properties of the TEMSProvider component.The Delphi supported platforms for this sample are: 32-bit, 64-bit Windows, and iOS Simulator.

*  To run the sample on iOS Simulator, change the **URLHost** property of the TEMSProvider component to the IP address from the machine you are launching the sample and running the server. **Note:** The TEMSProvider component is placed in the NotesClientModule unit.
The C++ Supported platforms for this sample are: 32-bit and 64-bit.
1.  On the Project Manager, right-click on **ProjectGroup1**.
2.  Click **Add Existing Project...**.
3.  Navigate to:

*  Delphi: **Start | Programs | Embarcadero RAD Studio Rio | Samples****\Object Pascal\DataBase\EMS\NotesResource\NotesClientProject.dproj**.
*  C++: **Start | Programs | Embarcadero RAD Studio Rio | Samples****\CPP\Database\EMS\NotesResource\NotesClientProjectCpp.cbproj**.

4.  Press **F9** or choose **Run > Run**.
5.  Insert a **User name** and **Password** and click **Signup**, or **Login** if you previously created an account.
6.  Click **Add** to add a new note.
7.  Write the note and click **Save**.

## Implementation 


### EMS Package 

The Resource Module has code to register a [REST OverView](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview) API resource. The resource is called "Notes". The resource defines a Get, GetItem, Post, PutItem, and DeleteItem method. Once you run the package and have the EMS server running, as a test, you can invoke the GET method by using the browser `http://localhost:8080/Notes`.
**Note:** An error message appears informing that you need to be logged in to access this information.The **NotesStorageU** file defines the path of the notes.ini file where the created notes are saved.
### Client Application 

The client application has a [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) component. This component identifies the address of the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) (<code>http://localhost:8080</code>).The client application also has a TBackendEndPoint for each method. This component identifies the name of a resource (**Notes**), the method used, and the ResourceSuffix. These components are used to call the methods defined on the server.

*  TBackendEndPointGetNote accesses the **Notes** resource with GET and one particular item of the collection with the ResourceSuffix {item}.
*  TBackendEndPointGetNotes accesses the **Notes** resource with GET.
*  TBackendEndPointUpdateNote updates one particular note defined by the ResourceSuffix {item} with PUT.
*  TBackendEndPointDeleteNote deletes one particular note defined by the ResourceSuffix {item} with DELETE.
*  TBackendEndPointAddNote creates a new note with POST.
The information is managed with TJSONObject and TJSONArray.
## Uses 


* [REST.Backend.EMSProvider.TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider)
* [REST.Backend.ServiceComponents.TBackendAuth](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendAuth)
* [REST.Backend.EndPoint.TBackendEndpoint](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EndPoint.TBackendEndpoint)
* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)

## See Also 


* [RAD Server (EMS)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_(EMS))
* [Installing a RAD Server Package](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_RAD_Server_Package)
* [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console)
* [Tutorial: Implementing Your First RAD Server Resource](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Implementing_Your_First_RAD_Server_Resource)
* [Tutorial: Implementing Your First RAD Server Client Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Implementing_Your_First_RAD_Server_Client_Application)
* [REST Overview](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview)
* [JSON](http://docwiki.embarcadero.com/RADStudio/en/JSON)
* [EMS.FireDACResource Sample](http://docwiki.embarcadero.com/CodeExamples/en/EMS.FireDACResource_Sample)






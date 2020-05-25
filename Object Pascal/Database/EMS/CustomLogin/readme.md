EMS.CustomLogin Sample[]()
# EMS.CustomLogin Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Run the EMS CustomLogin Package](#Run_the_EMS_CustomLogin_Package)
* [3.2 Run the Client Application](#Run_the_Client_Application)

* [4 Implementation](#Implementation)

* [4.1 EMS Custom Package](#EMS_Custom_Package)
* [4.2 Client Application](#Client_Application)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

The **CustomLogin** sample is a server-client EMS demo, that demonstrates how to implement custom Login and Signup endpoints in a custom resource.It requires InterBase to be installed on the machine to connect to the EMS server. Make sure that the EMS Server is running before you run the client project. 

## Location 

You can find the **CustomLogin** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Database\EMS\CustomLogin`
* `CPP\Database\EMS\CustomLogin`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/CustomLogin/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/CustomLogin/)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/CustomLogin/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/CustomLogin/)

## Description 

This sample demonstrates how to implement a custom resource EMS package to extend the EMS Server. The **CustomLogin** resource is used to log on and sign up to the EMS Server by using Windows credentials.The first part consists of creating an EMS Package with a new resource (**CustomLogin**), that implements custom Login and Signup endpoints for your EMS Server. Once you run the package, the CustomLogin resource is registered on the EMS server, and the EMS Resource endpoints (Login and Signup) can be accessed by an EMS client application using REST call. 
The client application allows you to use the custom Login and Signup endpoints (from the CustomLogin package) and the standard [Users.SignupUser](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource#SignupUser_Endpoint) and [Users.LoginUser](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource#LoginUser_Endpoint) endpoints from the [Users resource](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource). 

## How to Use the Sample 


### Run the EMS CustomLogin Package 

When you run the CustomLoginPackage project, the EMSDevServer starts automatically. The supported platforms for this sample are: 32-bit and 64-bit Windows.

1. Navigate to one of the locations given above and open:

*  Delphi: **CustomLoginPackage.dpk**.
*  C++: **CustomLoginPackageCpp.cbproj**.

2.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.
3.  The **EMS Development Server** opens.  If it is the first time you are using EMS on the machine, you need to run the configuration wizard in order to create the EMS server configuration file.

*  When the **Confirm** dialog opens, click **Yes**.
*  Click **Next** until the installation finishes.

4.  The EMS Development Server starts automatically.
In the [EMS Development Server window](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_Window) you can see the **CustomLogin** resource loaded to the server:
```
{"RegResource":{"Resource":"CustomLogin","Endpoints":["CustomSignupUser","CustomLoginUser"],"Thread":6444}}

```


### Run the Client Application 

The client expects the EMSDevServer to be running at `localhost:8080`. If you are running the server at a different address, modify the properties of the [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) component.To run the sample on a different machine that the EMS Server, change the **URLHost** property of the TEMSProvider component to the IP address from the machine where the EMS Server runs. 
**Note:** The TEMSProvider component is placed in the CustomLoginClientU unit.
1.  On the Project Manager, right-click on **ProjectGroup1**.
2.  Click **Add Existing Project...**.
3.  Navigate to one of the locations given above and open:

*  Delphi: **CustomLoginClient.dproj**.

4.  C++: **CustomLoginClientCpp.cbproj**.
5.  Press **F9** or choose **Run > Run**.
6.  Select **Use Custom Resource** (CustomLogin) to use your Window credentials to authenticate in the EMS Server.
7.  In the **Signup** or **Login** tabs, insert a **UserName** and **Password** and click the buttons:

*  Use the **Signup** tab to sign up a new user and log on to the EMS Server with that user.
*  Use the **Login** tab if you previously created an account. Click the **Logout** button to log off from the EMS Server.

8.  In the **User** tab you can manage your user data:

*  Click the **Delete `user`** to delete the user from the EMS Server.
*  Click the **Retrieve Fields** button to get the custom description field from the EMS Server.

```
{
"description":"New info"
}

```




*  Click the **Update Fields** button to modify and update the custom description field in the EMS Server.
**Note:** The custom Login and Signup endpoints validate the **UserName** and **Password** against Windows users by calling [WinApi.Windows.LogonUser](https://msdn.microsoft.com/en-us/library/windows/desktop/aa378184%28v=vs.85%29.aspx). You need to sign up with valid Windows credentials.
## Implementation 


### EMS Custom Package 

The custom login package implements custom Login and Signup endpoints, by matching the signature of the [Users.LoginUser](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource#LoginUser_Endpoint) and [Users.SignupUser](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource#SignupUser_Endpoint) and implementing these methods. The custom public endpoints are:
* **CustomSignupUser** to sign up a new EMS user.
* **CustomLoginUser** to log in an existing EMS user.
The custom package uses the [TEMSInternalAPI](http://docwiki.embarcadero.com/Libraries/en/EMS.Services.TEMSInternalAPI) to call the endpoints of the [Users](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Users_Resource) resource in the EMS Server.The custom package validates credentials using [Windows Logon API](https://msdn.microsoft.com/en-us/library/windows/desktop/aa378184%28v=vs.85%29.aspx).

### Client Application 

The client application has a [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) component, that:
*  Identifies the address of the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)): http://localhost:8080.
*  Set the value of [TEMSProvider.LoginResource](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider.LoginResource) property to **CustomLogin** (the custom resource from the sample).
The client application also has the following components:
*  A [TBackendAuth](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendAuth) component to standard log in and sign up users.
*  A [ActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) for the actions the client application can do against the EMS Server (Login, Logout, Signup, DeleteUser, RetrieveUserFields, UpdateUserFields, UseCustomResource).
You can authenticate in the EMS Server by using:
*  If **Use Custom Resource** is selected, the EMS client application uses the **CustomLogin** resource to authenticate in the EMS Server. Your **Windows credentials** are used to authenticate in this sample.
*  If **Use Custom Resource** is not selected, standard Login and Signup is used to authenticate in the EMS Server.
The information is managed with TJSONObject and TJSONArray.
## Uses 


* [REST.Backend.EMSProvider.TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider)
* [REST.Backend.ServiceComponents.TBackendAuth](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendAuth)
* [REST.Backend.EndPoint.TBackendEndpoint](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EndPoint.TBackendEndpoint)
* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)

## See Also 


* [RAD Server (EMS)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_(EMS))
* [RAD Server External Credentials Support](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_External_Credentials_Support)
* [Installing a RAD Server Package](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_RAD_Server_Package)
* [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console)
* [EMS.NotesResource Sample](http://docwiki.embarcadero.com/CodeExamples/en/EMS.NotesResource_Sample)
* [EMS.FireDACResource Sample](http://docwiki.embarcadero.com/CodeExamples/en/EMS.FireDACResource_Sample)






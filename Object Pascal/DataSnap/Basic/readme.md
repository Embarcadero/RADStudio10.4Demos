DataSnap.Basic DataSnap Client and Server Sample[]()
# DataSnap.Basic DataSnap Client and Server Sample 


This sample shows how to create a DataSnap Server and a DataSnap Client.
## Location 

You can find the **Basic DataSnap Client and Server Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\DataSnap\Basic**.
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/Basic](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/Basic)

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Server Project](#Server_Project)
* [3.2 Client Project](#Client_Project)
* [3.3 DataSnap Server Methods Example Project](#DataSnap_Server_Methods_Example_Project)

* [4 Files](#Files)

* [4.1 Server Files](#Server_Files)
* [4.2 Client Files](#Client_Files)
* [4.3 DataSnap Server Methods Example Files](#DataSnap_Server_Methods_Example_Files)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Description 

The Basic DataSnap Client and Server application demonstrates: 
*  How to create a DataSnap Server application.
*  How to create a DataSnap Client application.

## How to Use the Sample 

There are three projects in subdirectories of the **Basic** directory:
* [Server Project](#Server_Project)
* [Client Project](#Client_Project)
* [DataSnap Server Methods Example Project](#DataSnap_Server_Methods_Example_Project)

### Server Project 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\Basic\Server**.
2.  Open the **DataSnapTestServer.dproj** project.
3.  Build the **DataSnapTestServer.dproj** project.
4.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
5.  The Server's interface shows you an Event Log and an Active Connections chart. These auto-populate when the Client attempts to connect to the Server.

### Client Project 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\Basic\Client**.
2.  Open the **DataSnapTestClient.dproj** project.
3.  Build the **DataSnapTestClient.dproj** project.
4.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
5.  The Client application enables you to test the server method class, the server method component, and the provider.

### DataSnap Server Methods Example Project 

This client application is a collection of **dunit** tests. These are not rigorous tests. They provide easy to read examples of how to use DataSnap features.The server and client are included in this project. Normally these would be in separate projects and executed in separate processes. The client and server are combined into the same project and execute in the same process for the purpose of providing a simple example. Units that would normally execute in a server process have **Server** in their name. Units that would normally execute in a client process have **Client** in their name.

1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\Basic\Examples**.
2.  Open the **DataSnapExamples.dproj** project inside the same project group as the Server.
3.  Build the **DataSnapExamples.dproj** project.
4.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**. Make sure you have the **DataSnapExamples.dproj** project selected in the Project Group.

## Files 

The files used by this sample are:
* [Server Files](#Server_Files)
* [Client Files](#Client_Files)
* [DataSnap Server Methods Example Files](#DataSnap_Server_Methods_Example_Files)

### Server Files 



|**File**                  |**Contains**                                                                       |
|--------------------------|-----------------------------------------------------------------------------------|
|**DataSnapTestServer**    |The Basic DataSnap Server project.                                                 |
|**MethodsServerModule**   |The DataSnap Server module.                                                        |
|**ParametersServerModule**|The parameters Server module.                                                      |
|**ProviderServerModule**  |The provider Server module.                                                        |
|**ServerContainerForm**   |The main form that is the user interface for the Basic DataSnap Server application.|


### Client Files 



|**File**              |**Contains**                                                                       |
|----------------------|-----------------------------------------------------------------------------------|
|**ClientClasses**     |Client classes created by the DataSnap proxy generator.                            |
|**ClientForm**        |The main form that is the user interface for the Basic DataSnap Client application.|
|**DataSnapTestClient**|The Basic DataSnap Client project.                                                 |


### DataSnap Server Methods Example Files 



|**File**                                       |**Contains**                                                |
|-----------------------------------------------|------------------------------------------------------------|
|**This client is a collection of dunit tests.**|Client classes created by the DataSnap proxy generator.     |
|**ClientTestClasses**                          |Client test classes created by the DataSnap proxy generator.|
|**DataSnapExamples**                           |The Basic DataSnap Server Methods Example project.          |
|**DataSnapTestData**                           |Various methods and classes used in the testing process.    |
|**TestServerContainer**                        |The DataSnap server container.                              |
|**TestServerModule**                           |The DataSnap server module.                                 |


## Uses 


* [DB Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DB)
* [SqlExpr Unit](http://docwiki.embarcadero.com/Libraries/en/Data.SqlExpr)
* [DBXCommon Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DBXCommon)

## See Also 


* [Developing DataSnap Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_DataSnap_Applications)
* [DataSnap Server Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Server_Application)
* [DataSnap Client Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Client_Application)
* [Videos: Delphi Labs, by Paweł Głowacki](http://www.embarcadero.com/rad-in-action/delphi-labs)






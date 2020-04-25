DataSnap.EchoToChannel Sample[]()
# DataSnap.EchoToChannel Sample 


This sample shows how to use a DataSnap/DBX TCPIP connection. 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 EchoToChannel Server Project](#EchoToChannel_Server_Project)
* [3.2 EchoToChannel Client Project](#EchoToChannel_Client_Project)

* [4 Files](#Files)

* [4.1 EchoToChannel Server Files](#EchoToChannel_Server_Files)
* [4.2 EchoToChannel Client Files](#EchoToChannel_Client_Files)

* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **EchoToChannel** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **Object Pascal\DataSnap\EchoToChannel**.
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/EchoToChannel](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/DataSnap/EchoToChannel)

## Description 

The Echo to Channel sample contains two projects:
*  The client sample demonstrates how to listen for messages from a callback channel using a DataSnap/DBX TCPIP connection.
*  The server demonstrates how to implement a server method that broadcasts a message to a channel.

## How to Use the Sample 

Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and go to **Object Pascal\DataSnap\EchoToChannel**. There are two projects in the **EchoToChannel** directory:
* [EchoToChannel Server Project](#EchoToChannel_Server_Project)
* [EchoToChannel Client Project](#EchoToChannel_Client_Project)

### EchoToChannel Server Project 


1.  Open the **EchoToChannelServerProject.dproj** project.
2.  Build the **EchoToChannelServerProject.dproj** project.
3.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
4.  This opens an Echo to Channel server interface.
5.  Follow the [EchoToChannel Client Project](#EchoToChannel_Client_Project) instructions to start one or more clients.

### EchoToChannel Client Project 


1.  Open the **DBXEchoToChannelClientProject.dproj** project.
2.  Build the **DBXEchoToChannelClientProject.dproj** project.
3.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
4.  The client application enables you to listen to a channel and call the server method class.

## Files 

The files used by this sample are:
* [EchoToChannel Server Files](#EchoToChannel_Server_Files)
* [EchoToChannel Client Files](#EchoToChannel_Client_Files)

### EchoToChannel Server Files 



|**File**                             |**Contains**                                                                                               |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------|
|**EchoToChannelServerProject**       |The Echo to Channel server project.                                                                        |
|**EchoToChannelServerForm**          |The main form that is the user interface for the Echo to Channel server sample.                            |
|**EchoToChannelServerMethodsUnit1**  |The server methods container holding source code for the server methods used in the Echo to Channel sample.|
|**EchoToChannelServerContainerUnit3**|The server container that holds the DataSnap Server components.                                            |


### EchoToChannel Client Files 



|**File**                         |**Contains**                                                                       |
|---------------------------------|-----------------------------------------------------------------------------------|
|**DBXEchoToChannelClientProject**|The Echo to Channel client project.                                                |
|**DBXEchoToChannelClientClasses**|Client classes created by the DataSnap proxy generator.                            |
|**DBXEchoToChannelForm**         |The main form that is the user interface for the Basic DataSnap Client application.|
|**DBXEchoToChannelClientModule** |The Echo to Channel server module.                                                 |


## Classes 


* **TClientModule1** implements the Echo to Channel client module.
* **TServerMethods1Client** implements the server methods available for the Echo to Channel client sample.
* **TForm4** is the main form that handles all controls.

## Implementation 


*  A [TSQLConnection](http://docwiki.embarcadero.com/Libraries/en/Data.SqlExpr.TSQLConnection) object provides the DataSnap/DBX TCPIP connection.
*  The client interface has a **Connect** button to listen from the callback channel and an **Echo** button to call the server method.

## Uses 


* [DB Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DB)
* [SqlExpr Unit](http://docwiki.embarcadero.com/Libraries/en/Data.SqlExpr)
* [DBXCommon Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DBXCommon)
* [DbxDatasnap Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DbxDatasnap)
* [DBXJSON Unit](http://docwiki.embarcadero.com/Libraries/en/Data.DBXJSON)

## See Also 


* [Developing DataSnap Applications](http://docwiki.embarcadero.com/RADStudio/en/Developing_DataSnap_Applications)
* [DataSnap Server Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Server_Application)
* [DataSnap Client Application](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_Client_Application)






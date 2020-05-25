EMS.APIDocAttributes Sample[]()
# EMS.APIDocAttributes Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Run the EMS Package](#Run_the_EMS_Package)
* [3.2 API Doc Attributes](#API_Doc_Attributes)

* [4 Implementation](#Implementation)

* [4.1 EMS Package](#EMS_Package)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample consists of an EMS package that loads a new resource into the EMS Server provided with RAD Studio. The demo uses FireDAC components to access the Interbase database **employee.gdb**. The connection parameters are defined in the TFDConnection component. If you experience problems with the connection verify these parameters.It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the server is running before you run the example. InterBase is used to store the information about the server connections. You can use the [RAD Server Console](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Console) to display the statistics.

## Location 

You can find the **APIDocAttributes** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\DataBase\EMS\APIDocAttributes**
* **CPP\Database\EMS\APIDocAttributes**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/APIDocAttributes/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/EMS/APIDocAttributes/)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/APIDocAttributes/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/EMS/APIDocAttributes/)

## Description 

This sample is an EMS package that contains a new resource with API documentation that can be accessed via HTTP. It displays the server responses in YAML and JSON formats.This sample uses an EMS package to extend the EMS Server to connect to Interbase using FireDAC components. 

## How to Use the Sample 


### Run the EMS Package 

When you run the APIDocAttributes project, the EMSDevServer starts automatically. If the configuration file is missing, a wizard launches.
1.  Navigate to the location given above and open:

*  Delphi: **APIDocDelphiAttributes.dpk**
*  C++: **APIDocCppAttributes.cbproj**

2.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.
3.  The **EMS Development Server** opens. If it is the first time you are using EMS on the machine, you need to run the configuration wizard in order to create the EMS server configuration file.

1.  When the **Confirm** dialog opens, click **Yes**.
2.  Leave all the parameters by default and go through the different windows clicking **Next**.
3.  Click **Finish** to close the wizard.
4.  An **Information** window appears. Click **OK**.

4.  The server starts automatically. Minimize it.

### API Doc Attributes 

The new EMS package loads a new resource in the EMS Server. The new resource contains four endpoints with their corresponding API documentation in YAML and JSON format.To access the API documentation:

* `http://localhost:8080/api/apidoc.yaml`
* `http://localhost:8080/api/apidoc.json`
To access the API documentation only for the new resource uploaded:
*  Delphi:

* `http://localhost:8080/api/sampleattributesdelphi/apidoc.yaml`
* `http://localhost:8080/api/sampleattributesdelphi/apidoc.json`

*  C++:

* `http://localhost:8080/api/sampleattributescpp/apidoc.yaml`
* `http://localhost:8080/api/sampleattributescpp/apidoc.json`
To see the result of the SQL query in JSON format in the browser:
* `http://localhost:8080/sampleattributesdelphi`
* `http://localhost:8080/sampleattributescpp`**Note'**: This response is obtained using the Get endpoint method of the new resource.
The structure of the result provided by the server is also provided in the API documentation, in the [EndPointObjectsYAMLDefinitions(Definition_schema)] and [EndPointObjectsJSONDefinitions(Definition_schema)].Use GetItem to see one specific item of the employee table. To see how to use each specific method, you can access the API documentation provided.

* `http://localhost:8080/sampleattributesdelphi/{item}`
* `http://localhost:8080/sampleattributescpp/{item}`
**Note**: The GetItem method generates a new SQL query with the item **FIRST_NAME** provided. `SELECT * FROM EMPLOYEE WHERE FIRST NAME = {item}`
For example:
`http://localhost:8080/sampleattributesdelphi/Robert`
` {"FDBS":{"Version":15,"Manager":{"TableList":[{"class":"Table","Name":"EmployeeTable","SourceName":"EMPLOYEE","SourceID":1,"RowList":[{"RowID":0,"Original":{"EMP_NO":2,"FIRST_NAME":"Robert","LAST_NAME":"Nelson","PHONE_EXT":"250","HIRE_DATE":"20071229T000000","DEPT_NO":"600","JOB_CODE":"VP","JOB_GRADE":2,"JOB_COUNTRY":"USA","SALARY":105900,"FULL_NAME":"Nelson, Robert"}}]}]}}}`
There are two more methods provided in the sample, Post and PutItem. 
Use Post to update an item, and PutItem to add a new item into the employee table.

## Implementation 


### EMS Package 

The Resource Module has code to register a [REST](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview) API resource. The resource is called "sampleattributesdelphi" or "sampleattributescpp". The resource defines four methods: Get, GetItem, Post, and PutItem. Once you run the package and have the EMS server running, as a test, you can invoke the GET method using the browser `http://localhost:8080/sampleattributesdelphi`.
The TDataModule contains the FireDAC components:

* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) establishes the connection to the Interbase database.
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) contains an SQL query: "SELECT * FROM EMPLOYEE".
* [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) is responsible for saving query results to JSON and for loading a JSON delta and applying inserts, updates, and deletions to the database.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Phys.IB.TFDPhysIBDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.IB.TFDPhysIBDriverLink)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Comp.Client.TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.StorageJSON.TFDStanStorageJSONLink)

## See Also 


* [RAD Server Administrative API](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Administrative_API)
* [RAD Server API Resource](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_API_Resource)
* [Custom API Documentation](http://docwiki.embarcadero.com/RADStudio/en/Custom_API_Documentation)
* [RAD Server (EMS)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_(EMS))
* [Installing a RAD Server Package](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_RAD_Server_Package)
* [Tutorial: Implementing a FireDAC RAD Server Resource](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Implementing_a_FireDAC_RAD_Server_Resource)
* [REST Overview](http://docwiki.embarcadero.com/RADStudio/en/REST_Overview)
* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [JSON](http://docwiki.embarcadero.com/RADStudio/en/JSON)






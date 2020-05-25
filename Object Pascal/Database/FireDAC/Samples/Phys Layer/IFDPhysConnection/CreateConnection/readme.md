FireDAC.IFDPhysConnection.CreateConnection Sample[]()
# FireDAC.IFDPhysConnection.CreateConnection Sample 


This sample demonstrates the use of the [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) and [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager) interfaces to connect to a database in [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **CreateConnection** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysConnection\CreateConnection`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysConnection/CreateConnection](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysConnection/CreateConnection)

## Description 

The **CreateConnection** sample shows you how to use the [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) and [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager) interfaces in order to connect to a database in FireDAC. To this end, the sample creates a [database connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) in four different ways:
1.  Using a [persistent connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)#Connection_Definition_File).
2.  Using a [parent definition](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.IFDStanDefinition.ParentDefinition).
3.  Defining the connection [parameters](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams) to create a new connection definition in run time.
4.  Using the FireDAC connection string to create a new connection definition in run time.

## How to Use the Sample 


1.  Navigate to the location given above and open `CreateConnection.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                               | Contains          |
|----------------------------------------------|-------------------|
|`CreateConnection.dproj``CreateConnection.dpr`|The project itself.|
|`fCreateConnection.pas``fCreateConnection.fmx`|The main form.     |


## Implementation 

This sample uses the [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection) method of [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager) to create a [database connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) in four different ways. When you run the application, you see two objects: a [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) and a [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton). Click the **Create Connection** button to create the connections. For each one of the four different connections, the sample repeats the following process:
1.  The sample [creates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection) a conection.
2.  The sample [opens](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Open) the connection.
3.  The sample uses the [memo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object to notify it.
4.  The sample [closes](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Close) the connection.
The sample creates the four different connections as follows: Using a persistent connection definition The sample creates the first connection to a database using an existing permanent connection definition. To this end, the sample uses the [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection) method to select the `Access_Demo` connection definition. Then, the sample calls the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Open) and [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Close) methods of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to open and close the connection.**Note**: The persistent connection definitions are stored in an external file - the **connection definition file**. By default the file is `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`.  Using a parent definition To create the second connection, the sample makes use of the [ParentDefinition](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.IFDStanDefinition.ParentDefinition) property to reuse the `Access_Demo` connection definition. The sample changes some parameters from the `Access_Demo` connection and renames it as `MyDefOverride`. Then, the sample uses the [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection), [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Open) and [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Close) methods to connect through the `MyDefOverride` connection.**Note**: The `MyDefOverride` connection is not saved as a persistent connection. Moreover, the `Access_Demo` connection definition remains unchanged on the **connection definition file**. Creating a new connection definition in run time The sample creates the third connection on-fly. This connection is named as `MyDefnew`. The sample configures its [parameters](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Intf.TFDConnectionDefParams) in run time in order to connect through `myDefNew` connection.**Note**: To make the `myDefNew` connection definition as persistent call the **ConnectionDefs.Save** method. Creating new definition using FireDAC connection string To create the last connection, the sample uses the FireDAC connection string to set the desired parameters of the connection. The parameter are separated by semicolons. See the code below:
> ```
> FDPhysManager.CreateConnection('DriverID=MSAcc;Database=$(FDHOME)\DB\Data\FDDemo.mdb;ReadOnly=True', oConn);
> 
> ```


## Uses 


* [IFDPhysManager](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager)

* [CreateConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysManager.CreateConnection)

* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Open)
* [Close](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.Close)

* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Database Connectivity (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Database_Connectivity_(FireDAC))
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Setting up Connections (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Setting_up_Connections_(FireDAC))

### Samples 


* [FireDAC Connection Definitions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample






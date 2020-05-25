EMS.ThingPoint IoT Sample[]()
# EMS.ThingPoint IoT Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Running the Sample Projects](#Running_the_Sample_Projects)

* [3.1.1 The EMS Custom Package Project](#The_EMS_Custom_Package_Project)
* [3.1.2 The ThingPoint Application Project](#The_ThingPoint_Application_Project)
* [3.1.3 Running the Client Applications](#Running_the_Client_Applications)

* [4 Uses](#Uses)
* [5 See Also](#See_Also)

This sample is a server-client [ThingPoint Overview](http://docwiki.embarcadero.com/RADStudio/en/ThingPoint_Overview) application demo. This sample demonstrates how to use a [ThingPoint](http://docwiki.embarcadero.com/RADStudio/en/ThingPoint_Overview) application to extend the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) and how these data is consumed by a [EMS Client application](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Client_Application). 
It requires [InterBase](http://docwiki.embarcadero.com/InterBase/XE7/en/Main_Page) to be installed on the machine or to connect to the [EMS remote server](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)). Make sure that the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) is running before you run the sample.

## Location 

You can find the **ThingPoint** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Multi-Device Samples\EMS\ThingPoint IoT Sample Data Demo`
* `CPP\Multi-Device Samples\EMS\ThingPoint IoT Sample Data Demo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/EMS/ThingPoint%20IoT%20Sample%20Data%20Demo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/EMS/ThingPoint%20IoT%20Sample%20Data%20Demo/)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/EMS/ThingPoint%20IoT%20Sample%20Data%20Demo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/EMS/ThingPoint%20IoT%20Sample%20Data%20Demo/)

## Description 

The demo application creates a [ThingPoint application](http://docwiki.embarcadero.com/RADStudio/en/ThingPoint_Overview) that simulates data generated from a [ThingConnect](http://docwiki.embarcadero.com/IoT/en/ThingConnect) device, caches its data, and responds to remote requests for data from the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)).The [EMS Resource](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Resource_Overview) project is loaded to the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)). The new ResourceName is `Measurements`. Once you run the package, the resource is registered on the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) and can be accessed by a [client application](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Client_Application) using REST. 
There are two [client applications](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Client_Application) in the sample. The client applications need a [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) to connect to the EMS Server and to retrieve the JSON data.

*  The client project requests data to the [EMS Resource](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Resource_Overview) from the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)) and the data from the [particular EMS EdgeModule](http://docwiki.embarcadero.com/RADStudio/en/EMS_EdgeModules).
*  The mobile client application requests data from the [particular EMS EdgeModule](http://docwiki.embarcadero.com/RADStudio/en/EMS_EdgeModules).

## How to Use the Sample 


### Running the Sample Projects 


#### The EMS Custom Package Project 

When you run the CustomResourcePackage project, the [EMS Development Server](http://docwiki.embarcadero.com/RADStudio/en/Running_the_RAD_Server_Engine_or_RAD_Server_Console_on_a_Developer_Environment_on_Windows) starts automatically. If the configuration file is missing, a [wizard](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Your_RAD_Server_Engine_or_RAD_Server_Console_on_Windows) launches.
1.  Navigate to the location given above and open:

*  Delphi: `CustomResource\`**CustomResourcePackage.dpk**

2.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.
3.  The **EMS Development Server** opens. If it is the first time you are using EMS on the machine, you need to run the configuration wizard in order to create the EMS server configuration file.

1.  When the **Confirm** dialog opens, click **Yes**.
2.  Leave all the parameters by default and go through the different windows by clicking **Next**.
3.  Click **Finish** to close the wizard.
4.  An **Information** window appears. Click **OK**.

4.  The server starts automatically and registers the custom resource in **CustomResourcePackage.bpl**.

```
{"RegResource":{"Resource":"Measurements","Endpoints":["Get"],"Thread":4376}}
{"Loaded":{"Filename":"C:\Users\Public\Documents\Embarcadero\Studio\21.0\Bpl\CustomResourcePackage.bpl","Thread":4376}}

```


#### The ThingPoint Application Project 

The ThingPoint application simulates two different types of measurements: heart rate measurements and blood pressure. 
1. On the Project Manager, right-click on **ProjectGroup1**.
2. Click **Add Existing Project...**.
3. Navigate to the location given above and open:

*  Delphi: `Thing Point\`**ThingPointProject.dproj**
*  C++: `Thing Point\`**ThingPointProjectCpp.cbproj**

4.  Run without debbuging. Choose **Run > Run Without Debugging**.
5.  Test the connection to the [RAD Server Engine (EMS Server)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_Engine_(EMS_Server)). In the **Connection to EMS Server** options, click the **Test** button with the default parameters (if your server is running at localhost:8080).
6.  Enter the configuration parameters of the [EdgeModule](http://docwiki.embarcadero.com/RADStudio/en/EMS_EdgeModules):

*  Enter a name for the EdgeModule: `MeasurementsThingPoint`
*  Enter the IP address where it runs: `localhost`
*  Enter the connection port: `8081`

7. Activate the EdgeModule. To do so, click the **Activate Edge Module** option.
8. Test if the ThingPoint is properly registered in the EMS Server.

*  Click the **Test** button.
*  If the connection is OK, a dialog box shows the EdgeModule version and name.

```
{"Request":{"Resource":"Edgemodules","Endpoint":"GetResourceEndpoint","Method":"GET","User":"(blank)","Time":"10/1/2015 9:45:09 AM","Thread":4444}}

```


9. Generate the simulated heart rate measurement data for the demo. To do so:

*  Select the **Heart Rate** tab.
*  Click the **Start** button.

```
[10:26:170] {"bpm":69}
[10:25:668] {"bpm":69}
[10:25:167] {"bpm":68}
[10:24:668] {"bpm":70}

```


10. Generate the simulated blood pressure measurement data for the demo. To do so:

*  Select the **Blood Pressure** tab.
*  Click the **Notify** button every time you want to send a new measurement.

```
[10:10:886] {"systolic":115,"diastolic":77}
[10:08:695] {"systolic":118,"diastolic":77}

```

#### Running the Client Applications 

The client applications expect the EMS Development server to be running at localhost:8080. If you are running the server at a different address, modify the properties of the [TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider) component.
1. On the Project Manager, right-click on **ProjectGroup1**.
2. Click **Add Existing Project...**.
3. Navigate to the location given above and open:

*  ClientProject:

*  Delphi: `\Client\DesktopClient\`**ClientProject.dproj**.

*  MobileClientProject:

*  Delphi: `\Client\MobileClient\`**MobileClientProject.dproj**.

4. Press **F9** or choose **Run > Run**.
5. Select the **Edge Request** tab to retrieve all the EdgeModule names that are registered in the EMS Server. This populates the combo-box.
6. Select an EMS EdgeModule from the combo-box.
7. Click the **Execute** button to retrieve the most recent data from the selected EdgeModule.
8.  Select the **Custom Resource Request** tab.
9.  Click the **Execute** button to retrieve the most recent data from all ThingPoints. **Note:** This request fails if the **CustomResourcePackage.bpl** is not registered in the EMSDevServer.
10. Check **Auto Refresh** to continuously execute requests to the EMS Server.

## Uses 


* [REST.Backend.EMSProvider.TEMSProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.EMSProvider.TEMSProvider)
*  EMSHosting.EdgeService.TEMSEdgeService

## See Also 


* [ThingPoint Overview](http://docwiki.embarcadero.com/RADStudio/en/ThingPoint_Overview)
* [Developing a ThingPoint Application with RAD Server](http://docwiki.embarcadero.com/RADStudio/en/Developing_a_ThingPoint_Application_with_RAD_Server)
* [Registering a ThingPoint in the RAD Server Engine](http://docwiki.embarcadero.com/RADStudio/en/Registering_a_ThingPoint_in_the_RAD_Server_Engine)
* [RAD Server (EMS)](http://docwiki.embarcadero.com/RADStudio/en/RAD_Server_(EMS))
* [Installing a RAD Server Package](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_RAD_Server_Package)






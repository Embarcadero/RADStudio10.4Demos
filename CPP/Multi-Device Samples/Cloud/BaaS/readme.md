REST.BaaS ToDo Sample[]()
# REST.BaaS ToDo Sample 


This sample project demonstrates the use of Kinvey as a BaaS (Backend as a Service) provider to post and get data from your data collection.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Sing up with Kinvey](#Sing_up_with_Kinvey)
* [4 How to Use the Sample](#How_to_Use_the_Sample)
* [5 Using a Different BaaS Provider](#Using_a_Different_BaaS_Provider)
* [6 Files](#Files)
* [7 Classes](#Classes)
* [8 Implementation](#Implementation)

* [8.1 The Sample Project](#The_Sample_Project)
* [8.2 BaaS Components](#BaaS_Components)
* [8.3 Other Components](#Other_Components)

* [9 Uses](#Uses)
* [10 See Also](#See_Also)


## Location 

You can find the **BaaS_ToDo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Cloud\BaaS`
* `CPP\Multi-Device Samples\Cloud\BaaS`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Cloud/BaaS](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Cloud/BaaS)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Cloud/BaaS](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Cloud/BaaS)

## Description 

The **BaaS_ToDo** sample uses Kinvey as a BaaS provider to post and get data from a data collection. This demo requires that you [sing up for an account with Kinvey](#Sing_up_with_Kinvey).This sample demonstrates the use of the [TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider) and [TBackendStorage](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage) components.

## Sing up with Kinvey 

To use the sample, you need to create an app backend at Kinvey:
1.  Go to [Kinvey website](http://www.kinvey.com/) and create an account if you do not have one.
2.  Once you are logged in at Kinvey, go to [your console](https://console.kinvey.com/) and click the button to create a **New App**.

*  Enter the name of the project.
*  Select **REST API** as platform and click **Create App**.

3.  When the app is created, click on **Development**.
4.  In this screen, you can find the **App ID**, **App Secret**, and **Master Secret** that are required for the [TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider) component.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **BaaS_ToDo.dproj**.
*  C++: **BaaS_ToDoCpp.cbproj**.

2.  In the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window), expand the **DataModuleUnit1** node and double-click **DataModuleUnit1.dfm** (Delphi) or **DataModuleUnit1.fmx** (C++) to open the [Data Module](http://docwiki.embarcadero.com/RADStudio/en/Using_Data_Modules) where the nonvisual components are located.
3.  Select the **KinveyProvider1** component and in the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) set the [AppKey](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TCustomKinveyConnectionInfo.AppKey), [AppSecret](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TCustomKinveyConnectionInfo.AppSecret), and [MasterSecret](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TCustomKinveyConnectionInfo.MasterSecret) to the values provided by Kinvey as commented in step 4 of [the previous section](#Sing_up_with_Kinvey) (the Kinvey App ID corresponds with the App Key property).
4.  Select the wanted target Platform from the Project Manager.
5. **Only for C++**: Go to **Project > Options > C++ Linker** and set **Link with SSL and Crypto** to `True` under iOS Device - 32 bit platform or iOS Device - 64 bit platform.
6.  Press **F9** or choose **Run > Run**.**Note:** The device where you run the application must have access to the Internet.
7.  You can click the plus button to add an item, write the title and description of the item and click **Save** to save your item. This sends the information to Kinvey.
8.  To view the information in the [Kinvey Console](https://console.kinvey.com/), you can refresh the Kinvey page and see how “Data” has new sub-section named **ToDos**.
9.  You can update the information in the **BaaS ToDo Sample App**. Click Refresh in the ToDos collection at Kinvey, to see how the information you change in the **BaaS ToDo Sample App** gets updated.**Note:** If you run the application and the data collection is not empty, you may have to click the **RefreshList**[TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to update the information and populate the **ListView** with the existing items.

## Using a Different BaaS Provider 

This sample uses Kinvey as BaaS (Backend as a Service) Provider. You can also use Parse as a BaaS provider. To use Parse, you must delete the [TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider) component, add a [TParseProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ParseProvider.TParseProvider) component and select the **Parse Provider** in the [Provider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage.Provider) property of the [TBackendStorage](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage) component.As done with the Kinvey provider, if you use Parse as a BaaS provider you must register in the [Parse page](https://parse.com/) and add the Parse details to the [TParseProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ParseProvider.TParseProvider) component.

## Files 



|**File in Delphi**      |**File in C++**                               |**Contains**                                                                                                                                                                                                                                                                                                                                                           |
|------------------------|----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|**BaaS_ToDo.dproj**     |**BaaS_ToDoCpp.cbproj**                       |The project itself.                                                                                                                                                                                                                                                                                                                                                    |
|**BaaS_ToDoForm.fmx**   |**BaaS_ToDoForm.fmx**                         |The main form where the components are located.                                                                                                                                                                                                                                                                                                                        |
|**DataModuleUnit1.dfm** |**DataModuleUnit1.fmx**                       |[Data Module](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TDataModule) that contains the nonvisual components: [TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider) and [TBackendStorage](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage).|
|**ToDoItemTypes.pas**   |**ToDoItemTypes.h**, **ToDoItemTypesData.cpp**|Used to define and implement `TToDo` class and the `TToDoNames` explained in the [Classes section](#Classes).                                                                                                                                                                                                                                                          |
|**BaaS_ToDo_Readme.txt**|**BaaS_ToDo_Readme.txt**                      |Information about this sample.                                                                                                                                                                                                                                                                                                                                         |


## Classes 

One new class and one new record are developed in ToDoItemTypes:
*  The `TToDo` class represents the information that is stored in the ToDos Kinvey collection. This class has the `Title` and `Content` properties that corresponds with the **title** and **content** collection elements.
*  The `TToDoNames` record holds information such as TitleProperty, ContentProperty, BackendClassname, TitleElement, and ContentElement.

## Implementation 


### The Sample Project 

The sample is divided in 3 parts:
* **BaaS_ToDoForm**: Implements the graphical interface. Calls to the **DataModuleFormUnit1** are done from here in order to connect and manage data from the backend.
* **DataModuleFormUnit1**: Implements the backed connection.
* **ToDoItemTypes**: Defines and implements the **TToDo** class and the **TToDoNames** record.

### BaaS Components 


*  This sample uses the [TBackendStorage](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage) component to post and get data from your data collection.
*  The [TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider) is used to set up the Kinvey connection to use Kinvey as a BaaS provider. The **TBackendStorage** and the **TKinveyProvider** components are connected as Kinvey is set in the [Provider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage.Provider) property of the **TBackendStorage** component.

### Other Components 


* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) component holds the [TTabItems](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) used to create the four different views of the application: **List, Details, Add, and Edit**.
* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) component is used to present the data collection as a list of items in the **Details** view. [TEdits](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) and [TMemos](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) display the data in the rest of the views.
* [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) holds the list of actions used by the components in response to user actions.
* [TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TPrototypeBindSource) has the two fields **Title** and **Content**, available in an item of the data collection.
* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) is used to create managed binding among the different components.

## Uses 


* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.ActnList.TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction)
* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [REST.Backend.ServiceComponents.TBackendStorage](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.ServiceComponents.TBackendStorage)
* [REST.Backend.KinveyProvider.TKinveyProvider](http://docwiki.embarcadero.com/Libraries/en/REST.Backend.KinveyProvider.TKinveyProvider)
* [Data.Bind.ObjectScope.TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TPrototypeBindSource)
* [Data.Bind.Components.TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)

## See Also 


* [BaaS Overview](http://docwiki.embarcadero.com/RADStudio/en/BaaS_Overview)
* [Getting Started with Kinvey and Parse](http://docwiki.embarcadero.com/RADStudio/en/Getting_Started_with_Kinvey_and_Parse)
* [Managing BaaS Users](http://docwiki.embarcadero.com/RADStudio/en/Managing_BaaS_Users)
* [Using BaaS for Backend Storage](http://docwiki.embarcadero.com/RADStudio/en/Using_BaaS_for_Backend_Storage)
* [Handling VCL Actions Using an Action List](http://docwiki.embarcadero.com/RADStudio/en/Handling_VCL_Actions_Using_an_Action_List)

* [Mobile Tutorial: Using BaaS for Backend Storage (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_BaaS_for_Backend_Storage_(iOS_and_Android))
* [Mobile Tutorial: Using Remote Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Remote_Notifications_(iOS_and_Android))

* [Kinvey website](http://www.kinvey.com/)
* [Parse website](https://parse.com/)






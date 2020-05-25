FMX.DeviceInfo Sample[]()
# FMX.DeviceInfo Sample 


This sample shows you how to obtain device information that includes OS version, OS name and device type.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Clases](#Clases)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **DeviceInfo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\DeviceInfo `
* `CPP\Mobile Snippets\DeviceInfo `

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/DeviceInfo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/DeviceInfo)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/DeviceInfo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/DeviceInfo)

## Description 

The **DeviceInfo** sample demonstrates how to obtain device information of an iOS or Android device. This sample uses the [iOS](http://docwiki.embarcadero.com/RADStudio/en/Creating_an_iOS_App#iOS_Objective-C_Frameworks_.28iOSapi.29) or [Android](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Built-in_RAD_Studio_Java_Libraries_for_Android) APIs to obtain the OS version, the OS name and the device type.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **DeviceInfo.dproj**.
*  C++: **DeviceInfo.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Click on the refresh tool button at the upper right corner to obtain the following device information:

*  OS Name
*  Device Type
*  OS Version

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**DeviceInfo.dproj**|**DeviceInfo.cbproj**                  |The project itself.                            |
|**uMain.fmx**       |**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**       |**DeviceInfoPCH.h**, **TapAndHold.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Clases 

**TDeviceInfoForm** is the main form that represents the main window of the sample. It contains the following components: 
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object with three [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).

*  A [TListBoxItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **lbOSName**
*  A [TListBoxItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **lbDeviceType**
*  A [TListBoxItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **lbOSVersion**

*  A [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) object called **btnGetDeviceInfo** and a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display a set of information items related with the device and the OS.
*  The sample uses each [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) to display each information item.
*  The sample uses a [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) component called **btnGetDeviceInfo** to call the **OnClick** event that is used to get the device information.
When you run the application, you can see at the upper right corner a button with the **StyleLookup** set to **refreshtoolbuttonbordered**. Click on it to obtain the following information of your device:
*  OS Name
*  Device Type
*  OS Version

## Uses 


* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
The sample uses Built-in Java libraries for Android 
*  androidapi.JNI.JavaTypes
*  androidapi.Helpers
*  androidapi.JNI.Os
The sample uses iOS Objective-C Frameworks
*  iOSapi.UIKit
*  iOSapi.Foundation
*  Macapi.Helpers

## See Also 


* [Creating an iOS App](http://docwiki.embarcadero.com/RADStudio/en/Creating_an_iOS_App)
* [Using the Built-in RAD Studio Java Libraries for Android](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Built-in_RAD_Studio_Java_Libraries_for_Android)






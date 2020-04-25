FMX.Location Sample[]()
# FMX.Location Sample 


This sample demonstrates how to use the [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) component in order to read the GPS location of the device and display it on the form. The sample also shows you how to display Google Maps in a web browser in order to accurately pinpoint the location of the device on a map.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **Location** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\Location`
* `CPP\Mobile Snippets\Location`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Location](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Location)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Location](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Location)

## Description 

The **Location** sample demonstrates how to use the location sensor of the device on iOS applications. The sample uses [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) to offer information about the GPS location of the device. Moreover, the sample displays the location of the device on Google Maps using [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser).
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **Location.dproj**.
*  C++: **Location.cbproj**.

2.  Select the iOS platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Enable the **Location Sensor** to get the **Latitude** and **Longitude** values of the location of your device.
*  See the location of your device displayed on Google Maps.
*  Move the device in order to see how the location sensor can monitor the location changes of the device.
*  Change the **Trigger Distance** and **Accurancy** properties and interact with the sample another time.

## Files 



|**File in Delphi** |**File in C++**                    |**Contains**                                   |
|-------------------|-----------------------------------|-----------------------------------------------|
|**Location.dproj** |**Location.cbproj**                |The project itself.                            |
|**uMain.fmx**      |**uMain.fmx**                      |The main form where the components are located.|
|**uMain.pas**      |**LocationPCH.h**, **Location.cpp**|Used to define and implement the sample.       |
|**Information.txt**|**Information.txt**                |Further information about the sample.          |


## Classes 

**TLocationForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) object.
*  A [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) object.
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object containing five [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).

* [TListBoxItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbLocationSensor**, containing the following controls:

*  A [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) object, called **swLocationSensorActive**.

* [TListBoxItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbTriggerDistance**, containing the following controls:

*  Two [Tbuttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton).
*  A [TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox), called **nbTriggerDistance**.

* [TListBoxItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbAccurancy**, containing the following controls:

*  Two [Tbuttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton).
*  A [TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox), called **nbAcurrancy**.

* [TListBoxItem4](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbLatitude**.
* [TListBoxItem5](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbLongitude**.

*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) to determine the location information of your device.
*  The sample uses [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) to load and display content from a URL address (Google Maps in this sample).
*  The sample uses [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) to provide the user with a two-way on-off switch. [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) on enables [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor).
*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display a set of items of [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) information in a scrollable list.
When you run the application, [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) is disabled. You can enable the location sensor by switching the **swlocationSensorActive**. If [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) is enabled, it reads the GPS location of the device and displays it on Google Maps using a [web browser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) in order to accurately pinpoint the location of the device on a map. Then, the sample uses the [LocationChange](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.LocationChange), [Accuracy](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.Accuracy) and [Distance](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.Distance) properties of [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) to monitor location changes and trigger [OnLocationChanged](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.OnLocationChanged) whenever there is a location change.
## Uses 


* [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor)
* [LocationChange](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.LocationChange)
* [Accuracy](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.Accuracy)
* [Distance](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.Distance)
* [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser)
* [Navigate](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.Navigate)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)

## See Also 


* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))
* [Mobile Tutorial: Using the Web Browser Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Web_Browser_Component_(iOS_and_Android))
* [System.Sensors.Components.TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor)
* [FMX.WebBrowser.TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser)

### Samples 


* [LocationDemo](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LocationDemo_Sample) sample
* [Map](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Map_Sample) sample






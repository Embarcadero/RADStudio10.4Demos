FMX.LocationDemo Sample[]()
# FMX.LocationDemo Sample 


This is a sample that describes how to use location data in mobile applications, using **FireMonkey**.
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

You can find the **FireMonkeyMobile LocationDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\LocationDemo`
* `CPP\Multi-Device Samples\Device Sensors and Services\LocationDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/LocationDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/LocationDemo)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/LocationDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/LocationDemo)

## Description 

This application allows the user to display their location on a map and save it for future use.**Note**: This sample application requires Internet connection.

## How to Use the Sample 


1.  Navigate to one of the [locations](#Location) given above, and open:

*  Delphi: **LocationDemoProject.dproj**
*  C++: **LocationDemoProject.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Files 

The sample files are **LocationDemoUnit**, the main form that constitutes the user interface for the **FireMonkeyMobile LocationDemo** Sample application and **LocationDemoProject**, the project itself.
## Classes 

**FireMonkey TabSlideTransition** represents the main window of the sample. It contains the following components:
*  A [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor)
*  A [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser)
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox), named _ListBox1_, contains the following controls:

*  A [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader)
*  Two [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), named _ListBoxItemLatitude_ and _ListBoxItemLongitude_
*  A [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named _TListBoxGroupHeader2_
*  Ten [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), named _ListBoxItemAdminArea_, _ListBoxItemCountryCode_, _ListBoxItemCountryName_, _ListBoxItemFeatureName_, _ListBoxItemLocality_, _ListBoxItemPostalCode_, _ListBoxItemSubAdminArea_, _ListBoxItemSubLocality_, _ListBoxItemSubThoroughfare_, _ListBoxItemThoroughfare_.
*  A [TListBoxHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxHeader)

*  A [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)

*  A [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)

*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## Implementation 


*  Make sure that the Switch is On and the iOS device has the **Location Services On**.
*  The sample shows the Latitude and Longitude for the location of the device using the [TLocationCoord2D](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TLocationCoord2D) properties and the [OnLocationChanged](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor.OnLocationChanged) event.
* [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) is used to show a map using Google Maps.

## Uses 


* [System.Sensors.Components.TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor)
* [FMX.WebBrowser.TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser)
* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.ListBox.TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader)
* [FMX.ListBox.TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.Controls.TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [FMX.Controls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)
* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))

### Samples 


* [VCL Sensors](http://docwiki.embarcadero.com/CodeExamples/en/VCL.Sensors_Sample) sample






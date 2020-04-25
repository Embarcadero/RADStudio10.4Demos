FMX.OrientationSensor Sample[]()
# FMX.OrientationSensor Sample 


This sample demonstrates how to use the [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) component in order to get compass related information such as the tilt on the three axis and the heading on the three axis.
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

You can find the **OrientationSensor** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\OrientationSensor`
* `CPP\Mobile Snippets\OrientationSensor`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/OrientationSensor](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/OrientationSensor)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/OrientationSensor](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/OrientationSensor)

## Description 

The **OrientationSensor** sample demonstrates how to use the orientation sensor in iOS or Android applications. The sample uses the [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) component and the [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) class to offer information about the rotation angle (tilt) and the compass heading relative to the magnetic north (heading).**Note**: The [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) class supports Android, iOS and Windows platforms. However, each platform provides different orientation sensors and each type of sensor supports a different set of properties (see [platform support](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor#Platform_Support) for a completed list of platform, sensors and supported properties).
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **OrientationSensor.dproj**.
*  C++: **OrientationSensor.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Press the **Tilt** button. It shows:

*  The [rotation angle](http://en.wikipedia.org/wiki/Angle_of_rotation) in [degrees](http://en.wikipedia.org/wiki/Degree_(angle)) on the [X axis](http://en.wikipedia.org/wiki/Cartesian_coordinate_system#Cartesian_coordinates_in_three_dimensions).
*  The rotation angle in degrees on the Y axis.
*  The rotation angle in degrees on the Z axis.

*  Press the **Heading** button. It shows:

*  The [X coordinate](http://en.wikipedia.org/wiki/Cartesian_coordinate_system#Cartesian_coordinates_in_three_dimensions) of the vector that points to the [magnetic North](http://en.wikipedia.org/wiki/North_Magnetic_Pole), measured in [MicroTeslas](http://en.wikipedia.org/wiki/Tesla_(unit)).
*  The Y coordinate of the vector that points to the magnetic North, measured in MicroTeslas.
*  The Z coordinate of the vector that points to the magnetic North, measured in MicroTeslas.

## Files 



|**File in Delphi**         |**File in C++**                                      |**Contains**                                   |
|---------------------------|-----------------------------------------------------|-----------------------------------------------|
|**OrientationSensor.dproj**|**OrientationSensor.cbproj**                         |The project itself.                            |
|**uMain.fmx**              |**uMain.fmx**                                        |The main form where the components are located.|
|**uMain.pas**              |**OrientationSensorPCH.h**, **OrientationSensor.cpp**|Used to define and implement the sample.       |
|**Information.txt**        |**Information.txt**                                  |Further information about the sample.          |


## Classes 

**TOrientationSensorForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) object containing two [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) objects.

* [TSpeedButton1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) called **TiltButton**.
* [TSpeedButton1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) called **HeadingButton**.

*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object containing seven [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) objects.

* [TListBoxItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbOrentationSensor**, containing a [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) object, called **swOrientationSensorActive**.
* [TListBoxItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbTiltX**.
* [TListBoxItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbTiltY**.
* [TListBoxItem4](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbTiltZ**.
* [TListBoxItem5](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbHeadingX**.
* [TListBoxItem6](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbHeadingY**.
* [TListBoxItem7](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), called **lbHeadingZ**.

*  A [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) object.
*  A [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) to give information about the device inclination and compass heading.
*  The sample uses [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) to provide the user with a two-way on-off switch. [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) on enables [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor).
*  The sample uses [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) to repeat specific actions after a given time interval. [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) specifies the time interval in which [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) offers information to the user.
*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display a list with a set of items with [orientation](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) information.
*  The sample uses [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) to organize the **Tilt** and **Heading** buttons under the same parent.
*  The sample uses [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) to enable the orientation sensor to offer tilt related information or heading related information.
When you run the application, [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) is disabled. You can enable the orientation sensor by switching the **swOrientationSensorActive**. If [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) is enabled, the sample offers some orientation related information depending on which button is pressed. If you press the **Tilt** button, the sample offers information about the rotation angle. If you press the **Heading** button, the sample offers information about the compass heading relative to the magnetic north.
## Uses 


* [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor)
* [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton)

## See Also 


* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))

### Samples 


* [FireMonkey Sensor Info](http://docwiki.embarcadero.com/CodeExamples/en/FMX.SensorInfo_Sample) sample
* [FireMonkey Accelerometer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Accelerometer_Sample) sample
* [FireMonkey Location Demo](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LocationDemo_Sample) sample
* [FireMonkey Gyroscope](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Gyroscope_Sample) sample
* [VCL Sensors](http://docwiki.embarcadero.com/CodeExamples/en/VCL.Sensors_Sample) sample






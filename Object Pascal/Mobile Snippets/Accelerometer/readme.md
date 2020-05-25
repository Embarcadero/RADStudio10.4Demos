FMX.Accelerometer Sample[]()
# FMX.Accelerometer Sample 


This sample demonstrates how to use the accelerometer in order to obtain information about the acceleration, angular acceleration, motion and speed.
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

You can find the **TabSliding** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\Accelerometer`
* `CPP\Mobile Snippets\Accelerometer`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Accelerometer](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Accelerometer)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Accelerometer](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Accelerometer)

## Description 

The **Accelerometer** sample demonstrates how to use the accelerometer in iOS or Android applications. The sample uses [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) component and [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor) class to offer information about the acceleration, angle, state, and speed of the device motion.**Note**: [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor) class supports Android, iOS and Windows platforms. However, each platform provides different motion sensors and each type of sensor supports a different set of properties (see [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor) for a complete list of platform, sensors and supported properties). Some functionalities of this sample could be disabled depending on the target platform.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **Accelerometer.dproj**.
*  C++: **Accelerometer.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample. It shows:

* [Acceleration](http://en.wikipedia.org/wiki/Acceleration) in [gals](http://en.wikipedia.org/wiki/Gal_(unit)) for the [X axis](http://en.wikipedia.org/wiki/Cartesian_coordinate_system#Cartesian_coordinates_in_three_dimensions).
*  Acceleration in gals for the Y axis.
*  Acceleration in gals for the Z axis.
* [Angular acceleration](http://en.wikipedia.org/wiki/Angular_acceleration) in [degrees](http://en.wikipedia.org/wiki/Degree_(angle)) per [second](http://en.wikipedia.org/wiki/Second) squared for the [X axis](http://en.wikipedia.org/wiki/Cartesian_coordinate_system#Cartesian_coordinates_in_three_dimensions).
*  Angular acceleration in degrees per second squared for the Y axis.
*  Angular acceleration in degrees per second squared for the Z axis.
* [Speed](http://en.wikipedia.org/wiki/Speed) in [meters per second](http://en.wikipedia.org/wiki/Metre_per_second).
*  Specifies whether the device is currently in motion (`True`) or not (`False`).

## Files 



|**File in Delphi**     |**File in C++**                              |**Contains**                                   |
|-----------------------|---------------------------------------------|-----------------------------------------------|
|**Accelerometer.dproj**|**Accelerometer.cbproj**                     |The project itself.                            |
|**uMain.fmx**          |**uMain.fmx**                                |The main form where the components are located.|
|**uMain.pas**          |**AccelerometerPCH.h**, **Accelerometer.cpp**|Used to define and implement the sample.       |
|**Information.txt**    |**Information.txt**                          |Further information about the sample.          |


## Classes 

**TAccelerometerForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object.

*  Eight [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) objects.
*  A [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) object.

*  A [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) object.
*  A [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) to offer information about acceleration, angle, state, and speed of the device motion.
*  The sample uses [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) to repeat specific actions after a given time interval. [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) specifies the time interval in wich [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) offers information to the user.
*  The sample uses [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) to provide the user with a two-way on-off switch. [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) on enables [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) and [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor).
*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display a set of items of [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) information in a scrollable list.
When you run the application, [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) and [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) are disabled. When you switch on the [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) object, [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) and [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) are enabled and each [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) shows different information about the acceleration, angle, state, and speed of the device motion. The sample shows the following information of the device motion:
*  The acceleration of the X-axis of the accelerometer.
*  The acceleration of the Y-axis of the accelerometer.
*  The acceleration of the Z-axis of the accelerometer.
*  The angular acceleration of the X-axis of the accelerometer.
*  The angular acceleration of the Y-axis of the accelerometer.
*  The angular acceleration of the Z-axis of the accelerometer.
*  The speed of the accelerometer.
*  The motion property of the accelerometer, which could be set to `True` or `False`.
**Note**: Some functionalities of this sample could be disabled depending on the target platform. See [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor) for a complete list of platform, sensors and supported properties.
## Uses 


* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor)
* [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)

## See Also 


* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))
* [Mobile Code Snippets](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Code_Snippets)
* [TCustomSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomSensor)
* [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor)

### Samples 


* [FMX.SensorInfo Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.SensorInfo_Sample)
* [RTL.SensorTag](http://docwiki.embarcadero.com/CodeExamples/en/RTL.SensorTag)
* [VCL Sensors](http://docwiki.embarcadero.com/CodeExamples/en/VCL.Sensors_Sample) sample






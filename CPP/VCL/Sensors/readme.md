VCL.Sensors Sample[]()
# VCL.Sensors Sample 


This sample demonstrates how to use different [sensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components) components such as: [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor), [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) or [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor).
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

You can find the **Sensors** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\VCL\Sensors`
* `CPP\VCL\Sensors`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Sensors](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Sensors)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Sensors](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Sensors)

## Description 

The **Sensors** sample demonstrates how to use [sensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components) components on a [VCL application](http://docwiki.embarcadero.com/RADStudio/en/VCL_Forms_Application). The sample uses [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor), [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) and [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) to provide related sensor information.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: `VCLSensors.dproj`.
*  C++: `VCLSensorsCpp.cbproj`.

2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                   | File in C++                             | Contains          |
|----------------------------------|-----------------------------------------|-------------------|
|`VCLSensors.dproj``VCLSensors.dpr`|`VCLSensorsCpp.cbproj``VCLSensorsCpp.cpp`|The project itself.|
|`uMain.pas``uMain.fmx`            |`uMain.h``uMain.cpp``uMain.fmx`          |The main form.     |


## Classes 

**TForm5** is the main form that represents the main window of the sample. It contains the following components:
*  A [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) object, named **GroupBox4**, that contains:

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) object named **bSwitch**.

*  A [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) object named **lsLocation**.
*  A [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) object named **msAccelerometer**.
*  Two [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) objects, named **osCompass** and **osInclinometer**.
*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TPanel) object, named **Panel1**, that contains tree [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) objects.

* **GroupObject1** contains tree [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) objects, named **lAddress**, **lCoordinates** and **lGeoCoordinates**.
* **GroupObject2** contains a [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) object named **lAccel**.
* **GroupObject3** contains two [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) objects, named **lCompass** and **lInclinometer**.

*  Two [TTimer](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TTimer) objects, named **tMotion** and **tOrientation**.

## Implementation 


*  The sample uses [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor) to determine the location information of the device.
*  The sample uses [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor) to offer information about the acceleration in each coordinate axis.
*  The sample uses [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) to give information about the device inclination and compass heading.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) to enable the VCL sensors.
*  The sample uses [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) to repeat specific actions after a given time interval. Each [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) specifies the time interval in which each sensor offers information to the user.
*  The sample uses [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) to display text on the form. Each label is used to display each sensor information.
*  The sample uses [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) to group related controls on a form. In this sample, each [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) groups the labels that display information about the sample sensor.
When you run the application, the [Active](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TSensor.Active) properties of the VCL sensors are set to `False`, which means that all the sensors are disabled. Moreover, you see the form divided in four [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) objects with the following captions: `Location`, `Motion`, `Orientation` and `Manage`. The **GroupBox4**, labeled as `Manage`, contains the **bSwitch** button with its [caption](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.Caption) displaying the text `Turn on`. When you click on the **bSwitch** button, its caption changes to `Turn off` and the [Active](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TSensor.Active) property of the VCL sensors changes to `True`. Then, the information related with each sensor is displayed using the [labels](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) that contain each [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox) object. 
## Uses 


* [TLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TLocationSensor)
* [TMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TMotionSensor)
* [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor)
* [TTimer](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TTimer)
* [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TGroupBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)
* [TPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TPanel)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel)

## See Also 


* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))

### Samples 


* [FireMonkey Sensor Info](http://docwiki.embarcadero.com/CodeExamples/en/FMX.SensorInfo_Sample) sample
* [FireMonkey Accelerometer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Accelerometer_Sample) sample
* [FireMonkey Location](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LocationDemo_Sample) sample
* [FireMonkey Orientation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.OrientationSensor_Sample) sample






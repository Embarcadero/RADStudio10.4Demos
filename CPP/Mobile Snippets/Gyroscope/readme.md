FMX.Gyroscope Sample[]()
# FMX.Gyroscope Sample 


This sample demonstrates how to use the Gyroscope in order to rotate a 3D cube when your device is tilted.
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

You can find the **Gyroscope** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\Gyroscope`
* `CPP\Mobile Snippets\Gyroscope`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Gyroscope](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Gyroscope)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Gyroscope](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Gyroscope)

## Description 

The **Gyroscope** sample demonstrates how to use the Gyroscope in order to rotate a 3D cube when your device is tilted. This sample suports both iOS or Android devices. The sample uses the [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) component and the [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) class to act like a gyroscope that rotates a 3D cube while you tilt your device.**Note**: The [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) class supports Android, iOS and Windows platforms. However, each platform provides different orientation sensors and each type of sensor supports a different set of properties (see [platform support](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor#Platform_Support) for a completed list of platform, sensors and suported properties).
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **Gyroscope.dproj**.
*  C++: **Gyroscope.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  There is a 3D cube displayed in the screen.
*  Tilt your device and see how the 3D cube rotates.

## Files 



|**File in Delphi** |**File in C++**                      |**Contains**                                   |
|-------------------|-------------------------------------|-----------------------------------------------|
|**Gyroscope.dproj**|**Gyroscope.cbproj**                 |The project itself.                            |
|**uMain.fmx**      |**uMain.fmx**                        |The main form where the components are located.|
|**uMain.pas**      |**GyroscopePCH.h**, **Gyroscope.cpp**|Used to define and implement the sample.       |
|**Information.txt**|**Information.txt**                  |Further information about the sample.          |


## Classes 

**TGyroscopeForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) object.
*  A [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) object.
*  A [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) object.
*  A [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) object.
*  A [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
*  A [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) object.

## Implementation 


*  The sample uses [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) to implement a 3D shape under the form of a 3D rectangle that can be placed on a 3D FireMonkey form.
*  The sample uses [TSensorManager](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TSensorManager) to identify the sensor of your device.
*  The sample uses [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) to obtain information about the device inclination (tilt).
*  The sample uses [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) to repeat specific actions after a given time interval. [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) specifies the time interval in wich [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor) offers the tilt information used to rotate the [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D).
*  The sample uses [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) to imitate the rays of light and their propagation on the 3D object.
*  The sample uses [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) to link a [TLightMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TLightMaterial) to 3D objects. The link is made through [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
When you run the application, you see a 3D cube on the screen. If you tilt your device, the sample uses the [TiltX](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltX), [TiltY](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltY) and [TiltZ](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltZ) properties of [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) to obtain the angle that has to be used to rotate the 3D cube using the [RotationAngle.X](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle), [RotationAngle.Y](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle) and [RotationAngle.Z](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle) properties of [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D).
## Uses 


* [TOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.Components.TOrientationSensor)
* [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor)
* [TiltX](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltX)
* [TiltY](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltY)
* [TiltZ](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor.TiltZ)
* [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D)
* [RotationAngle](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle)
* [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource)
* [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface (FireMonkey 3D Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application (FireMonkey 3D Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

### Samples 


* [FireMonkey Orientation Sensor](http://docwiki.embarcadero.com/CodeExamples/en/FMX.OrientationSensor_Sample) sample
* [FireMonkey Low Level 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LowLevel3D_Sample) sample
* [FireMonkey Model Viewer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ModelViewer_Sample) sample
* [FireMonkey 3D Arrows](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample






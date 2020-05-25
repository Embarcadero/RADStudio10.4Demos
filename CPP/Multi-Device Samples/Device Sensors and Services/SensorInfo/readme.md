FMX.SensorInfo Sample[]()
# FMX.SensorInfo Sample 


This is a sample that illustrates how to get device sensor info in mobile applications, using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **FireMonkeyMobile SensorInfo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\SensorInfo`
* `CPP\Multi-Device Samples\Device Sensors and Services\SensorInfo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/SensorInfo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/SensorInfo)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/SensorInfo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/SensorInfo)

## Description 

This demo shows interaction with a mobile device sensor. 
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **SensorInfo.dproj**
*  C++: **SensorInfo.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Classes 

**FireMonkey SensorInfo** represents the main window of the sample. It contains the following components:
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
*  A [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)

## Implementation 


*  The application creates a list of [Sensors](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomSensor) and populates the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox).
*  The information about the [Sensors](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomSensor) is shown in the list:

* [TCustomBiometricSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomBiometricSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomBiometricSensor_Properties)
* [TCustomElectricalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomElectricalSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomElectricalSensor_Properties)
* [TCustomEnvironmentalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomEnvironmentalSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomEnvironmentalSensor_Properties)
* [TCustomLightSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLightSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLightSensor_Properties)
* [TCustomLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor_Properties)
* [TCustomMechanicalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMechanicalSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMechanicalSensor_Properties)
* [TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor_Properties)
* [TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor_Properties)
* [TCustomScannerSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomScannerSensor) and its [Properties](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomScannerSensor_Properties)

## Uses 


* [System.Sensors.TCustomSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomSensor)
* [System.Sensors.TCustomBiometricSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomBiometricSensor)
* [System.Sensors.TCustomElectricalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomElectricalSensor)
* [System.Sensors.TCustomEnvironmentalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomEnvironmentalSensor)
* [System.Sensors.TCustomLightSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLightSensor)
* [System.Sensors.TCustomLocationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomLocationSensor)
* [System.Sensors.TCustomMechanicalSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMechanicalSensor)
* [System.Sensors.TCustomMotionSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomMotionSensor)
* [System.Sensors.TCustomOrientationSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomOrientationSensor)
* [System.Sensors.TCustomScannerSensor](http://docwiki.embarcadero.com/Libraries/en/System.Sensors.TCustomScannerSensor)
* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)

### Samples 


* [FireMonkey Orientation Sensor](http://docwiki.embarcadero.com/CodeExamples/en/FMX.OrientationSensor_Sample) sample
* [VCL Sensors](http://docwiki.embarcadero.com/CodeExamples/en/VCL.Sensors_Sample) sample






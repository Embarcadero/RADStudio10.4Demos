FMX.FlashLight Sample[]()
# FMX.FlashLight Sample 


This is a sample that uses FireMonkey to make your device function as a flashlight.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile FlashLight** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\FlashLight`
* `CPP\Multi-Device Samples\Device Sensors and Services\FlashLight`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/FlashLight](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/FlashLight)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/FlashLight](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/FlashLight)

## Description 

This application shows the use of the [TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent) to toggle a device flash.
> **Note:** This application only has effect on an actual mobile device.


## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **FlashLight.dproj**
*  C++: **FlashLight.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Files 

The project has one source file, **FlashLightU.pas**, which contains the main form class. 
## Classes 

**TFlashLightForm** represents the main form of the application. It contains the following components:
*  A [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) object.
*  A [TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent) object.
*  Four [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects:

* **FlashLight**
* **Light**
* **ImageOn**
* **ImageOff**

## Implementation 


*  The main form contains two [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects: **ImageOff** and **ImageOn** that are shown or hidden depending on whether the flash is active.
*  The flashlight and the light on the screen are also two [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects on which two effects are applied: [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) and [TShadowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TShadowEffect).

## Uses 


* [FMX.Media.TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent)
* [FMX.Media.TCameraComponent.TorchMode](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.TorchMode)
* [FMX.Controls.TControl.Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Visible)

## See Also 


* [FMX.CameraComponent Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.CameraComponent_Sample)

* [Lighting up the sky with FireMonkey](http://blogs.embarcadero.com/sarinadupont/2013/03/25/lighting-up-the-sky-with-firemonkey/)
* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Tutorial: How to Use Cameras in a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_How_to_Use_Cameras_in_a_FireMonkey_3D_Application)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)






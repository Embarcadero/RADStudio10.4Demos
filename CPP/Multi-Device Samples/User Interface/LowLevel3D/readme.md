FMX.LowLevel3D Sample[]()
# FMX.LowLevel3D Sample 


This sample illustrates basic usage of low level 3D objects in mobile applications, using **FireMonkey**.
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

You can find the **FireMonkeyMobile LowLevel3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\LowLevel3D`
* `CPP\Multi-Device Samples\User Interface\LowLevel3D`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/LowLevel3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/LowLevel3D)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/LowLevel3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/LowLevel3D)

## Description 

This application defines a new [Material](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TCustomMaterial) using two predefined bitmaps and a random color. The new material is used to render a rotating rectangular shape within the 3D context of the application form.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **LowLevel3D.dproj**
*  C++: **LowLevel3D.cbproj**

2.  Press **F9** or choose **Run > Run**.
Notice the animated rectangular shape with the customized material.
## Classes 


* **TForm1** represents the main window of the sample. It contains the following:

*  two [TBitmapObject](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics.TBitmapObject) objects used to set the two bitmaps used to create the new material.
*  a [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) used to create the animated rotation.

* **TMyMaterial** class defines the new material.

## Implementation 


*  The new material is defined using low-level classes to manage graphical shaders: [TContextShaderSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TContextShaderSource), [TShaderManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TShaderManager), [TContextShaderVariable](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TContextShaderVariable). The rectangular shape and the new material are created on the [OnRender](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms3D.TCustomForm3D.OnRender) event of the form.
*  The drawing process is made through the [TContext3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TContext3D), associated to the **TForm**.

## Uses 


* [FMX.Materials.TCustomMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TCustomMaterial)
* [FMX.Types3D.TShaderManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TShaderManager)
* [FMX.Types3D.TContextShaderSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TContextShaderSource)
* [FMX.Types3D.TContextShaderVariable](http://docwiki.embarcadero.com/Libraries/en/FMX.Types3D.TContextShaderVariable)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)

### Samples 


* [FireMonkey 3D Arrows](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample






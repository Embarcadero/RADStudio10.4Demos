FMX.GUI3d Sample[]()
# FMX.GUI3d Sample 


This sample is a demonstration of how to build 3D [Graphical User Interface (GUI)](http://en.wikipedia.org/wiki/Graphical_user_interface) applications.
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

You can find the **GUI3d** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\GUI3d`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/GUI3d](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/GUI3d)

## Description 

The **GUI3d** sample demonstrates how to build 3D GUI applications. The sample uses a [3D layer](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) that holds a [2D button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton). The [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), which has a [TGlow](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) effect attached, enables a [float animation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation).
## How to Use the Sample 


1.  Navigate to the location given above and open **GUI3dCPP.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample: left-click on the button labeled as **Flip** to activate the animation.

## Files 



|**File in C++**                |**Contains**                                   |
|-------------------------------|-----------------------------------------------|
|**GUI3dCPP.cbproj**            |The project itself.                            |
|**Unit1.fmx**                  |The main form where the components are located.|
|**GUI3dCPPCH.h**, **Unit1.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3D1** is the main form that represents the main window of the sample. It contains the following components:
*  A [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) object that contains:

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) object that contains:

*  A [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) object that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object.

## Implementation 


*  The sample uses [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) to hold any 2D object in a FireMonkey 3D form.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to enable the [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation).
*  The sample uses [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) to create a glow effect around the [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton).
*  The sample uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) to define an animation.
When you run the application, you see a [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) labeled as **Flip**. The [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) has a [glow](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect) effect attached with the **GlowColor** property set to `Gold`. When you click on the [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), an [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.OnClick) event occurs. The [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.OnClick) event animates the [3D layer](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D). The sample uses the [AnimateFloat](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TFmxObject.AnimateFloat) and [AnimateFloatDelay](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TFmxObject.AnimateFloatDelay) methods of the [TFmxObject](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TFmxObject) class to define three different animations for the [3D Layer](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) object.
## Uses 


* [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TGlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect)
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)
* [AnimateFloat](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TFmxObject.AnimateFloat)
* [AnimateFloatDelay](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TFmxObject.AnimateFloatDelay)

## See Also 


* [GUI_Application_Frameworks](http://docwiki.embarcadero.com/RADStudio/en/GUI_Application_Frameworks)
* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

### Samples 


* [FireMonkey HD Animation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AnimationDemoHD_Sample) sample
* [FireMonkey Low Level 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LowLevel3D_Sample) sample
* [FireMonkey Arrows 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)






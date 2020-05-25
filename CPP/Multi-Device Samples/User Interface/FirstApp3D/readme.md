FMX.FirstApp3D Sample[]()
# FMX.FirstApp3D Sample 


This sample demonstrates how to animate a 3D object.
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

You can find the **FirstApp3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\FirstApp3D`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/FirstApp3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/FirstApp3D)

## Description 

The **FirstApp3D** sample demonstrates how to use the [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) class to animate a 3D object. The sample attaches a [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) to a [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) object. Moreover, this sample also demonstrates how to specify a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) as the target that is being watched by the [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera).
## How to Use the Sample 


1.  Navigate to the location given above and open **CppFMX3DFirstApp.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Left-click on the 3D rectangle to rotate it.
*  Left-click on the 3D rectangle to stop the rotation.

## Files 



|**File in C++**                            |**Contains**                                   |
|-------------------------------------------|-----------------------------------------------|
|**CppFMX3DFirstApp.cbproj**                |The project itself.                            |
|**MainForm.fmx**                           |The main form where the components are located.|
|**CppFMX3DFirstAppPCH.h**, **MainForm.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3D4** is the main form that represents the main window of the sample. It contains the following components:
*  A [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) object.
*  Three [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) objects.
*  A [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube) object
*  A [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) object.
*  A [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) object that contains a [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object.
*  A [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object.

## Implementation 


*  The sample uses [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) to change the color of 3D objects.
*  The sample uses [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube) to implement a 3D cube shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) to implement a 3D cylinder shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) to implement a 3D shape under the form of a 3D rectangle that can be placed on a 3D FireMonkey form.
*  The sample uses [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) to implement a 3D sphere shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective and projection of the objects in the scene to the viewport.
*  The sample uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
When you run the application, your FireMonkey form is focused on the [3D Rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D). This is because the [Target](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera.Target) property of the [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) is set to `Rectangle3D`. Moreover, If you click on the 3D rectangle, a [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.OnClick) event occurs. The [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.OnClick) event enables the [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to it. The [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) and [Loop](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Loop) properties set to `RotationAngle.Y` and `True`, respectively. Therefore, when you click on the 3D rectangle, it begins to rotate until you make another click on it.
## Uses 


* [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera)

* [Target](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera.Target)

* [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource)
* [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder)
* [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube)
* [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D)
* [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere)
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)

* [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName)
* [Loop](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Loop)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

* [Tutorial: How to Use Cameras in a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_How_to_Use_Cameras_in_a_FireMonkey_3D_Application)

### Samples 


* [FireMonkey Gyroscope](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Gyroscope_Sample) sample
* [FireMonkey Model Viewer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ModelViewer_Sample) sample
* [FireMonkey Low Level 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LowLevel3D_Sample) sample
* [FireMonkey Arrows 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey 3D Animation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AnimationDemo3D_Sample) sample
* [FMXTFmxObjectAnimateFloat (C++)](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29)
* [AttachTAnimation (C++)](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29)
* [FMXTimerAnimation(C++)](http://docwiki.embarcadero.com/CodeExamples/en/FMXTimerAnimation_%28C%2B%2B%29)






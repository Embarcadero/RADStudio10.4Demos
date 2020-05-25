FMX.Arrows3D Sample[]()
# FMX.Arrows3D Sample 


This sample demonstrates how to use the [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) class to view and interact with 3D objects.
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

You can find the **Arrows3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\Arrows3D`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Arrows3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Arrows3D)

## Description 

The **Arrows3D** sample demonstrates how to use the [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) class to view and interact with 3D objects. The [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) class implements the [interface](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.IViewport3D) for viewing 3D objects. This sample uses [3D controls](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D) such as [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) or [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) and [3D objects](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) such as [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy), [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) or [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone).
## How to Use the Sample 


1.  Navigate to the location given above and open **FMArrows3dCPP.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Left-click on the form and hold it pressed while moving the mouse to rotate the arrows.
*  Move the mouse wheel to zoom the scene perspective of the 3D arrows.

## Files 



|**File in C++**                           |**Contains**                                   |
|------------------------------------------|-----------------------------------------------|
|**FMArrows3dCPP.cbproj**                  |The project itself.                            |
|**FormArrows.fmx**                        |The main form where the components are located.|
|**FMArrows3dCPPPCH.h**, **FormArrows.cpp**|Used to define and implement the sample.       |


## Classes 

**TFormArrows3d** is the main form that represents the main window of the sample. It contains the following components:
*  Three [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) objects called: **LightMaterialSourceX**, **LightMaterialSourceY** and **LightMaterialSourceZ**.
*  A [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) object containing two [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy) objects.

*  The first [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy) object contains:

*  A [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) object called **CylX** that contains a [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone) object called **ConeX**
*  A [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) object called **CylY** that contains a [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone) object called **ConeY**
*  A [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) object called **CylZ** that contains a [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone) object called **ConeZ**

*  The second [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy) object contains:

*  A [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) object that contains a [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) object.

## Implementation 


*  The sample uses [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy) to group 3D controls so that they can be moved and rotated together.
*  The sample uses [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) to implement a 3D cylinder shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone) to implement a 3D cone shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective and projection of the objects in the scene to the viewport.
*  The sample uses [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) to imitate the rays of light and their propagation on the 3D object.
*  The sample uses [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) to link a [TLightMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TLightMaterial) to 3D objects. The link is made through [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) to describe how a 3D object is seen.
When you run the application, you see three 3D arrows forming a [cartesian coordinate system](http://en.wikipedia.org/wiki/Coordinate_system#Cartesian_coordinate_system). Each arrow is composed of a [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder) and a [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone). When you click the mouse, an [OnMouseDown](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseDown) event occurs. The [OnMouseDown](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseDown) event uses [TPointF](http://docwiki.embarcadero.com/Libraries/en/System.Types.TPointF) to define a position on your FireMonkey form. Then, if you move the mouse while holding press the left button of the mouse, an [OnMouseMove](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseMove) event occurs. The [OnMouseMove](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseMove) event uses the position denoted by [TPointF](http://docwiki.embarcadero.com/Libraries/en/System.Types.TPointF) to [rotate](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle) the 3D arrows. Moreover, if you move the mouse wheel, an [OnMouseWheel](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseWheel) event occurs. The [OnMouseWheel](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseWheel) event uses the value of the `WheelDelta` property to change the [position](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.Position) property of [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) in order to zoom the scene perspective of the 3D arrows.
## Uses 


* [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D)
* [TDummy](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TDummy)
* [TCylinder](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCylinder)
* [TCone](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCone)
* [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera)
* [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource)
* [OnMouseDown](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseDown)
* [OnMouseMove](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseMove)
* [OnMouseWheel](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnMouseWheel)
* [TPointF](http://docwiki.embarcadero.com/Libraries/en/System.Types.TPointF)
* [RotationAngle](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.RotationAngle)
* [Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TControl3D.Position)

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
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample






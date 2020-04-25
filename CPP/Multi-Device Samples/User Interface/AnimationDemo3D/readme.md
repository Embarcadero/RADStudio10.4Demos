FMX.AnimationDemo3D Sample[]()
# FMX.AnimationDemo3D Sample 


This sample illustrates how to create 3D animations using FireMonkey.
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

You can find the **AnimationDemo3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\AnimationDemo3D`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/AnimationDemo3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/AnimationDemo3D)

## Description 

The **AnimationDemo3D** sample animates several visual objects on a 3D form. To this end, the sample uses [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) and [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation).
## How to Use the Sample 


1.  Navigate to the location given above, and open **AnimationDemo3D.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  See the different animations.

## Files 



|**File in C++**                                  |**Contains**                                   |
|-------------------------------------------------|-----------------------------------------------|
|**AnimationDemo3D.cbproj**                       |The project itself.                            |
|**anidemofrm.fmx**                               |The main form where the components are located.|
|**AnimationDemo3DPCH.h**, **AnimationDemo3D.cpp**|Used to define and implement the sample.       |


## Classes 

**TfrmAniDemo** is the main form that represents the main window of the sample. It is a [3D form](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms3D.TForm3D) that contains the following components:
*  A [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) object labeled as **ColorLighting**.
*  A [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) object.
*  A [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) object that contains the following components:

*  A [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) object.
*  A [TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath) object labeled as **Path1**.
*  A [TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect) object labeled as **RoundRect1** that contains:

*  A [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) object labeled as **PathAni**.
*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object.

*  A [TPlane](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TPlane) object that contains:

*  A [TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D) object labeled as **Text4**.

*  A [TRoundCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRoundCube) object labeled as **RoundCube1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation3**.

*  A [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation5**.
*  A [TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D) object labeled as **Text1**.

*  A [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere2** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation1**.
*  A [TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D) object labeled as **Text2**.

*  A [TStrokeCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TStrokeCube) object labeled as **StrokeCube1** that contains:

*  A [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube) object.
*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation2**.

*  A [TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D) object labeled as **Text3**.
*  A [TText3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TText3D) object labeled **Text3D1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation4**.

*  A [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) object labeled as **TextureLighting**.

## Implementation 


*  The sample uses:

* [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) to hold any 2D object in a FireMonkey 3D form.
* [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout) to organize multiple graphical controls under the same parent.
* [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) to implement a 3D sphere shape that can be placed on a 3D FireMonkey form.
* [TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect) to define 2D rectangles with rounded corners.
* [TRoundCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRoundCube) to implement a 3D cube shape with rounded corners that can be placed on a 3D FireMonkey form
* [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube) to implement a 3D cube shape that can be placed on a 3D FireMonkey form.
* [TStrokeCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TStrokeCube) to implement a stroked 3D cube shape that can be placed on a 3D FireMonkey form.
* [TPlane](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TPlane) to implement a 2D plane that can be placed on a 3D FireMonkey form
* [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) to define 2D text object.
* [TText3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TText3D) to represent a 3D rendered text.
* [TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D) to implements a 3D layer that can be used to display [3D text](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TText3D) on a 3D FireMonkey form.
* [TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath) to define 2D path-type shapes representing groups of connected curves and lines.
* [TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation) to move a visual object on a specified [path](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath).
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
* [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) to link a [TLightMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TLightMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
* [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) to imitate the rays of light and their propagation on other 3D objects.
When you run the application, you see several animated 3D objects. The animations do the following:
* **FloatAnimation1** is attached to **Sphere2**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) set to `Opacity`, which means that the animation customizes the transparency of the sphere. Moreover, the [Loop](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Loop) property of the animation is set to `True`, which means that the animation is repeatedly executed.
* **FloatAnimation2** is attached to **StrokeCube1**. It has the folloing properties: [AutoReverse](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.AutoReverse), [Interpolation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Interpolation) and [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) set to `True`, `Back` and `RotationAngle.Y`, respectively. This configuration of the animation makes the cube rotate around the Y axis from the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue) to the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) and then, from the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) to the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue).
* **FloatAnimation3** is attached to **RoundCube1**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property set to `Position.Z`, which means that the animation moves the cube through the Z axis. Moreover, the [Interpolation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Interpolation) property determines the path and the rate at which the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) of the animation is changed to the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue) over time. As it is set to `Elastic` the animation follows a progressive sinusoidal geometric interpolation.
* **FloatAnimation4** is attached to **Text3D1**. As in **FloatAnimation2**, this animation has the [AutoReverse](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.AutoReverse) and [Interpolation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Interpolation) properties set to `True` and `Back` respectively. Moreover the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property is set to `RotationAngle.X`. Therefore, this configuration of the animation makes the cube rotate around the X axis from the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue) to the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) and then, from the [StartValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StartValue) to the [StopValue](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation.StopValue).
* **FloatAnimation5** is attached to **Sphere1**. It has the [PropertyName](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TCustomPropertyAnimation.PropertyName) property set to `Scale.X` and the [Trigger](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.Trigger) and [TriggerInverse](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TAnimation.TriggerInverse) properties set to `IsMouseOver=true` and `IsMouseOver=false`, respectively. This means that the sphere scales throught the X axis when the mouse is on the sphere. The inverse of the animation starts when the mouse leaves the sphere.
* **PathAni** is attached to **RoundCube1**. It makes the round cube follow the path determined by the **Path1** object.

## Uses 


* [FMX.Objects3D.TRoundCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRoundCube)
* [FMX.Objects3D.TStrokeCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TStrokeCube)
* [FMX.Objects3D.TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube)
* [FMX.Controls3D.TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [FMX.Layers3D.TTextLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TTextLayer3D)
* [FMX.Objects3D.TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere)
* [FMX.Objects3D.TPlane](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TPlane)
* [FMX.Objects3D.TText3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TText3D)
* [FMX.Layers3D.TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.Objects.TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath)
* [FMX.Objects.TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText)
* [FMX.Objects.TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect)
* [FMX.Ani.TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)
* [FMX.Controls.TPathAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TPathAnimation)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

* [Using FireMonkey Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Using_FireMonkey_Animation_Effects)

### Samples 


* [FireMonkey HD Animation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AnimationDemoHD_Sample) sample
* [FireMonkey ModelViewer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ModelViewer_Sample) sample
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample
* [FireMonkey Planets](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Planets_Sample) sample
* [FireMonkey 3D GUI](http://docwiki.embarcadero.com/CodeExamples/en/FMX.GUI3d_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)






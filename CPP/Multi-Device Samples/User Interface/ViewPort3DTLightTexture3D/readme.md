FMX.ViewPort3DTLightTexture3D Sample[]()
# FMX.ViewPort3DTLightTexture3D Sample 


This sample shows you how to use different FireMonkey classes that interact with 3D objects.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Files](#Files)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **ViewPort3DTLightTexture3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\ViewPort3DTLightTexture3D`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ViewPort3DTLightTexture3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ViewPort3DTLightTexture3D)

## Description 

The **ViewPort3DTLightTexture3D** sample demonstrates how to use the [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D), [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) and[TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) classes. The sample uses [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource)to link a [TColorMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TColorMaterial) to a 3D object and [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) to link a [TLightMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TLightMaterial) to a 3D object. Moreover, the sample attaches two different [TFloatAnimations](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) to two 3D objects.
## Files 



|**File in C++**                      |**Contains**                                   |
|-------------------------------------|-----------------------------------------------|
|**CppViewPort3DTLightTexture.cbproj**|The project itself.                            |
|**MainForm.fmx**                     |The main form where the components are located.|
|**MainForm.h**, **MainForm.cpp**     |Used to define and implement the sample.       |


## Classes 

**TForm4** is the main form that represents the main window of the sample. It contains the following components:
*  A [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) object.
*  A [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) object.
*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) object that contains:

*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object.

*  A [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) object that contains the following components:

*  A [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) object.
*  A [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) object that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object.

*  A [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object that contains:

*  Two [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) objects called as **FloatAnimation1** and **FloatAnimation2**.

## Implementation 


*  The sample uses [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) to link a [TColorMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TColorMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) to link a [TLightMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TLightMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [Tpanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) to hold multiple controls for organizing purposes.
*  The sample uses [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) to enable or disable [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation). Select the box to turn on the animation or clear it to turn off the animation.
*  The sample uses [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) to implement a 3D shape under the form of a 3D rectangle that can be placed on a 3D FireMonkey form.
*  The sample uses [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) to implement a 3D sphere shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
When you run the application, you see two [3D objects](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D): a [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) and a [3D rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D). On the one hand, the [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) is linked to the [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource) object with the **Texture** property set to a map of the Earth. Therefore, the [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object looks like the Earth. On the other hand, the [3D rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) is linked to the [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) with the **Color** property set to `Blue`. The link of [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) and [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) is made through the [MaterialShaftSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D.MaterialShaftSource) property, which set the color for the shaft sides of the 3D rectangle.**Note**: To set the color for the front and back sides of the 3D rectangle, use the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D.MaterialSource) and [MaterialBackSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D.MaterialBackSource) properties. Moreover, each [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) is attached to each [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D). When you click on the [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox), it enables both animations. The [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) is attached to the **FloatAnimation1**, which has the **PropertyName** set to `RotationAngle.Y`, while the [3D rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D) is attached to the **FloatAnimation2**, which has the **PropertyName** set to `RotationAngle.Z`. Finally, both animations have the **Loop** property set to `True`, so it repeats the animation until the [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) is cleared.
## Uses 


* [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource)
* [TLightMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TLightMaterialSource)
* [Tpanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D)
* [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [TRectangle3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TRectangle3D)
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)
* [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

* [Tutorial: How to Use Cameras in a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_How_to_Use_Cameras_in_a_FireMonkey_3D_Application)

### Samples 


* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample
* [FireMonkey Model Viewer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ModelViewer_Sample) sample
* [FireMonkey Arrows 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)
* [FireMonkey Timer Animation](http://docwiki.embarcadero.com/CodeExamples/en/FMXTimerAnimation_%28C%2B%2B%29) (C++)






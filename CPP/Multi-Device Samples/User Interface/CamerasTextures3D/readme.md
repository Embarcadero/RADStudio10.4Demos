FMX.CamerasTextures3D Sample[]()
# FMX.CamerasTextures3D Sample 


This sample demonstrates how to use [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) and [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) to interact with 3D objects.
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

You can find the **CamerasTextures3D** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\CamerasTextures3D`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CamerasTextures3D](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CamerasTextures3D)

## Description 

The **CamerasTextures3D** sample uses the FireMonkey classes: [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) and [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) in order to demonstrate how to interact with 3D objects. The sample uses [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective and [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) to define the material's texture of the 3D objects. Moreover, the sample also uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) to attach animations to the 3D objects.
## How to Use the Sample 


1.  Navigate to the location given above and open **CppFMX3DCamerasTextures.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample: left-click on the checkbox labeled as **Rotate 3D Shapes** to enable the animations.

## Files 



|**File in C++**                                   |**Contains**                                   |
|--------------------------------------------------|-----------------------------------------------|
|**CppFMX3DCamerasTextures.cbproj**                |The project itself.                            |
|**MainForm.fmx**                                  |The main form where the components are located.|
|**CppFMX3DCamerasTexturesPCH.h**, **MainForm.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3D4** is the main form that represents the main window of the sample. It contains the following components:
*  A [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) object that contains:

*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object.

*  Two [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) objects:

*  The first [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation1**.

*  The second [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation2**.

*  A [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) object that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation3**.

*  Two [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) objects labeled as **TextureMaterialSource1** and **TextureMaterialSource2**.

## Implementation 


*  The sample uses [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D) to hold any 2D object in a FireMonkey 3D form.
*  The sample uses [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) to enable or disable the different [TFloatAnimations](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation). Select the box to turn on the animations or clear it to turn off the animations.
*  The sample uses [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) to implement a 3D sphere shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) to link a [TTextureMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TTextureMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective and projection of the objects in the scene to the viewport.
*  The sample uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
When you run the application, you see a [checkbox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) labeled as **Rotate 3D Shapes** and two [spheres](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere). Each [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) is linked to each [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) object. The **Texture** property of both [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) objects is set to a map of a planet. Therefore, both [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) objects looks like planets. On the other hand, there are three [TFloatAnimations](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation): **TFloatAnimation1** attached to **sphere1**, **TFloatAnimation2** attached to **sphere2** and **TFloatAnimation3** attached to **Camera1**. Both **TFloatAnimation1** and **TFloatAnimation2** have the **PropertyName** set to `RotationAngle.Y`, while the **TFloatAnimation3** has the **PropertyName** set to `Position.Z`. When you check the checkbox labeled as **Rotate 3D Objects**, an [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox.OnChange) event occurs. The [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox.OnChange) event enables the animations. Therefore, when you check the checkbox, both spheres begin to rotate while the camera changes the zoom of your FireMonkey form.
## Uses 


* [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D)
* [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere)
* [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource)
* [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera)
* [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)

* [Creating the User Interface](http://docwiki.embarcadero.com/RADStudio/en/Creating_the_User_Interface_(FireMonkey_3D_Tutorial))
* [Creating a 2D Interface in a 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_2D_Interface_in_a_3D_Application_(FireMonkey_3D_Tutorial))
* [Creating a FireMonkey 3D Application with Animation Effects](http://docwiki.embarcadero.com/RADStudio/en/Creating_a_FireMonkey_3D_Application_with_Animation_Effects)

* [Tutorial: How to Use Cameras in a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_How_to_Use_Cameras_in_a_FireMonkey_3D_Application)

### Samples 


* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample
* [FireMonkey ViewPort3D TLightTexture3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ViewPort3DTLightTexture3D_Sample) sample
* [FireMonkey Planets](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Planets_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)






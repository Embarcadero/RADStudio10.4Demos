FMX.Planets Sample[]()
# FMX.Planets Sample 


This sample demonstrates how to use some of the different FireMonkey classes that interact with 3D objects. For example: [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera), [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) or [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation).
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

You can find the **Planets** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\Planets`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Planets](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Planets)

## Description 

The **Planets** sample uses different FireMonkey classes in order to demonstrate how to interact with 3D objects. The sample uses [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) as the 3D objects. [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) and [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) are used to define the scene perspective and the propagation of the rays of light on the 3D objects. Moreover, [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) and [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) are used to define the color and the texture of the 3D objects. Finally, [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) is used to attach animations to the 3D objects.
## How to Use the Sample 


1.  Navigate to the location given above and open **PlanetsCPP.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  See the planets rotating.

## Files 



|**File in C++**                   |**Contains**                                   |
|----------------------------------|-----------------------------------------------|
|**PlanetsCPP.cbproj**             |The project itself.                            |
|**Unit1.fmx**                     |The main form where the components are located.|
|**PlanetsCPPPCH.h**, **Unit1.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3D1** is the main form that represents the main window of the sample. It contains the following components:
*  A [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) object.
*  A [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) object.
*  A [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) object.
*  Two [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) objects:

*  The first [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation1**.

*  The second [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) object labeled as **Sphere1** that contains:

*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) object labeled as **FloatAnimation2**.

*  Two [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) objects labeled as **TextureMaterialSource1** and **TexturematerialSource2**.

## Implementation 


*  The sample uses [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource) to link a [TColorMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TColorMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) to link a [TTextureMaterial](http://docwiki.embarcadero.com/Libraries/en/FMX.Materials.TTextureMaterial) to a 3D object. The link is made through the [MaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TShape3D.MaterialSource) property of the 3D object.
*  The sample uses [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective and projection of the objects in the scene to the viewport.
*  The sample uses [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) to imitate the rays of light and their propagation on other 3D objects.
*  The sample uses [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) to implement a 3D sphere shape that can be placed on a 3D FireMonkey form.
*  The sample uses [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) attached to a [3D object](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D) in order to animate it.
When you run the application, you see two [spheres](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere). Each [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) is linked to each [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) object. The **Texture** property of both [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource) objects is set to a map of a planet. Therefore, both [sphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) objects looks like planets. Moreover, the **Position** property of both the [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) and the [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) objects is set so that you have a frontal view of the planets when you run the application. Finally, both [animations](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) have the **PropertyName** set to `RotationAngle.Y` and the **Enabled** and **Loop** properties set to `True`. Therefore, when you run the application the [spheres](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere) rotate until you close the application.
## Uses 


* [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera)
* [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [TSphere](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TSphere)
* [TColorMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TColorMaterialSource)
* [TTextureMaterialSource](http://docwiki.embarcadero.com/Libraries/en/FMX.MaterialSources.TTextureMaterialSource)
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
* [FireMonkey Cameras textures 3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.CamerasTextures3D_Sample) sample
* [FireMonkey TFmxObject AnimateFloat](http://docwiki.embarcadero.com/CodeExamples/en/FMXTFmxObjectAnimateFloat_%28C%2B%2B%29) (C++)
* [FireMonkey Attach TAnimation](http://docwiki.embarcadero.com/CodeExamples/en/FMXAttachTAnimation_%28C%2B%2B%29) (C++)






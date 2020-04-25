FMX.ModelViewer Sample[]()
# FMX.ModelViewer Sample 


This sample demonstrates how to use [TModel3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TModel3D) to load 3D models in FireMonkey applications at run time.
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

You can find the **SurfSpotFinderApp** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ModelViewer`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ModelViewer](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ModelViewer)

## Description 

This application creates a 3D model viewer that provides basic functionalities: load, rotation, zoom, change of the material that the 3D model uses.Load a 3D model from a file (*.obj, *.dae, *.ase) and change or view the material that the 3D model uses. For material you can use solid colors, textures or light materials.
You can interact with the loaded 3D model using mouse movements for rotation, the mouse wheel and key arrows for zoom, and the arrows in the upper-left corner for plane change of position.
Some models may not be visible immediately after being loaded due to the scale or Material settings of the respective model. To view the model, just use the track bar to change the scale or click 'Edit Material' and select TColorMaterialSource and appropriate color.
Also, some models may have a high level of detail, so the loading operation may take longer; watch the status bar to see when the model has been loaded.

## How to Use the Sample 


1.  Navigate to the location given above and open **Model3D.dproj**.
2.  Press F9 or choose **Run > Run**.

## Files 



|**File**       |**Contains**                                                                                     |
|---------------|-------------------------------------------------------------------------------------------------|
|**Materials_U**|The class for the form that is displayed when the user chooses **Edit Material** from the editor.|
|**Model3D_U**  |The class for the main form that represents the editor itself.                                   |


## Classes 


* **TFrameMaterialDesigner** is the form from which you can select the properties of the material. It contains a [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D), a [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight), and a [TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube) on which you can see the selected properties.
* **TModel3DTest** is the main form of the application. It contains components such as [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D), [TModel3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TModel3D), [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight), [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera), [TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook), used to create the basic viewer and to display an animated preview of the 3D model at a smaller scale.

## Implementation 


*  The basic viewer and the animated preview are implemented using [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) to view the 3D object, [TModel3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TModel3D) to allow manipulation for the loaded model, [TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera) to define the scene perspective, and [TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight) to imitate the rays of light.
*  A [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) component is used to implement the scale of the object.
*  The **load from file**, **clear**, and **edit material** actions are performed when the buttons with the same name are pressed.
*  Using a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) component, the application displays the loading status of the 3D object.
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) component contains the material source properties, which are displayed into a [TGroupBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TGroupBox).
*  The application uses different [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) objects to animate the 3D models.

## Uses 


* [FMX.Viewport3D.TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D)
* [FMX.Objects3D.TModel3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TModel3D)
* [FMX.Objects3D.TCube](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects3D.TCube)
* [FMX.Layers3D.TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D)
* [FMX.Controls3D.TCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TCamera)
* [FMX.Controls3D.TLight](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls3D.TLight)
* [FMX.Ani.TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation)

## See Also 


* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [Tutorial: Creating a FireMonkey 3D Application](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_a_FireMonkey_3D_Application)
* [Tutorial: Importing 3D Models (FireMonkey)](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Importing_3D_Models_(FireMonkey))

### Samples 


* [FireMonkey 3D Arrows](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Arrows3D_Sample) sample
* [FireMonkey First App3D](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FirstApp3D_Sample) sample






FMX.ImageFilters Sample[]()
# FMX.ImageFilters Sample 


This sample demonstrates how to apply [filter effects](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects) to images.
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

You can find the **ImageFilters** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\ImageFilters`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ImageFilters](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ImageFilters)

## Description 

The **ImageFilters** sample demonstrates how to apply the [Sepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TFilterSepia) filter to an [image](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage). The sample uses [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) to let the user select an image. Then, the sample uses [TFilterSepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TFilterSepia) to apply a [sepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSepiaEffect) effect to the image, and [TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog) to save the filtered image.
## How to Use the Sample 


1.  Navigate to the location given above and open **CppImageFilters.cbproj**.
2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click on the **Open Bitmap** button to open the file selection dialog.
*  Select an image.
*  Move the track bar to select the intensity of the sepia color that is applied over the image.
*  Click on the **Save Filtered Bitmap** button to open the dialog box for saving files.
*  Save the filtered image.

## Files 



|**File in C++**                           |**Contains**                                   |
|------------------------------------------|-----------------------------------------------|
|**CppImageFilters.cbproj**                |The project itself.                            |
|**MainForm.fmx**                          |The main form where the components are located.|
|**CppImageFiltersPCH.h**, **MainForm.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm1** is the main form that represents the main window of the sample. It contains the following components:
*  Two [Timage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects.
*  A [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) object.
*  A [TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog) object.
*  A [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) object.

## Implementation 


*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
*  The sample uses [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) to adjust the intensity properties of the sepia effect.
*  The sample uses[TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) to display a file selection dialog.
*  The sample uses[TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog) to display a dialog box for saving files.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to call the [open](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) and [save](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog) dialogs.
When you run the application, the sample shows two buttons labeled as **Open Bitmap** and **Save Filtered Bitmap**. Click on the **Open Bitmap** button to call the [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) class and to display the selection file dialog. When you choose an image, the sample displays the selected image two times on your FireMonkey form. The image displayed at the left side of your FireMonkey form is the original image, while the image displayed at the right side of your FireMonkey form is the [sepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSepiaEffect) filtered image. You can change the intensity property of the [sepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSepiaEffect) effect by changing the [value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCustomTrack.Value) of the [track bar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar). To change the [value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCustomTrack.Value) of the [track bar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) move the slide indicator or click on a particular location of the bar. To save the filtered image, click on the **Save Filtered Bitmap** button. It calls the [TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog) class and displays the **save as** dialog box.
## Uses 


* [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [TSaveDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TSaveDialog)
* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [TFilterSepia](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TFilterSepia)
* [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [FireMonkey Image Effects](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Image_Effects)
* [Using FireMonkey Image Effects](http://docwiki.embarcadero.com/RADStudio/en/Using_FireMonkey_Image_Effects)

### Samples 


* [FireMonkey Shader Filters](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ShaderFilters_Sample) sample
* [FireMonkey Photo Editor](http://docwiki.embarcadero.com/CodeExamples/en/FMX.PhotoEditorDemo_Sample) sample






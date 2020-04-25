FMX.AccessCameraApp Sample[]()
# FMX.AccessCameraApp Sample 


This sample shows you how to use standard actions to open the camera application, take a picture and retrieve the taken image to display it on your FireMonkey form.
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

You can find the **AccessCameraApp** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\AccessCameraApp`
* `CPP\Mobile Snippets\AccessCameraApp`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AccessCameraApp](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AccessCameraApp)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/AccessCameraApp](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/AccessCameraApp)

## Description 

The **AccessCameraApp** sample shows how to use [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) to open the camera application on your iOS or Android device, take a picture and retrieve the taken image to display it on your FireMonkey form.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **AccessCameraApp.dproj**.
*  C++: **AccessCamera.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample. Click the camera button to open the camera window and take a picture.

## Files 



|**File in Delphi**       |**File in C++**                            |**Contains**                                   |
|-------------------------|-------------------------------------------|-----------------------------------------------|
|**AccessCameraApp.dproj**|**AccessCamera.cbproj**                    |The project itself.                            |
|**uMain.fmx**            |**uMain.fmx**                              |The main form where the components are located.|
|**uMain.pas**            |**AccessCameraPCH.h**, **AccessCamera.cpp**|Used to define and implement the sample.       |
|**Information.txt**      |**Information.txt**                        |Further information about the sample.          |


## Classes 

**TAccessCameraAppForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) object.

*  A [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) object

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) and a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) to take photos from the camera device.
*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
When you run the aplication, the sample shows a picture and a [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) with the stylelookup set to **cameratoolbuttonbordered**. The [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) is attached to this button. If you click the button, the camera window is displayed and allows you to choose the camera to be used (front or back) and to take a photo. Once the photo has been taken, the [OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TCustomTakePhotoAction.OnDidFinishTaking) event assigns the image retrieved from the camera to the [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) component.
## Uses 


* [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction)
* [OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TCustomTakePhotoAction.OnDidFinishTaking)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/en/Images)
* [Mobile Tutorial: Taking and Sharing Pictures (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))
* [Taking and Sharing Pictures and Text Using Action Lists](http://docwiki.embarcadero.com/RADStudio/en/Taking_and_Sharing_Pictures_and_Text_Using_Action_Lists)
* [Setting Up Action Lists](http://docwiki.embarcadero.com/RADStudio/en/Setting_Up_Action_Lists)
* [Adding an Action to the Action List](http://docwiki.embarcadero.com/RADStudio/en/Adding_an_Action_to_the_Action_List)

### Samples 


* [VCL Image Processing](http://docwiki.embarcadero.com/CodeExamples/en/VCL.ImageProc_Sample) sample
* [FireMonkey Image Zoom](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageZoom_Sample) sample
* [FireMonkey Image Rotation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageRotation_Sample) sample
* [FireMonkey Actions](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ActionsDemo_Sample) sample
* [FireMonkey Camera Roll](http://docwiki.embarcadero.com/CodeExamples/en/FMX.CameraRoll_Sample) sample
* [FireMonkey Share Sheet](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ShareSheet_Sample) sample
* [Using Picture Dialogs (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/UsingPictureDialogs_%28Delphi%29)
* [Using Picture Dialogs (C++)](http://docwiki.embarcadero.com/CodeExamples/en/UsingPictureDialogs_%28C%2B%2B%29)






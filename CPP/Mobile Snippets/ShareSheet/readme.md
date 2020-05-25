FMX.ShareSheet Sample[]()
# FMX.ShareSheet Sample 


This sample demonstrates how to use [standard actions](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions) in order to open the Camera Application on your iOS or Android device, take a picture and share it with other services.
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

You can find the **ShareSheet** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\ShareSheet`
* `CPP\Mobile Snippets\ShareSheet`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/ShareSheet](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/ShareSheet)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/ShareSheet](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/ShareSheet)

## Description 

The **ShareSheet** sample shows how to use [standard actions](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions) in order take a picture with the Camera Application of your iOS or Android device, and share it with other services. The sample uses the [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) component with two standard actions: 
* [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) to open the camera application on your iOS or Android device, take a picture and retrieve the taken image to display it on your FireMonkey form.
* [TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction) to share the picture with other services (for example, in social networks, by email or Bluetooth).

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **ShareSheet.dproj**.
*  C++: **ShareSheet.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click the **Take Photo** button to open the camera window and take a picture.
*  Click the **Share** button to open the sharing sheet to share the picture with other services.

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**ShareSheet.dproj**|**ShareSheet.cbproj**                  |The project itself.                            |
|**uMain.fmx**       |**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**       |**ShareSheetPCH.h**, **ShareSheet.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Classes 

**TShareSheetForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) object with two standard actions.

*  A [TTakePhotoFromCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) action.
*  A [TShowShareSheet](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction) action.

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object.
*  Two [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) objects:

*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) called **TopToolBar** containing a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) called **BottomToolBar** containing two [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects:

*  A [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnTakePhoto**.
*  A [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnShare**.

## Implementation 


*  The sample uses [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) to take photos from the camera device.
*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
*  The sample uses [TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction) to share photos with other services.
*  The sample uses two [Tbuttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) that are attached to both actions.
When you run the application, the sample shows a picture and two [buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) labeled as **Take Photo** and **Share**. The [TTakePhotoFromCamera](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) action is attached to the **Take Photo** button, and the [TShowShareSheet](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction) action is attached to the **Share** button.
*  If you click the **Take Photo** button, the camera window is displayed and allows you to choose some camera properties (for example, the camera to be used (front or back)) and take a photo. Once the photo has been taken, the [OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TCustomTakePhotoAction.OnDidFinishTaking) event assigns the image retrieved from the camera to the [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) component in order to display the photo on your FireMonkey form.
*  If you click the **Share** button, the sharing sheet opens and allows you to share your picture with other services (for example, in social networks, by email or Bluetooth).

## Uses 


* [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction)
* [TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction)
* [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/en/Images)
* [Mobile Tutorial: Taking and Sharing Pictures (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))
* [Taking and Sharing Pictures and Text Using Action Lists](http://docwiki.embarcadero.com/RADStudio/en/Taking_and_Sharing_Pictures_and_Text_Using_Action_Lists)
* [Setting Up Action Lists](http://docwiki.embarcadero.com/RADStudio/en/Setting_Up_Action_Lists)
* [Adding an Action to the Action List](http://docwiki.embarcadero.com/RADStudio/en/Adding_an_Action_to_the_Action_List)

### Samples 


* [FireMonkey Acces Camera](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AccessCameraApp_Sample) sample
* [FireMonkey Camera Roll](http://docwiki.embarcadero.com/CodeExamples/en/FMX.CameraRoll_Sample) sample
* [VCL Image Processing](http://docwiki.embarcadero.com/CodeExamples/en/VCL.ImageProc_Sample) sample
* [FireMonkey Image Zoom](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageZoom_Sample) sample
* [FireMonkey Image Rotation](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageRotation_Sample) sample
* [FireMonkey Actions](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ActionsDemo_Sample) sample
* [Using Picture Dialogs (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/UsingPictureDialogs_%28Delphi%29)
* [Using Picture Dialogs (C++)](http://docwiki.embarcadero.com/CodeExamples/en/UsingPictureDialogs_%28C%2B%2B%29)






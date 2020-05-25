FMX.CameraRoll Sample[]()
# FMX.CameraRoll Sample 


This sample demonstrates how to use [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) to open the Photo Library on your iOS or Android device, retrieve an image from the library and display it on your FireMonkey form.
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
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\CameraRoll`
* `CPP\Mobile Snippets\CameraRoll`

* **GitHub Repository:**

* **Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/CameraRoll](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/CameraRoll)
* **C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/CameraRoll](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/CameraRoll)

## Description 

The **CameraRoll** sample shows how to use [media library](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions) actions to take photos from the local library of your iOS or Android device. The sample uses the [TTakePhotoFromLibrary](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) action to open the Photo Library of your device. Then, you can choose a photo from the library in order to be displayed on your FireMonkey form.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **AccessCameraApp.dproj**.
*  C++: **AccessCamera.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click the library button to open the Photo Library of your device.
*  Select a photo.
*  See the photo displayed in your FireMonkey form.

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**CameraRoll.dproj**|**CameraRoll.cbproj**                  |The project itself.                            |
|**uMain.fmx**       |**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**       |**CameraRollPCH.h**, **CameraRoll.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Classes 

**TCameraRollForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TActionList) object with a [media library](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions) action:

*  A [TTakePhotoFromLibrary](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) action

*  A [TImage](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Objects.TImage) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TToolBar) object with a [Tbutton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TButton) and a [TLabel](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) to take photos from the Photo Library of your device.
*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Objects.TImage) to display and define 2D image components.
*  The sample uses a [Tbutton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TButton) as the component that is attached to the [TTakePhotoFromLibrary](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) action.
When you run the aplication, the sample shows a [button](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TButton) at the upper right corner with the stylelookup set to **organizetoolbuttonbordered**. The [TTakePhotoFromLibrary](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction) action is attached to this button. If you click the button, the Photo Library opens and allows you to choose a photo. Once the photo has been chosen, the [OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TCustomTakePhotoAction.OnDidFinishTaking) event assigns the image retrieved from the library to the [TImage](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Objects.TImage) component in order to be displayed on your FireMonkey form.
## Uses 


* [TActionList](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TActionList)
* [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction)
* [OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.MediaLibrary.Actions.TCustomTakePhotoAction.OnDidFinishTaking)
* [TImage](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Objects.TImage)
* [ToolBar](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TToolBar)
* [Tbutton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TButton)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/Denali/en/Images)
* [Mobile Tutorial: Taking and Sharing Pictures (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/Denali/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))
* [Taking and Sharing Pictures and Text Using Action Lists](http://docwiki.embarcadero.com/RADStudio/Denali/en/Taking_and_Sharing_Pictures_and_Text_Using_Action_Lists)
* [Setting Up Action Lists](http://docwiki.embarcadero.com/RADStudio/Denali/en/Setting_Up_Action_Lists)
* [Adding an Action to the Action List](http://docwiki.embarcadero.com/RADStudio/Denali/en/Adding_an_Action_to_the_Action_List)

### Samples 


* [VCL Image Processing](http://docwiki.embarcadero.com/CodeExamples/Denali/en/VCL.ImageProc_Sample) sample
* [FireMonkey Image Zoom](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.ImageZoom_Sample) sample
* [FireMonkey Image Rotation](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.ImageRotation_Sample) sample
* [FireMonkey Actions](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.ActionsDemo_Sample) sample
* [FireMonkey Access Camera](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.AccessCameraApp_Sample) sample
* [FireMonkey Share Sheet](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.ShareSheet_Sample) sample
* [Using Picture Dialogs (Delphi)](http://docwiki.embarcadero.com/CodeExamples/Denali/en/UsingPictureDialogs_%28Delphi%29)
* [Using Picture Dialogs (C++)](http://docwiki.embarcadero.com/CodeExamples/Denali/en/UsingPictureDialogs_%28C%2B%2B%29)






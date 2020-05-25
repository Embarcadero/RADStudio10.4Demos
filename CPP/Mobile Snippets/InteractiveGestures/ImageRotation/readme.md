FMX.ImageRotation Sample[]()
# FMX.ImageRotation Sample 


This sample uses the [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to demonstrate how to rotate an image.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **ImageRotation** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\InteractiveGestures\ImageRotation`
* `CPP\Mobile Snippets\InteractiveGestures\ImageRotation`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/ImageRotation](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/ImageRotation)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/ImageRotation](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/ImageRotation)

## Description 

The **ImageRotation** sample demonstrates how to rotate an image on an iOS or Android device. The sample provides a picture and the user can rotate the picture by pressing it with two fingers and rotating them. The image rotates in the direction of your fingers. If you rotate the fingers to the right, the image rotates to the right. If you rotate the fingers to the left, the image rotates to the left.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **ImageRotation.dproj**.
*  C++: **ImageRotation.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Press the picture with two fingers and rotate them to see how the image rotates.

## Files 



|**File in Delphi**     |**File in C++**                              |**Contains**                                   |
|-----------------------|---------------------------------------------|-----------------------------------------------|
|**ImageRotation.dproj**|**ImageRotation.cbproj**                     |The project itself.                            |
|**ImageRotationU.fmx** |**ImageRotationU.fmx**                       |The main form where the components are located.|
|**ImageRotationU.pas** |**ImageRotationPCH.h**, **ImageRotation.cpp**|Used to define and implement the sample.       |
|**Information.txt**    |**Information.txt**                          |Further information about the sample.          |


## Implementation 


*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define a 2D image component.
*  The property [RotationAngle](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.RotationAngle) is used to specify the amount (in degrees) by which the image is rotated from the x-axis.
*  The sample uses the [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to manage all the touch and gesturing functionalities of the application.
*  The [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) describes a gesture event. It is a record that contains information about a gesture event. The [TGestureEvent](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEvent) type passes a [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) record to the user code.
The sample shows a picture. When the user presses the picture with two fingers, the [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) detects a gesture event. If the user rotates the fingers, the sample calculates the rotation angle in order to rotate the image with the same angle.
## Uses 


* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Objects.TImage.RotationAngle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.RotationAngle)
* [FMX.Gestures.TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager)
* [FMX.Types.TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/en/Images)
* [Mobile Tutorial: Taking and Sharing Pictures (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))
* [Gesturing Overview](http://docwiki.embarcadero.com/RADStudio/en/Gesturing_Overview)
* [Using Gesturing in Your Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Gesturing_in_Your_Applications)

### Samples 


* [VCL.ImageProc_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.ImageProc_Sample)
* [FMX.ImageZoom_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageZoom_Sample)
* [FMX.TapAndHold_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TapAndHold_Sample)
* [FMX.AccessCameraApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AccessCameraApp_Sample)






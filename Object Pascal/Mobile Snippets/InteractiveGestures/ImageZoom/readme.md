FMX.ImageZoom Sample[]()
# FMX.ImageZoom Sample 


This sample uses the [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to demonstrate how to zoom an image.
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

You can find the **ImageZoom** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\InteractiveGestures\ImageZoom`
* `CPP\Mobile Snippets\InteractiveGestures\ImageZoom`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/ImageZoom](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/ImageZoom)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/ImageZoom](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/ImageZoom)

## Description 

The **ImageZoom** sample demonstrates how to zoom an image on an iOS or Android device. The sample provides a picture and the user can zoom the picture by pinching it.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **ImageZoom.dproj**.
*  C++: **ImageZoom.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Pinch the picture to see how it zooms.

## Files 



|**File in Delphi** |**File in C++**                      |**Contains**                                   |
|-------------------|-------------------------------------|-----------------------------------------------|
|**ImageZoom.dproj**|**ImageZoom.cbproj**                 |The project itself.                            |
|**ImageZoomU.fmx** |**ImageZoomU.fmx**                   |The main form where the components are located.|
|**ImageZoomU.pas** |**ImageZoomPCH.h**, **ImageZoom.cpp**|Used to define and implement the sample.       |
|**Information.txt**|**Information.txt**                  |Further information about the sample.          |


## Implementation 


*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define a 2D image component.
*  The properties [TImage.Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Position), [TImage.Width](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Width) and [TImage.Height](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Height) are used to specify the position and size of the image.
*  The sample uses the [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to manage all the touch and gesturing functionalities of the application. The [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) describes a gesture event. It is a record that contains information about a gesture event. The [TGestureEvent](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEvent) type passes a [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) record to the user code.
The sample shows a picture. The sample uses the field [GestureID](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo.GestureID) of the [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) to identify a zoom gesture. When [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) identifies a zoom gesture, the sample uses the [TImage.Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Position), [TImage.Width](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Width) and [TImage.Height](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Height) properties to zoom the picture.
## Uses 


* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Objects.TImage.Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Position)
* [FMX.Objects.TImage.Width](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Width)
* [FMX.Objects.TImage.Height](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Height)
* [FMX.Gestures.TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager)
* [FMX.Types.TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/en/Images)
* [Mobile Tutorial: Taking and Sharing Pictures (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))
* [Gesturing Overview](http://docwiki.embarcadero.com/RADStudio/en/Gesturing_Overview)
* [Using Gesturing in Your Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Gesturing_in_Your_Applications)

### Samples 


* [VCL.ImageProc_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.ImageProc_Sample)
* [FMX.ImageRotation_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageRotation_Sample)
* [FMX.TapAndHold_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TapAndHold_Sample)
* [FMX.AccessCameraApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AccessCameraApp_Sample)






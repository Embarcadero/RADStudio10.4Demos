FMX.TapAndHold Sample[]()
# FMX.TapAndHold Sample 


This sample use the [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to demonstrate how to use long tap gestures.
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

You can find the **TapAndHold** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\InteractiveGestures\TapAndHold`
* `CPP\Mobile Snippets\InteractiveGestures\TapAndHold`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/TapAndHold](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/InteractiveGestures/TapAndHold)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/TapAndHold](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/InteractiveGestures/TapAndHold)

## Description 

The **TapAndHold** sample demonstrates how to use long tap gestures on an iOS or Android device. The sample demonstrates how to detect and act with long tap gestures. 
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **TapAndHold.dproj**.
*  C++: **TapAndHold.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Press the screen with a finger. Hold pressed to see a message with the tap location and the date-time information.

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**TapAndHold.dproj**|**TapAndHold.cbproj**                  |The project itself.                            |
|**TapHoldForm.fmx** |**TapHoldForm.fmx**                    |The main form where the components are located.|
|**TapHoldForm.pas** |**TapAndHoldPCH.h**, **TapAndHold.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Implementation 


*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define a 2D image component.
*  The [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class is used to manage all the touch and gesturing functionalities of the application.
*  The [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) describes a gesture event. It is a record that contains information about a gesture event. The [TGestureEvent](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEvent) type passes a [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) record to the user code.
The sample shows a picture. When the user holds press a finger on the picture, the [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) detects a long tap gesture and the screen shows a message with the location and date-time information of the long tap. The sample uses the field [Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo.Location) of the [TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo) to show the screen tap location and the [FormatDateTime](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime) to show the date-time value of the long tap. 
## Uses 


* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Gestures.TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager)
* [FMX.Types.TGestureEventInfo](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TGestureEventInfo)
* [System.SysUtils.FormatDateTime](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime)

## See Also 


* [Gesturing Overview](http://docwiki.embarcadero.com/RADStudio/en/Gesturing_Overview)
* [Using Gesturing in Your Applications](http://docwiki.embarcadero.com/RADStudio/en/Using_Gesturing_in_Your_Applications)

### Samples 


* [FMX.ImageZoom_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageZoom_Sample)
* [FMX.ImageRotation_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageRotation_Sample)






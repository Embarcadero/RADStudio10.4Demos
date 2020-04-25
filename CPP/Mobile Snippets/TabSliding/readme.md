FMX.TabSliding Sample[]()
# FMX.TabSliding Sample 


This sample demonstrates how to use [TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) to create applications with multiple tabs for iOS and Android.
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

You can find the **TabSliding** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\TabSliding`
* `CPP\Mobile Snippets\TabSliding`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/TabSliding](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/TabSliding)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/TabSliding](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/TabSliding)

## Description 

The **TabSliding** sample demonstrates how to create applications with multiple tabs for iOS and Android. The sample uses [TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) with [TabPosition](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabPosition) set to `Dots` in order to enable scrolling of [tab items](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem). The sample has 2 tab items, each one containing a different image.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **TabSliding.dproj**.
*  C++: **TabSliding.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  The sample shows an image. Slide the image in order to change between tabs. Each tab contains a different image.

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**TabSliding.dproj**|**TabSliding.cbproj**                  |The project itself.                            |
|**uMain.fmx**       |**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**       |**TabSlidingPCH.h**, **TabSliding.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Classes 

**TTabSlidingForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) object.

*  Two [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction) objects.

*  A [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
*  A [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) object with two [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) objects.

*  The first tab item contains:

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object.

*  The second tab item contains:

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object.

## Implementation 


*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
*  The sample uses [TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) class to manage all the touch and gesturing functionalities of the application.
*  The sample uses [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction) to implement tab change actions.
When you run the application, the sample shows the first [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem). The sample has 2 tab items, each one containing its own image. The first [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) displays its image. When the user slides the image, a [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction) is invoked to change to the other [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), which displays its image.
## Uses 


* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [FMX.Gestures.TGestureManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager)
* [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction)
* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)

## See Also 


* [Tab Controls](http://docwiki.embarcadero.com/RADStudio/en/Tab_Controls)
* [Mobile Tutorial: Using Tab Components to Display Pages (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Tab_Components_to_Display_Pages_(iOS_and_Android))

### Samples 


* [FMX.TabSlideTransition_Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TabSlideTransition_Sample)
* [TabVisible_(Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/TabVisible_%28Delphi%29)
* [TabVisible_(C++)](http://docwiki.embarcadero.com/CodeExamples/en/TabVisible_%28C%2B%2B%29)
* [TabControlChange_(Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/TabControlChange_%28Delphi%29)
* [TabControlChange_(C++)](http://docwiki.embarcadero.com/CodeExamples/en/TabControlChange_%28C%2B%2B%29)






FMX.HorizontalScroll Sample[]()
# FMX.HorizontalScroll Sample 


This sample demonstrates how to use the [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) component in order to scroll through different pictures on your FireMonkey form.
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

You can find the **HorizontalScroll** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\HorizontalScroll`
* `CPP\Mobile Snippets\HorizontalScroll`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/HorizontalScroll](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/HorizontalScroll)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/HorizontalScroll](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/HorizontalScroll)

## Description 

The **HorizontalScroll** sample shows how to use [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) to scroll through different pictures on your iOS or Android device. The sample uses a [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) component with four images that the user can move horizontally.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **HorizontalScroll.dproj**.
*  C++: **HorizontalScroll.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample. Sweep your finger through the images in order to scroll through the images.

## Files 



|**File in Delphi**        |**File in C++**                                    |**Contains**                                   |
|--------------------------|---------------------------------------------------|-----------------------------------------------|
|**HorizontalScroll.dproj**|**HorizontalScroll.cbproj**                        |The project itself.                            |
|**uMain.fmx**             |**uMain.fmx**                                      |The main form where the components are located.|
|**uMain.pas**             |**HorizontalScrollPCH.h**, **HorizontalScroll.cpp**|Used to define and implement the sample.       |
|**Information.txt**       |**Information.txt**                                |Further information about the sample.          |


## Classes 

**THorizontalScrollForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) object with four [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects.
*  A [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScrollBox) to create a scroll box in a FireMonkey form restricted to horizontal scrolling.
*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
When you run the aplication, the sample uses [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) to show a scroll box in your FireMonkey form with an image attached to each [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) component. The **align** property of the [THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox) component is set to **client** so that the horizontal scroll box fills the entire FireMonkey form except the [Tool Bar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) at the bottom. Therefore, if you slide your finger horizontally anywhere on the FireMonkey form, the images move horizontally.
## Uses 


* [FMX.Layouts.THorzScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.THorzScrollBox)
* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)

## See Also 


* [Images](http://docwiki.embarcadero.com/RADStudio/en/Images)
* [Scroll Boxes](http://docwiki.embarcadero.com/RADStudio/en/Scroll_Boxes)
* [FireMonkey Layouts Strategies](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Layouts_Strategies)
* [FMX.Layouts.TScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScrollBox)

### Samples 


* [FireMonkey Platform Scroll Box](http://docwiki.embarcadero.com/CodeExamples/en/FMX.PlatformScrollBox_Sample) sample
* [FireMonkey Scrollable Form](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ScrollableForm_Sample) sample






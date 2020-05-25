FMX.DragAndDrop Sample[]()
# FMX.DragAndDrop Sample 


This sample demonstrates how to implement object dragging features in the Firemonkey application.
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

You can find the **DragAndDrop** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\DragAndDrop`
* `CPP\Multi-Device Samples\User Interface\DragAndDrop`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/DragAndDrop](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/DragAndDrop)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/DragAndDrop](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/DragAndDrop)

## Description 

The **DragAndDrop** sample demonstrates how to implement object dragging features in your Firemonkey application. Moreover, the sample shows you how to set the image icon that will be displayed while dragging the object. The sample uses [IFMXDragDropService](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXDragDropService) to provide support for drag-and-drop operations. Concretely, the [BeginDragDrop](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXDragDropService.BeginDragDrop) method is used to implement functionality to start the drag-and-drop process of a given object on the surface of a given form. **Note**: This sample is only supported by Windows and OSX platforms.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **DragAndDrop.dproj**.
*  C++: **DragAndDrop.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Type text in the box under the **Input text to transfer** label.
*  See the written text in the rectangle below.
*  Choose whether you want to drag the text as text or as image. Then, select the corresponding button.**Note**: if you select to drag the text as image, the sample makes a screenshot of the rectangle with the text.
*  Start the drag-and-drop process:

1.  Click on the rectangle with the text, maintain the mouse pressed and move the mouse to drag the object.
2.  Drop the object.

## Files 



|**File in Delphi**   |**File in C++**                                 |**Contains**                                   |
|---------------------|------------------------------------------------|-----------------------------------------------|
|**DragAndDrop.dproj**|**DragAndDropCpp.cbproj**                       |The project itself.                            |
|**fmMain.fmx**       |**fmMain.fmx**                                  |The main form where the components are located.|
|**fmMain.pas**       |**DragAndDropCppPCH1.h**, **DragAndDropCpp.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3** is the main form that represents the main window of the sample. It contains the following components:
*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) object that contains:

*  Two [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) objects.
*  A [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object with a [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object.

## Implementation 


*  The sample uses [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) to hold multiple controls for organizing purposes.
*  The sample uses [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) to provide the user an edit box to write text.
*  The sample uses [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) to show the written text.
*  The sample uses [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) to present a set of mutually exclusive choices (choose between drag the object as text or as image).
When you run the application, the sample shows a [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box, two [TRadio](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) buttons labeled as **Drag as text** and **Drag as image** and a [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object. When you type text into the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box, an [OnChangeTracking](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit.OnChangeTracking) event automatically displays the text in the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle). Moreover, you can choose whether you want to drag the text as text or as image by selecting the corresponding [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton). Then, you can start the drag-and-drop process. When you start a drag-and-drop process, the sample uses the [BeginDragDrop](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXDragDropService.BeginDragDrop) method to implement the drag-and-drop process of the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object on the surface of your FireMonkey form. Finally, the sample uses the `ABitmap` parameter of the [BeginDragDrop](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXDragDropService.BeginDragDrop) method to set the image icon that is displayed while dragging the object.**Note**: if you select the **Drag as image** button, the sample makes a screenshot of the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) and uses it as the [data](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TDragObject.Data) to drag and drop.
## Uses 


* [BeginDragDrop](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXDragDropService.BeginDragDrop)
* [MakeScreenshot](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.MakeScreenshot)
* [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton)
* [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [Implementing Drag and Drop in Controls](http://docwiki.embarcadero.com/RADStudio/en/Implementing_Drag_and_Drop_in_Controls)

* [Starting a Drag Operation](http://docwiki.embarcadero.com/RADStudio/en/Starting_a_Drag_Operation)
* [Accepting Dragged Items](http://docwiki.embarcadero.com/RADStudio/en/Accepting_Dragged_Items)
* [Dropping Items](http://docwiki.embarcadero.com/RADStudio/en/Dropping_Items)
* [Customizing Drag and Drop with a Drag Object](http://docwiki.embarcadero.com/RADStudio/en/Customizing_Drag_and_Drop_with_a_Drag_Object)
* [Ending a Drag Operation](http://docwiki.embarcadero.com/RADStudio/en/Ending_a_Drag_Operation)

### Samples 


* [ControlsTDragState (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/ControlsTDragState_%28Delphi%29)
* [ControlsTDragState (C++)](http://docwiki.embarcadero.com/CodeExamples/en/ControlsTDragState_%28C%2B%2B%29)
* [OnDragOver (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/OnDragOver_%28Delphi%29)
* [OnDragOver (C++)](http://docwiki.embarcadero.com/CodeExamples/en/OnDragOver_%28C%2B%2B%29)
* [OnEndDrag (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/OnEndDrag_%28Delphi%29)
* [OnEndDrag (C++)](http://docwiki.embarcadero.com/CodeExamples/en/OnEndDrag_%28C%2B%2B%29)






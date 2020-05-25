FMX.CopyPaste Sample[]()
# FMX.CopyPaste Sample 


This sample demonstrates how to get access to the system's clipboard, copy text or images into the clipboard and paste either text or images from the clipboard.
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

You can find the **CopyPaste** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\CopyPaste`
* `CPP\Multi-Device Samples\User Interface\CopyPaste`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/CopyPaste](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/CopyPaste)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CopyPaste](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CopyPaste)

## Description 

The **CopyPaste** sample demonstrates how to create applications that use the system's clipboard to copy and paste text or images. The sample uses [IFMXClipboardService](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService) to iteract with the system clipboard. Concretelly the [SetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.SetClipboard) method is used to put data into the system clipboard and the [GetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.GetClipboard) method is used to return data from the system clipboard. **Note**: Windows, OSX, iOS platforms provides copy/paste of both text and images. Android platform only provides text copy/paste.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **CopyPaste.dproj**.
*  C++: **CopyPaste.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  The sample shows two tabs: **COPY** and **PASTE**.
*  Stand on the **COPY** tab and write some text in the box under the **Input text to copy** label. Then, the **Copy data** button is enabled.
*  See the written text on the rectangle below.
*  Choose whether you want to copy the text as text or as image. Then, select the corresponding button.**Note**: if you select to copy the text as image, the sample makes a screenshot of the rectangle with the text.
*  Move to the **PASTE** control and click on the **Paste** button. If you copied the text as text, the text appears on the label next to the **Paste** button. If you copied the text as an image, the image appears on the rectangle below the **Paste** button.

## Files 



|**File in Delphi**     |**File in C++**                              |**Contains**                                   |
|-----------------------|---------------------------------------------|-----------------------------------------------|
|**CopyPasteDemo.dproj**|**CopyPasteDemo.cbproj**                     |The project itself.                            |
|**fmMain.fmx**         |**fmMain.fmx**                               |The main form where the components are located.|
|**fmMain.pas**         |**CopyPasteDemoPCH.h**, **CopyPasteDemo.cpp**|Used to define and implement the sample.       |


## Classes 

**TForm3** is the main form that represents the main window of the sample. It contains the following components:
*  A [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) object with two [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) objects.

*  The first tab item contains:

*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) object that contains:

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) object.
*  Two [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) objects.
*  A [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects.

*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object with a [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) object.

*  The second tab item contains:

*  A [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) object that contains:

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) object.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) object.

## Implementation 


*  The sample uses [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) to add a control with multiple tab settings to a FireMonkey form.
*  The sample uses [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) to hold multiple controls for organizing purposes.
*  The sample uses [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) to provide the user an edit box to write text.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to enable or activate some related application actions like copy data or paste the data.
*  The sample uses [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) to show the written text.
*  The sample uses [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display and define 2D image components.
The sample has 2 tab items, one to type text and copy it into the clipboard and the other to paste the data from the clipboard.When you run the application, the sample shows the first [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) labeled as **COPY**. It contains a [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), a [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle), two [TRadioButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) labeled as **Copy as text** and **Copy as image** and a [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) labeled as **Copy data**. First, the **Copy data** button is disabled. It gets enabled when you type text in the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box. The text you type in the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box is shown on the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle). Before clicking on the **Copy data** button, choose whether you want to copy the text as text or as image; then, select the corresponding [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton). On the one hand, If you choose the **Copy as text** radio button, the sample uses [SetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.SetClipboard) to put the data of the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box into the clipboard. On the other hand, if you choose the **Copy as image** radio button, the sample uses the [MakeScreenshot](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.MakeScreenshot) method to make a screenshot of the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) component and then, uses [SetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.SetClipboard) to put the image generated by the screenshot into the clipboard.
The second [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) labeled as **PASTE** contains a [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) and a [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) components. When you click on the **Paste** button, the samples uses the [GetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.GetClipboard) method to return data from the system clipboard. If the clipboard contains text, it is pasted into the [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) component. However, if the clipboard contains an image, it is pasted into the [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) component.

## Uses 


* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [SetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.SetClipboard)
* [GetClipboard](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXClipboardService.GetClipboard)
* [FMX.Objects.TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [MakeScreenshot](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.MakeScreenshot)
* [TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [Clipboard Support Routines](http://docwiki.embarcadero.com/RADStudio/en/Clipboard_Support_Routines)
* [Using the Clipboard with Graphics](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Clipboard_with_Graphics)

* [Copying Graphics to the Clipboard](http://docwiki.embarcadero.com/RADStudio/en/Copying_Graphics_to_the_Clipboard)
* [Cutting Graphics to the Clipboard](http://docwiki.embarcadero.com/RADStudio/en/Cutting_Graphics_to_the_Clipboard)
* [Pasting Graphics from the Clipboard](http://docwiki.embarcadero.com/RADStudio/en/Pasting_Graphics_from_the_Clipboard)

* [Mobile Tutorial: Using Tab Components to Display Pages](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Tab_Components_to_Display_Pages_(iOS_and_Android))

### Samples 


* [LoadFromClipBoard (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/LoadFromClipBoard_%28Delphi%29)
* [LoadFromClipBoard (C++)](http://docwiki.embarcadero.com/CodeExamples/en/LoadFromClipBoard_%28C%2B%2B%29)
* [GetComponent (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/GetComponent_%28Delphi%29)
* [GetComponent (C++)](http://docwiki.embarcadero.com/CodeExamples/en/GetComponent_%28C%2B%2B%29)
* [ClipboardAssign (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/ClipboardAssign_%28Delphi%29)
* [ClipboardAssign (C++)](http://docwiki.embarcadero.com/CodeExamples/en/ClipboardAssign_%28C%2B%2B%29)
* [FireMonkey TabSlide Transition](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TabSlideTransition_Sample) sample






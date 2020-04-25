FMX.NativeControls Sample[]()
# FMX.NativeControls Sample 


This sample demonstrates the use of the [Native Controls](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_Controls) of FireMonkey
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

You can find the **NativeControls** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\NativeControls`
* `CPP\Multi-Device Samples\User Interface\NativeControls`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/NativeControls](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/NativeControls)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/NativeControls](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/NativeControls)

## Description 

The **NativeControls** sample shows the use of the [Native Controls](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_Controls) of FireMonkey. To this end it uses several components that are configured with its [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property set to `Platform` in order to have the native styling of that control.**Note:** Only iOS and Windows support native controls. The following links provide a list of controls that support native presentation on [iOS](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_iOS_Controls) and [Windows](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_Windows_Controls) platforms. The value of [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property on any other platform does not have any effect.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: `NativeControlsDemo.dproj`.
*  C++: `NativeControlsDemo.cbproj`.

2.  Select the target platform in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**.
3.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                   | File in C++                                       | Contains          |
|--------------------------------------------------|---------------------------------------------------|-------------------|
|`NativeControlsDemo.dproj``NativeControlsDemo.dpr`|`NativeControlsDemo.cbproj``NativeControlsDemo.cpp`|The project itself.|
|`MainFrm.pas``MainFrm.fmx`                        |`MainFrm.h``MainFrm.cpp``MainFrm.fmx`              |The main form.     |


## Classes 

**TForm1** is the main form that represents the main window of the sample. It contains the following components:
*  A [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) object with four [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) objects.

* **TabItem1** contains:

*  Five [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object. The [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object named **Edit3** contains a [TClearEditButton](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearEditButton) object.
*  Five [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects.

* **TabItem2** contains:

*  A [TCalendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar) object.
*  A [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) object.
*  Two [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects.

* **TabItem3** contains:

*  Three [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) objects.
*  Three [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects.

* **TabItem4** contains:

*  A [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) object.

## Implementation 

FireMonkey provides native presentation for certain visual components. Although the default value of the [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property is `Styled`, which means that the control has the standard FireMonkey presentation, if you set the [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property to `Platform`, the controls have the native styling. In the sample, when you run the application, it shows four tabs labeled as **Edit**, **Memo**, **Standard** and **ListView**. Each tab contains several controls. All the controls have the [ControlType](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType) property set to `Platform` in order to have the native styling of that control. Moreover, the controls are also configured with other properties that are explained below.
* **TabItem1**, which is labeled as **Edit**, contains five [edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) components:

*  The **Edit1** component is configured with the [TCaret.Color](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TCaret.Color) property set to `Green`.
*  The **Edit2** component uses the [TextPrompt](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.TextPrompt) property, which is used to display a message when the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.Text) property is empty. In this sample it shows this message: `First Name` , which is cleared from the entry field as soon as the user begins to type into the edit field.
*  The **Edit3** component has a [TClearEditButton](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearEditButton) component attached. It is used for clearing text when you want to quickly erase the text in the edit box.
*  The **Edit4** component has the [TextAlign](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.TextAlign) property set to `Center`.
*  The **Edit5** component has the [StyleLookup](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit.StyleLookup) property set to `transparentedit`.

* **TabItem2**, which is labeled as **Standard**, contains the following components:

*  A [TCalendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar) component, which is used to display a calendar for one month, where the user can select a day or browse for months and years.
*  A [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) component without any functionality attached to it. It could be used to provide the user with a two-way on-off switch.

* **TabItem3**, which is labeled as **Memo**, contains three [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) components:

*  The **Memo1** component has the [StyleLookup](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit.StyleLookup) property set to `transparentmemo`.
*  The **Memo2** component is configured with the [CheckSpelling](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo.CheckSpelling) property set to `True`. Moreover, some properties of [TextSettings](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TCustomMemo.TextSettings) are configured so that the text is underlined and highlighted in bold and italics. Finally, the **FontColor** is set to `Lightcoral`.
*  The **Memo3** component has the **PhoneNumber**, **Link**, **Address** and **CalendarEvent** options of the [DataDetectorTypes](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TCustomMemo.DataDetectorTypes) property set to `True` in order to detect these types of information in the memo text.

* **TabItem4**, which is labeled as **ListView**, contains a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) component that contains a list of names organized by their jobs.

## Uses 


* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [TClearEditButton](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearEditButton)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [TCalendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar)
* [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo)
* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)

## See Also 


* [Native Controls](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_Controls)
* [FireMonkey Native iOS Controls](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_iOS_Controls)
* [FireMonkey Native Windows Controls](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Native_Windows_Controls)
* [Tab Controls](http://docwiki.embarcadero.com/RADStudio/en/Tab_Controls)
* [Mobile Tutorial: Using Tab Components to Display Pages](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Tab_Components_to_Display_Pages_(iOS_and_Android))

### Samples 


* [FireMonkey Controls](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ControlsDemo_Sample) sample
* [FireMonkey Tab Slide Transition](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TabSlideTransition_Sample) sample






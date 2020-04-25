FMX.TabSlideTransition Sample[]()
# FMX.TabSlideTransition Sample 


This is a sample that illustrates how to add dynamism to use tab sliding effects in mobile applications, using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 How to Use the Sample](#How_to_Use_the_Sample)
* [3 Classes](#Classes)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **TabSlideTransition** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\TabSlideTransition`
* `CPP\Multi-Device Samples\User Interface\TabSlideTransition`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/TabSlideTransition](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/TabSlideTransition)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/TabSlideTransition](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/TabSlideTransition)

## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **TabSlidingProject.dproj**
*  C++: **TabSlidingProject.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Classes 

**TabSlideTransitionFrmBase** represents the main window of the sample. It contains the following components:
*  A [ActionList1](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) object containing:

* [PreviousTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TPreviousTabAction) and [NextTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TNextTabAction) objects.

*  A [GestureManager1](http://docwiki.embarcadero.com/Libraries/en/FMX.Gestures.TGestureManager) object.
*  A [TabControl1](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) object with five [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) objects:

*  The first `TabItem1` tab item contains:
A [NameList](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) list box containing `FirstName` and `LastName`[list box items](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) containing [edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) controls providing input fields.

*  Other four `TabItem2`, `TabItem3`, `TabItem4`, and `TabItem5` tab items contain:
List boxes containing three `PersonalInfoList`, `EducationList`, and `WorkList`[list box items](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) and the [memo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) control containing [edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) and [combo box](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) controls providing input controls.
*  A [ToolBar1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) toolbar containing:

*  The `Back` and `Next`[buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton).

## Implementation 


*  When you run the application, the first [TabItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) is displayed. Before going to any of the next [tab items](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), all fields on the tab must be completed. Otherwise, the **Next** button is not [Enabled](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Enabled).
*  On pressing the **Next** or **Back** buttons on the toolbar tab control, the [NextTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TNextTabAction) or
[PreviousTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TPreviousTabAction) tab switching actions are invoked.
*  To assign these actions to toolbar buttons, in the **Structure** view select a button, for example **Next** ({Code|Button1}}). In the **Object Inspector**, select the **Action** node, click the down arrow on the right, and assign **New Standard Action > Tab > TNextTabAction** to the **Action** property. To set the [TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TPreviousTabAction.TabControl) tab control in which to make switching of active tabs, in the **Object Inspector**, expand the **Action** node, select the [TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TPreviousTabAction.TabControl) item, and click the down arrow on the right. From the list, select the `TabControl1` tab control.
*  To enable or disable the **Keyboard Toolbar**, the [SetToolbarEnabled](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled) method is used.
*  The **Keyboard Toolbar** is implicitly hidden, appearing only when completing information in [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) objects. Setting the visibility is achieved using the following method: [SetHideKeyboardButtonVisibility](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisibility).

## Uses 


* [FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled)
* [FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisibility](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisibility)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Mobile Tutorial: Using the Web Browser Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Web_Browser_Component_(iOS_and_Android))
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)
* [FMX.KeyboardToolbar Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardToolbar_Sample)
* [FMX.KeyboardTypes Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardTypes_Sample)






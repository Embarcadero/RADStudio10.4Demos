FMX.MouseOverHints Sample[]()
# FMX.MouseOverHints Sample 


This sample shows how to use hints to show contextual help.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Setting and Showing Hints](#Setting_and_Showing_Hints)
* [5.2 Actions](#Actions)
* [5.3 Status Bar](#Status_Bar)
* [5.4 Menu](#Menu)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **MouseOverHints** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\MouseOverHints`
* `CPP\Multi-Device Samples\User Interface\MouseOverHints`

* **GitHub Repository:**

*  Delphi: [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MouseOverHints](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MouseOverHints)
*  C++: [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/MouseOverHints](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/MouseOverHints)

## Description 

The **MouseOverHints** sample demonstrates how to use hints to show contextual help.The sample shows how to work with hints, and the special behavior that some components, such as status bars, actions, and menus, have when working with hints.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **MouseOverHints.dproj**.
*  C++: **MouseOverHints.cbproj**.

2.  Select the target platform.**Note:** The **MouseOverHints** sample is supported by desktop platforms, see [Platform Support for Hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Platform_Support_for_Hints) for further details.
3.  Press F9 or choose **Run > Run**.
4.  Use the check boxes to change the different options and place the mouse over the buttons, menu items, and panel to see hints.

![MouseOverHints Sample.png](data:image/png;base64,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)

## Files 



|**File in Delphi**        |**File in C++**                                     |**Contains**                                   |
|--------------------------|----------------------------------------------------|-----------------------------------------------|
|**MouseOverHints.dproj**  |**MouseOverHints.cbproj**                           |The project itself.                            |
|**MouseOverHints.fmx**    |**MouseOverHints.fmx**                              |The main form where the components are located.|
|**MouseoverHintsForm.pas**|**MouseoverHintsForm.h**, **MouseoverHintsForm.cpp**|Used to define and implement the sample.       |


## Implementation 


### Setting and Showing Hints 


*  The [TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint) property is used to set the hint of a control in the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) at design time. The [TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint) property is also used to change or set the hint of a control at run time.

*  The [TApplication.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.ShowHint) property is used to enable or disable the hints for the sample application. Disabling the hints of the application disables the hints from all controls.

*  The [TForm.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.ShowHint) property is used to enable or disable the hints of the form.

*  The [TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) property is used to enable or disable the hints of a control.

*  The [TControl.ParentShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ParentShowHint) property is used to set whether the [ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) of a control is enabled or disabled according to the [TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) property of the parent control.

*  The [TApplication.HintShortCuts](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.HintShortCuts) property is used to indicate if the hints also display the [keyboard shortcuts](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.ShortCut).

*  The [GetLongHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Utils.GetLongHint) method is used to get the long version of the hint. The long version of the hint is the one written after the | (pipe) character.
See more information about [enabling hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Enabling_Hints).
### Actions 

The [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) component is used to maintain a list of some of the actions used in the sample.
*  The [TAction.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.OnHint) event is used to set or change the hint of the client control. Setting the hint with `OnHint` changes the hint that displays by default.
See more information about [actions and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Actions).
### Status Bar 

The [TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar) control works in a different manner for hints.
*  The [TStatusBar.AutoHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.AutoHint) property is set to `True` to allow the status bar to intercept all hints from the application.
*  Since `TStatusBar.AutoHint` is `True`, the [TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint) event occurs when any hint in the application is triggered.
*  The [TApplication.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.Hint) property is used to get the text of the current hint.
See more information about [status bar and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Status_Bar).
### Menu 

Since the [menu items](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) do not display hints as other controls do, the `Label1` displays the hints of the menu items when the [TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint) event occurs.See more information about [menus and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Menus).

## Uses 


* [FMX.Forms.TApplication.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.Hint)
* [FMX.Forms.TApplication.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.ShowHint)
* [FMX.Forms.TApplication.HintShortCuts](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.HintShortCuts)

* [FMX.Forms.TForm.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.ShowHint)

* [FMX.Controls.TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint)
* [FMX.Controls.TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint)
* [FMX.Controls.TControl.ParentShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ParentShowHint)

* [FMX.ActnList.TAction.ShortCut](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.ShortCut)
* [FMX.ActnList.TAction.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.OnHint)

* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)

* [FMX.Utils.GetLongHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Utils.GetLongHint)

* [FMX.StdCtrls.TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar)
* [FMX.StdCtrls.TStatusBar.AutoHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.AutoHint)
* [FMX.StdCtrls.TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint)

## See Also 


* [Using Hints to Show Contextual Help in a FireMonkey Application](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application)
* [FireMonkey Actions](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Actions)






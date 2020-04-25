VCL.ToggleSwitch Sample[]()
# VCL.ToggleSwitch Sample 


This is a sample that shows the use of the [TToggleSwitch](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch) control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TToggleSwitchForm](#TToggleSwitchForm)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **ToggleSwitch** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\VCL\ToggleSwitch`
* `CPP\VCL\ToggleSwitch`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/ToggleSwitch](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/ToggleSwitch)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ToggleSwitch](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ToggleSwitch)

## Description 

This application demonstrates the [TToggleSwitch](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch) control and shows how to modify the caption text of the toggle switch.The application uses the following controls:

* `TB`: The toggle switch.
* `grpAlignment`: Sets the [alignment](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.Alignment).
* `grpState`: Toggles the [state](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.State) of the toggle switch.
* `grpColors`: Sets the [color](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.Color) of the switch and its parts.
* `grpstateCaptions`: Edit controls that define the [caption](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.StateCaptions) text.
* `chkReadOnly`: Sets the [ReadOnly](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.ReadOnly) property of the toggle switch.
* `chkShowStateCaptions`: Specifes whether the toggle switch [displays captions](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.ShowStateCaption).
* `chkEnabled`: [Enables or disables](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.Enabled) the toggle switch.
* `cbxVclStyles`: A combo box that allows you to change the style of the application. You can choose between any style that is active in the [Application Appearance - Custom Styles](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance) options for this project.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **ToggleSwitch.dproj**.
*  C++: **ToggleSwitch.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Change the different options on the form and test the functionality of the toggle switch. Modify colors, caption text, alignment, and the state of the toggle switch.

## Implementation 


### TToggleSwitchForm 

On initialization, the `FormCreate` adds all the active styles to the `cbxVclStyles` combo box.
*  The application defines the following event handlers:

* `edtCaptionOffChange`: Changes the [CaptionOff](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitchStateCaptions.CaptionOff) property.
* `edtCaptionOnChange`: Changes the [CaptionOn](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitchStateCaptions.CaptionOn) property.
* `chkShowStateCaptionsClick`: Changes the [ShowStateCaption](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.ShowStateCaption) property.
* `grpAlignmentClick`: Changes the [Alignment](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.Alignment) property.
* `cbxThumbColorChange`: Changes the [ThumbColor](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.ThumbColor) property.
* `cbxFrameColorChange`: Changes the [FrameColor](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.FrameColor) property.
* `cbxColorChange`: Changes the [Color](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.Color) property.
* `grpStateClick`: Changes the [State](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.State) property.
* `chkReadOnlyClick`: Changes the [ReadOnly](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch.ReadOnly) property.
* `cbxVclStylesChange`: Sets the style for the application.
* `chkEnabledClick`: Enables or disables the toggle switch.

## Uses 


* [Vcl.WinXCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls)
* [Vcl.Themes](http://docwiki.embarcadero.com/Libraries/en/Vcl.Themes)
* [Vcl.ExtCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls)
* [Vcl.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls)
* [Vcl.Dialogs](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs)
* [System.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Actions)
* [Vcl.ActnList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList)

## See Also 


* [Vcl.WinXCtrls.TToggleSwitch](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TToggleSwitch)
* [VCL Styles Overview](http://docwiki.embarcadero.com/RADStudio/en/VCL_Styles_Overview)

* [Including Bi-directional Functionality in Applications](http://docwiki.embarcadero.com/RADStudio/en/Including_Bi-directional_Functionality_in_Applications)
* [Vcl.Controls.TControl.BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode)

* [Application Appearance](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance)






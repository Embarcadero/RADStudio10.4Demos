VCL.SplitView Sample[]()
# VCL.SplitView Sample 


This is a sample that shows the use of the [TSplitView](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView) control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TSplitViewForm](#TSplitViewForm)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **SplitView** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\VCL\SplitView`
* `CPP\VCL\SplitView`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/SplitView](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/SplitView)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/SplitView](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/SplitView)

## Description 

This application demonstrates the [TSplitView](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView) control and shows how to modify its various properties.The application uses the following controls:

* `ActionList1`: The actions associated with the menu items.
* `SV`: The split view.

* `catMenuItems`: The menu items.

* `pnlToolbar`: The panel that holds the title and the master button.

* `imgMenu`: The image that acts as the master button.

* `pnlSettings`: The panel that holds main application controls.

* `cbxVclStyles`: A combo box that allows you to change the style of the application. You can choose any style that is active in the [Application Appearance - Custom Styles](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance) options for this project.
* `chkCloseOnMenuClick`: The checkbox that specifies whether a click on a menu item collapses the split view
* `grpAnimation`:

* `chkUseAnimation`: Toggles the [UseAnimation](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.UseAnimation) property of the split view.
* `trkAnimationDelay`: Sets the [animation delay](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.AnimationDelay) of the split view.
* `trkAnimationStep`: Sets the [animation step](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.AnimationStep) of the split view.

* `grpCloseStyle`: Allows you to choose the [close style](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.CloseStyle) of the split view.
* `grpDisplayMode`: Allows you to choose the [display mode](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.DisplayMode) of the split view.
* `grpPlacement`: Allows you to choose the [placement](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.Placement) of the split view.
* `lstLog`: Displays the feedback text.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **SplitView.dproj**.
*  C++: **SplitView.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Change the different options on the form and test the functionality of the split view. Modify display mode, close style, animation speed and step of the split view.

## Implementation 


### TSplitViewForm 

On initialization, the `FormCreate` adds all the active styles to the `cbxVclStyles` combo box.The application defines the following event handlers: 

* `grpDisplayModeClick`: Changes the [DisplayMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.DisplayMode) of the split view.
* `grpPlacementClick`: Changes the [Placement](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.Placement) of the split view.
* `grpCloseStyleClick`: Changes the [CloseStyle](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.CloseStyle) of the split view.
* `SVClosed`: The event handler for the [OnClosed](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.OnClosed) event. Adjusts the width of the menu items.
* `SVClosing`: The event handler for the [OnClosing](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.OnClosing) event.
* `SVOpened`: The event handler for the [OnOpened](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.OnOpened) event. Adjusts the width of the menu items.
* `SVOpening`: The event handler for the [OnOpening](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.OnOpening) event. Adjusts the width of the menu items.
* `catMenuItemsCategoryCollapase`: Prevents the catMenuItems category group from being collapsed.
* `imgMenuClick`: Acts as a master button to [Open](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TCustomSplitView.Open) or [Close](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TCustomSplitView.Close) the split view.
* `chkUseAnimationClick`: Toggles the [UseAnimation](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.UseAnimation) property of the split view.
* `trkAnimationDelayChange`: Changes the [animation delay](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.AnimationDelay) of the split view.
* `trkAnimationStepChange`: Changes the [animation step](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView.AnimationStep) of the split view.
* `actHomeExecute`: The event handler for the execution of the corresponding action of this menu item. Logs the name of the menu item into the `lstLog` and closes the split view if `chkCloseOnMenuClick` is checked.
* `actLayoutExecute`: The event handler for the execution of the corresponding action of this menu item. Logs the name of the menu item into the `lstLog` and closes the split view if `chkCloseOnMenuClick` is checked.
* `actPowerExecute`: The event handler for the execution of the corresponding action of this menu item. Logs the name of the menu item into the `lstLog` and closes the split view if `chkCloseOnMenuClick` is checked.
* `cbxVclStylesChange`: Sets the style for the application.

## Uses 


* [Vcl.WinXCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls)
* [Vcl.Themes](http://docwiki.embarcadero.com/Libraries/en/Vcl.Themes)
* [Vcl.ExtCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls)
* [Vcl.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls)
* [Vcl.ComCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls)
* [Vcl.Dialogs](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs)
* [Vcl.ActnList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList)
* [System.ImageList](http://docwiki.embarcadero.com/Libraries/en/System.ImageList)
* [System.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Actions)

## See Also 


* [Vcl.WinXCtrls.TSplitView](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSplitView)
* [VCL Styles Overview](http://docwiki.embarcadero.com/RADStudio/en/VCL_Styles_Overview)

* [Including Bi-directional Functionality in Applications](http://docwiki.embarcadero.com/RADStudio/en/Including_Bi-directional_Functionality_in_Applications)
* [Vcl.Controls.TControl.BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode)

* [Application Appearance](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance)






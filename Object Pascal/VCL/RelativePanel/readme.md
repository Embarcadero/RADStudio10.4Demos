VCL.RelativePanel Sample[]()
# VCL.RelativePanel Sample 


This is a sample that shows the use of the [TRelativePanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanel) control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TRelativePanelForm](#TRelativePanelForm)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **RelativePanel** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\VCL\RelativePanel`
* `CPP\VCL\RelativePanel`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/RelativePanel](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/RelativePanel)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/RelativePanel](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/RelativePanel)

## Description 

This application demonstrates the [TRelativePanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanel) control and shows how to use the alignment properties of the child controls.The application uses the following controls:

* `RelativePanel1`: The relative panel.

* `Button1`: A button control.
* `ControlCollection`: A collection of [references to the child controls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem) of the relative panel.
* `Edit1`: An edit control.
* `Shape1`: A shape.

* `pageControl1`: A [TPageControl](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TPageControl) with tabs for each of the controls on the relative panel.

* `TabSheet1, TabSheet2, TabSheet3` (`Edit1, Button1, Shape1`): The tabs of the `pageControl1`. Each contains the check boxes and drop-down menus that control the properties of the corresponding control on the relative panel.

* `cbAlignLeftWithPanel`: Toggles the [AlignLeftWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignLeftWithPanel) property of the associated control.
* `cbAlignHorizontalCenterWithPanel`: Toggles the [AlignHorizontalCenterWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignHorizontalCenterWithPanel) property of the associated control.
* `cbAlignRightWithPanel`: Toggles the [AlignRightWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignRightWithPanel) property of the associated control.
* `cbAlignTopWithPanel`: Toggles the [AlignTopWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignTopWithPanel) property of the associated control.
* `cbAlignVerticalCenterWithPanel`: Toggles the [AlignVerticalCenterWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignVerticalCenterWithPanel) property of the associated control.
* `cbAlignBottomWithPanel`: Toggles the [AlignBottomWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignBottomWithPanel) property of the associated control.
* `cbxLeftOf`: Allows you to modify the [LeftOf](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.LeftOf) property of the associated control.
* `cbxAlignLeftWith`: Allows you to modify the [AlignLeftWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignLeftWith) property of the associated control.
* `cbxAlignHorizontalCenterWith`: Allows you to modify the [AlignHorizontalCenterWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignHorizontalCenterWith) property of the associated control.
* `cbxAlignRightWith`: Allows you to modify the [AlignRightWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignRightWith) property of the associated control.
* `cbxRightOf`: Allows you to modify the [RightOf](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.RightOf) property of the associated control.
* `cbxAbove`: Allows you to modify the [Above](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.Above) property of the associated control.
* `cbxAlignTopWith`: Allows you to modify the [AlignTopWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignTopWith) property of the associated control.
* `cbxAlignVerticalCenterWith`: Allows you to modify the [AlignVerticalCenterWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignVerticalCenterWith) property of the associated control.
* `cbxAlignBottomWith`: Allows you to modify the [AlignBottomWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignBottomWith) property of the associated control.
* `cbxBelow`: Allows you to modify the [Below](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.Below) property of the associated control.

* `cbxVclStyles`: A combo box that allows you to change the style of the application. You can choose between any style that is active in the [Application Appearance - Custom Styles](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance) options for this project.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **RelativePanel.dproj**.
*  C++: **RelativePanel.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Change the different alignment options for each control on the corresponding tab. Modify alignment of the controls relative to each other and to the relative panel.

## Implementation 


### TRelativePanelForm 

On initialization, the `FormCreate` adds all the active styles to the `cbxVclStyles` combo box.The application defines the following event handlers:

* `RelativePanel1DragOver`: Allows you to drag controls around the relative panel.
* `RelativePanel1DragDrop`: Allows you to drop controls on the relative panel.
* `SampleControlMouseDown`: Initiates a drag of the current control and changes the tab to the one associated with the current control.
* `cbAlignHorizontalCenterWithPanelClick`: Toggles the [AlignHorizontalCenterWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignHorizontalCenterWithPanel) property of the associated control.
* `cbAlignRightWithPanelClick`: Toggles the [AlignRightWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignRightWithPanel) property of the associated control.
* `cbAlignTopWithPanelClick`: Toggles the [AlignTopWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignTopWithPanel) property of the associated control.
* `cbAlignVerticalCenterWithPanelClick`: Toggles the [AlignVerticalCenterWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignVerticalCenterWithPanel) property of the associated control.
* `cbAlignBottomWithPanelClick`: Toggles the [AlignBottomWithPanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignBottomWithPanel) property of the associated control.
* `cbxLeftOfChange`: Allows you to modify the [LeftOf](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.LeftOf) property of the associated control.
* `cbxAlignLeftWithChange`: Allows you to modify the [AlignLeftWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignLeftWith) property of the associated control.
* `cbxAlignHorizontalCenterWithChange`: Allows you to modify the [AlignHorizontalCenterWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignHorizontalCenterWith) property of the associated control.
* `cbxAlignRightWithChange`: Allows you to modify the [AlignRightWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignRightWith) property of the associated control.
* `cbxRightOfChange`: Allows you to modify the [RightOf](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.RightOf) property of the associated control.
* `cbxAboveChange`: Allows you to modify the [Above](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.Above) property of the associated control.
* `cbxAlignTopWithChange`: Allows you to modify the [AlignTopWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignTopWith) property of the associated control.
* `cbxAlignVerticalCenterWithChange`: Allows you to modify the [AlignVerticalCenterWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignVerticalCenterWith) property of the associated control.
* `cbxAlignBottomWithChange`: Allows you to modify the [AlignBottomWith](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.AlignBottomWith) property of the associated control.
* `cbxBelowChange`: Allows you to modify the [Below](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanelControlItem.Below) property of the associated control.
* `cbxVclStylesChange`: Sets the style for the application.
The application also defines the following public procedure:
* `SelectedControl`: A helper method that forwards the actions of a check box or a drop-down menu to the corresponding control.

## Uses 


* [Vcl.WinXCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls)
* [Vcl.Themes](http://docwiki.embarcadero.com/Libraries/en/Vcl.Themes)
* [Vcl.ExtCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls)
* [Vcl.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls)
* [Vcl.ComCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls)
* [Vcl.Dialogs](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs)

## See Also 


* [Vcl.WinXCtrls.TRelativePanel](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TRelativePanel)
* [VCL Styles Overview](http://docwiki.embarcadero.com/RADStudio/en/VCL_Styles_Overview)

* [Application Appearance](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance)






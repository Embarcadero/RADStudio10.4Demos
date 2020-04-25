FMX.ControlsDemo Sample[]()
# FMX.ControlsDemo Sample 


This sample illustrates the **FireMonkey Controls** and how to use them.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **Controls Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ControlsDesktop`
* `CPP\Multi-Device Samples\User Interface\ControlsDesktop`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ControlsDesktop](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ControlsDesktop)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ControlsDesktop](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ControlsDesktop)

## Description 

This sample shows how to use FireMonkey controls.
## How to Use the Sample 


1.  Navigate to the location given above, and open the **ControlsDemo** project file.
2.  Press F9 or choose **Run > Run**.
3.  Open different tabs, observe and try to use FireMonkey controls in each tab.

## Classes 

**FireMonkey Controls** represents the main window of the sample. It contains the following components:
* [MainMenu](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) with the **File** and **Help**[MenuItems](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem), each of them containing several other [MenuItems](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem)
* [OpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [Timer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout), called **ControlRoot**, containing the [TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl), called **TabControl1**, with several [TabItems](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem):

*  The first [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Standard**, contains the following controls:

* [AniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
* [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [CalloutPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCalloutPanel) with four [RadioButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton) and a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
*  Two [CheckBoxes](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
*  Four [Labels](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [Panel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) with a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) and two [Buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [ProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)
*  Two [RadioButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton)
*  Two [ScrollBars](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TScrollBar)
* [SmallScrollBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSmallScrollBar)
* [ComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) with several string type [ListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem)
* [ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) with several string type [ListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), called **TextBox1**
* [TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)

*  The second [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Additional**, contains the following controls:

*  Three [TArcDials](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TArcDial), called **AngleButton1**, **AngleButton2**, and **AngleButton3**
* [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) with a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) and an [Image](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage)
* [Calendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar)
* [DateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit)
* [Expander](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander) with a [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) and a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [GroupBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TGroupBox) with a [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) and a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
*  Six [Labels](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [NumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox) with a [GlowEffect](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TGlowEffect)
* [PopupBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TPopupBox)
* [Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), called **TextBox3**
* [TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)

*  The third [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **ExtControls**, contains the following controls:

* [DropTarget](http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TDropTarget)
* [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit)

*  The fourth [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **TreeView and ListBox**, contains the following controls:

* [CheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) with several [ListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), each of them containing one or more of the following components: [Image](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage), [Path](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath), [Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), [Rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle). The [Rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) also has two children: [Ellipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse) and [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel).

*  The fifth [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Transformations**, contains the following controls:

* [Ellipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse)
*  Two [Labels](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox), called **ListTransform**
* [Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
*  Two [TrackBars](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)

*  The sixth [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **ScrollBox**, contains the following controls:

* [Panel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) with a [ScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScrollBox)
* [Rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) with a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) and a [VertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox). The [VertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) contains three [Expanders](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander), each of them having a [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), [Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), and [TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) as children.
* [Splitter](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter)

*  The seventh [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Memo**, contains the [Memo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) control.
*  The eighth [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **New!**, contains the following controls:

* [AlphaTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TAlphaTrackBar)
* [BWTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TBWTrackBar)
* [HueTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.THueTrackBar)
*  Four [CheckBoxes](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), called **CornerButton**
* [ComboColorBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TComboColorBox)
* [ComboEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.ComboEdit.TComboEdit)
* [ComboTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.ComboTrackBar.TComboTrackBar)
*  Six [CornerButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton), two of them containing [Paths](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath) as children.
*  Three [Labels](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [SpinBox](http://docwiki.embarcadero.com/Libraries/en/FMX.SpinBox.TSpinBox)
* [ClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit)
* [TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)

* [StatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar), containing the following controls:

* [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
*  Three [Labels](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## Implementation 

When you run the application, the main window of the sample is displayed:
*  Position the mouse pointer over the [TMenuItem](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem) object named **File**, from the [TMainMenu](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) object, to display the **File** menu.

*  Select the **File > Load Style** command to open a browse dialog, where you can load a new `.style` file. The FireMonkey style files are available at `C:\Users\Public\Documents\Embarcadero\Studio\\Styles`.
*  Select the **File > Exit** command to close the main window of the sample.
*  Select the **Help > About** command to display an animated **About** box (aboutboxfrm.fmx).

*  Select one of the [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) objects, to display the specific controls for each of the eight tabs (**Standard**, **Additional**, and so forth):

* **Standard** is **TabItem1**. This tab shows the standard controls, such as labels, buttons, radio buttons, check box, and edit box.

*  Type some text in the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object labeled **Edit** to change its content.
*  Clear or check the [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object.
*  Click the arrow on the [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) object labeled **ListBoxItem** to view its subitems.
*  Grab the scroll on the [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) object and move it to the right.
*  Check the [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object, named **MultiSelect**, to be able to select more than one item from the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object.
*  The [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar) has its **BindingSource** property set to `ScrollBar1`, so changing the value of the scroll bar automatically changes the value of the progress bar.
*  The [TCalloutPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCalloutPanel) changes the callout position according to the radio button selection.

* **Additional** is **TabItem4**. Select the [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) object, named **Additional**, to see some additional controls.

*  Select the arrow from the [TExpander](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander) object to compact and to expand the box.
*  Grab the angle point from the [TArcDial](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TArcDial) angle buttons and spin it, to change the value of an angle. This changes the value of the label corresponding to the rotated angle button.
*  Use the [TCalendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar) object to view the calendar and select a specific date. The value of the date is changed.

* **Ext Controls** is **TabItem5**.

*  Drag an item over the [TDropTarget](http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TDropTarget) object.
*  Type some text in the [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit) object, and then press the **x** button to erase the text you typed.

* **TreeView and ListBox** is **TabItem3**. This tab displays the [ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) and [TreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) controls that allow you to build a list box or a tree view.

*  In the [TreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView), click the arrows to expand or to compact the view. The tree view has several tree view items, displayed on three levels.
*  The list box displays list box items with different content (labels, images, paths, buttons).
*  The check box labeled as **Show check boxes** shows check boxes before the items in the tree view and in the list box.

* **Transformations** is **TabItem6**. This tab displays the **Rotate** and **Opacity** controls with which you can transform objects.

*  Scroll the **Rotate** and **Opacity**[TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) objects, and observe how the angle and the opacity of other objects are changed. (**Opacity** must be high in order to see the rotation changes.)

* **ScrollBox** is **TabItem2**.

*  This tab displays the [TVertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) control that you can use to provide a vertical scroll box in your application.
*  Also this tab displays the [Rectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) with a [Label](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) and [VertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox). The [VertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) contains three [Expanders](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander), each of them having a [Button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton), [Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit), and [TrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) as children. [Expanders](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander) provide the possibility to expand or contract their display area showing or hiding contained controls. [VertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) supports vertical scrolling of [Expanders](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander) if they do not fit in the visible area.

* **Memo** is **TabItem8**. This tab displays the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) control that allows you to keep written notes.
* **New!** is **TabItem7**. This tab displays some of the newer FireMonkey controls.

*  Set the corner check boxes associated with the first [CornerButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton), called **CornerButton1**, to see how they round checked corners of the button. The **TrackBar4**[track bar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)'s value sets the X and Y radius for all rounded corners of all [corner buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton).
*  Click the [ColorComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TColorComboBox) to display the color wheel from which you can select a color.
*  Click the down-arrow on the [ComboEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.ComboEdit.TComboEdit) to display the available choices.
*  Click the arrows on the [TSpinBox](http://docwiki.embarcadero.com/Libraries/en/FMX.SpinBox.TSpinBox) to increment or decrement the number displayed.
*  Click the segmented corner button to see how to set the **Corners** property when creating a segmented corner button.

*  The **Switch to 3D and back** button, located below the TabControl and thus available on each tab, briefly animates the current tab as a 3D image, using [TViewPort3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) and [TLayer3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayer3D).

## Uses 


* [FMX.Menus.TMainMenu](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [FMX.StdCtrls.TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar)
* [FMX.TabControl.TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [FMX.StdCtrls.TGroupBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TGroupBox)
* [FMX.ExtCtrls.TDropTarget](http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TDropTarget)
* [FMX.StdCtrls.TCalloutPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCalloutPanel)
* [FMX.StdCtrls.TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
* [FMX.StdCtrls.TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)
* [FMX.StdCtrls.TSmallScrollBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSmallScrollBar)
* [FMX.StdCtrls.TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)
* [FMX.Layouts.TScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScrollBox)
* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [FMX.Layouts.TVertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox)
* [FMX.StdCtrls.TSplitter](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter)
* [FMX.Calendar.TCalendar](http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar)
* [FMX.DateTimeCtrls.TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit)
* [FMX.NumberBox.TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox)
* [FMX.ExtCtrls.TPopupBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TPopupBox)
* [FMX.Objects.TEllipse](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TEllipse)
* [FMX.Colors.TAlphaTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TAlphaTrackBar)
* [FMX.Colors.TBWTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TBWTrackBar)
* [FMX.Colors.TComboColorBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TComboColorBox)
* [FMX.ComboEdit.TComboEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.ComboEdit.TComboEdit)
* [FMX.ComboTrackBar.TComboTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.ComboTrackBar.TComboTrackBar)
* [FMX.Colors.THueTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.THueTrackBar)
* [FMX.SpinBox.TSpinBox](http://docwiki.embarcadero.com/Libraries/en/FMX.SpinBox.TSpinBox)
* [FMX.Menus.TMenuItem](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.TabControl.TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.ListBox.TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem)
* [FMX.StdCtrls.TExpander](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TExpander)
* [FMX.StdCtrls.TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)
* [FMX.StdCtrls.TArcDial](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TArcDial)
* [FMX.StdCtrls.TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [FMX.StdCtrls.TRadioButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TScrollBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TScrollBar)
* [FMX.Edit.TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [FMX.StdCtrls.TPanel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel)
* [FMX.TreeView.TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView)
* [FMX.TreeView.TTreeViewItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeViewItem)
* [FMX.Memo.TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo)
* [FMX.Edit.TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit)
* [FMX.StdCtrls.TCornerButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton)
* [FMX.Objects.TPath](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TPath)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)

### Samples 


* [FireMonkey Native Controls](http://docwiki.embarcadero.com/CodeExamples/en/FMX.NativeControls_Sample) sample






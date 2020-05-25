FMX.ImageList Sample[]()
# FMX.ImageList Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)

* [5.1 Image Tab](#Image_Tab)
* [5.2 Bitmap and Image Tab](#Bitmap_and_Image_Tab)
* [5.3 Bitmap Tab](#Bitmap_Tab)
* [5.4 None Tab](#None_Tab)

* [6 See Also](#See_Also)

This sample illustrates how to create and use image lists in FireMonkey. You can view the [video demonstrating features programmed in this Sample](http://youtu.be/oAEHD44BnQQ).
## Location 

You can find the **ImageList** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ImageList`
* `CPP\Multi-Device Samples\User Interface\ImageList`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ImageList](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ImageList)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ImageList](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ImageList)

## Description 

This sample shows how to use FireMonkey [image lists](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TImageList). In the [Using TImageList Image Lists as Centralized Collections of Images](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images) tutorial, this example is used:
*  To [demonstrate how to use](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#How_To_Use_The_Image_List_Editor) the [Image List Editor](http://docwiki.embarcadero.com/RADStudio/en/Image_List_Editor_(FireMonkey)).
*  To describe the code implementing the **ActnNextImageExecute** event handler of the **OnExecute** event assigned to the [**Add New Source**](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#.27Add_New_Source.27_Button.27s_Event_Handler) button. This button adds, to an image in the Destination collection, a new layer and creates a new multi-resolution bitmap in this layer.
*  To describe the code implementing the **ActnUpdateTextExecute** event handler of the **OnExecute** event assigned to the [**Update Text**](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#.27Update_Text.27_Button.27s_Event_Handler) button. This button draws the specified text over the main image in a layer.
*  To describe the code demonstrating [how to draw images from an image list on the surface of your own controls](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#Using_Image_Lists_in_Your_Controls).

## How to Use the Sample 

You can view the [video demonstrating how to use this Sample](http://youtu.be/oAEHD44BnQQ).To run this sample:

1.  Navigate to the location given above, and open **ImageListDemo.dproj**.
2.  Press Shift+Ctrl+F9 or choose **Run > Run Without Debugging**. The **Demo of images** application is built and runs.
3.  Open the **[Image](#Image_Tab)**, **[Bitmap and Image](#Bitmap_and_Image_Tab)**, **[Bitmap](#Bitmap_Tab)**, and **[None](#None_Tab)** tabs, try to click different controls in each tab and carefully read the displayed messages, observe changing images and additional information.

## Classes 

The **UnitDataModule** unit contains the [ImageList1](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TImageList) image list.The **UnitMain** unit contains the main window of the sample containing the following components:

* [MainMenu1](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) with the **Files**, **Bitmap and Image**, **Bitmap**, and **None**, [MenuItems](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem), each of them containing several other [MenuItems](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem). Some menu items show images from the `ImageList1` image list.
* [PopupMenu1](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TPopupMenu) containing several [MenuItems](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMenuItem). Menu items show images from the `ImageList1` image list.
* [ActionList1](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) containing several [Actions](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction).
* [BindingsList1](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) containing several [Actions](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction).
* [BindingsList1](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) containing several methods.
* [PrototypeBindSource1](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TPrototypeBindSource).

* [TabControl1](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) containing several [TabItems](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem):

* [TabItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Image**, containing the following controls:

* [Panel1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) containing the following controls:

* [Button1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Next Image**.
* [Button2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) showing only the image.
* [CornerButton1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton) called **Next Image**.
* [SpeedButton1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) called **Next Image**.

* [Splitter1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) providing the possibility of resizing client area.

* [TabItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Bitmap and Image**, containing the following controls:

* [Panel2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) containing the following controls:

* [CheckBox1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) called **Dormant**.
* [Button3](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Up Cache Size**.
* [Button4](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Down Cache Size**.
* [Button5](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Clear Cache**.
* [Button6](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Update Text**.
* [Button7](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **Add New Source**.
* [Label2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) called **Label2**.

* [Selection1](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TSelection) containing:

* [Rectangle1](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) containing:

* [Glyph1](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TGlyph) control references to the `MainDataModule.ImageList1`[image list](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TGlyph.Images).

* [Splitter2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) providing the possibility of resizing client area.
* [ToolBar1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) containing the following controls:

* [Label1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) called **ActnInfo**.
* [SpeedButton2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) the **Left arrow** button (having the `arrowlefttoolbutton` in **StyleLookup** property).
* [SpeedButton3](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) the **Right arrow** button (having the `arrowrighttoolbutton` in **StyleLookup** property).

* [TabItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **Bitmap**, containing the following controls:

* [Panel3](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel) containing the following controls:

* [CheckBox3](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) called **ShowCheckboxes**.
* [ComboBox1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) containing the following [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) items: `ListBoxItem1`, `ListBoxItem2`, `ListBoxItem3`, and `ListBoxItem4`. The [ComboBox1.Images](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox.Images) property references to the `MainDataModule.ImageList1` image list.
* [ListBox1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) containing the following [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) items: `ListBoxItem5`, `ListBoxItem6`, `ListBoxItem7`, and `ListBoxItem8`. The [ListBox1.Images](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox.Images) property references to the `MainDataModule.ImageList1` image list. Some of the list box items show images - specified by the [ImageIndex](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem.ImageIndex) property - from the `MainDataModule.ImageList1` image list.
* [TreeView1](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) containing the hierarchical structure of several [TTreeViewItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeViewItem) items from `TreeViewItem1` until `TreeViewItem14`. The [TreeView1.Images](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView.Images) property references to the `MainDataModule.ImageList1` image list. Some of the tree view items show images - specified by the [ImageIndex](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeViewItem.ImageIndex) property - from the `MainDataModule.ImageList1` image list.

* [Splitter3](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) providing the possibility of resizing client area.

* [TabItem4](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), called **None**, containing the following controls:

* [ToolBar2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) containing the following controls:

* [CheckBox2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) called **Images**.
*  and several [Buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) named **Clear Items**, **Add Item**, **Add Item with Bitmap**, **Add Bitmap and Image**.

* [ListView1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) containing several items.
* [ListView2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) managed by controls in the [ToolBar2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar).
* [Splitter4](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSplitter) divides the client area into resizable panes.

## Implementation 

The **ImageListDemo.dproj** project contains the main **UnitMain** unit, that includes the **UnitDataModule** unit:
*  The **UnitDataModule** unit contains the `ImageList1: TImageList;` image list. Open this module in the **Form Designer** and double-click the `ImageList1` icon. The [Image List Editor](http://docwiki.embarcadero.com/RADStudio/en/Image_List_Editor_(FireMonkey)) opens with `ImageList1`. Look at the images and their numbers in the **List of Images** tab.
*  The **UnitMain** unit implements the business functionality of the project.
[How To Use Image Lists](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#How_To_Use_Image_Lists) describes how to create such projects that use image lists.The **Demo of images** application has the **[Image](#Image_Tab)**, **[Bitmap and Image](#Bitmap_and_Image_Tab)**, **[Bitmap](#Bitmap_Tab)**, and **[None](#None_Tab)** tabs. Here we shortly describe the functionality implemented in these tabs.

### Image Tab 

Now click the first **Image** tab. This tab contains four types of the **Next Image** button. Each button shows the image. Click any of these buttons -- check that the image containing the next index in the `ImageList1` image list is drawn in each button. Note that in the **Object Inspector**, each button shows both **Images** and **ImageIndex** properties. Try to change the **ImageIndex** value.
### Bitmap and Image Tab 

In the **Demo of images** application, click the **Bitmap and Image** tab. This tab contains several controls managing images in the images list:
1.  The **Right** and **Left** arrows increase or decrease the index of the image being shown.
2.  The **Up Cache Size** and **Down Cache Size** buttons increase or decrease the [CacheSize](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TCustomImageList.CacheSize) property on `1`.
3.  The **Clear Cache** button to clear the internal cache.
4.  The **Dormant** check box sets or clears whether the actual image is stored with this bitmap item (the [Dormant](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TCustomImageList.Dormant) property).
5.  The **Add New Source** button creates a new image and adds it to the image list.
6.  The **Update Text** button demonstrates the drawing of a text over the current image.
7.  The **Right** and **Left** arrow buttons draw the next or previous image from the `ImageList1` image list over the **None** caption of the **None** tab.
Open this **Bitmap and Image** tab in the [Form Designer](http://docwiki.embarcadero.com/RADStudio/en/Form_Designer), double-click a control so you can see the code implementing the functionality of the control . Investigate this code.The ['FMX.TImageList Code Sample' section of the 'Using TImageList Image Lists as Centralized Collections of Images' topic](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#FMX.TImageList_Code_Sample) describes some details of the code implementing the **[Add New Source](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#.27Add_New_Source.27_Button.27s_Event_Handler)** and **[Update Text](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#.27Update_Text.27_Button.27s_Event_Handler)** buttons and the code demonstrating[how to draw images from an image list on the surface of your own controls](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images#Using_Image_Lists_in_Your_Controls).

### Bitmap Tab 

Now click the first **Bitmap** tab. This tab contains three list controls: `ComboBox1`, `ListBox1`, and `TreeView1`. These list controls show the **Images** property - in the **Object Inspector** - in which you can select an image list to use. Notice that each item control in these lists shows the **ImageIndex** property - in the **Object Inspector** - in which you can select a number (index) of an image in the image list. Try to change the **ImageIndex** value.
### None Tab 

Now click the last **None** tab. This tab contains the **Add Items**, **Add Items with Bitmap**, and **Add Bitmap and Image** buttons adding into the `ListView2: TListView;` list view a new item showing the `Image1.Bitmap` bitmap and/or images from the `ImageList1` image list. The **Clear Items** button clears all items from the `ListView2`. The **Images** check box switches showing or hiding images from the `ImageList1` image list.
## See Also 


* [Video demonstrating features programmed in this 'FMX.ImageList Sample'](http://youtu.be/oAEHD44BnQQ)
* [Using TImageList Image Lists as Centralized Collections of Images](http://docwiki.embarcadero.com/RADStudio/en/Using_TImageList_Image_Lists_as_Centralized_Collections_of_Images)
* [Image List Editor](http://docwiki.embarcadero.com/RADStudio/en/Image_List_Editor_(FireMonkey))

* [Video demonstrating typical steps required to create a new Image List in your FireMonkey project](http://youtu.be/QI_dwMWtpuc)






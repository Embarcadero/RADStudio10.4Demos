FMX.CustomPicker Sample[]()
# FMX.CustomPicker Sample 


This sample demonstrates how to use the [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) component to customize and invoke an item picker.
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

You can find the **CustomPicker** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\CustomPicker`
* `CPP\Mobile Snippets\CustomPicker`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/CustomPicker](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/CustomPicker)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/CustomPicker](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/CustomPicker)

## Description 

The **CustomPicker** sample demonstrates how to use an item picker on Android and iOS devices. The sample uses [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) to customize the options of the picker and to allow the user to pick an item and display the text of the selected item on a label.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **CustomPicker.dproj**.
*  C++: **CustomPicker.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click or tap the [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) control. See how it displays the native picker that allows you to select an item.
*  Select an item.
*  The sample displays the text of the selected item on a label.

## Files 



|**File in Delphi**    |**File in C++**                            |**Contains**                                   |
|----------------------|-------------------------------------------|-----------------------------------------------|
|**CustomPicker.dproj**|**CustomPicker.cbproj**                    |The project itself.                            |
|**uMain.fmx**         |**uMain.fmx**                              |The main form where the components are located.|
|**uMain.pas**         |**CustomPickerPCH.h**, **CustomPicker.cpp**|Used to define and implement the sample.       |
|**Information.txt**   |**Information.txt**                        |Further information about the sample.          |


## Classes 

**TCustomPickerForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object containing two [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).

*  The first [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) contains a [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) object with four [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem):

* [TListBoxItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **Item One**.
* [TListBoxItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **Item Two**.
* [TListBoxItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **Item Three**.
* [TListBoxItem4](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **Item Four**.

*  The second [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) is empty.

*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) to display a list of items and select an item from it.
*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to locate the [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) on the first [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) and to display the selected item on the second [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).
When you run the application, there are two [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem). In the first [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), click on the [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) next to **Pick an Item**. Then, the sample displays an item picker that allows you to select one of the four items. When you select an item, an [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TCustomComboBox.OnChange) event displays the text of this item in the second [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).
## Uses 


* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)

## See Also 


* [Combo Boxes](http://docwiki.embarcadero.com/RADStudio/en/Combo_Boxes)
* [Mobile Tutorial: Using Combo Box Components to Pick Items from a List (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Combo_Box_Components_to_Pick_Items_from_a_List_(iOS_and_Android))
* [FMX.ListBox.TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)

### Samples 


* [TComboBox (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/TComboBox_%28Delphi%29)
* [ComboBox (C++)](http://docwiki.embarcadero.com/CodeExamples/en/ComboBox_%28C%2B%2B%29)






FMX.CustomListBox Sample[]()
# FMX.CustomListBox Sample 


This sample illustrates how to add items to a custom list box, using the **StyleEditor**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **CustomListBox** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\CustomListBox`
* `CPP\Multi-Device Samples\User Interface\CustomListBox`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/CustomListBox](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/CustomListBox)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CustomListBox](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/CustomListBox)

## Description 

This application uses a list box and populates the list with custom items that contain information about an image file (thumbnail, name, resolution, depth, and so on). The items are created using a custom style, set in the [TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook) editor. The project uses the binding features to set the values of or get the values from the items and set the event handlers.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **CustomListBox.dproj**.
*  C++: **CustomListBox.cbproj**.

2.  Press F9 or choose **Run > Run**.

## Classes 

**FireMonkey Custom List** represents the main window of the sample. It contains the following components:
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
*  Three [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects
*  A [TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
*  A [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
*  Two [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects
*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)

## Implementation 


*  The **ListBox** is populated with customized items that contain information about an image, when the user presses one of the buttons. The **Add By Code** button adds one item. The **Add 1000 By Code** button adds 1000 new random items. The user can add other images by clicking the **Add From File...** button, which opens the **TOpenDialog** object, allowing the user to find the desired image on the computer.
*  The items contain a thumbnail, information about the image, and a button labeled **info**. When clicking the **info** button, a text appears on the info label as a result of the **OnClick** event trigger.
*  The customized items use the [StylesData](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyledControl.StylesData) property to set the values for the children controls.

## Uses 


* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [FMX.Controls.TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [FMX.Controls.TStyledControl.StylesData](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyledControl.StylesData)

## See Also 


* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)






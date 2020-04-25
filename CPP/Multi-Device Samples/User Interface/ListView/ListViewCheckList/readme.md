FMX.ListViewCheckList Sample[]()
# FMX.ListViewCheckList Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to make the display mode of a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) behave as a check list, where you can tap items to add or remove them from the current selection.**Note:** You can easily implement a check list in [edit mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.EditMode) using one of the [default TListView.ItemAppearance.ItemEditAppearance values](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance).
## Location 

You can find the **ListViewCheckList Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\ListViewCheckList`
* `CPP\Multi-Device Samples\User Interface\ListView\ListViewCheckList`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewCheckList](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewCheckList)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewCheckList](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewCheckList)

## Description 

When you run the application, it shows a list view. Tapping an unselected item shows a checked check mark on its right-hand side. Tapping a selected item hides that check mark.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **ListViewCheckListProject.dproj**
*  C++: **ListViewCheckListProject.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Implementation 

This application keeps a [list](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections.TList) of indexes of selected items.The [item appearance of this list view in display mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance) is the default value, `ListItem`, but this appearance has been modified. The properties of the [TListView.ItemAppearance.Item.Accessory](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance) appearance object have been changed as follows:

* [AccessoryType](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance.AccessoryType) has been set to `Checkmark`.
* [Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance.Visible) has been set to `False`.
To show or hide check marks as you tap list view items, this application handles the [OnItemClick](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnItemClick) event of the list view. The handler of this event shows or hides the Accessory appearance object and updates the list of selected items that the application keeps.This application also handles the [OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects) event of the list view, where it:

*  Adjusts the width of the Text appearance objects, so that text does not cover the check mark in the selected items.
*  Sets the visibility of the Accessory of each list view item based on the list of selected items. This is necessary because the rotation resets the list items to their default appearances.

## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance)
* [FMX.ListView.Appearances.TAccessoryObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance)
* [FMX.ListView.Appearances.TAccessoryObjectAppearance.AccessoryType](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance.AccessoryType)
* [FMX.ListView.Appearances.TAccessoryObjectAppearance.Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance.Visible)
* [FMX.ListView.TListView.OnItemClick](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnItemClick)
* [FMX.ListView.TListView.OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects)

## See Also 


* [FMX.ListView.TListViewBase.EditMode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.EditMode)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance)

* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/en/Database_and_LiveBindings_Tutorials)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






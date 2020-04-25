FMX.SimpleListView Sample[]()
# FMX.SimpleListView Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to implement a **Delete** button that works with a "Select" [edit mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance) of a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView).
## Location 

You can find the **SimpleListView Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\SimpleListView`
* `CPP\Multi-Device Samples\User Interface\ListView\SimpleListView`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/SimpleListView](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/SimpleListView)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/SimpleListView](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/SimpleListView)

## Description 

When you run the application, it shows a list view and an **Edit** button on top. You can tap the **Edit** button to enter edit mode.In edit mode, a **Delete** button appears at the bottom of the application. You can select list items and then tap **Delete** to remove them from the list. Also, in edit mode the **Edit** button turns into a **Done** button that you can tap to return to display mode.

## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **SimpleListView.dproj**
*  C++: **SimpleListView.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Implementation 

This application is based on a [list view](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) and three [buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton): **Edit**, **Delete** and **Done**.The **Edit** button is located at the top-right corner of the application. The application handles the [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event of this button, where it enables the [edit mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.EditMode) of the list view, shows the **Delete** and **Done** buttons, and hides the **Edit** button.
The **Delete** button is located at the bottom-left corner of the application, and is hidden by default. The application handles the [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event of this button. This event handler deletes any selected list view item.
The **Done** button is located at the top-right corner of the application, overlapping at design time with the **Edit** button. However, **Done** is hidden by default. **Edit** and **Done** never overlap at run time. The application handles the [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event of the **Done** button as well. Its event handler disables the [edit mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.EditMode) of the list view, shows the **Edit** button and hides the **Delete** and **Done** buttons.

## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [FMX.ListView.Appearances.TAppearanceListViewItems.CheckedIndexes](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.CheckedIndexes)
* [FMX.ListView.Appearances.TAppearanceListViewItems.Delete](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Delete)
* [FMX.Controls.TControl.BeginUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.BeginUpdate)
* [FMX.Controls.TControl.EndUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.EndUpdate)

## See Also 


* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/en/Database_and_LiveBindings_Tutorials)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






FMX.PullToRefresh Sample[]()
# FMX.PullToRefresh Sample 


This sample uses the [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) component to create a list of items and demostrates how to handle a [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) event.
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

You can find the **PullToRefresh** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\PullToRefresh`
* `CPP\Multi-Device Samples\User Interface\PullToRefreshExample`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/PullToRefresh](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/PullToRefresh)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/PullToRefreshExample](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/PullToRefreshExample)

## Description 

The **PullToRefresh** sample demonstrates how to handle a [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) event for a list of items on Android and iOS applications. This sample uses [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) to create a list of items and writes an [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) event to specify what happens when the user pulls down the list of items.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **PullToRefresh.dproj**.
*  C++: **PullToRefreshExample.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  See the list of 20 items.
*  Pull down the list of items.

*  A new item appears at the top of the list.
*  The last item disappears from the list.

## Files 



|**File in Delphi**     |**File in C++**                                            |**Contains**                                   |
|-----------------------|-----------------------------------------------------------|-----------------------------------------------|
|**PullToRefresh.dproj**|**PullToRefreshExample.cbproj**                            |The project itself.                            |
|**Unit1.fmx**          |**Unit1.fmx**                                              |The main form where the components are located.|
|**Unit1.pas**          |**PullToRefreshExamplePCH.h**, **PullToRefreshExample.cpp**|Used to define and implement the sample.       |
|**RandomTextUtils.pas**|**RandomTextUtils.h**                                      |Contains different random arrays of strings.   |


## Classes 

**TForm1** is the main form that represents the main window of the sample. It contains the following components:
*  A [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) object.

## Implementation 


*  The sample uses [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) to displays a collection of items in a list.
When you run the application, the sample creates a list of 20 random items using the [Add](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Add) method of [TAppearanceListViewItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems). The items are composed of three string fields: **ComonNames**, **CommonSurnames** and **SampleTopics**. Each one of the three fields that form each item is chosen randomly from an array of 20 strings. Moreover, when you pull down the list of items, the sample handles the [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) event of the [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) object. The [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) event uses the [Insert](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Insert) and [Delete](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Delete) methods of [TAppearanceListViewItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems) to insert a new random item and to delete an existing item, respectively. The [Insert](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Insert) method, inserts the new item at the first position of the list and shifts the other items, while the [Delete](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Delete) method deletes the last item of the list.**Note**: To successfully call the [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh) method, you have to set the [PullToRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.PullToRefresh) property to `True`.
## Uses 


* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [Add Item](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Add)
* [Insert Item](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Insert)
* [Delete Item](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Delete)
* [OnPullRefresh](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.OnPullRefresh)

## See Also 


* [Customizing FireMonkey ListView Appearance](http://docwiki.embarcadero.com/RADStudio/en/Customizing_FireMonkey_ListView_Appearance)
* [Mobile Tutorial: Using LiveBindings to Populate a ListView](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_LiveBindings_to_Populate_a_ListView_(iOS_and_Android))
* [ListView Items Editor](http://docwiki.embarcadero.com/RADStudio/en/ListView_Items_Editor)

### Samples 


* [FireMonkey ListView Add Thumb And Caption](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewAddThumbAndCaption_Sample) sample
* [FireMonkey ListView Ratings Appearance](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewRatingsAppearance_Sample) sample
* [FireMonkey ListView Custom Bottom Detail](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewCustomBottomDetail_Sample) sample
* [FireMonkey ListView MultiDetail Appearance](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewMultiDetailAppearance_Sample) sample
* [FireMonkey ListView Custom Adapter](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewCustomAdapter) sample
* [FireMonkey ListView Check List](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewCheckList_Sample) sample






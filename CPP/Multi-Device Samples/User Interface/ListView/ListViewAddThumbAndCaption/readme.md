FMX.ListViewAddThumbAndCaption Sample[]()
# FMX.ListViewAddThumbAndCaption Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to customize the appearance of a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) to show a thumbnail with a caption on the left-hand side of every list view item. It does this by modifying the appearance of the list view at run time.
## Location 

You can find the **ListViewAddThumbAndCaption Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\ListViewAddThumbAndCaption`
* `CPP\Multi-Device Samples\User Interface\ListView\ListViewAddThumbAndCaption`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewAddThumbAndCaption](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewAddThumbAndCaption)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewAddThumbAndCaption](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewAddThumbAndCaption)

## Description 

When you run the application, it shows a list view. Each list item shows a thumbnail image with a caption on the right-hand side corner.You can tap the **ToggleEditMode** button to have the list view enter a selection edit mode where you can select several items. The buttons at the bottom, **LiveBindings** and **Fill in Code**, let you fill the list view with items defined using [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) or defined at run time, respectively.

## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **SampleListViewAddThumbAndCaptionProject.dproj**
*  C++: **SampleListViewAddThumbAndCaptionProject.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Implementation 

To render the thumbnail and caption on each list view item the application handles the [OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects) event of the list view. For each list view instance, the application creates and initializes the required [TListItemImage](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.TListItemImage) instance that will hold the thumbnail and the [TListItemText](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.TListItemText) instance that will hold the caption.When using LiveBindings, the application handles the [OnFilledListItem](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TCustomBindList.OnFilledListItem) event of the instance of [TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField) to fill list view items with the required data for their new fields: the bitmap of the thumbnail and the text of the caption.
You can change at design time the values of the [ItemAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance) and [ItemAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance) properties of the list view to see how, at run time, the application extends any selected appearance with a thumbnail and a caption on the right-hand side of each item.
**Note:** This application is not meant to work with every item appearance, but you can make it work with all of them.The **LiveBindings** button uses [TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField) to fill the list view using LiveBindings. The **Fill in Code** button [uses a for loop to fill the list view with items created at run time](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView#Example).
## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [FMX.ListView.TListView.OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects)
* [FMX.ListView.Types.TListItemImage](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.TListItemImage)
* [FMX.ListView.Types.TListItemText](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.TListItemText)
* [Data.Bind.Components.TCustomBindList.OnFilledListItem](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TCustomBindList.OnFilledListItem)
* [Data.Bind.Components.TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField)
* [FMX.ListView.TAppearanceListView.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TAppearanceListView.ItemAppearance)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance)

## See Also 


* [FMX.ListViewCustomBottomDetail Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewCustomBottomDetail_Sample)
* [FMX.ListViewMultiDetailAppearance Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewMultiDetailAppearance_Sample)
* [FMX.ListViewRatingsAppearance Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewRatingsAppearance_Sample)

* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/en/Database_and_LiveBindings_Tutorials)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






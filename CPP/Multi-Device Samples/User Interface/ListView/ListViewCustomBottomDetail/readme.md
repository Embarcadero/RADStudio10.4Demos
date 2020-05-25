FMX.ListViewCustomBottomDetail Sample[]()
# FMX.ListViewCustomBottomDetail Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to customize the appearance of a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) to show a detail text at the bottom of every list view item. It does this by using the "Custom" list view item appearance value and configuring the appearance properties of list view items at design time. It also shows how to do this at run time.
## Location 

You can find the **ListViewCustomBottomDetail Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\ListViewCustomBottomDetail`
* `CPP\Multi-Device Samples\User Interface\ListView\ListViewCustomBottomDetail`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewCustomBottomDetail](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewCustomBottomDetail)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewCustomBottomDetail](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/ListView/ListViewCustomBottomDetail)

## Description 

When you run the application, it shows a list view. Each list item shows a detail text under its main label.Tap the **Set Properties** button to change the appearance of the list view at run time. Tap the **ToggleEditMode** button to have the list view enter a selection edit mode where you can select several items. The buttons at the bottom, **LiveBindings** and **Fill in Code**, let you fill the list view with items defined using [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) or defined at run time, respectively.

## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **SampleListViewCustomBottomDetailProject.dproj**
*  C++: **SampleListViewCustomBottomDetailProject.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Implementation 

The values of the [ItemAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance) and [ItemAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance) properties of the list view in this application are "Custom". This indicates that, instead of using a default appearance set, the [appearance objects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TObjectAppearance) of the [item appearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance) are customized. They have been customized at design time, selecting appearance objects in the **[Structure](http://docwiki.embarcadero.com/RADStudio/en/Structure_View)** view and changing their properties from the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**.By default, the base custom appearance only has one visible appearance object: [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextObjectAppearance). That is, Text is the only [visible](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TObjectAppearance.Visible) appearance object in [TListView.ItemAppearance.Item](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TItemAppearanceObjects) and [TListView.ItemAppearance.ItemEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TItemAppearanceObjects). This application makes visible the following appearance objects as well, and configures their properties to customize their appearance:

* [TListView.ItemAppearance.Item.Accessory](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance)
* [TListView.ItemAppearance.Item.Detail](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextObjectAppearance)
* [TListView.ItemAppearance.Item.Image](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TImageObjectAppearance)
* [TListView.ItemAppearance.ItemEdit.Detail](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextObjectAppearance)
* [TListView.ItemAppearance.ItemEdit.GlyphButton](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TGlyphButtonObjectAppearance)
* [TListView.ItemAppearance.ItemEdit.Image](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TImageObjectAppearance)
In addition to these design time changes, this application handles the [OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects) event of the list view to adjust the width of the Text and Detail appearance objects.The **Set Properties** button, when tapped, modifies the appearance of the list view at run time, performing appearance adjustment on top of the custom appearance defined at design time.
The **LiveBindings** button uses [TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField) to fill the list view using LiveBindings. The **Fill in Code** button [uses a for loop to fill the list view with items created at run time](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView#Example).

## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)

* [FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance)

* [FMX.ListView.Appearances.TObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TObjectAppearance)
* [FMX.ListView.Appearances.TItemAppearanceObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TItemAppearanceObjects)
* [FMX.ListView.Appearances.TAccessoryObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAccessoryObjectAppearance)
* [FMX.ListView.Appearances.TGlyphButtonObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TGlyphButtonObjectAppearance)
* [FMX.ListView.Appearances.TImageObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TImageObjectAppearance)
* [FMX.ListView.Appearances.TTextObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TTextObjectAppearance)

* [FMX.ListView.TListView.OnUpdateObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnUpdateObjects)
* [Data.Bind.Components.TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField)

## See Also 


* [FMX.ListViewAddThumbAndCaption Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewAddThumbAndCaption_Sample)
* [FMX.ListViewMultiDetailAppearance Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewMultiDetailAppearance_Sample)
* [FMX.ListViewRatingsAppearance Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewRatingsAppearance_Sample)

* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/en/Database_and_LiveBindings_Tutorials)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






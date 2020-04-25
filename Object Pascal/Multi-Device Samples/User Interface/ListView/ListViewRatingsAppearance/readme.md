FMX.ListViewRatingsAppearance Sample[]()
# FMX.ListViewRatingsAppearance Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to customize the appearance of a [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) to show a rating as an image. That is, it shows a different image based on a numeric value of each list view item. It does this by using list view item appearances previously defined in a custom package.
## Location 

You can find the **ListViewRatingsAppearance Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\ListViewRatingsAppearance`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewRatingsAppearance](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/ListViewRatingsAppearance)

## Description 

When you run the application, it shows a list view. Each list item shows three different detail fields under their main label.You can tap the **ToggleEditMode** button to have the list view enter a selection edit mode where you can select several items. The buttons at the bottom, **LiveBindings** and **Fill in Code**, let you fill the list view with items defined using [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) or defined at run time, respectively.

## How to Use the Sample 


1.  Navigate to the location given above and open the package file **SampleListViewRatingsAppearancePackage.dpk**.
2.  In the Project Manager, right-click the **SampleListViewRatingsAppearancePackage.bpl** file and select **Install** from the context menu.
3.  Return to the location given above and open the project file **ListViewMRatingsAppearanceProject.dproj**.
4.  Double-click the project entry on the **Project Manager**, and press **F9** or choose **Run > Run**.

## Implementation 

The package defines three subclasses of [Appearances.TPresetItemObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPresetItemObjects) that implement a custom appearance for list view items. It actually defines a base subclass that is later inherited and extended by the other two subclasses.These subclasses use instances of a custom class, `TRatingsImageObjectAppearance`. Its subclasses use [Appearances.TImageObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TImageObjectAppearance) to implement a rating image, a control that shows a different image based on a numeric value. The rest of the fields are inherited from [Appearances.TPresetItemObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPresetItemObjects) and customized as necessary.
The application uses these subclasses in the [ItemAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance) and [ItemAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance) properties of the list view to use the appearance defined in the installed package. You can tap **ToggleEditMode** to see how the application keeps the appearance in [edit mode](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListViewBase.EditMode).
The **LiveBindings** button uses [TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField) to fill the list view using LiveBindings. The **Fill in Code** button [uses a for loop to fill the list view with items created at run time](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView#Example). You must use **Fill in Code** to actually see a different rating on each list view item; the LiveBindings items do not provide a rating and the default value is used instead.

## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [FMX.ListView.Appearances.TPresetItemObjects](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPresetItemObjects)
* [FMX.ListView.Appearances.TImageObjectAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TImageObjectAppearance)
* [FMX.ListView.Appearances.TPublishedAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemAppearance)
* [FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TPublishedAppearance.ItemEditAppearance)
* [Data.Bind.Components.TLinkFillControlToField](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToField)

## See Also 


* [FMX.ListViewMultiDetailAppearance Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewMultiDetailAppearance_Sample)
* [FMX.ListViewAddThumbAndCaption Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewAddThumbAndCaption_Sample)
* [FMX.ListViewCustomBottomDetail Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ListViewCustomBottomDetail_Sample)

* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/en/Database_and_LiveBindings_Tutorials)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)






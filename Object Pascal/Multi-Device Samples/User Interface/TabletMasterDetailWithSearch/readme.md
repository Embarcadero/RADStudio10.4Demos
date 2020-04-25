FMX.TabletMasterDetailwithSearch Sample[]()
# FMX.TabletMasterDetailwithSearch Sample 


This is a project that shows how to implement a master-detail application for tablets using a [TListView](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView) and [LiveBindings](http://docwiki.embarcadero.com/RADStudio/Denali/en/LiveBindings_in_RAD_Studio).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **TabletMasterDetailwithSearch Sample** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\TabletMasterDetailWithSearch`
* `CPP\Multi-Device Samples\User Interface\TabletMasterDetailWithSearch`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/User%20Interface/TabletMasterDetailWithSearch](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/User%20Interface/TabletMasterDetailWithSearch)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/User%20Interface/TabletMasterDetailWithSearch](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/User%20Interface/TabletMasterDetailWithSearch)

## Description 

When you run the application, it shows two columns. The column on the left-hand side shows a list of people and includes a search box. The column on the right-hand side shows details (a picture, name, job and "description") about the person currently selected on the list view.You can tap list view entries to select them and load their information on the right-hand side column. You can also click the **Prior** and **Next** button on the top-right corner of the application to navigate the list view items.
You can also enter text in the search box of the list view to filter the list of people.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **TabletMasterDetailwithSearch.dproj**.
*  C++: **TabletMasterDetailwithSearch.cbproj**.

2.  Press **F9** or choose **Run > Run**.

## Implementation 

This application uses a [list view](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView) populated using [LiveBindings](http://docwiki.embarcadero.com/RADStudio/Denali/en/LiveBindings_in_RAD_Studio), specifically a [TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.ObjectScope.TPrototypeBindSource).This application handles the [OnItemClick](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView.OnItemClick) event of the list view with a procedure that takes the [TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.ObjectScope.TPrototypeBindSource) to the clicked entry, so that the right-hand side column of the application shows that information.
This application contains a [TActionList](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TActionList) with two actions that are associated with the **Prior** and **Next** buttons. These actions are the standard [TFMXBindNavigatePrior](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigatePrior) and [TFMXBindNavigateNext](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigateNext) actions and they are linked with the [TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.ObjectScope.TPrototypeBindSource) through their [DataSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigateAction.DataSource) property and have event handlers for their [OnExecute](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TAction.OnExecute) and [OnUpdate](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TAction.OnUpdate) events. The Execute event handler takes the [TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.ObjectScope.TPrototypeBindSource) to the next entry and the Update event handler disables when there is no prior or following item, respectively.
The [SearchVisible](http://docwiki.embarcadero.com/Libraries/Denali/en/) property of the list view is `True`, so that the list view shows a search box to filter the list view items. The Update event handler of the **Prior** and **Next** actions disables these actions when the list view is filtered.

## Uses 


* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView)
* [Data.Bind.ObjectScope.TPrototypeBindSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.ObjectScope.TPrototypeBindSource)
* [FMX.ListView.TListView.OnItemClick](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView.OnItemClick)
* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TActionList)
* [Fmx.Bind.Navigator.TFMXBindNavigatePrior](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigatePrior)
* [Fmx.Bind.Navigator.TFMXBindNavigateNext](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigateNext)
* [Fmx.Bind.Navigator.TFMXBindNavigateAction.DataSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Fmx.Bind.Navigator.TFMXBindNavigateAction.DataSource)
* [FMX.ActnList.TAction.OnExecute](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TAction.OnExecute)
* [FMX.ActnList.TAction.OnUpdate](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ActnList.TAction.OnUpdate)
* [FMX.ListView.TListView.SearchVisible](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListView.TListView.SearchVisible)

## See Also 


* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/Denali/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [All the LiveBindings Tutorials](http://docwiki.embarcadero.com/RADStudio/Denali/en/Database_and_LiveBindings_Tutorials#LiveBindings)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/Denali/en/LiveBindings_in_RAD_Studio)






LiveBindings.AdapterBindSource Sample[]()
# LiveBindings.AdapterBindSource Sample 


This sample project demonstrates the use of a [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 At Design Time](#At_Design_Time)
* [5.2 At Run Time](#At_Run_Time)

* [5.2.1 JSON Tab](#JSON_Tab)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **AdapterBindSource** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to Object Pascal\LiveBindings\AdapterBindSource
* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/AdapterBindSource](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/AdapterBindSource)

## Description 

This sample demonstrates the use of [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource) and [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter).
* [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource) to provide custom data to a grid at run time.
* [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter) to provide random data to a grid at design time.
The grid and the adapters are linked using [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings).The sample also uses [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) to bind a [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) with a [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid). 

## How to Use the Sample 


1.  Navigate to the location above and open **AdapterBindSourceSample.dproj**.
2.  Press F9 or choose **Run > Run**.
3.  When you run the application, the **TGrid** is populated with a user-defined list.

1.  Use the **TBindNavigator** to navigate through the rows and to add/delete items at run time.**Note:** The modifications to the fields remain only at run time.

4.  Go to the **JSON** tab to see a JSON representation of the data.
5.  Any modification over the data in the **Grid** or **JSON** tab applies to the other tab at run time.

## Files 



|**File**                                         |**Contains**                                             |
|-------------------------------------------------|---------------------------------------------------------|
|**AdapterBindSourceSample.dproj**                |The project itself.                                      |
|**ABSMain.fmx / pas**                            |The main form and main unit.                             |
|**CollectionObjects.pas**                        |The unit with the definition of the custom class TPerson.|
|**ABSMain.iPhone4in.fmx / ABSMain.LgXhdpiPh.fmx**|View forms for iPhone and Android.                       |


## Implementation 


### At Design Time 

The [Adapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TCustomAdapterBindSource.Adapter) property of the [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource) is filled at design time with the [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter) to generate some prototype data.Three [FieldDefs](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TCustomDataGeneratorAdapter.FieldDefs) items are added to the [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter) using the **Fields Editor**.
The sample uses [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings) to create the binding between the adapter and the grid.
At run time, the [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter) is replaced with the user-defined data.

### At Run Time 

**CollectionObjects.pas** contains a custom class, **TPerson**, that contains three properties: **FirstName**, **LastName** and **Age**.The [OnCreateAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TBaseObjectBindSource.OnCreateAdapter) event of the [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource) is used to initialize a user defined list. The list is a [TObjectList](http://docwiki.embarcadero.com/Libraries/en/System.Contnrs.TObjectList) that contains individual **TPerson** objects.
After creating the list, the collection is populated with hard-coded data provided in **ABSMain.pas**.
An adapter ([TBindSourceAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TBindSourceAdapter)) provides the data to the grid. It uses [TListBindSourceAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TListBindSourceAdapter) to implement the adapter for the user-defined list of objects. 
[LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings) creates the binding between the adapter and the grid.

#### JSON Tab 

The sample uses the [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl.OnChange) event from the [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) to populate the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) from the **JSON** tab with the JSON representation of the data from the grid.Making changes on the **Grid** data, updates the data from the **JSON** tab, and vice versa.

## Uses 


* [TAdapterBindSource](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TAdapterBindSource)
* [TDataGeneratorAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TDataGeneratorAdapter)
* [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator)
* [TBindSourceAdapter](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.ObjectScope.TBindSourceAdapter)
* [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid)

## See Also 


* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)
* [Creating LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings)
* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)






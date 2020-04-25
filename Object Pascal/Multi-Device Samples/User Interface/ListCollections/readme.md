FMX.ListCollections Sample[]()
# FMX.ListCollections Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

This sample illustrates how to use **LiveBindings** to populate a list box with the items gathered from various collections, using a **TBindList** type of **LiveBinding**.
> **Note:** Instructions for constructing this sample are given in **[Tutorial: Creating Collection Lists Using LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_Collection_Lists_Using_LiveBindings)**.


## Location 

You can find the **SurfSpotFinderApp** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListCollections`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListCollections](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListCollections)

## Description 

The sample application uses several visual objects that are bound via **TBindList** to the list box. A combo box holds a series of items describing various collections you can choose from when populating the list box.The **Control Component** and **Control Expression** fields are not editable and they specify the control component (**ListBox1**) and the control expression.
The **Source Component** field is also not editable and it specifies the source component, which varies each time you select another collection type from the combo box.
The **Source Expression** field is editable and allows typing in the binding expression used to gather information from the source component. This binding expression also supports conversion methods such as **ToStr** to convert from numbers to strings.
Each time you press the **Fill** button (or **Auto Fill** is selected), the list box is populated with 100 items, generated at run time, for the collection specified through the **Collection** combo box.

## How to Use the Sample 


1.  Navigate to the location given above, and open **ListCollectionsSampleProject.dproj**.
2.  Press F9 or choose **Run > Run**.

## Classes 

**List Collections Demo** represents the main window of the sample. It contains the following components:
*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects
*  Four [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) objects
*  Five [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) objects
*  Three [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) objects
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
*  A [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
*  A [TBindScope](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindScope)
*  A [TBindList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindList)

## Implementation 


*  The **SampleCollections.pas** unit implements the additional supported collections of elements that will be exported to the **List Box** by means of **LiveBindings**.

## Uses 


* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [FMX.Edit.TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox)
* [FMX.ListBox.TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)
* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [Data.Bind.Components.TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
* [Data.Bind.Components.TBindScope](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindScope)
* [Data.Bind.Components.TBindList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindList)

## See Also 


* [Tutorial: Creating Collection Lists Using LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Creating_Collection_Lists_Using_LiveBindings)
* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [Tutorial: Using LiveBindings to Create a FireMonkey Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [Tutorial: Using LiveBindings in FireMonkey Applications](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_in_FireMonkey_Applications)
* [Tutorial: Using LiveBindings in VCL Applications](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBinding_in_VCL_Applications)
* [Bindings Lists](http://docwiki.embarcadero.com/RADStudio/en/Bindings_Lists)






LiveBindings.BindGridLinkFMX Sample[]()
# LiveBindings.BindGridLinkFMX Sample 


This sample project demonstrates the use of a **TBindGridLink**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **BindGridLinkFMX** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to Object Pascal\LiveBindings\bindgridlink\fmx
* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/bindgridlink/fmx](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/bindgridlink/fmx)

## Description 

This sample demonstrates the use of a [TBindGridLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindGridLink). This sample uses [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) to bind a **TBindNavigator** with a **TStringGrid** and other controls.
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples**, go to **Object Pascal\LiveBindings\bindgridlink\fmx**, and open **BindGridLinkFMXProject.dproj**.
2.  Press F9 or choose **Run > Run**.
3.  When you run the application, the main window displays the visual components of the sample. Initially, the components display the first item of the dataset.
4.  Use the **TBindNavigator** or the **TStringGrid** to navigate through the dataset.
5.  See how the rest of the visual components update when navigating through the dataset.

## Files 



|**File**                  |**Contains**                                   |
|--------------------------|-----------------------------------------------|
|**BindGridLinkFMXProject**|The project itself.                            |
|**FMXGridFormUnit1**      |The main form where the components are located.|
|**Readme.html**           |Basic information about this sample.           |


## Implementation 


*  Use the [TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) or the [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) to navigate through the dataset.
* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) is used to create managed binding among the different components.
*  The [TImageControl](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TImageControl) displays the image of the selected fish.
*  The two [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) and the [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) display the Category of the selected fish within the dataset.
*  The other [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) displays the position of the selected item of the dataset.
* [TBindGridLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindGridLink) is used to bind the TStingGrid and the [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB).

## Uses 


* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
* [TBindScope](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindScope)
* [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB)
* [TBindGridLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindGridLink)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TBindLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindLink)

## See Also 


* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)
* [Creating LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings)
* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)






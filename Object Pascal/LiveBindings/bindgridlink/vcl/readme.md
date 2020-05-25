LiveBindings.BindGridLinkVCL Sample[]()
# LiveBindings.BindGridLinkVCL Sample 


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

You can find the **BindGridLinkVCL** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to Object Pascal\LiveBindings\bindgridlink\vcl
* **GitHub Repository:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/LiveBindings/bindgridlink/vcl](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/LiveBindings/bindgridlink/vcl)

## Description 

This sample demonstrates the use of a [TBindGridLink](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindGridLink).This sample uses [LiveBindings](http://docwiki.embarcadero.com/RADStudio/Denali/en/LiveBindings_in_RAD_Studio) to bind a **TDBNavigator** with a **TStringGrid** and other controls.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples**, go to **Object Pascal\LiveBindings\bindgridlink\vcl**, and open **BindGridLinkVCLProject.dproj**.
2.  Press F9 or choose **Run > Run**.
3.  When you run the application, the main window displays the visual components of the sample. Initially, the components display the first item of the dataset.
4.  Use the **TStringGrid** to navigate through the dataset.
5.  Ensure the Active **TCheckBox** is checked to navigate through the dataset also using the **TDBNavigator**.
6.  See how the rest of the visual components update when navigating through the dataset.

## Files 



|**File**                  |**Contains**                                   |
|--------------------------|-----------------------------------------------|
|**BindGridLinkVCLProject**|The project itself.                            |
|**GridLinkFormUnit1**     |The main form where the components are located.|
|**Readme.html**           |Basic information about this sample.           |


## Implementation 


*  Use the [TDBNavigator](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.DBCtrls.TDBNavigator) or the [TStringGrid](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Grids.TStringGrid) to navigate through the dataset. Ensure the **Active**[TCheckBox](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TCheckBox) is checked to navigate through the dataset using the **TDBNavigator**.
* [TBindingsList](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindingsList) is used to create managed binding among the different components.
*  The [TImage](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ExtCtrls.TImage) displays the image of the selected fish.
*  The two [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TEdit) and the [TLabel](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TLabel) display the Category of the selected fish within the dataset.
* [TBindGridLink](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindGridLink) is used to bind the **TStingGrid** and the [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.DBScope.TBindSourceDB).

## Uses 


* [TBindingsList](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindingsList)
* [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.DBScope.TBindSourceDB)
* [TBindGridLink](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindGridLink)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.DB.TDataSource)
* [TBindLink](http://docwiki.embarcadero.com/Libraries/Denali/en/Data.Bind.Components.TBindLink)

## See Also 


* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/Denali/en/LiveBindings_in_RAD_Studio)
* [Creating LiveBindings](http://docwiki.embarcadero.com/RADStudio/Denali/en/Creating_LiveBindings)
* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/Denali/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)






LiveBindings.BindLinkFMX Sample[]()
# LiveBindings.BindLinkFMX Sample 


This sample project demonstrates the use of a **TBindLink**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **BindLinkFMX** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to Object Pascal\LiveBindings\bindlink\fmx
* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/bindlink/fmx](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/LiveBindings/bindlink/fmx)

## Description 

This sample demonstrates the use of a [TBindLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindLink). This sample uses [LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) to bind a **TBindNavigator** with other controls.
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples**, go to **Object Pascal\LiveBindings\bindlink\fmx** and open **BindLinkFMXProject.dproj**.
2.  Press F9 or choose **Run > Run**.
3.  When you run the application the main window displays the visual components of the sample. Initially the components display the first item of the dataset.
4.  Use the **TBindNavigator** to navigate through the dataset.
5.  See how the rest of the visual components update when navigating through the dataset.
6.  Choose **View > LiveBindings Designer** to open the [LiveBindings Designer](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_Designer) and view the data binding connections.

## Files 



|**File**              |**Contains**                                   |
|----------------------|-----------------------------------------------|
|**BindLinkFMXProject**|The project itself.                            |
|**FormUnit1**         |The main form where the components are located.|
|**Readme.html**       |Basic information about this sample.           |


## Implementation 


*  Use the **BindNavigator1**[TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator) to navigate through the dataset.
* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) is used to create managed binding among the different components. [TBindLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindLink) is used to create bindings to the columns of the dataset.
*  The **ImageWithHandler**[TImageControl](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TImageControl) displays the Graphic [Field](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Fields) of the selected fish within the dataset.
*  The **EditWithHandler**[TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) displays the Category Field of the selected fish within the dataset.
*  The **ListBoxWithHandler**[TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) displays the different Categories of the dataset.
*  The **MemoWithHandler**[TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) displays the Notes of the selected fish.
*  The **LabelFields**[TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) displays the Category and Species Name of the selected fish. The **LabelPosition** TLabel displays the position of the selected fish within the dataset.

## Uses 


* [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
* [TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB)
* [TBindLink](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindLink)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [LiveBindings in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio)
* [Creating LiveBindings](http://docwiki.embarcadero.com/RADStudio/en/Creating_LiveBindings)
* [Tutorial: Using LiveBindings to Create an Application Without Code](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_LiveBindings_to_Create_an_Application_Without_Code)
* [Binding Expression Editor](http://docwiki.embarcadero.com/RADStudio/en/Binding_Expression_Editor)
* [BindGridLinkFMX Sample](http://docwiki.embarcadero.com/CodeExamples/en/LiveBindings.BindGridLinkFMX_Sample)






FMX.TimePicker Sample[]()
# FMX.TimePicker Sample 


This sample demonstrates how to use the [TTimeEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit) component in FireMonkey.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Files](#Files)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **TimePicker** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **C:\Users\Public\Documents\Embarcadero\Studio\\Samples\CPP\Mobile Snippets\TimePicker**
* **C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Mobile Snippets\TimePicker**

* **GitHub Repository:**

*  For C++: [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/TimePicker/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/TimePicker/)
*  For Delphi: [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/TimePicker/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/TimePicker/)

## Description 

This code snippet shows you how to use the [TTimeEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit) component to invoke the native time picker at runtime, select times from it and process them for use in your own applications.
## How to Use the Sample 


1.  Navigate to the location given above.
2.  Open the sample application project file:

* **Delphi:**`TimePicker.dproj`
* **C++:**`TimePicker.cbproj`

3.  Press **F9** or choose **Run > Run**.

## Classes 

The main form contains a [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) with 2 [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), the first one containing a [TTimeEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit) component that allows selecting the time. The main form also contains a [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) and a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel).
## Files 

The project has one source file, **uMain.pas**, which contains the class for the main form.
## Implementation 


*  The [TTimeEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit) component implements the [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit.OnChange) event.

## Uses 


* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TTimeEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit)
* [OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TTimeEdit.OnChange)
* [FMX.StdCtrls.TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [Mobile Code Snippets](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Code_Snippets)
* [Mobile Tutorial: Using ListBox Components to Display a Table View (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_ListBox_Components_to_Display_a_Table_View_(iOS_and_Android))
* [Using Pickers to Provide Platform-Specific Behavior and View of Selection Controls](http://docwiki.embarcadero.com/RADStudio/en/Using_Pickers_to_Provide_Platform-Specific_Behavior_and_View_of_Selection_Controls)






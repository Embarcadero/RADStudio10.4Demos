FMX.DatePicker Sample[]()
# FMX.DatePicker Sample 


This sample demonstrates how to use the [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) component to invoke the native date picker at runtime and select a date in order to use it in your own application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **DatePicker** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\DatePicker`
* `CPP\Mobile Snippets\DatePicker`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/DatePicker](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/DatePicker)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/DatePicker](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/DatePicker)

## Description 

The **DatePicker** sample demonstrates how to use the date picker on Android and iOS applications. The sample uses the [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) component that allows you to select a date from the date picker.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **DatePicker.dproj**.
*  C++: **DatePicker.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click or tap the [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) control. See how it displays a date picker that allows you to select a date.
*  Select a date.
*  The picked date is displayed with the following format string: 'dddd, mmmm d, yyyy'.**Note**: Click [here](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime) to see the meaning of the specifiers of the date time format string.

## Files 



|**File in Delphi**  |**File in C++**                        |**Contains**                                   |
|--------------------|---------------------------------------|-----------------------------------------------|
|**DatePicker.dproj**|**DatePicker.cbproj**                  |The project itself.                            |
|**uMain.fmx**       |**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**       |**DatePickerPCH.h**, **DatePicker.cpp**|Used to define and implement the sample.       |
|**Information.txt** |**Information.txt**                    |Further information about the sample.          |


## Classes 

**TDatePickerForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object containing two [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).

*  The first [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) contains a [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) object.

*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) to display a date picker that allows you to select a date.
*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display the date picker on the first [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) and to show the selected date on the second [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).
When you run the application and click on **Pick a Date**, the [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit) component displays a date picker that allows you to select a date. When you select a date, this date is displayed in a [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) with a specified [date time format](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime). 
## Uses 


* [TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit)
* [FormatDateTime](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)

## See Also 


* [Mobile Tutorial: Using a Calendar Component to Pick a Date (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_Calendar_Component_to_Pick_a_Date_(iOS_and_Android))
* [Tracking the Date](http://docwiki.embarcadero.com/RADStudio/en/Tracking_the_Date)
* [FMX.DateTimeCtrls.TDateEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.DateTimeCtrls.TDateEdit)
* [System.SysUtils.FormatDateTime](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.FormatDateTime)

### Samples 


* [DateTimeInfo (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/DateTimeInfo_%28Delphi%29)
* [DateTimeInfo (C++)](http://docwiki.embarcadero.com/CodeExamples/en/DateTimeInfo_%28C%2B%2B%29)






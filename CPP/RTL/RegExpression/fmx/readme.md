RTL.RegExpressionFMX Sample[]()
# RTL.RegExpressionFMX Sample 


**RegExpressionDemo** is a sample that demonstrates how to use regular expressions in an application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **RegExpressionDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to one of the following:

* **Object Pascal\RTL\RegExpression\fmx**
* **CPP\RTL\RegExpression\fmx**

* **GitHub Repository for Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/RegExpression/fmx](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/RegExpression/fmx)
* **GitHub Repository for C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/RegExpression/fmx](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/RegExpression/fmx)

## Description 

This application allows the user to test the validity of a string with regards to a regular expression. The form contains a list box, a memo, and an edit box. From the list box the user can choose to validate an e-mail address, an IP address, or a date in either of two formats. When one of the options is selected from the [TListBox](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListBox.TListBox), the regular expression that is used for validation is displayed in the [TMemo](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Memo.TMemo) component. Next, the user can enter a string in the [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) to see whether the input is valid according to the regular expression.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **RegExpressionDemo.dproj**.
*  C++: **CppRegExFMX.cbproj**.

2.  Press F9 or choose **Run > Run**.
To interact with the sample:
*  Select the type of expression from the **lbRegExp** list box.
*  Type the input string you want to evaluate in the **EditText** edit.
*  The shadow effect of the **EditText** edit turns green when the input matches the regular expression.
*  You can edit the regular expression in the **MemoRegEx** memo.

## Files 



|**File in Delphi**         |**File in C++**         |**Contains**                                   |
|---------------------------|------------------------|-----------------------------------------------|
|**RegExpressionDemo.dproj**|**CppRegExFMX.cbproj**  |The project itself.                            |
|**Main.fmx**               |**Main.fmx**            |The main form where the components are located.|
|**Main.pas**               |**Main.h**, **Main.cpp**|Implementation of the sample.                  |


## Classes 

**TForm1**, the class for the main form, handles the display of visual components and the validation of strings by using regular expressions.
## Implementation 


*  The [TListBox.OnChange](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListBox.TListBox.OnChange) event is used to know when an item is selected on the list box; then the corresponding regular expression is added to the [TMemo](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Memo.TMemo).
*  The input string is evaluated with the [TRegEx.IsMatch](http://docwiki.embarcadero.com/Libraries/Denali/en/System.RegularExpressions.TRegEx.IsMatch) method.
*  A [TShadowEffect](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Effects.TShadowEffect) activates on the **EditText** edit and displays in green or red depending on whether the input corresponds with the regular expression or not.

## Uses 


* [System.RegularExpressions.TRegEx.IsMatch](http://docwiki.embarcadero.com/Libraries/Denali/en/System.RegularExpressions.TRegEx.IsMatch)
* [FMX.Effects.TShadowEffect.ShadowColor](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Effects.TShadowEffect.ShadowColor)
* [FMX.Memo.TMemo.Lines](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Memo.TMemo.Lines)
* [FMX.ListBox.TListBox.OnChange](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListBox.TListBox.OnChange)
* [FMX.ListBox.TListBox.ItemIndex](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ListBox.TListBox.ItemIndex)

## See Also 


* [TRegExReplace (Delphi)](http://docwiki.embarcadero.com/CodeExamples/Denali/en/TRegExReplace_%28Delphi%29)
* [TRegExReplace (C++)](http://docwiki.embarcadero.com/CodeExamples/Denali/en/TRegExReplace_%28C%2B%2B%29)
* [RTL.RegExpressionVCL Sample](http://docwiki.embarcadero.com/CodeExamples/Denali/en/RTL.RegExpressionVCL_Sample)
* [Regular Expressions](http://docwiki.embarcadero.com/RADStudio/Denali/en/Regular_Expressions)
* [RegularExpressions Unit](http://docwiki.embarcadero.com/Libraries/Denali/en/System.RegularExpressions)
* [RegularExpressionsCore Unit](http://docwiki.embarcadero.com/Libraries/Denali/en/System.RegularExpressionsCore)






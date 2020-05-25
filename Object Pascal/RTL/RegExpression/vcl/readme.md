RTL.RegExpressionVCL Sample[]()
# RTL.RegExpressionVCL Sample 


**RegExpDemo** is a sample that demonstrates how to use regular expressions in an application.
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

You can find the **RegExpDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to one of the following:

* **Object Pascal\RTL\RegExpression\vcl**
* **CPP\RTL\RegExpression\vcl**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/RegExpression/vcl](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/RegExpression/vcl)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/RegExpression/vcl](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/RTL/RegExpression/vcl)

## Description 

This application allows the user to test the validity of a string with regards to a regular expression. The form contains a list box, a memo, an edit box, and a button. From the list box the user can choose to validate an e-mail address, an IP address, or a date in either of two formats. When one of the options is selected from the [TListBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox), the regular expression that is used for validation is displayed in the [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) component. Next, the user can enter a string in the [TEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TEdit) and click **Evaluate** to see whether the input is valid according to the regular expression.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **RegExpDemo.dproj**.
*  C++: **CppRegExpDemo.cbproj**.

2.  Press F9 or choose **Run > Run**.
To interact with the sample:
*  Select the type of expression from the **lbRegExp** list box.
*  Type the input string you want to evaluate in the **EditText** edit and click **Evaluate**.
*  You can edit the regular expression in the **MemoRegEx** memo.

## Files 



|**File in Delphi**  |**File in C++**         |**Contains**                                   |
|--------------------|------------------------|-----------------------------------------------|
|**RegExpDemo.dproj**|**CppRegExpDemo.cbproj**|The project itself.                            |
|**Main.dfm**        |**Main.dfm**            |The main form where the components are located.|
|**Main.pas**        |**Main.h**, **Main.cpp**|Implementation of the sample.                  |


## Classes 

**TForm1**, the class for the main form, handles the display of visual components and the validation of strings by using regular expressions.
## Implementation 


*  The [TListBox.OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox.OnClick) event is used to know when an item is selected on the list box; then the corresponding regular expression is added to the [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo).
*  The input string is evaluated with the [TRegEx.IsMatch](http://docwiki.embarcadero.com/Libraries/en/System.RegularExpressions.TRegEx.IsMatch) method.
*  A message shows whether the input corresponds with a regular expression or not.

## Uses 


* [System.RegularExpressions.TRegEx.IsMatch](http://docwiki.embarcadero.com/Libraries/en/System.RegularExpressions.TRegEx.IsMatch)
* [Vcl.StdCtrls.TMemo.Lines](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo.Lines)
* [Vcl.StdCtrls.TListBox.OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TListBox.OnClick)
* [Vcl.Controls.TCustomListControl.ItemIndex](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TCustomListControl.ItemIndex)

## See Also 


* [TRegExReplace (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/TRegExReplace_%28Delphi%29)
* [TRegExReplace (C++)](http://docwiki.embarcadero.com/CodeExamples/en/TRegExReplace_%28C%2B%2B%29)
* [RTL.RegExpressionFMX Sample](http://docwiki.embarcadero.com/CodeExamples/en/RTL.RegExpressionFMX_Sample)
* [Regular Expressions](http://docwiki.embarcadero.com/RADStudio/en/Regular_Expressions)
* [RegularExpressions Unit](http://docwiki.embarcadero.com/Libraries/en/System.RegularExpressions)
* [RegularExpressionsCore Unit](http://docwiki.embarcadero.com/Libraries/en/System.RegularExpressionsCore)






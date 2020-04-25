RTL.ComplexNumbers Sample[]()
# RTL.ComplexNumbers Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample demonstrates various features of records.
## Location 

You can find the **ComplexNumbers** sample project at:
* **Start > Programs > Embarcadero RAD Studio > Samples > Delphi > RTL > ComplexNumbers**
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/ComplexNumbers/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/ComplexNumbers/)

## Description 

This application provides an implementation for a record that handles complex numbers. It exemplifies operator overloading, visibility specifiers, instance methods, class methods, and class variables. 
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open **Win32OperatorOverload.dproj**.
2.  Press F9 or choose **Run > Run**.

## Files 

The project has two source files:

|**File**                     |**Contains**                                                               |
|-----------------------------|---------------------------------------------------------------------------|
|**Vassbotn.Vcl.Complex.pas** |The implementation for **TComplex**, a record that handles complex numbers.|
|**Win32OperatorOverload.dpr**|A program that uses **TComplex** instances, operators, and methods.        |


## Classes 

**TComplex** implements a record that manages complex numbers. It provides fields, operators, instance methods, class methods, and class variables for operations with complex numbers. 
## Implementation 


*  A constructor is simulated by using a private class procedure and the initialization section of the unit.
*  The **TComplex** class overloads some of the Delphi operators: **Add**, **Substract**, **Multiply**, **Divide**, **Negative**, **Equal**, **NotEqual**, and so on.
* **TComplex** contains class variables, like **Symbol** and **SymbolBeforeImaginary**, that belong to the entire class and not to individual instances.
* **TComplex** implements both class methods (for example `class function From(const AReal, AImaginary: Double): TComplex; static;`) and instance methods, for example `function ToString: System.String;`.
*  Members of **TComplex** have different visibility specifiers: **strict private**, **private**, and **public**.

## Uses 


* [Records](http://docwiki.embarcadero.com/RADStudio/en/Structured_Types_(Delphi)#Records_.28advanced.29)

## See Also 


* [Operator Overloading (Delphi)](http://docwiki.embarcadero.com/RADStudio/en/Operator_Overloading_(Delphi))
* [Classes and Objects#Visibility of Class Members](http://docwiki.embarcadero.com/RADStudio/en/Classes_and_Objects_(Delphi)#Visibility_of_Class_Members)






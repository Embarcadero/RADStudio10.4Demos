RTL.SimpleShareMem Sample[]()
# RTL.SimpleShareMem Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample demonstrates how to share memory between a DLL and its client application.
## Location 

You can find the **SimpleShareMem** sample project at:
* **Start > Programs > Embarcadero RAD Studio > Samples > Delphi > RTL > SimpleShareMem**
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/SimpleShareMem/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/SimpleShareMem/)

## Description 

This sample contains a DLL module and a VCL form application. The DLL exports a method that has a string as a parameter and frees the memory allocated for it.The VCL application creates a form with one button. When the button is pressed, long strings are created and passed as argument to the function from the DLL, which frees them.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open **SimpleShareMem.groupproj**.
2.  Build **TestDLL.dll**.
3.  Build and Run **MainApp**.

## Files 

This project has one source file, **MainAppForm**, which contains the class for the main form.
## Classes 

**TfMainAppForm**, the class for the main form, loads the DLL module and invokes the method exported by it.
## Implementation 


*  The DLL is loaded with the **LoadLibrary** function and freed with **FreeLibrary**. Both functions are Windows calls.
*  The **GetProcAddress** Windows call is used to get the address of the function exported by the DLL.
* [System.Assigned](http://docwiki.embarcadero.com/Libraries/en/System.Assigned) is used to check whether the function returned by **GetProcAddress** exists.

> **Note**: **ShareMem** or **SimpleShareMem** must be the first unit in your library's uses clause and your project's uses clause (select **Project > View Source**) if your DLL exports any procedures or functions that pass strings as parameters or function results. This applies to all strings passed to and from your DLL, including those that are nested in records and classes. ShareMem is the interface unit to the _BORLNDMM.DLL_ shared memory manager, which must be deployed along with your DLL. To avoid using _BORLNDMM.DLL_, pass string information using [PChar](http://docwiki.embarcadero.com/Libraries/en/System.PChar) or [ShortString](http://docwiki.embarcadero.com/Libraries/en/System.ShortString) parameters.


## Uses 


* [System.Assigned](http://docwiki.embarcadero.com/Libraries/en/System.Assigned)

## See Also 


* [Sharing Memory](http://docwiki.embarcadero.com/RADStudio/en/Sharing_Memory)
* [Managing Memory Index](http://docwiki.embarcadero.com/RADStudio/en/Managing_Memory_Index)
* [LoadLibrary (MSDN)](http://msdn.microsoft.com/en-us/library/ms684175(VS.85).aspx)
* [FreeLibrary (MSDN)](http://msdn.microsoft.com/en-us/library/ms684175(VS.85).aspx)
* [GetProcAddress (MSDN)](http://msdn.microsoft.com/en-us/library/ms684175(VS.85).aspx)






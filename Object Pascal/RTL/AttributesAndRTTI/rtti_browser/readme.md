RTL.AttributesAndRTTI Sample[]()
# RTL.AttributesAndRTTI Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample demonstrates how to use the RTTI API.
## Location 

You can find the **AttributesAndRTTI** sample project at:
* **Start > Programs > Embarcadero RAD Studio > Samples > Delphi > RTL > AttributesAndRTTI > rtti_browser**
* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/AttributesAndRTTI/rtti_browser](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/RTL/AttributesAndRTTI/rtti_browser)

## Description 

**Rtti_browser** is a VCL application that displays the hierarchy of the public types available in the current RTTI context. Clicking a class, method, property, or parameter in the tree view displays all their RTTI properties in the list view below.
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open `rtti_browser.dproj`.
2.  Press `F9` or choose **Run > Run**.

## Files 

The project has three source files:

|**File**         |**Contains**                                                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------|
|**DemoAttr.pas** |The implementation of **MyDemoAttribute**, a user-defined custom attribute, and of **TDemoObject**, the corresponding annotated class.|
|**Form_Main.pas**|**TMainForm**, the class corresponding to the main form.                                                                              |


## Classes 


* **MyDemoAttribute**, derived from [TCustomAttribute](http://docwiki.embarcadero.com/Libraries/en/System.TCustomAttribute), provides two constructors that can be used to annotate a class or its members.
* **TDemoObject** is a demo class with one field and one procedure. The class, the field, the procedure, and the parameter of the procedure are all annotated using **MyDemoAttribute**.
* **TMainForm** retrieves all the RTTI information from the context and displays it on the form.

## Implementation 


*  A [TRttiContext](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiContext) object is used to get type information for all the public types.
*  The **ListAttributes** method gets all the fields, properties, methods, and parameters and, for each of them, it displays the corresponding attribute values.
* [TRttiType.QualifiedName](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiType.QualifiedName) is used to get the qualified name for a class. For the other RTTI objects (methods, parameters, fields, and properties), their qualified name is obtained by concatenating the qualified name of their [parent](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiObject.Parent) with their own [name](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiNamedObject.Name).
*  The hierarchy of types is displayed using a [TTreeView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TTreeView) component and the properties for each node are displayed using a [TListView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TListView) component.

## Uses 


* [TCustomAttribute](http://docwiki.embarcadero.com/Libraries/en/System.TCustomAttribute)
* [TRttiContext](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiContext)
* [TRttiType.QualifiedName](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiType.QualifiedName)
* [TRttiObject.Parent](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiObject.Parent)
* [TRttiNamedObject.Name](http://docwiki.embarcadero.com/Libraries/en/System.Rtti.TRttiNamedObject.Name)
* [TTreeView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TTreeView)
* [TListView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TListView)

## See Also 


* [Working with RTTI](http://docwiki.embarcadero.com/RADStudio/en/Working_with_RTTI)
* [General Type Information](http://docwiki.embarcadero.com/RADStudio/en/General_Type_Information)






VCL.MDIApp Sample[]()
# VCL.MDIApp Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample shows the use of the customized tab preview in the Windows task bar for a Delphi/C++ application. 
## Location 

You can find the **MDIApp** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\VCL\Taskbar\MDI**
* **CPP\VCL\Taskbar\MDIApp**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/MDI](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/MDI)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/MDIApp](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/MDIApp)

## Description 

The application creates a main form that has the functionality to open images in a new child form. The application shows a thumbnail preview of each new image in the Windows task bar. You can close a tab by clicking the close button in the thumbnail preview in Windows task bar. **Note:** Only .bmp images can be opened.
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open:

*  Delphi: **MDIApp.dproj**
*  C++: **CPPMDIApp.cbproj**

2.  Press F9 or choose **Run > Run**.

## Files 

This project has two source files:

|**File**       |**Contains**                                                            |
|---------------|------------------------------------------------------------------------|
|**MainMDIForm**|The main form where new images are open and the child forms are created.|
|**MDIChild**   |The child form where customized task bar preview functionality is done. |


## Classes 


* **TForm2**, the form class, implements the main visual component of the application. It contains a [TMainMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TMainMenu) component and a [TActionList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList.TActionList) to open a image file in a child form.
* **TFrMDIChild**, the child form class, contains a TImage and the customized [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component. It implements the functionality to close the child form.

## Implementation 


*  For the main form, in the **Object Inspector** set the FormStyle property to `fsMDIForm`. For the child form, in the **Object Inspector** set the FormStyle property to `fsMDIChild`.
*  The menu item in the [TMainMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TMainMenu) of the application is linked to the open file action in the [TActionList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList.TActionList), and a new child form is created for each opened image file.
*  The [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component registers each new form as a new tab.
*  For the [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component, in the **Object Inspector** set the CustomizedPreview property of the [TabProperties](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.TabProperties) to `True`. A preview thumbnail of each image is shown in the application Windows task bar.

## Uses 


* [Vcl.Taskbar.TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar)
* [Vcl.Taskbar.TTaskbar.TabProperties](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.TabProperties)
* [Vcl.ActnList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList)
* [Vcl.ImgList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ImgList)

## See Also 


* [VCL Taskbars](http://docwiki.embarcadero.com/RADStudio/en/VCL_Taskbars)
* [Building a VCL Forms MDI Application Without Using a Wizard](http://docwiki.embarcadero.com/RADStudio/en/Building_a_VCL_Forms_MDI_Application_Without_Using_a_Wizard)
* [MDI Applications](http://docwiki.embarcadero.com/RADStudio/en/MDI_Applications)
* [VCL.OneFormApp_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.OneFormApp_Sample)
* [VCL.VideoPlayer Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.VideoPlayer_Sample)






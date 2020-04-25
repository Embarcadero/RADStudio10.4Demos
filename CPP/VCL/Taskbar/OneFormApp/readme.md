VCL.OneFormApp Sample[]()
# VCL.OneFormApp Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample demonstrates the use of the task bar component in a Delphi/C++ application. The application shows how to use the progress bar, change the overlay icon, modify thumb buttons actions and appearance, and clip the thumbnail preview region in the Windows task bar. 
## Location 

You can find the **One Form Application** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\VCL\Taskbar\OneForm**
* **CPP\VCL\Taskbar\OneFormApp**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/OneForm](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/OneForm)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/OneFormApp](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/OneFormApp)

## Description 

The form has functionality to change the progress bar status (state and progress values) and the overlay icon of the application task bar, to modify a message that is shown when a thumb button is clicked and to resize the preview thumbnail in the Windows task bar.
*  On the Progress example panel, switch between the different states for the progress status in the combo box and change the value of the progress bar by dragging the slider to the desired position.
*  On the OverlayIcon panel, change the overlay icon of the application task bar by selecting it.
*  On the Buttons panel, select the visibility of a thumb button and change the message that is shown when clicking the thumb button.
*  On the Clip Region panel, clip the form region that is shown in the thumbnail preview by modifying the values.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open:

*  Delphi: **OneFormApp.dproj**
*  C++: **CPPOneFormApp.cbproj**

2.  Press F9 or choose **Run > Run**.

## Files 

This project has one source file, **SimpleFormApp**, which contains the class for the main form.
## Classes 


* **TForm1**, the form class, implements the main visual component of the application. It contains four panels, buttons and functionalities to customize the application [task bar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar).

## Implementation 


*  The [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component is used to control the application Windows task bar.
*  Three [TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton) are added to the task bar. Set their visibility and use a custom action for them. Use the [ApplyButtonsChanges](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TCustomTaskbar.ApplyButtonsChanges) method to update them at once.
*  The [TActionList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList) component defines custom actions for the thumb buttons.
*  The [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) component is used to select the state of the progress bar and the [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TTrackBar) component is used to set the progress value. These changes are displayed in the Windows task bar.
*  The [TImageList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ImgList) component includes all the icons that can be used in the application task bar (for the thumb button icons and the overlay icon).
*  Use the [ApplyClipAreaChanges](http://docwiki.embarcadero.com/Libraries/en/System.Win.TaskbarCore.TTaskbarBase.ApplyClipAreaChanges) method to clip the thumbnail preview region of the application in the Windows task bar.

## Uses 


* [Vcl.Taskbar.TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar)
* [Vcl.Taskbar.TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton)
* [Vcl.Taskbar.TTaskbar.ProgressValue](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.ProgressValue)
* [Vcl.Taskbar.TTaskbar.ProgressState](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.ProgressState)
* [Vcl.Taskbar.TCustomTaskbar.OverlayIcon](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TCustomTaskbar.OverlayIcon)
* [Vcl.Taskbar.TTaskbar.TaskBarButtons](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.TaskBarButtons)
* [Vcl.Taskbar.TTaskbar.PreviewClipRegion](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.PreviewClipRegion)
* [Vcl.ActnList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList)
* [Vcl.ImgList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ImgList)

## See Also 


* [VCL Taskbars](http://docwiki.embarcadero.com/RADStudio/en/VCL_Taskbars)
* [VCL.MDIApp_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.MDIApp_Sample)
* [VCL.VideoPlayer Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.VideoPlayer_Sample)






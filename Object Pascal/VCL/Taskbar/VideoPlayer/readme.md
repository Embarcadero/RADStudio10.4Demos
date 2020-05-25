VCL.VideoPlayer Sample[]()
# VCL.VideoPlayer Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

This sample shows the use of the thumb buttons in the Windows task bar to play or pause a video in a Delphi/C++ application. 
## Location 

You can find the **VideoPlayer** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* **Object Pascal\VCL\Taskbar\VideoPlayer**
* **CPP\VCL\Taskbar\VideoPlayer**

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/VideoPlayer/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/Taskbar/VideoPlayer/)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/VideoPlayer/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/Taskbar/VideoPlayer/)

## Description 

The application creates a main form that has the functionality to open a video. Use the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/Vcl.MPlayer.TMediaPlayer) controls or the [TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton) in the Windows task bar to play or pause the video.
## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio Rio | Samples** and open:

*  Delphi: **VideoPlayer.dproj**
*  C++: **CPPVideoPlayer.cbproj**

2.  Press F9 or choose **Run > Run**.

## Files 

This project has one source file (**Unit3** for Delphi and **Unit4** for C++), which contains the class for the main form.
## Classes 


* **TForm3**, the form class, implements the main visual component of the application. It contains a [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/Vcl.MPlayer.TMediaPlayer) component and a [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component to reproduce videos.

## Implementation 


*  The main form contains a [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/Vcl.MPlayer.TMediaPlayer) component to reproduce a video and a [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component to control it.
*  The [TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar) component has two [TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton), and you can click on them to play and pause the video.
*  The [TActionList](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList) component defines the actions for the [TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton).

## Uses 


* [Vcl.Taskbar.TTaskbar](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar)
* [Vcl.Taskbar.TThumbBarButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TThumbBarButton)
* [Vcl.Taskbar.TTaskbar.TaskBarButtons](http://docwiki.embarcadero.com/Libraries/en/Vcl.Taskbar.TTaskbar.TaskBarButtons)
* [Vcl.MPlayer.TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/Vcl.MPlayer.TMediaPlayer)

## See Also 


* [VCL Taskbars](http://docwiki.embarcadero.com/RADStudio/en/VCL_Taskbars)
* [Adding Audio or Video Clips to an Application](http://docwiki.embarcadero.com/RADStudio/en/Adding_Audio_or_Video_Clips_to_an_Application)
* [rad_en:Example of Adding Audio or Video Clips (VCL Only)](http://docwiki.embarcadero.com/RADStudio/en/Example_of_Adding_Audio_or_Video_Clips_(VCL_Only))
* [VCL.OneFormApp_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.OneFormApp_Sample)
* [VCL.MDIApp_Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.MDIApp_Sample)






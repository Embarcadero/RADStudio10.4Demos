FMX.StreamingMedia Sample[]()
# FMX.StreamingMedia Sample 


This sample demonstrates how to stream audio and video files. 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **StreamingMedia** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either of the following folders:

* `Object Pascal\Multi-Device Samples\Media\StreamingMedia`
* `CPP\Multi-Device Samples\Media\StreamingMedia`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Media/StreamingMedia](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Media/StreamingMedia)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Media/StreamingMedia](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Media/StreamingMedia)

## Description 

The **StreamingMedia** sample application shows how to stream audio and video content. The sample uses the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) component for media file playback. 
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **StreamingMedia.dproj**.
*  C++: **StreamingMedia_Cpp.cbproj**.

2.  Select the target platform.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample.

* **Video** tab:

*  Select one item from the list.
*  Click the play button to reproduce the video file.
*  Click the stop button to stop the reproduction of the video file.

* **Music** tab:

*  Introduce a web site.
*  Click **Scan** to start searching for audio content.
*  Select one item from the list.
*  Click the play button to reproduce the audio file.
**Note:** If the media file is not supported by the OS, a error message could appear.

## Files 



|**File in Delphi**      |**File in C++**              |**Contains**                                                           |
|------------------------|-----------------------------|-----------------------------------------------------------------------|
|**StreamingMedia.dproj**|**StreamingMedia_Cpp.cbproj**|The project itself.                                                    |
|**Unit1.fmx**           |**Unit1.fmx**                |The main form where the components are located.                        |
|**Unit1.pas**           |**Unit1.h**, **Unit1.cpp**   |Used to define and implement the sample.                               |
|**StreamingMedia.dpr**  |**StreamingMedia_Cpp.cpp**   |Source of the project file that manages the running of the application.|


## Implementation 


*  The application defines the following event handlers:

* `Button1Click`: The [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event [stops or pauses](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop) the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer). It checks the active [TabIndex](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl.TabIndex) of the [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) and [plays](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play) the selected item of the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox).
* `Button2Click`: The [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event calls `IdHTTP.TIdHTTP.Get` for an HTTP get request that permints obtaining the data from the URL defined at the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) control. It calls `ScanText` with the obtained data as an argument to get the audio items and list them in the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox).
* `Button3Click`: The [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event [stops or pauses](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop) the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer).
* `FormCreate`: The [OnCreate](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnCreate) event of the [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) populates the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) of the **Video** tab with video files from the URL `http://techslides.com/demos/sample/<FileName.extension>`.

*  The application defines the following methods:

* `ScanText` gets as an argument the data obtained from `IdHTTP.TIdHTTP.Get`. The method calls `AddItem` to populate the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) with the audio files from the URL.
* `GetTagValue` provides the URL to the videos from the raw data obtained in `IdHTTP.TIdHTTP.Get`. The URL is the item that uses `ScanText` to populate the list of available audio files.
* `IsItemCorrect` is used in `ScanText` to check ig the item is an **mp3** audio file.
* `AddItem` adds the items to the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox).

*  The application defines the following significant controls:

* `Button2`, the Scan button, executes `Button2Click` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick).
* `Button1`, the Start button, executes `Button1Click` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick).
* `Button3`, the Stop/Pause button, executes `Button3Click` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick).
* `Edit1` sets the URL to get the mp3 files from the Internet.

## Uses 


* [TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play)
* [TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop)
* [TIdHTTP](http://docwiki.embarcadero.com/Libraries/en/IdHTTP.TIdHTTP)

## See Also 


* [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/Audio-Video_in_FireMonkey)
* [Tutorial: FireMonkey Audio-Video](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_FireMonkey_Audio-Video)
* [Playing Audio Files](http://docwiki.embarcadero.com/RADStudio/en/Playing_Audio_Files)
* [Audio Recording](http://docwiki.embarcadero.com/RADStudio/en/Audio_Recording)

### Samples 


* [RTL Media Player](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample
* [FireMonkey Media Player HD](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) sample
* [FireMonkey Music Player](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MusicPlayer_Sample) sample
* [FireMonkey Audio Rec-Play](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AudioRecPlay_Sample) sample






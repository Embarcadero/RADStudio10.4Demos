FMX.Mobile.VideoPlayback Sample[]()
# FMX.Mobile.VideoPlayback Sample 


This sample demonstrates the use of the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) and the [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) components.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 The Video](#The_Video)
* [5.2 The Rectangle Used as Parent](#The_Rectangle_Used_as_Parent)
* [5.3 Selecting the Video](#Selecting_the_Video)
* [5.4 The Timer](#The_Timer)
* [5.5 On From Creation](#On_From_Creation)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **VideoPlayback** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Mobile Snippets\VideoPlayback`

* **Subversion repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/VideoPlayback](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/VideoPlayback)

## Description 

The **VideoPlayback** sample uses the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) and the [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) components to demonstrate how to playback an existing video clip on your iOS or Android device, including:
*  Selecting different videos.
*  Playing and stopping the video.
*  Moving the video forward, backward, to the beginning, and to the end.
*  Using a [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) as parent for the [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) to hide and show the video as well as to move up and down the position of the video.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **VideoPlayerTest.dproj**.

2.  Select your target platform (iOS or Android supported).
3.  Press `F9` or choose **Run > Run**.
4.  Select one of the files to play from the file list.
5.  Use the **Play**, **Stop**, **To The Start**, **10 Sec Backward**, **10 Sec Forward**, and **To The End** buttons to interact with the video.
6.  Use the **Moving Parent Up**, **Moving Parent Down**, and **Change Parents Visible** buttons to interact with the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) that contains the [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl).

## Files 



|**File in Delphi**                     |**Contains**                                   |
|---------------------------------------|-----------------------------------------------|
|**VideoPlayerTest.dproj**              |The project itself.                            |
|**uMain.fmx**                          |The main form where the components are located.|
|**uMain.pas**                          |Used to define and implement the sample.       |
|**MP4\Kayaking.mp4**, **MP4\Ocean.mp4**|The video files to play in the sample.         |


## Implementation 


### The Video 


*  The sample uses the [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) component to access the media files.
* [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) is used to display the video media file.
*  The [TMediaPlayerControl.MediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl.MediaPlayer) property is used to link the [media player control](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) with the [media player](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) to access the video files.
* [TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play) is used to play the video.
* [TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop) is used to stop the video.
* [TMediaPlayer.CurrentTime](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.CurrentTime) is used to know, as well as to specify the current position of the video.
* [TMediaPlayer.Duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Duration) is used to know the total duration time of the video.

### The Rectangle Used as Parent 


* [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) is the rectangle that serves as parent for the [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) component.
* [TRectangle.Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle.Position) with [TPosition](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition) type is used to get and update the [X](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition.X) and [Y](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition.Y) positions of the rectangle.
*  The [TRectangle.Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle.Visible) property is used to hide and show the rectangle when the **Change Parent Visible** button is clicked.
*  Since the rectangle is the parent of the media player control, changing the position as well as hiding and showing the rectangle also moves, hides or shows the video.

### Selecting the Video 


*  When a [list box item is clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox.OnItemClick), the sample sets the [TMediaPlayer.FileName](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.FileName) property to the file that corresponds with the item that was clicked; [combining](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TPath.Combine) the path to the file, according to the platform, and the [list box item text](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem.Text).

### The Timer 


*  The [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) is used to repeat the following actions after a given [interval](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.Interval), that specifies the time interval between the [TTimer.OnTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.OnTimer) events:

*  Setting the [maximum value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Max) of the **tbProcess** track bar according to the [Duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Duration) of the video file.
*  Updating the [Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Value) of the **tbProcess** track bar to match the [CurrentTime](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.CurrentTime) of the video file.

### On From Creation 

When the [form is created](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.OnCreate) the sample:
*  Gets the appropriate paths to access the video files: The `Platform` property of [TOSVersion](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.TOSVersion) is used to know the platform the sample is running on. Depending on the platform, a different path to the video is used.
*  Fills the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) with the available video files.
*  Sets the volume: The [Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Value) of the **tbVolume**[track bar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) is adjusted to the [TMediaPlayer.Volume](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Volume). Later, when the **tbVolume** track bar [changes](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.OnChange), the [Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Value) of the track bar is used to set the [TMediaPlayer.Volume](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Volume).

## Uses 


* [FMX.Media.TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl)
* [FMX.Media.TMediaPlayerControl.MediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl.MediaPlayer)

* [FMX.Media.TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)
* [FMX.Media.TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play)
* [FMX.Media.TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop)
* [FMX.Media.TMediaPlayer.CurrentTime](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.CurrentTime)
* [FMX.Media.TMediaPlayer.Duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Duration)
* [FMX.Media.TMediaPlayer.FileName](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.FileName)
* [FMX.Media.TMediaPlayer.Volume](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Volume)

* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [FMX.Objects.TRectangle.Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle.Visible)
* [FMX.Objects.TRectangle.Position](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle.Position)

* [FMX.Types.TPosition](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition)
* [FMX.Types.TPosition.X](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition.X)
* [FMX.Types.TPosition.Y](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TPosition.Y)

* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [FMX.Types.TTimer.Interval](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.Interval)
* [FMX.Types.TTimer.OnTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.OnTimer)

* [FMX.StdCtrls.TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)
* [FMX.StdCtrls.TTrackBar.Max](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Max)
* [FMX.StdCtrls.TTrackBar.Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Value)
* [FMX.StdCtrls.TTrackBar.OnChange](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.OnChange)

* [FMX.Forms.TForm.OnCreate](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.OnCreate)
* [System.SysUtils.TOSVersion](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.TOSVersion)
* [System.SysUtils.TOSVersion.TPlatform](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.TOSVersion.TPlatform)
* [System.IOUtils.TPath.Combine](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TPath.Combine)
* [System.IOUtils.TPath.GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TPath.GetDocumentsPath)

## See Also 


* [MediaPlayer (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/MediaPlayer_%28Delphi%29)
* [MediaPlayer (C++)](http://docwiki.embarcadero.com/CodeExamples/en/MediaPlayer_%28C%2B%2B%29)
* [RTL.MediaPlayer Sample](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample)
* [TMediaPlayerEject (Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/TMediaPlayerEject_%28Delphi%29)
* [TMediaPlayerEject (C++)](http://docwiki.embarcadero.com/CodeExamples/en/TMediaPlayerEject_%28C%2B%2B%29)
* [VCL.VideoPlayer Sample](http://docwiki.embarcadero.com/CodeExamples/en/VCL.VideoPlayer_Sample)

* [Building a Basic Media Player](http://docwiki.embarcadero.com/RADStudio/en/Building_a_Basic_Media_Player)
* [Adding Audio or Video Clips to an Application](http://docwiki.embarcadero.com/RADStudio/en/Adding_Audio_or_Video_Clips_to_an_Application)






FMX.MediaPlayerHD Sample[]()
# FMX.MediaPlayerHD Sample 


This sample illustrates how to load and play a media file, using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **MediaPlayerHD** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\App Tethering\MediaPlayer\MediaPlayerHD`
* `CPP\Multi-Device Samples\Device Sensors and Services\App Tethering\MediaPlayer\MediaPlayerHD`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/MediaPlayer/MediaPlayerHD](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/MediaPlayer/MediaPlayerHD)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/MediaPlayer/MediaPlayerHD](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/MediaPlayer/MediaPlayerHD)

## Description 

This application uses [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer), [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl), and [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) in order to implement the HD media player.
## How to Use the Sample 

Load the wanted media file using the load button from the upper-left corner of the form. The file will start playing immediately. If the loaded file is a video file, the image is displayed on the center of the form. 
1.  Navigate to one of the locations given above and open:

*  Delphi: **MediaPlayerHD.dproj**.
*  C++: **CppMediaPlayerHD.cbproj**.

2.  Press **F9** or choose **Run > Run**.

## Classes 

**MediaPlayerForm.pas** represents the main window unit of the sample. It contains the **TForm240** class, that defines the main form and contains:
*  A [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) object.
*  A [TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl) object.
*  A [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) object.
*  Three [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) objects.
*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox) object.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
*  A [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) object.
*  Two [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) objects.
*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object.

## Implementation 

The sample: 
*  Loads the media file, displays information about the loaded file in the upper-right corner, and enables the controls to manipulate the loaded file (pause, forward/rewind, volume, visibility).
*  Implements the actions to be attached to each control that allows to manipulate the loaded file.

## Uses 


* [FMX.Media.TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)
* [FMX.Media.TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl)
* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)

## See Also 


* [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/Audio-Video_in_FireMonkey)

* [MusicPlayer](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MusicPlayer_Sample) sample
* [MediaPlayer](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample






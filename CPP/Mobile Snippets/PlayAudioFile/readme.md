FMX.PlayAudioFile Sample[]()
# FMX.PlayAudioFile Sample 


This sample demonstrates how to include an audio file for playback in your iOS or Android application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **PlayAudioFile** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\PlayAudioFile`
* `CPP\Mobile Snippets\PlayAudioFile`

* **GitHub Repository:**

* **Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/PlayAudioFile](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/PlayAudioFile)
* **C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/PlayAudioFile](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/PlayAudioFile)

## Description 

The **PlayAudioFile** sample demonstrates how to include an audio file for playback on iOS and Android devices. The sample uses the nonvisual [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer) component for media file playback. 
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **AccessCameraApp.dproj**.
*  C++: **AccessCamera.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample.

*  Click the play button to reproduce the audio file.
*  Click the stop button to stop the reproduction of the audio file.

## Files 



|**File in Delphi**     |**File in C++**                      |**Contains**                                   |
|-----------------------|-------------------------------------|-----------------------------------------------|
|**PlayAudioFile.dproj**|**PlayAudioFile.cbproj**             |The project itself.                            |
|**PlayAudioFile.fmx**  |**PlayAudioFile.fmx**                |The main form where the components are located.|
|**PlayAudioFile.pas**  |**PlayAudioPCH.h**, **PlayAudio.cpp**|Used to define and implement the sample.       |
|**soundsample.mp3**    |**soundsample.mp3**                  |The audio file.                                |


## Classes 

**TAudioPlayBackForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TToolBar) object with:

*  Two [TSpeedButton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TSpeedButton) objects.
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/Denali/en/System.IOUtils.TPath.GetDocumentsPath) to obtain the path to the directory where user documents are stored.
*  The sample uses [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer) component for easy access to media files.
*  The sample uses [TSpeedButton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TSpeedButton) to implement two push-buttons for playing and stoping the reproduction of the audio file.
When you run the aplication, the sample shows a [ToolBar](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TToolBar) with two [TSpeedButton](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.StdCtrls.TSpeedButton) objects with the stylelookup set to **stoptoolbuttonbordered** and **playtoolbuttonbordered**. When you click the play button, the sample uses [GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/Denali/en/System.IOUtils.TPath.GetDocumentsPath) to obtain the media file, and [TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer.Play) to reproduce it. When you click on the stop button, the sample uses [TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer.Stop) to stop the reproduction of the media file.
## Uses 


* [GetDocumentsPath](http://docwiki.embarcadero.com/Libraries/Denali/en/System.IOUtils.TPath.GetDocumentsPath)
* [TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer.Play)
* [TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Media.TMediaPlayer.Stop)

## See Also 


* [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/Denali/en/Audio-Video_in_FireMonkey)
* [Tutorial: FireMonkey Audio-Video](http://docwiki.embarcadero.com/RADStudio/Denali/en/Tutorial:_FireMonkey_Audio-Video)
* [Playing Audio Files](http://docwiki.embarcadero.com/RADStudio/Denali/en/Playing_Audio_Files)
* [Audio Recording](http://docwiki.embarcadero.com/RADStudio/Denali/en/Audio_Recording)

### Samples 


* [RTL Media Player](http://docwiki.embarcadero.com/CodeExamples/Denali/en/RTL.MediaPlayer_Sample) sample
* [FireMonkey Media Player HD](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.MediaPlayerHD_Sample) sample
* [FireMonkey Music Player](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.MusicPlayer_Sample) sample
* [FireMonkey Audio Rec-Play](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.AudioRecPlay_Sample) sample






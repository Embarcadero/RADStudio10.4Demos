FMX.AudioRecPlay Sample[]()
# FMX.AudioRecPlay Sample 


This sample demonstrates how to record some sound via the microphone of your device and then playback it using the device speakers or headphones.
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

You can find the **AudioRecPlay** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\AudioRecPlay`
* `CPP\Mobile Snippets\AudioRecPlay`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AudioRecPlay](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AudioRecPlay)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/AudioRecPlay](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/AudioRecPlay)

## Description 

The **AudioRecPlay** sample shows you how to record some sound via the microphone of your iOS or Android device. Then you can reproduce the recorded sound. The sample uses the [TAudioCaptureDevice](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TAudioCaptureDevice) class and its methods [StartCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StartCapture) and [StopCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StopCapture) to record the sound. Moreover, it uses the nonvisual [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) component to playback the recorded sound. 
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **AudioRecPlay.dproj**.
*  C++: **AudioRecPlay.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click on the **Start Recording** button to start recording some sound.
*  Click on the **Stop Recording** button to stop the recording.
*  Click on the **Play** button to reproduce the recorded sound.
*  Click on the **Stop** button to stop the reproduction of the recorded sound.

## Files 



|**File in Delphi**    |**File in C++**                            |**Contains**                                   |
|----------------------|-------------------------------------------|-----------------------------------------------|
|**AudioRecPlay.dproj**|**AudioRecPlay.cbproj**                    |The project itself.                            |
|**AudioRecPlay.fmx**  |**AudioRecPlay.fmx**                       |The main form where the components are located.|
|**uMain.pas**         |**AudioRecPlayPCH.h**, **AudioRecPlay.cpp**|Used to define and implement the sample.       |
|**Information.txt**   |**Information.txt**                        |Further information about the sample.          |


## Classes 

**TAudioRecPlayForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) object with four actions: **actPlay**, **actStop**, **actStartRecording** and **actStopRecording**.
*  A [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) object.
*  Two [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects.
*  Two [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) objects:

* [ToolBar1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) containing two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects called **btnStartPlay** and **btnStopPlay** and a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
* [ToolBar2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) containing two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects called **btnStartRec** and **btnStopRec**.

## Implementation 


*  The sample uses [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) to maintain a list of actions that can be used by other components (tool buttons in this sample).
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to implement four buttons to enable and disable the recording or the playback of audio files.
*  The sample uses [TAudioCaptureDevice](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TAudioCaptureDevice) to define an audio capture device. [TAudioCaptureDevice](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TAudioCaptureDevice) extends the [TCaptureDevice](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice) implementation to add specific behavior for audio capturing devices (like microphones).

*  The sample uses [StartCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StartCapture) to start capturing data.
*  The sample uses [StopCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StopCapture) to stop capturing data.

*  The sample uses [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer) component for easy access to media files.

*  The sample uses [Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play) to start playing a media file.
*  The sample uses [Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop) to stop or pause a running media file.
When you run the aplication, the sample shows a picture of a microphone and two [ToolBars](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar), one aligned at the bottom and the other aligned at the top of your FireMonkey form. Each [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) contains two [TButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton). The bottom aligned [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) contains the **Start Recording** and **Stop Recording** buttons, while the top aligned [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) contains the **Play** and **Stop** buttons. When you click on the **Start Recording** button, the [StartCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StartCapture) method starts capturing data until you click on the **Stop Recording** button. Then if you press the **Play** button, the sample starts to playback the recorded sound. Finally you can press the **Stop** button to stop the playback of the recording sound.
## Uses 


* [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TAudioCaptureDevice](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TAudioCaptureDevice)

* [StartCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StartCapture)
* [StopCapture](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCaptureDevice.StopCapture)

* [TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)

* [TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play)
* [TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop)

## See Also 


* [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/Audio-Video_in_FireMonkey)
* [Tutorial: FireMonkey Audio-Video](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_FireMonkey_Audio-Video)
* [Audio Recording](http://docwiki.embarcadero.com/RADStudio/en/Audio_Recording)
* [Playing Audio Files](http://docwiki.embarcadero.com/RADStudio/en/Playing_Audio_Files)

### Samples 


* [RTL Media Player](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample
* [FireMonkey Media Player HD](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) sample
* [FireMonkey Music Player](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MusicPlayer_Sample) sample
* [FireMonkey Play Audio File](http://docwiki.embarcadero.com/CodeExamples/en/FMX.PlayAudioFile_Sample) sample






FMX.FireFlow Sample[]()
# FMX.FireFlow Sample 


This sample illustrates how to create a photo gallery with FireMonkey.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Classes](#Classes)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **FireFlow** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\FireFlow`
* `CPP\Multi-Device Samples\User Interface\FireFlow`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/FireFlow](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/FireFlow)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/FireFlow](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/FireFlow)

## Description 

This application uses **TViewport3D** to create a 3D photo gallery. The user can open several photos from the computer and can navigate through them by using the **TTrackBar** or by clicking the next picture displayed.
1.  Navigate to one of the locations given above and open:

*  Delphi: **FireFlow.dproj**.
*  C++: **FireFlow.cbproj**.

2.  Press F9 or choose **Run > Run**. Press the **Select** button, select a picture from your computer, and press the **Open** button. A gallery with all the photos in the same folder with the picture you selected is displayed.

## Classes 

**FireFlow - Powered by FireMonkey** represents the main window of the sample. It contains the following components:
*  A [TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D) with a [TLayout3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayout3D) and a [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
*  A [TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) with a [TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect), which contains a [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar), a [TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator), and a [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)

## Implementation 


*  When you run the application, the main window of the sample is displayed.
*  To display the **TOpenDialog** window, press the **Select** button.
*  To display a gallery with all the photos in the same folder with the photo you selected, select an image and press the **Open** button.
*  The **TAniIndicator** object is visible until the photos are uploaded into the gallery.
*  Once the photos are uploaded, the **TTrackBar** object is enabled, allowing you to navigate through the gallery.

## Uses 


* [FMX.Types3D.TViewport3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Viewport3D.TViewport3D)
* [FMX.Layers3D.TLayout3D](http://docwiki.embarcadero.com/Libraries/en/FMX.Layers3D.TLayout3D)
* [FMX.Dialogs.TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog)
* [FMX.Types.TStyleBook](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyleBook)
* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)
* [FMX.Objects.TRoundRect](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRoundRect)
* [FMX.Controls.TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar)
* [FMX.Controls.TAniIndicator](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TAniIndicator)
* [FMX.Controls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey 3D](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_3D)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)






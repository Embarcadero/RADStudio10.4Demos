VCL.ActivityIndicator Sample[]()
# VCL.ActivityIndicator Sample 


This is a sample that shows the use of the [TActivityIndicator](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator) control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TActivityIndicatorForm](#TActivityIndicatorForm)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **ActivityIndicator** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\VCL\ActivityIndicator`
* `CPP\VCL\ActivityIndicator`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/ActivityIndicator](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/ActivityIndicator)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ActivityIndicator](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/ActivityIndicator)

## Description 

This application demonstrates the [TActivityIndicator](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator) control and shows how to modify its various properties.The application uses the following controls:

* `AI`: The activity indicator.
* `grpIndicatorSize`: Sets the [size](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorSize) of the activity indicator.
* `grpIndicatorColor`: Sets the [color](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorColor) of the activity indicator.
* `grpIndicatorType`: Sets the [type](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorType) of the activity indicator.
* `trkFrameDelay`: Sets the [frame delay](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.FrameDelay) of the activity indicator.
* `chkAnimate`: Toggles the [Animate](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.Animate) property of the activity indicator.
* `cbxFormColor`: Sets the [Color](http://docwiki.embarcadero.com/Libraries/en/Vcl.Forms.TForm.Color) of the form if the current style is `Windows`.
* `cbxVclStyles`: A combo box that allows you to change the style of the application. You can choose between any style that is active in the [Application Appearance - Custom Styles](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance) options for this project.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **ActivityIndicator.dproj**.
*  C++: **ActivityIndicator.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Change the different options on the form and test the functionlity of the activity indicator. Modify color, size, animation speed and the type of the activity indicator.

## Implementation 


### TActivityIndicatorForm 

On initialization, the `FormCreate` adds all the active styles to the `cbxVclStyles` combo box.The application defines the following event handlers: 

* `grpIndicatorTypeClick`: Changes the [type](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorType) of the activity indicator.
* `grpIndicatorSizeClick`: Changes the [size](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorSize) of the activity indicator.
* `grpIndicatorColorClick`: Changes the [color](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorColor) of the activity indicator.
* `cbxFormColorChange`: Changes the [size](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.IndicatorSize) of the activity indicator.
* `trkFrameDelayChange`: Changes the [frame delay](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator.FrameDelay) of the activity indicator.
* `cbxVclStylesChange`: Sets the style for the application.
* `chkAnimateClick`: Enables or disables the animation of the activity indicator.

## Uses 


* [Vcl.WinXCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls)
* [Vcl.Themes](http://docwiki.embarcadero.com/Libraries/en/Vcl.Themes)
* [Vcl.ExtCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls)
* [Vcl.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls)
* [Vcl.ComCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls)
* [Vcl.Dialogs](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs)

## See Also 


* [Vcl.WinXCtrls.TActivityIndicator](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TActivityIndicator)
* [VCL Styles Overview](http://docwiki.embarcadero.com/RADStudio/en/VCL_Styles_Overview)

* [Including Bi-directional Functionality in Applications](http://docwiki.embarcadero.com/RADStudio/en/Including_Bi-directional_Functionality_in_Applications)
* [Vcl.Controls.TControl.BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode)

* [Application Appearance](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance)






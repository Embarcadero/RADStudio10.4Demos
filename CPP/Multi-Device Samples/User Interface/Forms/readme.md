FMX.Forms Sample[]()
# FMX.Forms Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This is a project that shows how to display different [forms](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm) depending on the orientation, portrait or landscape, of the device running your application.
## Location 

You can find the **Forms** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\Forms`
* `CPP\Multi-Device Samples\User Interface\Forms`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Forms](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Forms)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/User%20Interface/Forms](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/User%20Interface/Forms)

## Description 

When you run the application, it shows a form with a background image and a label which states the current orientation of the device, either "Portrait" or "Landscape". When you change the orientation of your device, the form changes to display a different background image and updates the label to mach the new device orientation.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **Forms.dproj**
*  C++: **Forms.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Implementation 

This application is composed of two [forms](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm), each one intended to be displayed when the target mobile device is in a specific orientation.To show the right form for each orientation, this application handles the [OnResize](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm.OnResize) event of each form. The application uses these event handlers to show the right form depending on the [Height](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm.Height) and [Width](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm.Width) properties of the form: If Height is lower than Width, then it shows the landscape form, otherwise it shows the portrait form.

## Uses 


* [FMX.Forms.TForm.OnResize](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Forms.TForm.OnResize)

## See Also 


* [FMX.Controls Sample](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FMX.Controls_Sample)






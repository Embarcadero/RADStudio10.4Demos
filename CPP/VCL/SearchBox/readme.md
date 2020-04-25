VCL.SearchBox Sample[]()
# VCL.SearchBox Sample 


This is a sample that shows the use of the [TSearchBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox) control.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TSearchBoxForm](#TSearchBoxForm)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **SearchBox** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\VCL\SearchBox`
* `CPP\VCL\SearchBox`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/SearchBox](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/VCL/SearchBox)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/SearchBox](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/VCL/SearchBox)

## Description 

This application demonstrates the [TSearchBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox) control and how to use the [OnInvokeSearch](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox.OnInvokeSearch) event of [TSearchBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox).The application uses the following controls:

* `SB`: The search box.
* `lstLog`: The listbox for the feedabck messages.
* `grpBiDiMode`: The radio buttons that allow you to change the [BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode).
* `grpSearchIndicator`: The radio buttons that allow you to change the [search indicatior](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox.SearchIndicator) icon.
* `chkEnabled`: Enables or disables the search box.
* `cbxVclStyles`: A combo box that allows you to change the style of the application. You can choose between any style that is active in the [Application Appearance - Custom Styles](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance) options for this project.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **SearchBox.dproj**.
*  C++: **SearchBox.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Change the different options on the form and test the search box functionality. Type into the search box and press `Enter` or click the [search indicator](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox.SearchIndicator) button.

## Implementation 


### TSearchBoxForm 

On initialization, the `FormCreate` adds all the active styles to the `cbxVclStyles` combo box.
*  The application defines the following event handlers:

* `grpSearchIndicatorClick`: Changes the [SearchIndicator](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox.SearchIndicator) type.
* `cbxVclStylesChange`: Sets the style for the application.
* `chkEnabledClick`: Enables or disables the search box.
* `grpBiDiModeClick`: Changes the [BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode).
* `SBInvokeSearch`: Responds to the [OnInvokeSearch](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox.OnInvokeSearch) event of [TSearchBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox). Calls the `Log` method and passes the input from the search box.

*  The application also defines the following methods:

* `Log`: Adds the received text to the listbox.

## Uses 


* [Vcl.WinXCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls)
* [Vcl.Themes](http://docwiki.embarcadero.com/Libraries/en/Vcl.Themes)
* [Vcl.ExtCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls)
* [Vcl.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls)
* [Vcl.Dialogs](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs)

## See Also 


* [Vcl.WinXCtrls.TSearchBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.WinXCtrls.TSearchBox)
* [VCL Styles Overview](http://docwiki.embarcadero.com/RADStudio/en/VCL_Styles_Overview)

* [Including Bi-directional Functionality in Applications](http://docwiki.embarcadero.com/RADStudio/en/Including_Bi-directional_Functionality_in_Applications)
* [Vcl.Controls.TControl.BiDiMode](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.BiDiMode)

* [Application Appearance](http://docwiki.embarcadero.com/RADStudio/en/Application_Appearance)






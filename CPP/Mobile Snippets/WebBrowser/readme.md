FMX.WebBrowser Sample[]()
# FMX.WebBrowser Sample 


This sample depicts how to use a **TWebBrowser** component using FireMonkey.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **WebBrowser** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Mobile Snippets\WebBrowser`
* `CPP\Mobile Snippets\WebBrowser`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/WebBrowser](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/WebBrowser)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/WebBrowser](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/WebBrowser)

## Description 

This application creates a form that permits loading and displaying web content or local files. The main form contains a [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) component that supports the basic functions of a web browser, such as: navigate to URL, go back and go forward.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **WebBrowser.dproj**.
*  C++: **WebBrowser.cbproj**.

2.  Press **F9** or choose **Run > Run**.

## Files 

The project consists of one source file, **uMain.pas**, that contains the class for the main form that represents the user interface.
## Classes 


* **WebBrowserForm** is the main form that represents the main window, and it contains the following components:

* [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) called **WebBrowser1**.
* [TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar) called **StatusBar1**.

* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnBack**.
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnForward**.

* [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) called **TToolbar1**.

* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnGO**.
* [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit) called **edtURL**.

## Implementation 


*  The [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) component calls the [Navigate](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.Navigate) method in order to load and display the content associated with an URL address or a file name.
*  The [TClearingEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearingEdit) component gets the URL address or file name.
*  The **btnGo** button implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event in order to call the event-handler that sets the [URL](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.URL) property of the **WebBrowser1**. Setting this property allows [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser) to automatically call the [Navigate](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.Navigate) method.
*  The **btnForward** button implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event to call the event-handler that calls the [GoForward](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.GoForward) method to navigate to the next URL address or file name in the browsing history list, if any.
*  The **btnBack** button implements an [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event to call the event-handler that calls the [GoBack](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.GoForward) method to navigate to the previous URL address or file name in the browsing history list, if any.

## Uses 


* [TWebBrowser](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser)
* [Navigate](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.Navigate)
* [URL](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.URL)
* [GoForward](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.GoForward)
* [GoBack](http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TCustomWebBrowser.GoForward)

## See Also 


* [FMX.LocationDemo Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.LocationDemo_Sample)

* [Mobile Tutorial: Using the Web Browser Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Web_Browser_Component_(iOS_and_Android))






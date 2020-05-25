FMX.Controls Sample[]()
# FMX.Controls Sample 


This is a sample that shows component styling in mobile applications using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile Controls** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\Controls`
* `CPP\Multi-Device Samples\User Interface\Controls`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Controls](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Controls)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Controls](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Controls)

## Description 

This application uses tabbed pages ([TTabControls](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)), on which you can see various FireMonkey mobile controls, such as ToolBars, Tool Buttons, ListBoxes, Tabs, Controls, and Editors.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **MobileControls.dproj**
*  C++: **MobileControls.cbproj**

2.  Press **F9** or choose **Run > Run**.
**Note:** The **Back** button will navigate tabs until the leftmost tab is reached, and will exit at the leftmost tab. So when you capture **Back** events, consider how to control when this 'falling off' occurs.
## Classes 

**TForm1** is the main form of the application and contains all the visual controls that are displayed.
## Implementation 

For different stylings of the same control, the [StyleLookup](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyledControl.StyleLookup) property is used: 
*  On the first tab, the [StyleLookup](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyledControl.StyleLookup) property for one [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) is set to **deletetoolbutton**, and therefore the button is rendered red and labeled **Delete**.
*  The [StyleLookup](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TStyledControl.StyleLookup) property of the speed button next to the Delete button is set to **donetoolbutton** and therefore, the button is rendered blue and labeled **Done**.

## Uses 


* [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton)
* [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)
* [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [TCalendarEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.CalendarEdit.TCalendarEdit)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Mobile Tutorial: Using a Button Component with Different Styles (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_Button_Component_with_Different_Styles_(iOS_and_Android))
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)






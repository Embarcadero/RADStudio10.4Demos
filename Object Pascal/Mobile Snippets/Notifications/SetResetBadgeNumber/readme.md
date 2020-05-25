FMX.SetResetBadgeNumber Sample[]()
# FMX.SetResetBadgeNumber Sample 


This sample demonstrates how to set the [application icon badge number](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter.ApplicationIconBadgeNumber) on iOS devices.
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

You can find the **SetResetBadgeNumber** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\Notifications\SetResetBadgeNumber`
* `CPP\Mobile Snippets\Notifications\SetResetBadgeNumber`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Notifications/SetResetBadgeNumber](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/Notifications/SetResetBadgeNumber)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Notifications/SetResetBadgeNumber](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/Notifications/SetResetBadgeNumber)

## Description 

The **SetResetBadgeNumber** sample shows you how to use the Notification API in order to set the [badge number](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotification.Number) on the application icon on iOS devices to a specified value or to reset the [badge number](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotification.Number) to 0.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: `SettingResettingBadgeNumber.dproj`.
*  C++: `SettingResettingBadgeNumber.cbproj`.

2.  Select the iOS platform in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**.
3.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                            | File in C++                                                         | Contains          |
|-----------------------------------------------------------|---------------------------------------------------------------------|-------------------|
|`SettingResettingBadgeNumber.dproj``NativeControlsDemo.dpr`|`SettingResettingBadgeNumber.cbproj``SettingResettingBadgeNumber.cpp`|The project itself.|
|`uMain.pas``uMain.fmx`                                     |`uMain.h``uMain.cpp``uMain.fmx`                                      |The main form.     |


## Classes 

**TSettingBadgeNumberForm** is the main form that represents the main window of the sample. It contains the following components:
*  A [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) object.
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object with a ListBox [Item](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) that contains:

*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects named **btnBadgeNumberDown** and **btnBadgeNumberUp**.
*  A [TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox) object.

*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object that contains:

*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects named **btnResetBadgeNumber** and **btnSetBadgeNumber**.

*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) to allow the user to access the notification service.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to enable or activate a function such as set or reset the badge number.
When you run the aplication, you see the [TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox) object set to `0`. This is the badge number of the application. To increase the badge number, use the buttons **btnBadgeNumberDown** and **btnBadgeNumberUp**. To increase the badge number, click on the **btnBadgeNumberUp** button. To decrease the badge number, click on the **btnBadgeNumberDown** button. Once the badge number is set to the desired one, if you click on the **btnSetBadgeNumber** button, the sample uses the [ApplicationIconBadgeNumber](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter.ApplicationIconBadgeNumber) property of [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) to update the application badge number. Finally, if you click on **btnResetBadgeNumber** button, the application badge number is reset to `0`.
## Uses 


* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter)
* [ApplicationIconBadgeNumber](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter.ApplicationIconBadgeNumber)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TNumberBox](http://docwiki.embarcadero.com/Libraries/en/FMX.NumberBox.TNumberBox)
* [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)

## See Also 


* [Using Notifications](http://docwiki.embarcadero.com/RADStudio/en/Using_Notifications)
* [Mobile Tutorial: Using Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Notifications_(iOS_and_Android))
* [Using the macOS Notification Center](http://docwiki.embarcadero.com/RADStudio/en/Using_the_macOS_Notification_Center)

### Samples 


* [FireMonkey Send Cancel Notification](http://docwiki.embarcadero.com/CodeExamples/en/FMX.SendCancelNotification_Sample) sample
* [FireMonkey Notification Mac](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Notification.Mac_%28Delphi%29) (Delphi)
* [FireMonkey Notification Mac](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Notification.Mac_%28C%2B%2B%29) (C++)
* [OSX Dock Badges](http://docwiki.embarcadero.com/CodeExamples/en/OSX_Dock_Badges_%28Delphi%29) (Delphi)






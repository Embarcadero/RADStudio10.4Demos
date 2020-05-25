FMX.SendCancelNotification Sample[]()
# FMX.SendCancelNotification Sample 


This sample demonstrates how to send and cancel notifications, and the use of the [TNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification) and [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) classes.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Notification Details](#Notification_Details)
* [5.2 Scheduling Notifications](#Scheduling_Notifications)
* [5.3 Firing Notifications](#Firing_Notifications)
* [5.4 Cancelling Notifications](#Cancelling_Notifications)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **SendCancelNotification** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\Notifications\SendCancelNotification`
* `CPP\Mobile Snippets\Notifications\SendCancelNotification`

* **GitHub Repository:**

* **Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/Notifications/SendCancelNotification](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Mobile%20Snippets/Notifications/SendCancelNotification)
* **C++:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/Notifications/SendCancelNotification](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Mobile%20Snippets/Notifications/SendCancelNotification)

## Description 

The **SendCancelNotification** sample demonstrates how to send and cancel notifications, and the use of the [TNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification) and [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) classes.With this sample, you can do the following:

*  Send notifications immediately.
*  Send scheduled notifications.
*  Cancel scheduled notifications.
*  Cancel all notifications.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **SendCancelNotifications.dproj**.
*  C++: **SendCancelNotifications.cbproj**.

2.  Select the target platform, iOS, Android, and OS X supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click **Send Scheduled Notifications** to schedule a notification to be fired in 10 seconds.
*  Click **Send Notification Immediately** to send a notification immediately.
*  Click **Cancel Scheduled** to cancel the scheduled notification.
*  Click **Cancel All Notifications** to cancel all notifications.

## Files 



|**File in Delphi**               |**File in C++**                                                       |**Contains**                                   |
|---------------------------------|----------------------------------------------------------------------|-----------------------------------------------|
|**SendCancelNotifications.dproj**|**SendCancelNotifications.cbproj**                                    |The project itself.                            |
|**uMain.fmx**                    |**uMain.fmx**                                                         |The main form where the components are located.|
|**uMain.pas**                    |**SendCancelNotificationsPCH1.h**, **SendCancelNotificationsPCH1.cpp**|Used to define and implement the sample.       |
|**Information.txt**              |**Information.txt**                                                   |Further information about the sample.          |


## Implementation 

The [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) component is the notification center; this component [creates the notification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CreateNotification).The [TNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification) component is the notification itself.

### Notification Details 

After creating the notification, the sample sets the following notification details:
*  The [Name](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.Name) field uniquely identifies a notification.

*  The [AlertBody](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.AlertBody) field adds the text of the notification.

### Scheduling Notifications 

[FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate) is used to set the [date and time](http://docwiki.embarcadero.com/Libraries/Denali/en/System.TDateTime) when the notification is going to be fired.
* **Immediate Notifications:** The sample sets the [FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate) to [Now](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.Now) for notifications that need to be fired immediately.
**Note:** By default, [FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate) is set to [Now](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.Now), so if you do not change the value of [FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate), the notification is fired immediately.
* **Scheduled Notifications:** To fire the notification in 10 seconds, the sample sets the [FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate) to the [current system time](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.Now) and then uses [EncodeTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.EncodeTime) to add 10 seconds to the current time.**Warning:** Windows does not support [ScheduleNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.ScheduleNotification).

### Firing Notifications 

After adding the information for the notification and adding the scheduling information, the sample uses the following sentence to send the notification to the notification center.**Delphi:**
```
NotificationC.ScheduleNotification(Notification);

```



**C++:**
```
NotificationC->ScheduleNotification(Notification);

```



The following sentence is equivalent for immediate notifications, and you may also use `PresentNotification` to send notifications to the notification center when they have to be fired immediately.**Delphi:**
```
NotificationC.PresentNotification(Notification);

```



**C++:**
```
NotificationC->PresentNotification(Notification);

```



**Tip:** Windows does not support scheduled notifications, you can present immediate notifications in Windows with `PresentNotification`.
### Cancelling Notifications 

The sample uses [CancelNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelNotification) to cancel a scheduled notification indicating the [Name](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.Name) of the notification.The sample uses [CancelAll](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelAll) to cancels all notifications:

*  The notifications that are scheduled will not be fired.
*  The notifications, that belong to this application, and are available in the notification center or notification drawer are also cancelled and removed.

## Uses 


* [System.Notification.TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter)
* [System.Notification.TCustomNotificationCenter.CreateNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CreateNotification)

* [System.Notification.TCustomNotificationCenter.ScheduleNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.ScheduleNotification)
* [System.Notification.TCustomNotificationCenter.PresentNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.PresentNotification)

* [System.Notification.TCustomNotificationCenter.CancelNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelNotification)
* [System.Notification.TCustomNotificationCenter.CancelAll](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelAll)

* [System.Notification.TNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification)
* [System.Notification.TNotification.Name](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.Name).
* [System.Notification.TNotification.AlertBody](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.AlertBody)
* [System.Notification.TNotification.FireDate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotification.FireDate)

* [System.TDateTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.TDateTime)
* [System.SysUtils.Now](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.Now)
* [System.SysUtils.EncodeTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.SysUtils.EncodeTime)

## See Also 


* [Using Notifications](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Notifications)
* [Mobile Tutorial: Using Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/Denali/en/Mobile_Tutorial:_Using_Notifications_(iOS_and_Android))
* [Using the macOS Notification Center](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_the_macOS_Notification_Center)

### Samples 


* [FireMonkey Android Notification Service](http://docwiki.embarcadero.com/codeExamples/Denali/en/FMX.Android_Notification_Service_Sample) sample
* [FireMonkey Set Reset Badge Number](http://docwiki.embarcadero.com/codeExamples/Denali/en/FMX.SetResetBadgeNumber_Sample) sample
* [OSX Dock Badges](http://docwiki.embarcadero.com/codeExamples/Denali/en/OSX_Dock_Badges_(Delphi)) (Delphi)
* [FireMonkey Notification Mac](http://docwiki.embarcadero.com/codeExamples/Denali/en/FMX.Notification.Mac_(Delphi)) (Delphi)
* [FireMonkey Notification Mac](http://docwiki.embarcadero.com/codeExamples/Denali/en/FMX.Notification.Mac_(C%2B%2B)) (C++)






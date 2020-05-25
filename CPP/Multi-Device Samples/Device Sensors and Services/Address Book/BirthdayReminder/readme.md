FMX.Birthday Reminder Sample[]()
# FMX.Birthday Reminder Sample 


This demo is an FMX application that shows how to use the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) component to access the Address Book on an Android or iOS device. 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Permission Request](#Permission_Request)
* [4.2 Contacts Upload to the Address Book](#Contacts_Upload_to_the_Address_Book)
* [4.3 Address Book Changes](#Address_Book_Changes)
* [4.4 Birthday Notifications](#Birthday_Notifications)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Birthday Reminder** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Address Book\BirthdayReminder`
* `CPP\Multi-Device Samples\Device Sensors and Services\Address Book\BirthdayReminder`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/BirthdayReminder](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/BirthdayReminder)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/BirthdayReminder](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/BirthdayReminder)

## Description 

This sample demonstrates how to:
*  Request permission to access the Address Book.
*  Retrieve contacts from the Address Book.
*  Show notifications to remember birthdays.
The sample uses a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component to send notifications.
## How to Use the Sample 


1.  Navigate to the location given above, and open:

*  Delphi: **BirthdayReminderDemo.dproj**
*  C++: **BirthdayReminderDemo.cbproj**

2.  Select **Android** or **iOS Device** as the **Target Platform**.
3.  Select the device.
4.  Press **F9** or choose **Run > Run**.

## Implementation 


### Permission Request 

The [OnShow](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnShow) event triggers when the [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) is shown.[OnShow](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnShow) calls [RequestPermission](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RequestPermission).
The [RequestPermission](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RequestPermission) method of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) requests for permission to read and change the Address Book of the mobile device if the Address Book is currently available on the current platform.

### Contacts Upload to the Address Book 

The [OnPermissionRequest](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnPermissionRequest) event of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) triggers when requesting for permission to the mobile device.
*  If permission is granted, the [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) is filled with contacts of the Address Book that have birth date information, and the [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar) is animated during the upload process.
*  If permission in not granted, a message appears informing that the user is not allowed to read contacts.

### Address Book Changes 

The [OnExternalChange](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnExternalChange) event of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) triggers when there is a change in the Address Book. [OnExternalChange](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnExternalChange) invokes the [RevertCurrentChangesAndUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RevertCurrentChangesAndUpdate) procedure. 
If the Address Book is currently available on the current platform, [RevertCurrentChangesAndUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RevertCurrentChangesAndUpdate) reverts all current changes and updates the instance of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook).

### Birthday Notifications 

When a contact is loaded, the **ContactLoaded** procedure defines a label next to the contact with the remaining days to the birthday. If the contact has a photo in the Address Book, the photo is shown at the left of the contact. When the loading process starts, all the notifications are canceled.

*  In Delphi:

```
  NotificationCenter1.CancelAll;

```




*  In C++:

```
  NotificationCenter1->CancelAll();

```



**PostNotification** procedure is called in the **ContactLoaded** procedure.**PostNotification** procedure creates and presents the notification when the birthday arrives. 

*  In Delphi:

```
  Notification.RepeatInterval := TRepeatInterval.Year; //The interval for a repeating notification. 
  Notification.FireDate := EventDate; //Date and time when the notification is fired. 
  Notification.AlertBody := Format(NotificationMessage, [ADisplayName]); //The notification message text. 
  Notification.EnableSound := True; //An alert is played when the notification appears. 
  NotificationCenter1.ScheduleNotification(Notification); //Schedules a local notification for delivery at a specific date and time.

```




*  In C++:

```
  notification->RepeatInterval = TRepeatInterval::Year; //The interval for a repeating notification. 
  notification->FireDate = eventDate; //Date and time when the notification is fired. 
  notification->AlertBody = "Don't forget to congratulate " + displayName; //The notification message text. 
  notification->EnableSound = true; //An alert is played when the notification appears.
  NotificationCenter1->ScheduleNotification(notification); //Schedules a local notification for delivery at a specific date and time

```




## Uses 


* [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook)
* [TImageList](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TImageList)
* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter)
* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)

## See Also 


* [Mobile Tutorial: Using an Address Book Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_an_Address_Book_Component_(iOS_and_Android))
* [Address Book Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Address_Book_Sample)






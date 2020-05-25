VCL.Windows 10 Notifications Sample[]()
# VCL.Windows 10 Notifications Sample 


This demo is a VCL application that shows how to use the [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) component to create, present, and cancel notifications on Windows 8 and later Windows versions.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 'Show' Button](#.27Show.27_Button)
* [4.2 'Show Another' Button](#.27Show_Another.27_Button)
* [4.3 'Cancel' Button](#.27Cancel.27_Button)
* [4.4 'Cancel Another' Button](#.27Cancel_Another.27_Button)
* [4.5 'Cancel All' Button](#.27Cancel_All.27_Button)
* [4.6 TMemo](#TMemo)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Windows 10 Notifications** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Windows 10 Notifications`
* `Object Pascal\VCL\Windows 10 Notifications`
* `CPP\Multi-Device Samples\Device Sensors and Services\Windows 10 Notifications`
* `CPP\VCL\Windows 10 Notifications`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Windows%2010%20Notifications](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Windows%2010%20Notifications)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/VCL/Windows%2010%20Notifications](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/VCL/Windows%2010%20Notifications)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Windows%2010%20Notifications](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Windows%2010%20Notifications)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/VCL/Windows%2010%20Notifications](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/VCL/Windows%2010%20Notifications)

## Description 

This sample demonstrates how to create, present, and cancel notifications on Windows 8 or later.The sample uses a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) component. 

## How to Use the Sample 


1.  Navigate to the location given above, and open:

1.  Delphi: **NotificationProject.dproj**
2.  C++: **Notifications.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Click the different buttons to create and delete notifications:

*  Click **Show** to present a notification.
*  Click **Show Another** to present a second notification.
*  Click **Cancel** to dismiss the notification presented after clicking **Show**.
*  Click **Cancel Another** to dismiss the notification presented after clicking **Show Another**.
*  Click **Cancel All** to cancel all the notifications.
*  Handle the notifications to show a received message in the [TMemo](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TMemo).

## Implementation 

The sample uses the [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) component to create and handle notifications. When a notification is presented in Windows, it appears as a banner in the right up/bottom side of the window.If the notification is not handled by the user, it goes to the [Action Center](http://windows.microsoft.com/en-US/windows7/What-is-Action-Center) (Only for Windows 10).
The sample uses the buttons **Cancel**, **Cancel Another**, and **Cancel All** to remove notifications from the **Action Center**.
When the notification is handled, that is when a user clicks it, the [OnReceiveLocalNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.OnReceiveLocalNotification) event triggers and a line is added to the [TMemo](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TMemo).

### 'Show' Button 

It creates a notification named 'Windows10Notification'.The [OnClick](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Controls.TControl.OnClick) event creates and defines the notification:
For Delphi:
```
procedure TNotificationsForm.btnShowClick(Sender: TObject);
var
  MyNotification: TNotification; //Defines a TNotification variable
begin
  MyNotification := NotificationCenter1.CreateNotification; //Creates the notification
  try
    MyNotification.Name := 'Windows10Notification'; //Defines the name of the notification.
    MyNotification.Title := 'Windows 10 Notification #1'; //Defines the name that appears when the notification is presented.
    MyNotification.AlertBody := 'RAD Studio 10 Seattle'; //Defines the body of the notification that appears below the title.

    NotificationCenter1.PresentNotification(MyNotification); //Presents the notification on the screen.
  finally
    MyNotification.Free; //Frees the variable
  end;
end;

```



For C++:
```
void __fastcall TForm1::btnShowClick(TObject *Sender)
{
  TNotification *MyNotification; 
  MyNotification = new TNotification; 
  try
  {
    MyNotification->Name = "Windows10Notification";  //Defines the name of the notification.
    MyNotification->Title = "Windows 10 Notification #1"; //Defines the name that appears when the notification is presented.
    MyNotification->AlertBody = "RAD Studio 10 Seattle"; //Defines the body of the notification that appears below the title.

    NotificationCenter1->PresentNotification(MyNotification); //Presents the notification on the screen.
  }
  __finally
  {
    delete MyNotification; 
  }
}

```




### 'Show Another' Button 

The [OnClick](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Controls.TControl.OnClick) event creates and defines a second notification, similar to the first one, named 'Windows10Notification2'.
### 'Cancel' Button 

The [OnClick](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Controls.TControl.OnClick) event cancels the notification presented with **Show**.To cancel a specific notification, you provide the name as an argument to the [CancelNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelNotification) method.
For Delphi:
```
procedure TNotificationsForm.btnCancelClick(Sender: TObject);
begin
  NotificationCenter1.CancelNotification('Windows10Notification'); //Cancels the 'Windows10Notification' notification.
end;

```



For C++:
```
void __fastcall TForm1::btnCancelClick(TObject *Sender)
{
    NotificationCenter1->CancelNotification("Windows10Notification"); //Cancels the 'Windows10Notification' notification.
}

```




### 'Cancel Another' Button 

The [OnClick](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Controls.TControl.OnClick) event cancels the 'Windows10Notification2' notification presented with **Show Another**.
### 'Cancel All' Button 

The [OnClick](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.Controls.TControl.OnClick) event uses the [CancelAll](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.CancelAll) method to cancel all notifications at once:For Delphi:
```
procedure TNotificationsForm.btnCancelAllClick(Sender: TObject);
begin
  NotificationCenter1.CancelAll; // Cancels all notifications.
end;

```



For C++:
```
void __fastcall TForm1::btnCancelAllClick(TObject *Sender)
{
  NotificationCenter1->CancelAll();
}

```




### TMemo 

The [OnReceiveLocalNotification](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TCustomNotificationCenter.OnReceiveLocalNotification) of the [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter) is defined to show a line when a notification is handled by the user. Handling a notification means that the user clicks it.For Delphi:
```
procedure TNotificationsForm.NotificationCenter1ReceiveLocalNotification(Sender: TObject;
  ANotification: TNotification);
begin
  mmLog.Lines.Add('Notification received: ' + ANotification.Name); //Shows the name of the notification handled.
end;

```



For C++:
```
void __fastcall TForm1::NotificationCenter1ReceiveLocalNotification(TObject *Sender, TNotification *ANotification)
{
  mmLog->Lines->Add("Notification received: " + ANotification->Name); //Shows the name of the notification handled.
}

```




## Uses 


* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Notification.TNotificationCenter)

## See Also 


* [Action Center](http://windows.microsoft.com/en-US/windows7/What-is-Action-Center)






FMX.Android Notification Service Sample[]()
# FMX.Android Notification Service Sample 


This demo shows an Android application using an Android Service to present a scheduled notification. The Android Service works as a background task, and presents the notification after the service is started. The notification launches even if the main application is not running. The service stops itself after performing the task.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Starting the Android Service](#Starting_the_Android_Service)

* [4 Implementation](#Implementation)

* [4.1 Notification Service](#Notification_Service)
* [4.2 Notification App](#Notification_App)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Android Notification Service** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\AndroidNotificationServiceDemo`

* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/AndroidNotificationServiceDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/AndroidNotificationServiceDemo)

## Description 

This sample demonstrates how to create and use a local Android service to present a scheduled notification. 
*  The Notification Service project consists of a Data Module. A [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component creates and presents a notification after the service is started from the Notification application.

*  The Notification Application project starts the Android Service to present a notification on the Android device. Once the notification is handled by the user, a message is sent to the TMemo. To handle notifications, the application uses a TNotificationCenter component.

## How to Use the Sample 

To open the projects:
1.  Navigate to the location given above.
2.  Open the sample application group project file: **NotificationServiceDemo.groupproj**.
To create the Android Service:
1.  Select **libNotificationService.so** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
2.  Right-click to select **Compile**.**Note:** Compiling the project generates the files that you need to add to the main application.
To add the Android Service to the main application:
1.  Select **NotificationApp** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
2.  Expand the Target Platforms node.
3.  Select the **Android** device.
4.  Right-click on the **Android** device, and select **Add Android Service**.
5.  Select the location to `C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Multi-Device Samples\Device Sensors and Services\AndroidNotificationServiceDemo\NotificationService`.
6.  Click **Next**.**Note**: Check that the location to these files is added: **libNotificationService.so, NotificationService.jar**, and **NotificationServiceUnit.pas**.
7.  Press **F9** or choose **Run > Run** to deploy the application to an Android device.

### Starting the Android Service 


1.  To start the service, on the Notification application click **Start Service**.
2.  On the Android device wait the scheduled time to see the notification in the screen.
3.  Click the notification to trigger the **OnReceiveLocalNotification** event of the TNotificationCenter from the main application.
4.  See the message **Notification received: RAD Studio 10 Seattle** in the TMemo.

## Implementation 


### Notification Service 

The Notification Service is an [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service) project. The type of the service is local. The Data Module has a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component. 
The **OnStartCommand** event from the Data Module triggers when the service starts. After starting, the **OnStartCommand** event calls the **LaunchNotification** procedure that creates and presents the notification after eight seconds.

```
function TNotificationServiceDM.AndroidServiceStartCommand(const Sender: TObject; const Intent: JIntent; Flags,
  StartId: Integer): Integer;
begin
  LaunchNotification; //Calls the procedure that defines and presents the notification.
  JavaService.stopSelf; // The service stops itselfs after presenting the notification.
  Result := TJService.JavaClass.START_STICKY; //The '''OnStartCommand''' event is defined by default as START_NOT_STICKY, this line of code sets it to START_STICKY.
end;

```


**Note:** When defined as **START_STICKY**, the system tries to re-create the service when killed. 
### Notification App 

The Notification Service is a Multi-Device application project.The **OnClick** event-handler of the **Start Service** button calls the **StartService** method of the **TLocalServiceConnection** class.
**Note**: **TLocalServiceConnection** is the helper class that manages the connection to an Android Local Service.
```
procedure TForm1.Button1Click(Sender: TObject);
begin
  TLocalServiceConnection.StartService('NotificationService'); //Initialize the TLocalServiceConnection variable to a specific service, and starts it.
end;

```


**Note**: After starting a service, you do not need to refer to the service name for the rest of methods. The **OnReceiveLocalNotification** event of the TNotification component triggers once the user handles the notification on the Android device, that means clicking on the notification, not dismissing it.
```
procedure TForm1.NotificationCenter1ReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
begin
  Memo1.Lines.Add('Notification received:'); //It shows on the memo a message when the user handles the notification.
  Memo1.Lines.Add(ANotification.AlertBody); //It shows the alert body of the notification defined on the Android Service project.
end;

```



## Uses 


* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter)
*  System.Android.Service
*  System.Android.ServiceApplication
The sample uses Built-in Java libraries for Android.
*  Androidapi.JNI.App
*  AndroidApi.JNI.GraphicsContentViewText
*  Androidapi.JNI.Os

## See Also 


* [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service)
* [Creating Android Services](http://docwiki.embarcadero.com/RADStudio/en/Creating_Android_Services)
* [Sticky Start](http://docwiki.embarcadero.com/RADStudio/en/Creating_Android_Services#Sticky_Start)
* [ServiceLifecycle](http://developer.android.com/reference/android/app/Service.html#ServiceLifecycle)
* [Mobile Tutorial: Using Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Notifications_(iOS_and_Android))
* [Android Beacon Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Beacon_Service_Sample)
* [Android Download Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Download_Service_Sample)






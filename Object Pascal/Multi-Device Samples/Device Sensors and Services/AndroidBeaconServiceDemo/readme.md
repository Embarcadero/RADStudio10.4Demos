FMX.Android Beacon Service Sample[]()
# FMX.Android Beacon Service Sample 


This demo shows an Android application using an Android Service to present a notification when a beacon with [immediate](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity) proximity (below 0.5 meters) is detected. The Android Service works as a background task, even if the main application is not running. The service stops itself after performing the task.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Configuring the Beacon](#Configuring_the_Beacon)
* [3.2 Starting the Android Service](#Starting_the_Android_Service)

* [4 Implementation](#Implementation)

* [4.1 Beacon Service](#Beacon_Service)
* [4.2 Beacon Service App](#Beacon_Service_App)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Android Beacon Service** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\AndroidBeaconServiceDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/AndroidBeaconServiceDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/AndroidBeaconServiceDemo)

## Description 

This sample demonstrates how to create and use a local Android service to present a notification. 
*  The Beacon Service project consists of a Data Module. A [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component creates and presents a notification when a beacon with immediate proximity is detected. The parameters for a specific beacon are configured using the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) component.

*  The Beacon Service Application project starts the Android Service to present a notification on the Android device. Once the beacon is detected, a notification is presented. When the user handles it, a message is sent to the TMemo. To handle notifications, the application uses a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component.

## How to Use the Sample 

To open the projects:
1.  Navigate to the location given above.
2.  Open the sample application group project file: **BeaconServiceDemo.groupproj**.
To create the Android Service:
1.  Select **libBeaconService.so** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
2.  Right-click to select **Compile**.**Note:** Compiling the project generates the files that you need to add to the main application.
To add the Android Service to the main application:
1.  Select **BeaconServiceApp** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
2.  Expand the Target Platforms node.
3.  Select the **Android** device.
4.  Right-click on the **Android** device, and select **Add Android Service**.
5.  Select the location to `C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Multi-Device Samples\Device Sensors and Services\AndroidBeaconServiceDemo\BeaconService`.
6.  Click **Next**.**Note**: Check that the location to these files is added: **libBeaconService.so, BeaconService.jar**, and **BeaconServiceUnit.pas**.
7.  Click **Finish**.
8.  Press **F9** or choose **Run > Run** to deploy the application to an Android device.

### Configuring the Beacon 

You need to set the specific parameters for the Beacon device that you want to use with this demo.Configure the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) component from the service Data Module:

1.  Select the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) component.
2.  In the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**, go to the [MonitorizedRegions](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.MonitorizedRegions) property.
3.  Click

![ProjectOptionsEllipsis.png](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAAAAACMfPpKAAAAOUlEQVR4AWNZw4AFsDC4YAruYWH4j1UtNkC6WspNEGFk+A9Bb7Ca8B/JhNevYIiabsAEtAuz41hEAWjJGSaPYaXQAAAAAElFTkSuQmCC)

to see the [TBeaconRegionCollection](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconRegionCollection).
4.  Select the existing [TBeaconRegionItem](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconRegionItem) : **0-TBeaconRegionItem**.
5.  Edit the **Major**, **Minor** and **UUID** properties from the **Object Inspector**.

### Starting the Android Service 


1.  To start the service, on the Beacon Service application, click **Start Service**.
2.  Place the Android device near the beacon. For an immediate proximity the distance must be less than 0.5 meters.
3.  When the beacon is detected, a notification is presented in the screen.
4.  Click the notification to trigger the **OnReceiveLocalNotification** event of the TNotificationCenter from the main application.
5.  See the message '**Beacon Proximity detected:'+ BeaconName** in the TMemo.

## Implementation 


### Beacon Service 

The Beacon Service is an [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service) project. The type of the service is local. The Data Module has a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component and a [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) component. 
The **OnStartCommand** event from the Data Module triggers when the service starts. **OnStartCommand** enables the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) to start scaning regions automatically. 

```
function TBeaconServiceDM.AndroidServiceStartCommand(const Sender: TObject; const Intent: JIntent; Flags,
  StartId: Integer): Integer;
begin
  Beacon1.Enabled := True; //Enables the TBeacon component to start scanning regions.
  Result := TJService.JavaClass.START_STICKY; //The '''OnStartCommand''' event is defined by default as START_NOT_STICKY, this line of code sets it to START_STICKY.
end;

```


**Note:** When defined as **START_STICKY**, the system tries to re-create the service when killed. The [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.OnBeaconProximity) event of the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) triggers every time the [Proximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Proximity) value changes. When the [proximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity) is **Immediate**, it calls the **NotifyBeaconProximity** procedure that presents a notification on the Android device.
```
procedure TBeaconServiceDM.Beacon1BeaconProximity(const Sender: TObject; const ABeacon: IBeacon;
  Proximity: TBeaconProximity);
begin
  if Proximity = TBeaconProximity.Immediate then //Checks if the proximity to the Beacon device is below 0.5 meters.
    NotifyBeaconProximity(ABeacon.GUID.ToString + ':' + ABeacon.Major.ToString + ',' + ABeacon.Minor.ToString); //It calls '''NotifyBeaconProximity''' with some parameters of the detected Beacon device.
end;

```


The [MonitorizedRegions](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon.MonitorizedRegions) property of the [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) defines the region to be monitored. A region consists of a collection of TBeacon devices defined by their **Major**, **Minor** and **UUID** parameters.
### Beacon Service App 

The Beacon Service application is a Multi-Device application project.The **OnClick** event-handler of the **Start Service** button calls the **StartService** method of the **TLocalServiceConnection** class.
**Note**: **TLocalServiceConnection** is the helper class that manages the connection to an Android Local Service.
```
procedure TForm1.Button1Click(Sender: TObject);
begin
  TLocalServiceConnection.StartService('BeaconService'); //Initialize the TLocalServiceConnection variable to a specific service, and starts it.
end;

```


**Note**: After starting a service, you do not need to refer to the service name for the rest of methods. The **OnReceiveLocalNotification** event of the TNotification component triggers once the user handles the notification on the Android device, that means clicking on the notification, not dismissing it.
```
procedure TForm1.NotificationCenter1ReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
begin
  Memo1.Lines.Add(ANotification.AlertBody); //It shows the alert body of the notification defined on the Android Service project.
end;

```



## Uses 


* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter)
* [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon)
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
* [Desktop Beacon Cast Demo Sample](http://docwiki.embarcadero.com/CodeExamples/en/RTL.Desktop_Beacon_Cast_Demo_Sample)
* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)
* [Android Notification Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Notification_Service_Sample)
* [Android Download Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Download_Service_Sample)






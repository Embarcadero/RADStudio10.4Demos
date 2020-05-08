FMX.Remote Service Demo Sample[]()
# FMX.Remote Service Demo Sample 


This demo shows two Android applications that use a remote Android service to present a message in the screen. The Android service works as a background task. The service presents the text in the Android device, after the application binds to the service, and clicking **Get Data**. Data is only accessible while the application is bound to the service.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Remote Service](#Remote_Service)
* [4.2 App Remote Host](#App_Remote_Host)

* [4.2.1 Bind Button](#Bind_Button)
* [4.2.2 Unbind Button](#Unbind_Button)
* [4.2.3 Get Data](#Get_Data)

* [4.3 App Remote External](#App_Remote_External)

* [4.3.1 Bind Button](#Bind_Button_2)
* [4.3.2 Unbind Button](#Unbind_Button_2)
* [4.3.3 Get Data](#Get_Data_2)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Remote Service** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\RemoteServiceDemo`

* **GitHub Repository:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/RemoteServiceDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/RemoteServiceDemo)

## Description 

This sample demonstrates how to use remote Android services from local and remote applications, to present a message in the screen. We understand local application as the application that contains the service, and remote application as the application that access a service hosted in a different application. The Remote Service demo consists of one remote service and two applications, the app that contains the service and an external application:

* **Remote Service**: This is a [remote Android service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service) project. It consists of a Data Module without visual components, the functionality for this demo is included in the code.

* **App Remote Host**: This is a [Multi-Device](http://docwiki.embarcadero.com/RADStudio/en/HD_Multi-Device_Application) application that contains the service. The application provides three buttons:

* **Bind**: To bind to the service. After binding to the service, the **Unbind** and **Get Data** buttons are enabled and the **Bind** button is disabled.
* **Unbind**: To unbind to the service. After unbinding from the service, the **Unbind** and **Get Data** buttons are disabled and the **Bind** button is enabled.
* **Get Data**: To get data from the service hosted in the application.

* **App Remote External**: This is a [Multi-Device](http://docwiki.embarcadero.com/RADStudio/en/HD_Multi-Device_Application) application that uses a remote service connection to bind to the service included in the **App Remote Host** application. The application provides three buttons:

* **Bind**: To bind to the remote service. After binding to the service, the **Unbind** and **Get Data** buttons are enabled and the **Bind** button is disabled.
* **Unbind**: To unbind to the remote service. After unbinding from the service, the **Unbind** and **Get Data** buttons are disabled and the **Bind** button is enabled.
* **Get Data**: To get data from the remote service.

## How to Use the Sample 

To open the projects:
1.  Navigate to the location given above.
2.  Open the sample application group project file: **RemoteDemo.groupproj**.**Note:** The **RemoteService** is already attached to the **App Remote Host** application. The service comes by default selected in [Project Dependencies](http://docwiki.embarcadero.com/RADStudio/en/Project_Dependencies), which means that you do not need to compile the project after it changes.
3.  In the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window), select **AppRemoteHost**.

1.  Press **F9** or choose **Run > Run** to deploy the application to an Android device.

4.  In the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window), select **AppRemoteExternal**.

1.  Press **F9** or choose **Run > Run** to deploy the application to the same Android device.
In the **AppRemoteHost**:
1.  Click **Bind** to bind to the local service. **Note:** You can bind to the service from the application that hosts the service and by the external application.
2.  Click **Get Data** to show the message in the screen. **Note:** **Get Data** only appears enabled while the application is bound to the service.
3.  Click **Unbind** to unbind from the service.
In the **AppRemoteExternal**:
1.  Click **Bind** to bind to the remote service hosted in **AppRemoteHost**. **Note:** You can bind to the service from the application that hosts the service and by the external application.
2.  Click **Get Data** to show the message in the screen. **Note:** **Get Data** only appears enabled while the application is bound to the service.
3.  Click **Unbind** to unbind from the service.

## Implementation 


### Remote Service 

The Remote Service is an [Android service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service) project. The type of the service is remote. This option includes the following line in the Android Manifest file of the **AppRemoteHost**, after compiling:

```
<service android:exported="true" android:name="com.embarcadero.services.RemoteService" /> //RemoteService is the name of the service. Exported means that can be accessed by an external application.

```


The **OnHandleMessage** event of the Data Module triggers a handler instance that presents a string in the Android application. Two codes are defined in the service:

```
  GET_STRING = 123;
  SERVICE_STRING = 321;

```



### App Remote Host 

**AppRemoteHost** is a Multi-Device application project that hosts the service. A specific line included in the Android Manifest file allows external applications to use **RemoteService**.

```
<service android:exported="true" android:name="com.embarcadero.services.RemoteService" /> //RemoteService is the name of the service. Exported means that can be accessed by an external application.

```



*  The **OnCreate** event from the TForm creates the remote service connection.
*  The **OnConnected** event of the TRemoteServiceConnection is associated to the **OnServiceConnected** procedure.
*  The **OnHandleMessage** event of the TRemoteServiceConnection is associated to the **OnHandleMessage** procedure.

#### Bind Button 

It stablishes the connection to **RemoteService** with `TRemoteServiceConnection.BindService('APackageName', AServiceName)`. If the service is not started, it also starts it. 
```
procedure TForm1.ButtonBindClick(Sender: TObject);
begin
  FServiceConnection.BindService('com.embarcadero.AppRemoteHost',
    'com.embarcadero.services.RemoteService');
end;

```


The **OnConnected** event fires when you are connected to the service. The **OnConnected** calls the **OnServiceConnected** procedure, which enables the **Unbind** and **Get Data** buttons and disables the **Bind** button.

#### Unbind Button 

It unbinds from the service with `TRemoteServiceConnection.UnbindService`. It does not stop the service when it is bound to other applications.
```
procedure TForm1.ButtonUnbindClick(Sender: TObject);
begin
  FServiceConnection.UnbindService;
  
  ButtonBind.Enabled := True;
  ButtonUnbind.Enabled := False;
  ButtonGetData.Enabled := False;
end;

```



#### Get Data 

**Get Data** establishes the connection with the service messenger. The local messenger and the service messenger establishes the interaction using a verification code `GET_STRING = 123`.
```
procedure TForm1.ButtonGetDataClick(Sender: TObject);
var
  LMessage: JMessage;
const
  GET_STRING = 123;
begin
  LMessage := TJMessage.JavaClass.obtain(nil, GET_STRING);
  LMessage.replyTo := FServiceConnection.LocalMessenger;
  FServiceConnection.ServiceMessenger.send(LMessage);
end;

```


When the service receives the right code, replies sending the message. The **OnHandleMessage** event fires when the message arrives to the local messenger. It handles the answer from the service using a verification code `SERVICE_STRING = 321`.
The **OnHandleMessage** procedure presents the message from the service in the screen.

### App Remote External 

**AppRemoteExternal** is a Multi-Device application project that connects to **RemoteService** hosted in **AppRemoteHost**. 
#### Bind Button 

It stablishes the connection to **RemoteService** with `TRemoteServiceConnection.BindService('APackageName', AServiceName)`. If the service is not started, it also starts it. 
```
procedure TForm1.ButtonBindClick(Sender: TObject);
begin
  FServiceConnection.BindService('com.embarcadero.AppRemoteHost',
    'com.embarcadero.services.RemoteService');
end;

```


The **OnConnected** event fires when you are connected to the service. The **OnConnected** calls the **OnServiceConnected** procedure, which enables the **Unbind** and **Get Data** buttons and disables the **Bind** button. The **OnDisconnected** event fires when you are unexpectedly disconnected from the service, this typically happens when the process hosting the service has crashed or been killed. The **OnDisconnected** calls the **OnServiceDisconnected** procedure, which disables the **Unbind** and **Get Data** buttons and enables the **Bind** button.

#### Unbind Button 

It unbinds from the service with `TRemoteServiceConnection.UnbindService`. It does not stop the service when it is bound to other applications.
```
procedure TForm1.ButtonUnbindClick(Sender: TObject);
begin
  FServiceConnection.UnbindService;
end;

```



#### Get Data 

**Get Data** establishes the connection with the service messenger. The local messenger and the service messenger establishes the interaction using a verification code `GET_STRING = 123`.
```
procedure TForm1.ButtonGetDataClick(Sender: TObject);
var
  LMessage: JMessage;
const
  GET_STRING = 123;
begin
  LMessage := TJMessage.JavaClass.obtain(nil, GET_STRING);
  LMessage.replyTo := FServiceConnection.LocalMessenger;
  FServiceConnection.ServiceMessenger.send(LMessage);
end;

```


When the service recives the right code, replies sending the message. The **OnHandleMessage** event fires when the message arrives to the local messenger. It handles the answer from the service using a verification code `SERVICE_STRING = 321`.
The **OnHandleMessage** procedure presents the message from the service in the screen.

## Uses 


*  System.Android.Service
*  System.Android.ServiceApplication
The sample uses Built-in Java libraries for Android.
*  Androidapi.Helpers
*  AndroidApi.JNI.GraphicsContentViewText
*  Androidapi.JNI.Os
*  Androidapi.JNI.JavaTypes
*  Androidapi.JNI.Widget

## See Also 


* [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service)
* [Creating Android Services](http://docwiki.embarcadero.com/RADStudio/en/Creating_Android_Services)
* [Android Beacon Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Beacon_Service_Sample)
* [Android Download Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Download_Service_Sample)
* [Bound Services](http://developer.android.com/intl/es/guide/components/bound-services.html)






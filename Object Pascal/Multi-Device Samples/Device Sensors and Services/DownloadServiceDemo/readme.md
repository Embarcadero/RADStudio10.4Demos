FMX.Android Download Service Sample[]()
# FMX.Android Download Service Sample 


This demo shows an Android application using an Android Service to download an image from the Internet. The Android Service works as a background task, even if the main application is not running. When the image file is downloaded to the device, a notification is presented. Handling the notification loads the image previously downloaded.
The service stops itself after performing the download process.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Using the Application](#Using_the_Application)

* [4 Implementation](#Implementation)

* [4.1 IntentServiceUnit](#IntentServiceUnit)
* [4.2 Download Service](#Download_Service)
* [4.3 Download Image App](#Download_Image_App)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Download Service Demo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\DownloadServiceDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/DownloadServiceDemo](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/DownloadServiceDemo)

## Description 

This sample demonstrates how to create and use a local Android service to handle asynchronous requests on demand, using intents.The demo is prepared to manage several requests using a different thread for each one. When the service is destroyed all the threads are freed. 

## How to Use the Sample 

To open the project:
1.  Navigate to the location given above.
2.  Open the sample application group project file: **DownloadServiceDemo.groupproj**.
3.  Select **DownloadImage** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
4.  Right-click to select **Compile**.**Note:** Compiling the project generates the service files that you need to deploy to the device.
5.  Select the Android device from the **Target** node in the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).
6.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging** to deploy the application to an Android device.

### Using the Application 


1.  To start the service, on the application, click **Download**.
2.  The download process starts.
3.  When the download finishes, a notification is presented in the screen.
4.  Click the notification to trigger the [OnReceiveLocalNotification](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TCustomNotificationCenter.OnReceiveLocalNotification) event of the [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) from the main application.
5.  After handling the notification, the image is loaded to the [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) of the form.
6.  Click **Delete File** to [clear](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics.TBitmap.Clear) the [bitmap](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage.Bitmap) of the TImage.

## Implementation 

The sample consists of a multi-device application with a local service. The main activity starts the local service with an intent that contains the name of the service and the data.The service runs in the background and remains active even if the main activity is killed. The service starts the downloading process in an anonymous thread. The demo is designed to hold more than one downloading process at the same time. There is an array of threads and each thread is removed after the downloading process finishes. The service stops after the last download ends. The array of threads is freed when the service is destroyed.
Once the download is completed, a notification is created and presented immediately. When the notification is handled in the activity, the download image is loaded in the main form.

### IntentServiceUnit 

**IntentServiceUnit** is a helper unit where the intent structure is defined with the properties and functions.TIntentServiceHelper class contains properties and functions to create the intent.

```
class function TIntentServiceHelper.Create(const AServiceName: string; Code: Integer; Data: string): TIntentServiceHelper;

```


This function creates an intent with the service name, code and data passed as arguments. The main application calls this function to create the intent.
*  To add properties to the intent, it uses **putextra**.
*  To assign the parameters to the intent, to start the service, it uses **setclass** defining where the service is, and which service to launch.

*  It uses getPackageName() to get the name of the local package. For a remote service you need to set the package name explicitly.
*  It takes the name of the service as the second argument.

```
class function TIntentServiceHelper.Create(const Intent: JIntent): TIntentServiceHelper;

```


This function gets the code and data from the intent passed as an argument. The Service calls this function to extract the information from the intent received from the main application. To extract the code it uses **getIntExtra**, to extract the path to the file it uses **getStringExtra**.
### Download Service 

The Download Service is an [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service) project. The type of the service is local. The Data Module has a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component.
The service starts by clicking **Download** in the main application. The **OnClick** event calls StartService(<service_intent>). The intent service structure is declared in a class created in **IntentServiceUnit.pas**. The intent service is composed by the service_name, a code, and the URL + the <file_name>. 
The **OnStartCommand** event from the Data Module triggers when the service starts. It creates an anonymous thread starting the downloading process with a StartId.
The **OnCreate** event creates the arrays of threads to manage more than one download process for the same service.
The **OnDestroy** event frees the arrays of threads. 

### Download Image App 

The Download Image app is a multi-device application. It has a [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter) component to manage the received notification.The **Download** button creates the intent with the URL + filename from the TEdit, and the service name **DownloadService**. It also starts the service.
The **Delete** button clears the TBitmap from the TImage and disables the Button. 

## Uses 


* [TNotificationCenter](http://docwiki.embarcadero.com/Libraries/en/System.Notification.TNotificationCenter)
* [CreateAnonymousThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.CreateAnonymousThread)
*  System.Android.Service
*  System.Android.ServiceApplication
The sample uses Built-in Java libraries for Android.
*  Androidapi.JNI.App
*  AndroidApi.JNI.GraphicsContentViewText
*  Androidapi.JNI.Os
*  Androidapi.Helpers

## See Also 


* [Android Service](http://docwiki.embarcadero.com/RADStudio/en/Android_Service)
* [Creating Android Services](http://docwiki.embarcadero.com/RADStudio/en/Creating_Android_Services)
* [ServiceLifecycle](http://developer.android.com/reference/android/app/Service.html#ServiceLifecycle)
* [Mobile Tutorial: Using Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Notifications_(iOS_and_Android))
* [Android Notification Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Notification_Service_Sample)
* [Android Beacon Service Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Android_Beacon_Service_Sample)






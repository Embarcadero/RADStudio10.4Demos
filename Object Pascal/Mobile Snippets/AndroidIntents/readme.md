FMX.Android Intents Sample[]()
# FMX.Android Intents Sample 


This demo shows interaction between Android applications using intents. It consists of two applications, **SendIntent** that creates and send the intent, and **ReceiveIntent** that receives the intent and displays the information.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 SendIntent](#SendIntent)

* [4.1.1 How Android Handles Incoming Intents](#How_Android_Handles_Incoming_Intents)

* [4.2 ReceiveIntent](#ReceiveIntent)

* [4.2.1 Modifying the AndroidManifest.xml](#Modifying_the_AndroidManifest.xml)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Android Intents** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Object Pascal\Mobile Snippets\AndroidIntents**

* **GitHub Repository:**

*  For Delphi: [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AndroidIntents/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/AndroidIntents/)

## Description 

This sample demonstrates how to register an Android intent action. 
*  On the sender:

*  Defines the intent type with `<intent_name>.setType()`.
*  Defines the intent action with `<intent_name>.setAction(TJIntent.JavaClass.ACTION_VIEW)`.
*  Calls `startActivity()` when there is at least one application capable of receiving the intent.

*  On the receiver you need to register the type of intent action that you want your application to be able to receive.

*  Calls `registerIntentAction(TJIntent.JavaClass.ACTION_VIEW)`. Same action as in the sender.
*  Registers the receiver in the [Android Manifest](#Modifying_the_AndroidManifest.xml) file. A corresponding `</code> and <code><action></code> tags must exist in the <code><intent-filter></code> section. `

## How to Use the Sample 


1.  Navigate to the location given above.
2.  Open the sample application group project file: **AndroidIntentsGroup.groupproj**.
3.  Select **ReceiveIntent** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window).

1.  Select the **Android** device on the Project Manager.
2.  Press **F9** or choose **Run > Run**.**Note:****ReceiveIntent** needs to be on the device to receive the broadcast information.

4.  Select **SendIntent** on the **Project Manager**.

1.  Select the **Android** device on the **Project Manager**.
2.  Press **F9** or choose **Run > Run**.
**Note:** Send both applications to the same Android device, otherwise you need to use push notifications. 
## Implementation 


### SendIntent 

**SendIntent** project has one source file, **Unit1.pas**.**SendIntent** application sends text using an intent. It uses the **SendTextViaIntent** procedure to create the intent object and start the activity for this intent.

```
procedure TForm1.SendTextViaIntent(const AText: string);
var
  Intent: JIntent; //Declares the intent object
begin
  Intent := TJIntent.Create; 
  Intent.setType(StringToJString('text/pas')); // Defines the data string.
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW); //Defines the Action.
  Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringtoJString(AText));
  if MainActivity.getPackageManager.queryIntentActivities(Intent, TJPackageManager.JavaClass.MATCH_DEFAULT_ONLY).size > 0 then //Checks if there is at least one application capable of receiving the intent.
    MainActivity.startActivity(Intent); //Calls startActivity() to send the intent to the system.
  else
    ShowMessage('Receiver not found');
end;

```


The primary pieces of information in an intent are:
*  Action: the general action to be performed. In our sample, ACTION_VIEW.
*  Data: the data to operate on, expressed as Uri. In our sample, 'text/pas'.
The application has two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton):
* **TButton1** sends the text to write a simple **Hello World** Delphi application. It calls **SendTextViaIntent** procedure with the text as a parameter, on the [OnClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick) event.

* **TButton2** sends the structure of a Delphi .pas file in the same way as **TButton1**.

#### How Android Handles Incoming Intents 


*  No app: If there are no apps on the device that can receive the implicit intent, the app crashes when it calls <code>startActivity()</code>.**Note:** First verify that there is an app that can receive the intent.
*  One app: When there is only one app that can handle the intent, the system immediately starts it.
*  More than one app: If there is more than one app that can handle the activity, the system displays a dialog for the user to select which app to use.

### ReceiveIntent 

**ReceiveIntent** project has one source file, **Unit1.pas**. It receives and shows the text from the **SendIntent** application.
* **HandleIntentAction** function verifies that the intent contains information and shows the text on the TMemo1.

* **HandleAppEvent** function verifies that the intent is not null and calls **HandleIntentAction** function with the received itent. This function handles the intent the first time **ReceiveIntent** opens.

* **ReceiveIntent** procedure handles the intent when **ReceiveIntent** is already open.
The itent is register using <code>MainActivity.registerIntentAction(TJIntent.JavaClass.ACTION_VIEW);</code>.To receive simple data from other applications, you need to update the Android Manifest file to create the intent filters that are necessary to receive intents for a specific action.
After editing the Android Manifest for a specific action, when **SendIntent** application tries to share the information passing the intent to <code>startActivity()</code>, ReceiveIntent appears as the option to view this information. If more than one options is available, an app chooser with all the apps appears.

#### Modifying the AndroidManifest.xml 

Modify the Android Manifest xml file to add the intent filter. An intent filter informs the Android system about what intents the application can accept. In this example, an intent filter is added to accept the intent created on the **SendIntent** application. The **ReceiveIntent** is the only application that can accept the intent from **SendIntent** application.
The application that receives the intent needs to add some tags to the Android Manifest.

1.  After building your project for the first time with **Android** selected on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window), the **AndroidManifest.template.xml** is added to your project folder.
2.  Edit the AndroidManifest.template.xml file to add the following lines:

```
<!--<%application-meta-data%>
...
    <activity android:name="com.embarcadero.firemonkey.FMXNativeActivity"
                android:label="%activityLabel%"
                android:configChanges="orientation|keyboard|keyboardHidden"
                android:launchMode="singleTask">
        ...-->
        <intent-filter> 
            ...
            <action android:name="android.intent.action.VIEW" /> <!--Constant Value for the ACTION_VIEW-->
            <category android:name="android.intent.category.DEFAULT" /> <!-- Activities that want to receive implicit intents must include this constant-->
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:mimeType="text/pas" />  <!--Sets the MIME type of your intent.-->
        </intent-filter> 
    <!--</activity>-->

```



## Uses 

The sample uses Built-in Java libraries for Android.
*  Androidapi.JNI.GraphicsContentViewText
*  Androidapi.JNI.App
*  Androidapi.Helpers
*  FMX.Platform.Android
*  Androidapi.JNI.JavaTypes
*  Androidapi.JNI.Net
*  Androidapi.JNI.Os

## See Also 


* [Using the Built-in RAD Studio Java Libraries for Android](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Built-in_RAD_Studio_Java_Libraries_for_Android)
* [Intents and Intent Filters](http://developer.android.com/guide/components/intents-filters.html)
* [CATEGORY_BROWSABLE](http://developer.android.com/reference/android/content/Intent.html#CATEGORY_BROWSABLE)
* [CATEGORY_DEFAULT](http://developer.android.com/reference/android/content/Intent.html#CATEGORY_DEFAULT)
* [Preparing an Android Application for Deployment#Customizing Your AndroidManifest.xml File](http://docwiki.embarcadero.com/RADStudio/en/Preparing_an_Android_Application_for_Deployment#Customizing_Your_AndroidManifest.xml_File)
* [Android Application Manifest File (AndroidManifest.xml)](http://docwiki.embarcadero.com/RADStudio/en/Android_Application_Manifest_File_(AndroidManifest.xml))
* [Verify There is an App to Receive the Intent](http://developer.android.com/training/basics/intents/sending.html#Verify)






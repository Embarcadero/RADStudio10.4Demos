FMX.ForegroundLocationTracking Demo

# FMX.ForegroundLocationTracking Demo

This Android demo application demonstrates the use of a [**bound**](https://developer.android.com/guide/components/services#CreatingBoundService) and [**started**](https://developer.android.com/guide/components/services#CreatingAService) foreground Android service for tracking the user's location.  

## Description

**Android 8.0** introduced the [**background location limits**](https://developer.android.com/about/versions/oreo/background-location-limits), which affect the frequency of location updates provided by the system when the application goes to the background. To avoid being affected by the **background location limits**, the Android service that tracks the user's location is aware of changes in the current application state. That being said, when the application goes to the background, the Android service starts to run in the foreground, and when the application goes back to the foreground, the Android service stops to run in the foreground. 

## Interacting with the demo

When the application is in the foreground, location updates are presented to the user in toast messages of short duration. When the application is in the background, location updates are presented to the user in an ongoing notification. The user can interact with this demo application by performing these actions:

* Tap on the **Start location tracking** button to start receiving location updates. _It is applicable when the application is in the foreground._
* Tap on the **Stop location tracking** button to stop receiving location updates. _It is applicable when the application is in the foreground._
* Tap on the ongoing notification to start the application. _It is applicable when the application is in the background._
* Tap on the **Stop location tracking** notification action to stop receiving location updates. _It is applicable when the application is in the background._

## Implementation note

**Android 10** requires the [**foreground service type**](https://developer.android.com/about/versions/10/features#fg-service-types) to be declared in the **AndroidManifest.xml** file. For this reason, this demo application contains a _workaround_ for adding the **foregroundServiceType** attribute in the service declaration:
```
<service android:name="com.embarcadero.services.ForegroundLocationTrackingService"
    android:exported="false"
    android:foregroundServiceType="location" />
```
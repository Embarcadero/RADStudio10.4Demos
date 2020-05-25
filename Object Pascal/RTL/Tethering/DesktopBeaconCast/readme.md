RTL.Desktop Beacon Cast Demo Sample[]()
# RTL.Desktop Beacon Cast Demo Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

The sample shows how to use the [TBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TBeacon) component in a client application to scan for beacon devices. The sample also demonstrates how to take some actions on a specific beacon device, defined by **GUID**, **Major** and **Minor** parameters, when the proximity is inmediate (below 0.5 meters).To have this sample working and showing values, you need a beacon device.

## Location 

You can find the **Desktop Beacon Cast** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* **CPP\RTL\Tethering\DesktopBeaconCast**
* **Object Pascal\RTL\Tethering\DesktopBeaconCast**

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/Tethering/DesktopBeaconCast/](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/Tethering/DesktopBeaconCast/)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/Tethering/DesktopBeaconCast/](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/Tethering/DesktopBeaconCast/)

## Description 

This is a sample of a server - client application that uses tethering and beacon technology. Beacon transmitters use Bluetooth 4.0 technology to send specific information to nearby devices based on location.The server and client applications connect to each other using tethering components. **Start** the server to enable the tethering manager to allow communication with the client application.
The [TBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TBeacon) component on the client scans for beacon devices, when the beacon device with the parameters defined on the server is found and the proximity to the device is below 0.5 meters, remote actions are executed to take and get a screenshot from the server.

## How to Use the Sample 

Navigate to the location given above and open **DesktopBeaconCast.groupproj**. The group contains two projects, the server and the client application. Run the server on a computer and then deploy the client to a mobile device. 
* Run the server:

1.  Select **VCLBeaconCastDesktop.exe** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/Denali/en/Projects_Window).
2.  Press **F9** or choose **Run > Run**.
3.  Introduce the parameters **GUID**, **Major** and **Minor** identifying the beacon that you want to use to represent the server.
4.  Click **Start** to enable communication with the client.
5.  Click **Stop** to stop communication with the client.

* **Note:** You can create as many server - beacon associations as you need by repeating the steps above. Make sure that the server app has permissions to access the network in order for clients to connect.

* Run the client:

1.  With the server running, select **FMXClientBeaconCast** on the [Projects Window](http://docwiki.embarcadero.com/RADStudio/Denali/en/Projects_Window).
2.  Select the target platform. The application works with **iOS** and **Android**.**Note:** See [Using Beacons](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Beacons) for more information about client platform support for Beacons.
3.  Press **F9** or choose **Run > Run**.
4.  Click **Connect** to start the automatic connection between tethering managers.
5.  Approach the mobile to the beacon associated to the server that you want to present on the client application. Once you are close enough to the beacon, a remote screenshot from the server is created and sent to the client by using tethering.

## Implementation 

The client application lists all the available servers after clicking **Connect**. The client is notified about the beacon parameters associated with all the available servers. The parameters that identify a specific beacon, that is **GUID**, **Major**, and **Minor**, are stored in a shared resource on the server application. The method used to get the information from the server resource is [GetRemoteResourceValue](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile.GetRemoteResourceValue). The client application uses a [TBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TBeacon) component to scan for beacon devices. [ScanningSleepingTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TCustomBeacon.ScanningSleepingTime) and [ScanningTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TCustomBeacon.ScanningTime) properties are used to define the scanning period. The [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TCustomBeacon.OnBeaconProximity) event is fired every time the proximity value changes on the detected beacon. The event handler checks if:

*  The parameters **GUID**, **Major** and **Minor** from the beacon are the same parameters as the ones defined on the server application.
*  The Proximity to the beacon is **Inmediate**, below 0.5 meters.
When restrictions are met, [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TCustomBeacon.OnBeaconProximity) event launches a remote screen shot on the server and loads it on the client.To take and load the remote screenshot from the server, the application uses the [TTetheringManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.Manager.TTetheringManager) component and the [TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile) component.
The [TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile) component is used on the server and the client to create tethering profiles. The [Group](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.Manager.TTetheringProfile.Group) property allows the connection between the server and the client. There is an action defined on the server profile, **actFullShot** to create and save the screenshot as a resource. The client uses [GetRemoteResourceValue](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile.GetRemoteResourceValue) to load the image to the client.

## Uses 


* [System.Tether.NetworkAdapter](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.NetworkAdapter)
* [System.Tether.Manager.TTetheringManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.Manager.TTetheringManager)
* [System.Tether.AppProfile.TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile)
* [Vcl.ActnMan.TActionManager](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ActnMan.TActionManager)
* [System.Beacon.Components.TBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TBeacon)
* [System.Beacon.Components.TCustomBeacon.OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TCustomBeacon.OnBeaconProximity)
* [System.Tether.AppProfile.TTetheringAppProfile.GetRemoteResourceValue](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Tether.AppProfile.TTetheringAppProfile.GetRemoteResourceValue)
* [Vcl.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ActnList.TActionList)
* [Vcl.ActnMan.TActionManager](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ActnMan.TActionManager)
* [FMX.ImgList.TImageList](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.ImgList.TImageList)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Bluetooth_Low_Energy)
* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Beacons)






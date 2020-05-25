RTL.ExtendedBeaconScanner Sample[]()
# RTL.ExtendedBeaconScanner Sample 


This sample shows how to scan for [Beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) devices using different [scan modes](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconScanMode): **Standard**, **Alternative**, **Eddyston**, and **Extended**.When selecting the **Extended** mode, the sample allows you to select the [kind of Beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TKindofBeacon) device to scan: **iBeacon**, **AltBeacon**, and **Eddystone**. The **Extended** mode allows scanning all different kind of beacon devices simultaneously.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 SCAN Button](#SCAN_Button)
* [4.2 STOP SCANNING Button](#STOP_SCANNING_Button)
* [4.3 Device Information](#Device_Information)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **ExtendedBeaconScanner** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\ExtendedBeaconScanner`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/ExtendedBeaconScanner](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/ExtendedBeaconScanner)

## Description 

This sample shows how to use the **Extended**[scan mode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconScanMode) to discover all [kind of beacons](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TKindofBeacon) at the same time.Using the **Extended** scan mode, the application is able to discover non-registered beacons.
The demo also works with the **Standard**, **Alternative**, and **Eddyston** modes to discover registered beacons.

## How to Use the Sample 


1.  Navigate to the location given above and open **AllBeaconsScanner.dproj**.
2.  Press **F9** or choose **Run > Run**.
3.  Select the scan mode: **Standard**, **Alternative**, **Eddyston**, or **Extended**.
4.  When selecting **Extended** as the scan mode, select the kind of beacon to scan: **iBeacon**, **AltBeacon**, and **Eddystone**.
5.  Select **Device Inf.** to show information about the discovered devices in the TListView.
6.  Click **SCAN** to start scanning for devices.

## Implementation 

This application uses a [TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) component:
*  The [Mode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.Mode) property is used to define the scan mode. The value that comes by default is **extended**.
*  The [ModeExtended](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.ModeExtended) property indicates which kind of beacons to monitor. The values that comes by default are: **[iBeacons, AltBeacons, Eddystones].**

### SCAN Button 

The [Mode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.Mode) property and the [ModeExtended](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.ModeExtended) property are defined using two functions:
* `GetScanningModeChecked` function checks the [Scan mode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconScanMode) selected in the **Scan mode** panel of the application. Modes are mutually exclusive.
* `GetKindOfBeaconsChecked` function checks the [kind of beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TKindofBeacon) selected in the **Extended mode** panel of the application. The Extended mode allows you to scan for several kinds of beacons at the same time.
The **SCAN** button calls the [StartScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.StartScan) method to start monitoring beacons.
### STOP SCANNING Button 

The **STOP SCANNING** button calls the [StopScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.StopScan) method to stop monitoring beacons.
### Device Information 

When **Device Inf** is selected, the [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) is filled with the information of the discovered devices.The [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) component is used to print the information in the TListView after the specified time [interval](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.Interval), in this case 1 second.
The [OnTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.OnTimer) event triggers the `Timer1Timer` procedure after the defined time interval.
The `Timer1Timer` procedure checks the [BeaconList](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeacon.BeaconList) and gets information about the devices.

## Uses 


* [System.Beacon.IBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon)
* [System.Beacon.TBeaconList](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconList)
* [System.Beacon.Components.TBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon)
* [System.Bluetooth.TBluetoothLEDeviceList](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDeviceList)
* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)

## See Also 


* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)






RTL.BLE BeaconScanner Sample[]()
# RTL.BLE BeaconScanner Sample 


This is a sample that shows the use of the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby Beacons and display their information.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Main Form](#Main_Form)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **BLE Beacon Scanner** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\BLE_BeaconScanner`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\BLEBeaconScanner`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/BLE_BeaconScanner](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/BLE_BeaconScanner)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/BLEBeaconScanner](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/BLEBeaconScanner)

## Description 

This application uses the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby beacons and display their information.The application uses the following controls:

* `Start Discovery`: Fires the `Button1Click` event handler.
* `Cancel Discovery`: Fires the `Button2Click` event handler.
* `ListBox1`: Displays the information about the discovered beacons.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **BLEBeaconScanner.dproj**.
*  C++: **BLEBeaconScannerCPP.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Click the **Start Discovery** button to start searching for devices.
4.  Wait until the discovery completes.
To interrupt a discovery, click the **Cancel Discovery** button to stop searching for devices.The application displays the following information about the discovered beacons in the `ListBox1` control:

*  Beacon Found: The name of the discovered beacon and the type of the beacon. The type of the beacon is either iB (iBeacon) or AltB (any other beacon).
*  Device Complete Name: The complete device name that the beacon broadcasts.
*  UUID: The [GUID identifier](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothUUID) of the beacon.
*  Major: The [Major](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconInfo.Major) identifier of the beacon.
*  Minor: The [Minor](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconInfo.Minor) identifier of the beacon.
*  txPower: The [power transmission](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconInfo.TxPower) of the beacon.
*  Rssi: The [received signal strength indicator](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Rssi) of the beacon.
*  Distance: The calculated [distance](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.RssiToDistance) to the beacon, in meters.

## Implementation 

This application uses an instance of [TBluetoothLEManager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager) to:
*  Search for nearby [Bluetooth Low Energy devices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice).
*  Decode the response from each device and determine if that device is a beacon.
*  Display the information about each discovered beacon.
This application implements a custom event handler for the [OnDiscoverLeDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.OnDiscoverLeDevice) event, **DiscoverLEDevice**, that processes the response from discovered devices and displays the relevant information about any discovered beacons.
### Main Form 

On initialization, the `FormShow` method creates a list where the discovered devices are stored.
*  The application defines the following event handlers:

* `Button1Click`: Initializes an instance of [TBluetoothLEManager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager), registers the event handler for the [OnDiscoverLeDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.OnDiscoverLeDevice) event and [starts the discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.StartDiscovery) for Bluetooth Low Energy devices.
* `Button2Click`: [Cancels](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.CancelDiscovery) the discovery.
* `DiscoverLEDevice`: Decodes the response from each discovered device. If the discovered device is a beacon, **DiscoverLEDevice** displays the relevant information about that beacon in the `ListBox1` control.

## Uses 


* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [System.Bluetooth.Components](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components)

## See Also 


* [System.Bluetooth.TBluetoothLEManager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager)
* [System.Bluetooth.TBluetoothLEDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice)
* [System.Bluetooth.TScanResponseKey](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TScanResponseKey)
* [System.Beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon)

* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)

* [iBeacon](http://en.wikipedia.org/wiki/iBeacon)






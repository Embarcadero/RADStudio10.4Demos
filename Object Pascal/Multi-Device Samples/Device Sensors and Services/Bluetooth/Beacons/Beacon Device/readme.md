RTL.BeaconDevice Sample[]()
# RTL.BeaconDevice Sample 


This sample shows how to use the [BeaconDevice API](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconDevice) in order to configure a BLE device to operate as a [Beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeacon) device.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **BeaconDevice** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\Beacon Device`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\Beacon Device`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacon%20Device](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacon%20Device)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacon%20Device](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacon%20Device)

## Description 

This sample shows how to configure a [TBeaconDevice](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconDevice) component so that your **BLE** device operates as a **Beacon** device. After the component is configured, your device can start advertising data for proximity purposes.The application provided with this sample allows you to introduce custom settings for a **BeaconDevice**. 
You can either set random or custom values for the following advertising data parameters:

* [UUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeaconDevice.GUID): Identifies unequivocally your device as a beacon, or as part of a group of beacons.
* [Major](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeaconDevice.Major): Specifies subdivisions within a group of beacons defined by UUID.
* [Minor](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeaconDevice.Minor): Specifies further sub-regions inside Major subdivisions.
* [TxPower](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeaconDevice.TxPower): Specifies the power transmission of the beacon. It represents the RSSI value expected at 1m distance to the beacon. You can use this value later for calibration purposes.
**Note**: For information about platform support, see [platform support](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons#Platform_Support).
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **BeaconDeviceDemo.dproj**.
*  C++: **BeaconDevDemo.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  In order to specify values for the advertising data parameters, you can either:

*  Click the `BtnRandom` button: **Set Random** sets random values for **UUID**, **Major** and **Minor**. **TxPower** is set to its default value.
*  Enter your custom values in the following `TEdit` controls:


* `EdtBeaconUUID`: Enter a **UUID** value.
* `EdtBeaconMajor`: Enter a **Major** value.
* `EdtBeaconMinor`: Enter a **Minor** value.
* `EdTxPower`: Enter a **TxPower** value in `dBm`.

4.  Click the `BtnEnableBeacon` button: **Enable Beacon** enables the `BeaconDevice1` so that it can start advertising data with the specified parameters.

## Implementation 

This application uses a [TBeaconDevice](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconDevice) that can be configured by entering values in the following `TEdit` controls:
* `EdtBeaconUUID`
* `EdtBeaconMajor`
* `EdtBeaconMinor`
* `EdTxPower`
The application defines the following event handlers so that the entered values are set up in the component:
* `BtnRandomClick`: Generates random values for the parameters specified above.
* `BtnEnableBeaconClick`:

*  Checks whether the entered UUID value is valid.
*  Sets the entered values to the `BeaconDevice1` component.
* [Enables](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TCustomBeaconDevice.Enabled) the `BeaconDevice1` so that it can start advertising data.

## Uses 


* [System.Beacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon)
* [System.Beacon.Components](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components)

## See Also 


* [System.Beacon.Components.TBeaconDevice](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.Components.TBeaconDevice)
* [System.Beacon.TBeaconManager](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager)
* [System.Bluetooth.TBluetoothLEDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice)

* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)






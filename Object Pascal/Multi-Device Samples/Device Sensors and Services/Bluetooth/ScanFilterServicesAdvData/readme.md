RTL.ScanFilterServicesAdvData[]()
# RTL.ScanFilterServicesAdvData 


This is a sample that shows the use of the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby Bluetooth devices and filter them by services.**Note:** This sample application works on Windows, but only on Windows 10 and later versions.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Main Form](#Main_Form)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **ScanFilterServicesAdvData** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\ScanFilterServicesAdvData`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ScanFilterServicesAdvData](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ScanFilterServicesAdvData)

## Description 

This application uses the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby devices.The application uses the following controls:

* `Start Scan`: Fires the `Button1Click` event handler.
* `STOP Scan`: Fires the `Button2Click` event handler.
* `CheckBox1`: Specifies whether to force the search for non-broadcast services.
* `ListBox1`: Displays the information about discovered devices.
* `TBluetoothLE`: The BluetoothLE component that handles discovery of devices.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **ScanFilterServicesAdvData.dproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Click the **Start Scan** button to start searching for devices.
4.  Wait until the discovery completes.
5.  All the devices that broadcast any service from the filter are listed in the `ListBox1` control.
To interrupt a discovery, click the **STOP Scan** button. If you wish to force the discovery on non-broadcast services, check the **Force Connection to Devices** check box and restart the discovery.
## Implementation 

This application uses an instance of [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE) to:
*  Search for nearby [Bluetooth Low Energy devices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice).
*  Filter discovered devices by services.
*  Display the information about discovered devices in the `ListBox1` control.

### Main Form 

On initialization, the `FormShow` method initializes a list that acts as a filter for services. This list contains the following services:
*  HeartRate
*  HealthThermometer
*  DeviceInformation

*  The application defines the following event handlers:

* `Button1Click`: Initializes a list of devices, clears the `ListBox1` control, and initiates [discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices).
* `Button2Click`: Cancels [discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.CancelDiscovery).
* `BluetoothLE1DiscoverLEDevice`: Occurs for every discovered device. This method checks the services that the device advertises against the filter list. If any service is a match, the `PrintLine` method adds the device name to the list. If the **Force Connection to Devices** check box is checked, this method checks all services (including non-broadcast).
* `BluetoothLE1EndDiscoverDevices`: Occurs when the discovery finishes. Adds any matching non-broadcast services to the `ListBox1` control.
* `FormClose`: Occurs on application exit. Destroys any remaining lists of devices.

*  The application also defines the following methods:

* `PrintLine`: Gets the name and identifier of the device and adds them to the `ListBox1` control.
* `AddDeviceToList`: Adds the specified device to the provided device list.

## Uses 


* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [System.Bluetooth.Components](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components)
* [FMX.ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox)
* [System.Generics.Collections](http://docwiki.embarcadero.com/Libraries/en/System.Generics.Collections)
* [System.StrUtils](http://docwiki.embarcadero.com/Libraries/en/System.StrUtils)

## See Also 


* [System.Bluetooth.TBluetoothLEDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice)
* [System.Bluetooth.TBluetoothGattServiceList](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattServiceList)

* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)






RTL.BLEScanner Sample[]()
# RTL.BLEScanner Sample 


This is a sample that shows the use of the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby Bluetooth devices and check whether they broadcast any services.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Main Form](#Main_Form)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **BLEScanner** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\BLEScanner`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\BLEScanner`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/BLEScanner](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/BLEScanner)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/BLEScanner](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/BLEScanner)

## Description 

This application uses the [Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) API to search for nearby devices.The application uses the following controls:

* `Start Scan`: Fires the `Button1Click` event handler.
* `STOP Scan`: Fires the `Button2Click` event handler.
* `ProgressBar1`: Shows the progress of the discovery.
* `ListBox1`: Displays the information about discovered devices.
* `ListBox2`: Displays the information about discovered services.
* `TBluetoothLE`: The BluetoothLE component that handles discovery of devices.
* `Timer1`: The timer that fires events used for the progress bar tracking.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **BLEScanner.dproj**.
*  C++: **BLEScannerCPP.cbproj**.

2.  Press **F9** or choose **Run > Run**.
3.  Click the **Start Scan** button to start searching for devices.
4.  Wait until the discovery completes.
5.  Choose a discovered device from the list.
6.  The services that the device broadcasts are displayed in the `ListBox2` control. If that device does not broadcast any services, the text "Discover services not allow" is displayed in the `ListBox2` control.
To interrupt a discovery, click the **STOP Scan** button.
## Implementation 

This application uses an instance of [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE) to:
*  Search for nearby [Bluetooth Low Energy devices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice).
*  Display names of discovered devices in the `ListBox1` control.
*  Search for services on a specific device.
*  Display the information about discovered services in the `ListBox2` control.

### Main Form 

On initialization, the `FormShow` method initializes a Boolean that is used as a control for the discovery interruption and to prevent multiple simultaneous scanning.
*  The application defines the following event handlers:

* `Button1Click`: Resets the progress bar, clears the `ListBox1` control, enables the timer and initiates [discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices).
* `Button2Click`: Resets the timer and cancels [discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.CancelDiscovery).
* `BluetoothLE1DiscoverLEDevice`: Occurs for every discovered device. Adds the name of the discovered device to the `ListBox1` control.
* `BluetoothLE1EndDiscoverDevices`: Occurs when the discovery finishes. Disables the timer.
* `BluetoothLE1ServicesDiscovered`: Occurs for every discovered service. Reads the [name](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattCharacteristic.UUIDName) and the [UUID](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattCharacteristic.UUID) from the [list of characteristics](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattCharacteristicList) and adds them to the `ListBox2` control.
* `ListBox1ItemClick`: Clears the `ListBox2` control and initiates service [discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.DiscoverServices).
* `Timer1Timer`: Occurs for every timer interval (default is 1 second). Calculates the progress of the discovery based on the maximum discovery time and updates the progress bar accordingly.

## Uses 


* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [System.Bluetooth.Components](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components)
* [FMX.ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox)

## See Also 


* [System.Bluetooth.TBluetoothLEDevice](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice)
* [System.Bluetooth.TBluetoothGattServiceList](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattServiceList)

* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)






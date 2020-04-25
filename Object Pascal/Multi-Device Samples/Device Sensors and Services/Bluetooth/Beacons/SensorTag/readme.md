RTL.SensorTag[]()
# RTL.SensorTag 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Main Form](#Main_Form)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **SensorTag** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\SensorTag`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/SensorTag](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/SensorTag)

## Description 

This application uses the [Bluetooth](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth) API to search for nearby [SensorTag](http://processors.wiki.ti.com/index.php/Simplelink_SensorTag) devices, connect to them, and display the data from their sensors.The application uses the following controls:

* `BluetoothLE1`: The [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE) component.
* `Button1`: Fires the `Button1Click` event handler.
* `Button2`: Fires the `Button2Click` event handler.
* `ListBox1`: Displays the information about the discovered SensorTag devices.
* `EdAccelX`: [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the X-axis of the accelerometer.
* `EdAccelY`: [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the Y-axis of the accelerometer.
* `EdAccelZ`: [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the Z-axis of the accelerometer.
* `EdAmbient`: [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the ambient temperature of the IR temperature sensor.
* `EdHumidity`:[TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the humidity.
* `EdTarget`: [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control that displays the data for the target temperature of the IR temperature sensor.
* `Label1 - Label8`: The labels for the TEdit controls.

## How to Use the Sample 


1.  Navigate to the location given above and open: Delphi: **SensorTag.dproj**.
2.  Press **F9** or choose **Run > Run**.
3.  Click the **Find devices** button to start searching for SensorTag devices.
4.  Wait until the discovery completes.
5.  Click the **Subscribe to data** button to subscribe to the services that the SensorTag device offers.
The application displays the discovered SensorTag devices in the `ListBox1` control. If you subscribe to receive data from a SensorTag device, the application displays the following:
*  Temperature

*  Ambient: The ambient temperature.
*  Target: The calculated temperature of the target of the IRtemperature sensor.

*  Accelerometer

*  X: The acceleration of the X-axis of the accelerometer.
*  Y: The acceleration of the Y-axis of the accelerometer.
*  Z: The acceleration of the Z-axis of the accelerometer.

*  Humidity: The humidity.
If you do not select a device from the list and you click the **Subscribe to data** button, the application shows the alert: "Please select a device from the list".
## Implementation 

This application uses a [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE) component to:
*  Search for nearby SensorTag devices.
*  Search for the services that a SensorTag device offers, and subscribe to those services.
*  Display the data received from the SensorTag device.
This application implements custom event handlers for [OnEndDiscoverServices](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.OnEndDiscoverServices), [OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.OnCharacteristicRead), and [OnEndDiscoverDevices](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.OnEndDiscoverDevices) events.
### Main Form 


*  The application defines the following event handlers:

* `Button1Click`: Calls the [DiscoverDevices](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices) method of the Bluetooth component.
* `Button2Click`: Calls the [DiscoverServices](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.DiscoverServices) method of the Bluetooth component. The parameter that it passes to the method is the currently selected device from the list.
* `BluetoothLE1EndDiscoverDevices`: Occurs when the [discovery](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices) of devices finishes. This method filters the discovered devices by name and displays all The devices named "SensorTag" or "TI BLE Sensor Tag" on the `Listbox1` control.
* `BluetoothLE1EndDiscoverServices`: This method scans for services that the SensorTag device offers and subscribes to those services. Specifically, it subscribes to "UUID_IRT_SERV" (the IR temperature service), "UUID_ACC_SERV" (the accelerometer service)) and "UUID_HUM_SERV" (the humidity service).
* `BluetoothLE1CharacteristicRead`: Occurs when a SensorTag device send new data for any service that you subscribed. This method extracts and converts the data so that it is suitable for display in the corresponding [TEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/FMX.Edit.TEdit) control.

*  The application also defines the following methods:

* `shortSignedAtOffset`: This method returns the provided integer as [signed](http://en.wikipedia.org/wiki/Signedness).
* `shortUnsignedAtOffset`: This method returns the provided integer as [unsigned](http://en.wikipedia.org/wiki/Signedness)..
* `extractAmbientTemperature`: Extracts and returns the value for ambient temperature from the data provided by the SensorTag device.
* `extractTargetTemperature`: Extracts and returns the value for target temperature from the data provided by the SensorTag device.
The methods listed above are based on the code snippets published on the official SensorTag documentation: [SensorTag User Guide](http://processors.wiki.ti.com/index.php/SensorTag_User_Guide#Gatt_Server).
## Uses 


* [System.Bluetooth.Components.TBluetoothLE](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components.TBluetoothLE)

## See Also 


* [SensorTag User Guide](http://processors.wiki.ti.com/index.php/SensorTag_User_Guide)
* [SensorTag](http://processors.wiki.ti.com/index.php/Simplelink_SensorTag) homepage

* [Signedness](http://en.wikipedia.org/wiki/Signedness)

* [System.Bluetooth.Components](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Bluetooth.Components)

* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Beacons)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Bluetooth_Low_Energy)

* [iBeacon](http://en.wikipedia.org/wiki/iBeacon)






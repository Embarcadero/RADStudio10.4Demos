RTL.ClassicBluetooth Sample[]()
# RTL.ClassicBluetooth Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)

* [2.1 Bluetooth settings](#Bluetooth_settings)
* [2.2 Service demo](#Service_demo)

* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 TForm1](#TForm1)
* [4.2 TServerConnectionTH](#TServerConnectionTH)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Classic Bluetooth Basic app** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Classic Bluetooth Basic app`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\Classic Bluetooth Basic app`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Classic%20Bluetooth%20Basic%20app](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Classic%20Bluetooth%20Basic%20app)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Classic%20Bluetooth%20Basic%20app](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Classic%20Bluetooth%20Basic%20app)

## Description 

**Note:** This sample application does not work on iOS devices. For more information about platform support, see [Using Classic Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Classic_Bluetooth).This sample provides a **FireMonkey** application that is based on [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) with two different [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem): **Bluetooth settings** and **Service demo**.You need another device that supports [Classic Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Classic_Bluetooth) to use this sample. You can try the functionality of a simple text service presented in the **Service demo** tab only if you install this sample on another device.

### Bluetooth settings 

The **Bluetooth settings**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides options for discovering, pairing/unpairing devices and displaying services available on the paired device. 
*  The `Labeldiscoverable` control shows the name under which other devices can see your device.
* **Discover devices**: The `ButtonDiscover` control fires the `ButtonDiscoverClick` event handler.
* **Pair**: The `ButtonPair` control fires the `ButtonPairClick` event handler.
* **UnPair**: The `ButtonUnPair` control fires the `ButtonUnPairClick` event handler.
*  The `ComboBoxDevices` control allows you to choose a device from the list of discovered devices.
* **Paired Devices**: The `ButtonPairedDevices` control fires the `ButtonPairedDeviceClick` event handler.
*  The `ComboBoxPaired` control allows you to choose a device from a list of paired devices. If there are any paired devices when you start the application, the first device on the list is automatically chosen.
* **Services**: The `ButtonServices` control fires the `ButtonServicesClick` event handler.
*  The `ComboBoxServices` control allows you to choose a service from a list of available services.
*  The `DisplayR` control shows text output from the application, such as feedback on button clicks or errors that occur.

### Service demo 

The **Service demo**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides both server and client functionality for a simple text service.
* **Create text service**: The `ButtonOpenReadingSocket` control fires the `ButtonOpenReadingSocketClick` event handler.
* **Remove text service**: The `ButtonCloseReadingSocket` control fires the `ButtonCloseReadingSocketClick` event handler.
* **Send text to->**: The `ButtonConnectToRFCOMM` control fires the `ButtonConnectToRFCOMMClick` event handler.
*  The `LabelNameSarver` displays the name of the device that you selected from the list of paired devices.
*  The `Edit1` control allows you to modify the text that you send to the other device (default is "I am the text sent").
* **Clear**: The `Button2` control fires the `Button2Click` event handler.
* **Free Client Socket**: The `FreeSocket` control fires the `FreeSocketClick` event handler.
*  The `DisplayR` control shows text output from the application, such as feedback on button clicks or errors that occur.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **ClBluetooth.dproj**.
*  C++: **ClBluetoothCpp.cbproj**.

2.  As a target platform, select a device that supports Classic Bluetooth.**Note:** For more information about client platform support on Classic Bluetooth, see [Using Classic Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Classic_Bluetooth).
3.  Press **F9** or choose **Run > Run**.
4.  Discover devices.
5.  Choose a device from the list of discovered devices.
6.  Pair with that device.**Note:** On Android, after you successfully pair two devices you need to force-close (close in task manager) the application and reopen it. The paired device will then show in the list of paired devices. Pairing is not supported on Android lower than 4.4. To use this application on a device that has a lower version of Android, pair the devices using native system functionality and then run the sample application.
7.  See the services available on the paired device.**Note:** Devices with Android system version lower than 4.0.3. do not support this functionality.
8.  Unpair from a device (not supported on Android).
To try the functionality of the simple text service presented in the **Service demo** tab, you need to install this sample on another device. Follow the steps 1-6 from above on the second device and then:
1.  Choose the Service demo tab.
2.  Create a text service (on one or both of the devices).
3.  Send text from one device to the other (the receiving device needs to have a previously-created text service).**Note:** In C++ version, you need to free the client socket before sending the text (if you do not, the "Broken pipe" error will show).
4.  You can remove the text service and create it again.**Note:** In Delphi version, creating the text service after removing it has no effect. If you remove the text service you need to close the application and reopen it in order to use the text service.

## Implementation 

On initialization, the `FormShow` procedure creates a reference of the [current Bluetooth manager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.Current) and its [adapter](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.CurrentAdapter). If it successfully connects to the manager, it updates the `ComboBoxPaired` with the list of paired devices and displays the name of your device in the `Labeldiscoverable` control. If you run the sample application on an unsupported device or with the Bluetooth module turned off, `FormShow` shows the following exception in an alert: "Bluetooth device not found: disconnected or turned off".
### TForm1 


*  The application defines the following event handlers:

* `ButtonPairClick` calls the [Pair](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothAdapter.Pair) method of the current adapter. The parameter it passes, is the device that you select from the list of discovered devices. If you do not select a device, the event handler displays an alert: "No device selected".
* `ButtonUnPairClick` calls the [UnPair](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothAdapter.UnPair) method of the current adapter. The parameter it passes, is the device that you select from the list of paired devices. If you do not select a device, the event handler displays an alert: "No Paired device selected".
* `ComboBoxPairedChange` occurs every time the list of paired devices is updated. `ComboBoxPairedChange` updates the value displayed in the `LabelNameSarver` on the **Service Demo** tab with the name of the selected device from the list of paired devices.
* `ButtonPairedDeviceClick` calls `PairedDevices` and opens the `ComboboxPaired` control.
* `ButtonServicesClick` clears the `ComboBoxServices` control, adds the names of [services](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothDevice.GetServices) available on the device you selected from the list of paired devices to the `ComboBoxServices` control and opens the `ComboBoxServices` control. If you do not select a device, the event handler displays an alert: "No paired device selected".
* `FreeSocketClick` frees the instance of [TBluetoothSocket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket) that you initialize the first time you send text in the **Service demo** tab and displays the message "Client socket set free" in the `DisplayR` control. This method allows you to solve the problem where you cannot send the text to a device after removing and creating a text service on that device, because the client socket is still connected to the previous service.
* `Button2Click` clears all the text in the `DisplayR` control.
* `ButtonConnectToRFCOMMClick` calls `SendData` that tries to send the text in the `Edit1` control to the device that you select from the list of paired devices. If you do not select a device, `ButtonConnectToRFCOMMClick` displays the exception "Argument out of range" in the `DisplayR` control. If the paired device that you send the text to does not have a text service running, `ButtonConnectToRFCOMMClick` displays the exception "IOException: read failed, socket might closed, read ret: -1" in the `DisplayR` control. If the paired device, that you send the text to, removes the text service and creates a new one, `ButtonConnectToRFCOMMClick` displays the exception "IOException: Broken pipe" in the `DisplayR` control. You can solve this problem by using the "Free Client Socket" functionality on the sending device.
* `ButtonDiscoverClick` clears the `ComboboxDevices` control and [starts a discovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.StartDiscovery) with a timeout of 10 seconds. `ButtonDiscoverClick` also assignes the `DevicesDiscoveryEnd` event handler to the [OnDiscoveryEnd](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.OnDiscoveryEnd) event of the manager.
* `DevicesDiscoveryEnd` handles the [OnDiscoveryEnd](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.OnDiscoveryEnd) event of the manager. `DevicesDiscoveryEnd` adds the names of discovered devices to the `ComboboxDevices` controls and selects the first device.
* `ButtonOpenReadingSocketClick` calls `TServerConnectionTH.Create` to initialize an instance of the `TServerConnectionTH` class. Then `ButtonOpenReadingSocketClick`[creates a server socket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothAdapter.CreateServerSocket) for that instance and calls `TServerConnectionTH.Start` to start the server thread. Finally, `ButtonOpenReadingSocketClick` displays a message in the `DisplayR` control: " - Service created: <ServiceName>". If you start the application on an unsupported device or with the Bluetooth module turned off, `ButtonOpenReadingSocketClick` displays the exception "No Bluetooth device found" in the `DisplayR` control.
* `ButtonCloseReadingSocketClick` calls `TServerConnectionTH.Terminate` and `TServerConnectionTH.WaitFor` and then frees the instance of `TServerConnectionTH` that was created in `ButtonOpenReadingSocketClick`. Finally, `ButtonCloseReadingSocketClick` displays a message in the `DisplayR` control: " - Service removed -".

*  The application also defines the following methods:

* `PairedDevices` clears the `ComboboxPaired` control and adds the names of the [paired devices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.GetPairedDevices) of the current manager to the `ComboboxPaired` control. If there are no paired devices, `PairedDevices` displays a message "No Paired Devices" in the `DisplayR` control.
* `GetServiceName` accepts a Bluetooth service [GUID](http://docwiki.embarcadero.com/Libraries/en/System.TGUID) as a parameter and returns the name of the corresponding Bluetooth service.
* `ManagerConnected` returns `True` if the [connection state](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.ConnectionState) of the manager is [Connected](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothConnectionState) and sets the text of `Labeldiscoverable` to "Device discoverable as <CurrentAdapter.[AdapterName](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothCustomAdapter.AdapterName)>". If the connection state is `False` it displays a message "No Bluetooth device found" in the `DisplayR` control and returns `False`.
* `SendData` converts the text in the `Edit1` control into [bytes](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.TBytes) and [sends them](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket.SendData) to the device you selected from the list of paired devices. If the client [socket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket) instance is nil, `SendData` calls [CreateClientSocket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothDevice.CreateClientSocket). If the socket creation fails, `SendData` displays an alert "Out of time -15s-". If you did not select a device from the list of paired devices, `SendData` displays an alert "No paired device selected". If `SendData` sucessfully sends the text, it displays a message "Text Sent" in the `DisplayR` control.

### TServerConnectionTH 

This application implements a class **TServerConnectionTH** that is a subclass of [TThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread). This class provides the methods that support the server-side functionality of the text service on the **Service demo** tab.
* **TServerConnectionTH** defines the following methods:

* `Create` is the constructor.
* `Destroy` is the destructor that frees the [client socket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket) and the [server socket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket) instance of this class.
* `execute` is the implementation of the [Execute](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.Execute) method that runs when the thread is run. `execute` listens for incoming data on the instance of the server socket. When the data arrives, `execute` converts that data into a string and displays it in the `DisplayR` control. If the connected client device frees its socket, `execute` displays the exception "Server Socket closed: Channel is closed, cannot read data" in the `DisplayR` control.

## Uses 


* [System.SysUtils](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils)
* [System.Types](http://docwiki.embarcadero.com/Libraries/en/System.Types)
* [System.UITypes](http://docwiki.embarcadero.com/Libraries/en/System.UITypes)
* [System.Classes](http://docwiki.embarcadero.com/Libraries/en/System.Classes)
* [System.Variants](http://docwiki.embarcadero.com/Libraries/en/System.Variants)
* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [FMX.Types](http://docwiki.embarcadero.com/Libraries/en/FMX.Types)
* [FMX.Controls](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls)
* [FMX.Forms](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms)
* [FMX.Graphics](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics)
* [FMX.Dialogs](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs)
* [FMX.Layouts](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts)
* [FMX.ListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox)
* [FMX.StdCtrls](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls)
* [FMX.Memo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo)
* [FMX.Controls.Presentation](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation)
* [FMX.Edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit)
* [FMX.TabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl)
* [FMX.ScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ScrollBox)

## See Also 


* [Using Classic Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Classic_Bluetooth)
* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)

* [System.Bluetooth.TBluetoothManager.CurrentAdapter](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.CurrentAdapter)
* [System.Bluetooth.TBluetoothManager.Current](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.Current)
* [System.Bluetooth.TBluetoothManager.StartDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.StartDiscovery)
* [System.Bluetooth.TBluetoothManager.GetPairedDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.GetPairedDevices)
* [System.Bluetooth.TBluetoothManager.ConnectionState](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothManager.ConnectionState)

* [System.Bluetooth.TBluetoothSocket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket)
* [System.Bluetooth.TBluetoothSocket.SendData](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothSocket.SendData)

* [System.Bluetooth.TBluetoothAdapter.Pair](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothAdapter.Pair)

* [System.Bluetooth.TBluetoothDevice.GetServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothDevice.GetServices)
* [System.Bluetooth.TBluetoothDevice.CreateClientSocket](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothDevice.CreateClientSocket)

* [System.TGUID](http://docwiki.embarcadero.com/Libraries/en/System.TGUID)
* [System.SysUtils.TBytes](http://docwiki.embarcadero.com/Libraries/en/System.SysUtils.TBytes)

* [System.Classes.TThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread)
* [System.Classes.TThread.Execute](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.Execute)






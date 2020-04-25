FireDAC.TFDEventAlerter Sample[]()
# FireDAC.TFDEventAlerter Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample describes how to work with database events. TFDEventAlerter is used to receive event notifications.
## Location 

You can find the **TFDEventAlerter** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDEventAlerter\Main**.

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDEventAlerter/Main](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDEventAlerter/Main).

## Description 

This sample uses the **Use Connection Definition** drop-down menu to select a connection definition. If the database supports events, then the application fills the supported event kinds. You can register and unregister to an event. Click **Fire events** to start receiving the alerts when you are registered to the event.

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **EventAlerter.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select a connection definition from the **Use Connection Definition** drop-down menu.
4.  Select the event kind or leave **Default**.
5.  Click **Register events** to register to the database events in order to receive notifications.
6.  Click **Fire events** to trigger the events.
7.  Click **Unregister events** to unregister to the database events to stop receiving notifications.
**Note:** The notifications are shown on the TMemo.
## Implementation 


* **Use Connection Definition** drop-down menu:
The menu shows all the connections defined on the file at **C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionsDefs.ini**.If the database supports events, then the application fills the supported event kinds.
The [Kind](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDEventAlerterOptions.Kind) argument of the [Options](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.Options) property of the [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) is set to the event alerter type or empty to use the default alerter.
Once the connection is defined, the **Register events** button is enabled to register and start accepting events.

* **Register events** button:
To start receiving the event alert, the [Register](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomEventAlerter.Register) method is called. You can also set the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.Active) property of the [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) to **True**.Once you click **Register events**, the rest of buttons are enabled.

* **Fire events** button:
Click **Fire events** to trigger the alerts.When there is an alert, the [OnAlert](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.OnAlert) event handler is called and the event name and arguments are shown on the TMemo.
When there are no alerts for a "Timeout" period of time, the [OnTimeout](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.OnTimeout) event handler is called and the **Timeout** message appears on the TMemo. The timeout period is set by specifying the [Timeout](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDEventAlerterOptions.Timeout) argument of the [Options](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.Options) property of the [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter).
The value is set to `1000` ms by default (1 sec).

* **Unregister events** button:
To stop receiving the event alerts, the [Unregister](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomEventAlerter.Unregister) method is called by clicking **Unregister events**. You can also set the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.Active) property of the [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) to **False** to unable alerts.
## Uses 


* [FireDAC.Comp.Client.TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Database Alerts (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Database_Alerts_(FireDAC))






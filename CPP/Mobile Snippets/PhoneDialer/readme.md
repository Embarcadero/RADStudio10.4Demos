FMX.PhoneDialer Sample[]()
# FMX.PhoneDialer Sample 


This sample demonstrates how to use the [PhoneDialer](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer) API in order to make a phone call and to obtain the carrier information.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **PhoneDialer** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\PhoneDialer`
* `CPP\Mobile Snippets\PhoneDialer`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/PhoneDialer](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/PhoneDialer)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/PhoneDialer](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/PhoneDialer)

## Description 

The **PhoneDialer** sample demonstrates how to use the [PhoneDialer](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer) API in order to make a phone call on Android and iOS devices. The sample uses [IFMXPhoneDialerService.GetCarrier](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer.IFMXPhoneDialerService.GetCarrier) to obtain the carrier information and [IFMXPhoneDialerService.Call](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer.IFMXPhoneDialerService.Call) to make a phone call.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **PhoneDialer.dproj**.
*  C++: **PhoneDialer.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample:

*  Click on the **Get Carrier Info** button to see the following carrier information: **Carrier Name**, **ISO Country Code**, **Network Code** and **Mobile network**.
*  Write the Phone number on the box under the **Telephone Number** label.
*  Click on the **Make Call** button to make a phone call.

## Files 



|**File in Delphi**   |**File in C++**                          |**Contains**                                   |
|---------------------|-----------------------------------------|-----------------------------------------------|
|**PhoneDialer.dproj**|**PhoneDialer.cbproj**                   |The project itself.                            |
|**uMain.fmx**        |**uMain.fmx**                            |The main form where the components are located.|
|**uMain.pas**        |**PhoneDialerPCH.h**, **PhoneDialer.cpp**|Used to define and implement the sample.       |
|**Information.txt**  |**Information.txt**                      |Further information about the sample.          |


## Classes 

**TPhoneDialerForm** is the main form that represents the main window of the sample. It contains the following components:
*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects:

* [TButton1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnGetCarrierInfo**.
* [TButton2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) called **btnMakeCall**.

*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) object containing four [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem):

* [TListBoxItem1](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **CarriernameItem**.
* [TListBoxItem2](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **CountryCodeItem**.
* [TListBoxItem4](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **NetworkCodeItem**.
* [TListBoxItem3](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) called **MobilenetworkItem**.

* [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) object.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) to display a set of items with the carrier information.
*  The sample uses [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to activate different [IFMXPhoneDialerService](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer.IFMXPhoneDialerService_Methods) methods.
*  The sample uses [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) to create an edit box to enter the phone number to which the user is going to call.
When you run the application, there are four [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), two [TButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) and a [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box. If you click the **Get Carrier Info** button, the four [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) are filled with the carrier information. Moreover, if you want to make a phone call, you have to introduce the phone number into the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) box under the **Telephone Number** label and click on the **make Call** button.
## Uses 


* [PhoneDialer](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer)
* [IFMXPhoneDialerService.GetCarrier](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer.IFMXPhoneDialerService.GetCarrier)
* [IFMXPhoneDialerService.Call](http://docwiki.embarcadero.com/Libraries/en/FMX.PhoneDialer.IFMXPhoneDialerService.Call)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit)

## See Also 


* [List Boxes and Check-list Boxes](http://docwiki.embarcadero.com/RADStudio/en/List_Boxes_and_Check-list_Boxes)
* [Mobile Tutorial: Using the Phone Dialer on Mobile Devices](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Phone_Dialer_on_Mobile_Devices_(iOS_and_Android))






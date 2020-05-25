FMX.SettingsProject Sample[]()
# FMX.SettingsProject Sample 


This is a sample that shows a set of dialog boxes similar to those used for mobile device settings, using **FireMonkey**.
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

You can find the **FireMonkeyMobile SettingsDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\Settings Project`
* `CPP\Multi-Device Samples\User Interface\Settings Project`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Settings%20Project](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Settings%20Project)
* [https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Settings%20Project](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Multi-Device%20Samples/User%20Interface/Settings%20Project)

## Description 

This application uses [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction) methods and properties to implement actions on [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **SettingsDemo.dproj**
*  C++: **SettingsDemo.cbproj**

2.  Press **F9** or choose **Run > Run**.

## Files 

The sample files are **SettingsProjectForm**, the main form that constitutes the user interface for the **FireMonkeyMobile Settings Project** Sample application and **SettingsDemo**, the project itself.
## Classes 

**FireMonkey TSettingsForm** represents the main window of the sample. It contains the following components:
*  Two [TToolBars](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
*  A [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
*  Two [TTabItems](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), named _TabItem1_ and _TabItem2_
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) named _SettingsList1_

*  Three [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named _AccountType_, _PaymentType_, _RenewalType_
*  Two [TListBoxGroupHeaders](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named _AccountInfo_ and _SyncSettings_
*  Three [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem), named _SyncUSB_, _SyncWifi_, _SyncCollections_
*  Three [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)

*  A [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) named _SettingsDetails_
*  A [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) named _SettingsList2_

*  Six [TListBoxItems](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named _SelectAcctType_, _SelectPayment_, _Business_, _Personal_, _CreditCard_, _Check_.
*  Two [TComboBoxs](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) named _AcctCombo_ and _PaymentCombo_
*  A [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named _AcctTypes_

*  A [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
*  Two [TLinkFillControlToProperty](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToProperty)
*  A [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton)
*  A [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
*  A [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction)
*  A [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named _SelectRenewal_

*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) named _RenewalCombo_
*  Three [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named _Monthly_, _Annually_, _Quarterly_

*  A [TLinkFillControlToProperty](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToProperty)

## Implementation 


*  The **FireMonkeyMobile Settings Project** Sample application uses the [TChangeTabAction](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction) method [Execute](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TCustomAction.Execute) and the [Tab](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction.Tab) property to change the action on the respective tab.
*  The sample also provides an example for the usage of [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch).

## Uses 


* [FMX.ListBox.TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [FMX.ListBox.TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader)
* [FMX.ListBox.TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem)
* [FMX.StdCtrls.TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar)
* [FMX.Layouts.TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [FMX.StdCtrls.TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch)
* [FMX.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel)
* [FMX.StdCtrls.TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton)
* [Data.Bind.Components.TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)
* [Data.Bind.Components.TLinkFillControlToProperty](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TLinkFillControlToProperty)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)






FMX.MessageAlerts Sample[]()
# FMX.MessageAlerts Sample 


This sample uses [ShowMessage](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage) and [MessageDlg](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.MessageDlg) to shows how to pop up different alert messages.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **MessageAlerts** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Mobile Snippets\MessageAlerts`
* `CPP\Mobile Snippets\MessageAlerts`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/MessageAlerts](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Mobile%20Snippets/MessageAlerts)
* **C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/MessageAlerts](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Mobile%20Snippets/MessageAlerts)

## Description 

The **MessageAlerts** sample shows how to pop up alert messages on iOS or Android devices. This shample shows two different alert messages that are named **Standard One Button Alert** and **Multi Button Alert**. For the **Standard One Button Alert**, the sample uses [ShowMessage](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage) to show a simple message box that contains a text message and an **OK**[button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton). For the **Multi Button Alert**, the sample uses [MessageDlg](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.MessageDlg) to pop up a multiple-button alert that triggers different code blocks according to its input.
## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **MessageAlerts.dproj**.
*  C++: **MessageAlerts.cbproj**.

2.  Select the target platform, iOS and Android supported.
3.  Press F9 or choose **Run > Run**.
4.  Interact with the sample.

*  Click **Standard One Button Alert** to see a simple alert message.
*  Click **Multi Button Alert** to pop up a multiple-button alert message.

*  Click one of the multiple buttons of the alert message.

## Files 



|**File in Delphi**     |**File in C++**                              |**Contains**                                   |
|-----------------------|---------------------------------------------|-----------------------------------------------|
|**MessageAlerts.dproj**|**MessageAlerts.cbproj**                     |The project itself.                            |
|**uMain.fmx**          |**uMain.fmx**                                |The main form where the components are located.|
|**uMain.pas**          |**MessageAlertsPCH.h**, **MessageAlerts.cpp**|Used to define and implement the sample.       |
|**Information.txt**    |**Information.txt**                          |Further information about the sample.          |


## Classes 

**TMessageAlertsForm** is the main form that represents the main window of the sample. It contains the following components:
*  Two [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects.
*  A [ToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) object with a [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) object.

## Implementation 


*  The sample uses [Tbutton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to pop up the alert messages.
When you run the application you see two different buttons named **Standard One Button Alert** and **Multi Button Alert**. If you click **Standard One Button Alert**, the sample uses [ShowMessage](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage) to show a simple message box that contains a 'Hello World!' message and an **OK**[button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton). If you click the **Multi Button Alert**, the sample uses [MessageDlg](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.MessageDlg) to pop up a multiple-button alert that triggers a different message according to the button you choose.
## Uses 


* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [ShowMessage](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage)
* [MessageDlg](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.MessageDlg)

## See Also 


* [Using Notifications](http://docwiki.embarcadero.com/RADStudio/en/Using_Notifications)
* [Mobile Tutorial: Using Notifications (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Notifications_(iOS_and_Android))

### Samples 


* [MessageDlg_(Delphi)](http://docwiki.embarcadero.com/CodeExamples/en/MessageDlg_%28Delphi%29)
* [MessageDlg_(C++)](http://docwiki.embarcadero.com/CodeExamples/en/MessageDlg_%28C%2B%2B%29)






FireDAC.IFDPhysCommand.EscapeFunctions Sample[]()
# FireDAC.IFDPhysCommand.EscapeFunctions Sample 


This sample demonstrates how to use the FireDAC [escape function](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC)#Escape_Sequences) sequences.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **EscapeFunctions** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysCommand\EscapeFunctions`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/EscapeFunctions](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/EscapeFunctions)

## Description 

The **EscapeFunctions** sample shows you how to use the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to execute FireDAC [escape function](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC)#Escape_Sequences) sequences. To this end, the sample predefines some escape function sequences. To execute a predefined escape function, right-click the **Function** edit box and choose a predefined escape function from the [popup menu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TPopupMenu). Moreover, the sample allows you to write your own function. To this end, write text into the **Function** edit box and press **Enter**. Then, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare), [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define), [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) and [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) methods of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to process the escape function command text.**Note**: Go to the following [page](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC)#Escape_Sequences) to see the syntax of the escape function sequences.
## How to Use the Sample 


1.  Navigate to the location given above and open `EscapeFunctionsdproj`.
2.  Press F9 or choose **Run > Run**.
3.  Interact with the sample:

1.  Right-click the **Function** edit box and select a predefined escape function sequence.
2.  Write your own escape function and press **Enter**.

## Files 



| File in Delphi                             | Contains          |
|--------------------------------------------|-------------------|
|`EscapeFunctions.dproj``EscapeFunctions.dpr`|The project itself.|
|`fEscapeFunctions.pas``fEscapeFunctions.fmx`|The main form.     |


## Implementation 

To preset the [escape function](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC)#Escape_Sequences) sequences, the sample configures the following components at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**:
*  A [TPopupMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TPopupMenu) object named **pmnFunc**. The sample sets the [Items](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TMenu.Items) property of this object with a menu of several predefined escape function sequences.
*  A [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) object labeled as **Function**. The sample sets the [PopupMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit.PopupMenu) property of the component to `pmnFunc` at design time. This setup allows you to choose a predefined escape function sequence in run time. To this end, right-click inside the edit box to see the popup menu. Then, choose a predefined escape function from the menu.
Moreover, when you run the application, you can interact with the sample using the following objects:
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. Click the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. The menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. When the connection is defined, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command interface. Then, the sample enables the edit boxes labeled as: **Function**, **SQL string** and **Result**.

*  A [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) object labeled as **Function**. The sample uses this object to let you choose/write an escape function sequence:

*  To choose a predefined escape function, right-click inside the edit box to see the popup menu. Then, choose a predefined escape function.
*  To write an escape function, type your own command text inside the edit box and press **Enter**.
When you chose/write the escape function, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare), [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define), [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) and [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) methods of the [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) interface to process the scape function command text.
*  A [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) object labeled as **SQL string**. The sample uses this edit box to show the `SELECT` command text that is executed. The Command text is the following: `'select distinct {fn %s} from {id test_free}'`, where `%s` corresponds to the escape function selected/written in the **Function** edit box.
*  A [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit) object labeled as **Result**. The sample uses this edit box to show the result of the escape function execution.

## Uses 


* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)
* [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open)
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch)

* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TPopupMenu](http://docwiki.embarcadero.com/Libraries/en/Vcl.Menus.TPopupMenu)
* [TLabeledEdit](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TLabeledEdit)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Preprocessing Command Text (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC))

### Samples 


* [FireDAC IFDPhysCommand Macros](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.Macros_Sample) sample






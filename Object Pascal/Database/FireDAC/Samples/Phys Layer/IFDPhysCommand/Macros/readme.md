FireDAC.IFDPhysCommand.Macros Sample[]()
# FireDAC.IFDPhysCommand.Macros Sample 


This sample demonstrates how to use the [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Macros) property of [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand).
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

You can find the **Macros** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Phys Layer\IFDPhysCommand\Macros`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Macros](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Phys%20Layer/IFDPhysCommand/Macros)

## Description 

The **Macros** sample shows you how to use the [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Macros) property of [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) in order to parameterize parts of the SQL query. The sample allows you to modify the macro values at run time.**Note**: See the [Preprocessing Command Text](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC)) topic for more information about parameterizing SQL command texts. 
## How to Use the Sample 


1.  Navigate to the location given above and open `IFDPhys_Macros.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.
4.  Interact with the sample:

*  Modify the values of the **Macros** to retrieve the desired data. For example, change `'Address'` to `'First Name'`.
*  Click the **Fetch** button and see the retrieved data.

## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`IFDPhys_Macros.dproj``IFDPhys_Macros.dpr`|The project itself.|
|`fMacros.pas``fMacros.fmx`                |The main form.     |


## Implementation 

When you run the application, you see the following components that are configured on run time:
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Use Connection Definition**. When you click the **Use Connection Definition** combo box, the menu shows all the persistent connections defined on the file `C:\Users\Public\Documents\Embarcadero\Studio\FireDAC\FDConnectionDefs.ini`. Select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. When the connection is defined, the sample uses the [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand) method of [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection) to create a command interface. Then, the sample sets up five [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Macros) that are used on the SQL statement: `COLUMN`, `TAB`, `ID`, `Sign`, `IDVALUE`. Finally, the sample fills the **lstMacros** list editor with the predefined **Macros** and enables the **lstMacros**, **Data type** and **Fetch** objects.
*  A [TValueListEditor](http://docwiki.embarcadero.com/Libraries/en/Vcl.ValEdit.TValueListEditor) object named **lstMacros**. The sample use this object to show and modify the list of **Macros**. Modify the value of any **Macro** to modify the SQL query. For example, change `'Address'` to `'First Name'` and click the **fetch** button. The information that retrieves the SQL query is different.
*  A [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) object labeled as **Data type**. This object allows you to change the [data type](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDMacroDataType) of the selected **Macros** value.
*  A [Tbutton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) object called **Fetch**. Click the **Fetch** button to retrieve the desired data using the defined **Macros** and the following SQL command text: `'select !column from !tab where (!id !Sign !idValue)'`. To this end, the sample uses the [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare), [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define), [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open) and [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch) methods of the [command interface](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand) created before.
*  A [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object named **mmSQL**. The sample uses this object to show the SQL command text.
*  A [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo) object named **Console**. The sample uses this object to display the retrieved data from the `SELECT` statement.

## Uses 


* [IFDPhysConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection)

* [CreateCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysConnection.CreateCommand)

* [IFDPhysCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand)

* [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Macros)
* [Prepare](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Prepare)
* [Define](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Define)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Open)
* [Fetch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.Intf.IFDPhysCommand.Fetch)

* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)
* [TValueListEditor](http://docwiki.embarcadero.com/Libraries/en/Vcl.ValEdit.TValueListEditor)
* [Tbutton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)
* [TMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TMemo)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Preprocessing Command Text (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC))

* [Character Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Character_Macro_Functions_(FireDAC))
* [Numeric Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Numeric_Macro_Functions_(FireDAC))
* [Date and Time Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Date_and_Time_Macro_Functions_(FireDAC))
* [System Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/System_Macro_Functions_(FireDAC))
* [Convert Macro Function (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Convert_Macro_Function_(FireDAC))

### Samples 


* [FireDAC TFDQuery Macros](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Macros_Sample) sample
* [FireDAC IFDPhysCommand Escape Functions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.EscapeFunctions_Sample) sample






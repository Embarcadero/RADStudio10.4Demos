FireDAC.TFDQuery.Macros Sample[]()
# FireDAC.TFDQuery.Macros Sample 


This sample demonstrates how to use the [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Macros) property of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).
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

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\Macros`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Macros](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/Macros)

## Description 

The **Macros** sample shows you how to use the [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Macros) property of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) in order to parameterize parts of the SQL query. The sample allows you to modify the macro values at run time.
## How to Use the Sample 


1.  Navigate to the location given above and open `Macros.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.
4.  Interact with the sample:

*  Modify the **Macros** values.
*  Click on the **Open Query** button.

## Files 



| File in Delphi           | Contains          |
|--------------------------|-------------------|
|`Macros.dproj``Macros.dpr`|The project itself.|
|`fMacros.pas``fMacros.fmx`|The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryMain**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to specify the FireDAC connection object that is used to connect to a DBMS.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property to `select !column from !tab where !id !Sign !idValue`. It specifies the SQL statement to execute for the query. On run time, when you click on the **Open Query** button, the **Macro** values are substituted in the place of their names in the SQL statement.
*  Set up the [macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Macros) property. The sample sets the five macros used on the SQL statement: `COLUMN`, `TAB`, `ID`, `Sign`, `IDVALUE`.
*  Set the [MacroCreate](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDResourceOptions.MacroCreate) property of **ResourceOptions** to `True`.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `qryMain`, and the **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample [enables](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.Enabled) the **Open Query** button. Then, if you click on the **Open Query** button, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryMain** in order to execute the SQL statement. The SQL statement is executed using the **Macros** values in order to retrieve the corresponding data, which is displayed using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample in run time:
*  Modify the **Macros** values.
*  Choose the corresponding **Data Type**.
*  Click on the **Open Query** button

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Macros](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Macros)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))
* [Preprocessing Command Text (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC))

* [Character Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Character_Macro_Functions_(FireDAC))
* [Numeric Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Numeric_Macro_Functions_(FireDAC))
* [Date and Time Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Date_and_Time_Macro_Functions_(FireDAC))
* [System Macro Functions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/System_Macro_Functions_(FireDAC))
* [Convert Macro Function (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Convert_Macro_Function_(FireDAC))

### Samples 


* [FireDAC TFDQuery Filter](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Filter_Sample) sample
* [FireDAC TFDQuery Aggregates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Aggregates_Sample) sample
* [FireDAC TFDQuery Indices](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Indices_Sample) sample
* [FireDAC IFDPhysCommand Macros](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.IFDPhysCommand.Macros_Sample) sample






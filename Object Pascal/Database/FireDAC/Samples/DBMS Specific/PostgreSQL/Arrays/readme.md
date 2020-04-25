FireDAC.PostgreSQL Arrays Sample[]()
# FireDAC.PostgreSQL Arrays Sample 


This sample demonstrates how to use the [TFDParam.ArrayType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ArrayType) property to send arrays to a [PostgreSQL](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC)) database server using [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
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

You can find the **Arrays** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\PostgreSQL\Arrays`

* **GitHub Repository**:

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/PostgreSQL/Arrays](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/PostgreSQL/Arrays)

## Description 

The **Arrays** sample shows you how to use the [TFDParam.ArrayType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ArrayType) property to send arrays to a PostgreSQL database server. To this end, the **ArrayType** property is set to `atTable`.
## How to Use the Sample 


1.  Navigate to the location given above and open `PGArrays.dproj`.
2.  Press **F9** or choose **Run > Run**.

## Files 



| File in Delphi               | Contains          |
|------------------------------|-------------------|
|`PGArrays.dproj``PGArrays.dpr`|The project itself.|
|`fMain.pas``fMain.fmx`        |The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) object named **FDConnection1**. This is the FireDAC connection object that the sample uses to connect to a DBMS. The sample sets the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property to `PG_Demo`.

*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **FDQuery1**. This component implements a dataset capable of executing SQL queries. The sample sets its [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property to `FDConnection1` to specify the FireDAC connection object.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the sample sets the following properties:

*  The **DataSet** property of **DataSource** is set to `FDQuery1`.
*  The **DataSource** property of **DBGrid1** is set to `DataSource1`.
When you run the application, you see a grid, a combo box and two buttons labeled as **PG Read** and **PG Write**. The purpose of these components in this sample is the following:
* [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) - This sample uses the grid to display the arrays.
* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) - Use the combo box to choose whether to define the array as `ftArray` or `ftDataSet`.
* [TButtons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) - Both buttons have an **OnClick** event to do the following:

* **PG Read**:
Uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method to read the arrays from the database server. The sample displays the arrays on the grid.

* **PG Write**:
Press this button to send arrays to a database server. When you press this button, the sample takes the following steps:

1.  Uses the **Text** property of [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.SQL) to set the SQL command that **FDQuery1** will execute.
2.  Sets the [TFDParam.DataTypeName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.DataTypeName) to specify the field name as `<TableName>.<FieldName>`.
3.  Sets the [TFDParam.ArrayType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ArrayType) property to `atTable`.**Note**: If you set it to `atArray` it does not work.
4.  Sets the array size with the [TFDParam.ArraySize](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ArraySize) property.
5.  Sets the arrays using the [AsStrings](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDMacro.AsString) property:
6.  Sends the arrays to the database server by [executing the SQL command](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL) specified in the first step.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [FMX.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton)
* [Vcl.StdCtrls.TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Connect to PostgreSQL](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC))
* [Working with Commands](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))
* [FireDAC.Stan.Param.TFDParam.ArrayType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ArrayType)

### Samples 


* [FireDAC InterBase Arrays](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InterBase_Arrays_Sample) sample
* [FireDAC PostgreSQL Ranges](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.PostgreSQL_Ranges_Sample) sample






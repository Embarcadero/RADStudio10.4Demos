FireDAC.TFDTableAdapter.Main Sample[]()
# FireDAC.TFDTableAdapter.Main Sample 


This sample demonstrates how to use the [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) class to provide communication between the application and the database.
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

You can find the **TableAdapter** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDTableAdapter\Main`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDTableAdapter/Main](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDTableAdapter/Main)

## Description 

The **TableAdapter** sample shows you how to use [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) to transfer data from [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) into [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). To this end, the sample implements four [TFDCommands](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) for executing different SQL commands.
## How to Use the Sample 


1.  Navigate to the location given above and open `TableAdapter.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                       | Contains          |
|--------------------------------------|-------------------|
|`TableAdapter.dproj``TableAdapter.dpr`|The project itself.|
|`fTableAdapter.pas``fTableAdapter.fmx`|The main form.     |


## Implementation 

The goal of this sample is to demonstre how to use [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) to provide communication between the application and the database. To this end, the following main components are configured:
*  Four [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) objects named **cmSelect**, **cmDelete**, **cmInsert** and **cmUpdate**.
 These objects uses [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) to connect to the desired database. Moreover, each command object is used to implement a different SQL query. To this end, each [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) object use its **CommandText** property to write a SQL command in order to select, update, delete or insert data from/to a database. The **CommandText** property of each command object is set up at run time on a **FormCreate** event.**Note**: The setup of each **CommandText** property could have been done at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**.
*  A [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) object named **adOrders**.
 The [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) object is a mediator between each [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand) and [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable). To this end, the sample set up the following properties at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**:
*  The **SelectCommand** property of **adOrders** is set to `cmSelect`.
*  The **DeleteCommand** property of **adOrders** is set to `cmDelete`.
*  The **InsertCommand** property of **adOrders** is set to `cmInsert`.
*  The **UpdateCommand** property of **adOrders** is set to `cmUpdate`.

*  A [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) object named **cdsOrders**.
 This component retrieves data from database through [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter) and the [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand). To this end, the **Adapter** property of **cdsOrders** is set to `adOrders`.
*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**.
 This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the **DataSet** property of **DataSource1** is set to `cdsOrders` and the **DataSource** property of **DBGrid1** is set to `DataSource1`. This set up is done at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**.When you run the application a **FormCreate** event sets up each **CommandText** property of each command object. Click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Active](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable.Active) property of the **cdsOrders** table is set to `True` in order to open the dataset and read data from the database. Then, the sample displays a [table](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable) using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once **DBGrid1** is filled, you can interact with the sample using the [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator). To this end, the database navigator is linked with the **DataSource1** dataset by setting the **DataSource** property of **DBNavigator1** to `DataSource1`. Therefore, **DBNavigator1** allows you to [manipulate records](http://docwiki.embarcadero.com/RADStudio/en/Navigating_and_Manipulating_Records) when editing or viewing the data.
## Uses 


* [TFDTableAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDTableAdapter)
* [TFDCommand](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCommand)
* [TFDMemTable](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [TDBNavigator](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBNavigator)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))
* [Working with Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_Commands_(FireDAC))

* [Executing Commands (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Executing_Commands_(FireDAC))
* [Preprocessing Command Text (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Preprocessing_Command_Text_(FireDAC))

* [Navigating and Manipulating Records](http://docwiki.embarcadero.com/RADStudio/en/Navigating_and_Manipulating_Records)

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Main](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.Main_Sample) sample






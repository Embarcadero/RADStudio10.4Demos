IBX.InterBase ToGo Sample[]()
# IBX.InterBase ToGo Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)

This sample shows how to monitor trace flags on an InterBase database connection. It requires InterBase to be installed on the machine or to connect to a remote server. Make sure that the [InterBase server is running](http://docwiki.embarcadero.com/RADStudio/en/InterBase) before you run the example. 
## Location 

You can find the **Monitor Demo** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to **CPP\Database\IBX\InterBaseToGo**.
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/InterBaseToGo/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/CPP/Database/IBX/InterBaseToGo/)

## Description 

This sample has two [TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) components. The grid on the top shows the content of the **Customer** table from the **Employee** database. The lower grid is related to the grid on the top, and it shows all the records from the **Sales** table associated with the selected customer. This sample runs on Win32, Win64, and on Mac OSX versions starting with 10.9.

## How to Use the Sample 


1.  Navigate to the location given above and open:

* **CppIBToGoDemo.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select the **Employee GDB** check box to connect to the database.
4.  Use the navigators to go through the records of the grids.

## Files 



|**File in C++**         |**Contains**                                                       |
|------------------------|-------------------------------------------------------------------|
|**CppIBToGoDemo.cbproj**|The project itself.                                                |
|**MainForm.cpp/dfm**    |The main form and the code to give the functionality to the sample.|


## Implementation 

This sample uses a [TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase) component to connect to the **EMPLOYEE.gdb** database, which is available in the **C:\Users\Public\Documents\Embarcadero\Studio\\Samples\Data** directory.The relations on the different database components are created using LiveBindings. Select **View > LiveBindings Designer** to open the [LiveBindings Designer](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_Designer) pane where you can see the bindings between the components. You can also see the relations in the [TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList) component, this component is automatically added to the project once a relation using [livebindings](http://docwiki.embarcadero.com/RADStudio/en/LiveBindings_in_RAD_Studio) is created. 
The [Data.Bind.DBScope.TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB) is a nonvisual component that appears automatically after creating the binding.
The [Data.Bind.DBScope.TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB) allows the connection between the [IBX.IBCustomDataSet.TIBDataSet](http://docwiki.embarcadero.com/Libraries/en/IBX.IBCustomDataSet.TIBDataSet) and the access components: [FMX.Grid.TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid) and [Fmx.Bind.Navigator.TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator).
Right-click the IBDataSet1 component and click **Edit SQL** to see the SQL query that the dataset is using to show the data. The IBDataSet2 creates the relation between the two tables with the SQL Query: "select * from sales where Cust_No = :Cust_No".

## Uses 


* [IBX.IBDatabase.TIBDatabase](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBDatabase)
* [IBX.IBCustomDataSet.TIBDataSet](http://docwiki.embarcadero.com/Libraries/en/IBX.IBCustomDataSet.TIBDataSet)
* [IBX.IBDatabase.TIBTransaction](http://docwiki.embarcadero.com/Libraries/en/IBX.IBDatabase.TIBTransaction)
* [Data.Bind.DBScope.TBindSourceDB](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.DBScope.TBindSourceDB)
* [Fmx.Bind.Navigator.TBindNavigator](http://docwiki.embarcadero.com/Libraries/en/Fmx.Bind.Navigator.TBindNavigator)
* [FMX.Grid.TStringGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TStringGrid)
* [Data.Bind.Components.TBindingsList](http://docwiki.embarcadero.com/Libraries/en/Data.Bind.Components.TBindingsList)

## See Also 


* [Getting Started with InterBase Express](http://docwiki.embarcadero.com/RADStudio/en/Getting_Started_with_InterBase_Express)
* [View Various Tables (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/View_Various_Tables_(IBX_General_Tutorial))
* [Add a Data Module (IBX General Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_a_Data_Module_(IBX_General_Tutorial))
* [Add Database Components (IBX No Code Tutorial)](http://docwiki.embarcadero.com/RADStudio/en/Add_Database_Components_(IBX_No_Code_Tutorial))
* [Tutorial: Linking Controls via LiveBindings Designer](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Linking_Controls_via_LiveBindings_Designer)
* [IBX.AdminTool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.AdminTool_Sample)
* [IBX.IBMastApp Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.IBMastApp_Sample)
* [IBX.MtsPool Sample](http://docwiki.embarcadero.com/CodeExamples/en/IBX.MtsPool_Sample)






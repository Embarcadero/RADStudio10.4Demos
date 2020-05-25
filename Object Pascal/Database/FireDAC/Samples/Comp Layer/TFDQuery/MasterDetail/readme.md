FireDAC.TFDQuery.MasterDetail Sample[]()
# FireDAC.TFDQuery.MasterDetail Sample 


This sample demonstrates how to use the [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) component in order to set up [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets.
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

You can find the **MasterDetail** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\MasterDetail`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/MasterDetail](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/MasterDetail)

## Description 

The **MasterDetail** sample shows you how to set up [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets using two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects. The sample uses the master-detail relationship to automatically filter a detail dataset based on a current master dataset record. In this sample, the master dataset has "Order" records, and the detail dataset shows only lines for the current order. Moreover, you can modify in run time the [Cache](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Cache) property of [TFDFetchOptions](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions) to control the data allocation in cache memory.
## How to Use the Sample 


1.  Navigate to the location given above and open `Qry_MasterDetail.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                 | Contains          |
|------------------------------------------------|-------------------|
|`Qry_MasterDetail.dproj``Qry_MasterDetail.dpr`  |The project itself.|
|`fQueryMasterDetail.pas``fQueryMasterDetail.fmx`|The main form.     |


## Implementation 

To set up a [master-detail relationship](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)), this sample uses the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** to configure the following components at design time as follows:
*  Two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects named **qryOrders** and **qryOrderDetails**. These components are used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property of both components to specify the FireDAC connection object that is used to connect to a DBMS.
 In order to set up a master-detail relationship, the **SQL** properties of both components have to be set up using the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) at design time as follows:
*  The **SQL** property of **qryOrders** is set to `select * from {id Orders}` in order to select "Order" records.
*  The **SQL** property of **qryOrderDetails** is set to `select * from {id Order Details} where OrderID = :OrderID` in order to select "Order Details" records.
 Finally, both objects are linked in a master-detail relationship, where **qryOrders** is the master dataset and **qryOrderDetails** is the detail dataset. To this end, you have to set up the following properties of **qryOrderDetails**:
* **MasterFields** is set to `ORDERID`.
* **IndexFieldNames** is set to `ORDERID`.
* **MasterSource** is set to `dsOrders`.

*  Two [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) objects named **dsOrders** and **dsOrdDetails**. These components provide an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the datasets and the [grids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the datasets are displayed. To this end, the following properties are set up at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**:

*  The **DataSet** property of **dsOrders** is set to `qryOrders` and the **DataSource** property of **DBGrid2** is set to `dsOrder`.
*  The **DataSet** property of **dsOrderDetails** is set to `qryOrderDetails` and the **DataSource** property of **DBGrid1** is set to `dsOrderDetails`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryOrders** and **qryOrderDetails** in order to execute the SQL statements that retrieves the corresponding datasets from the database. Then, the sample displays the master and the detail datasets using a two [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) components. The **DBGrid2** is used to display and manipulate records from the master dataset, while the **DBGrid1** is used to display and manipulate records from the detail dataset. Once the grids are filled, you can interact with the **Cache details**[check box](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) and the **Refresh master** and **Refresh details** buttons. These components have events attached to them to do the following:
*  The **Cache details** check box includes `fiDetails` into the [FetchOptions.Cache](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Cache) property of **qryOrderDetails** if the check box is checked. It means that if it is checked, the associated detail record will not be discarded from the memory after changing a master dataset record.
*  The **Refresh master** button uses the [Refresh](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Refresh) method to re-fetch the master data from the database.
*  The **Refresh details** button uses the [Refresh](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Refresh) method to re-fetch the detail data from the database.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [FetchOptions.Cache](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.Cache)
* [Refresh](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Refresh)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [Fetching Rows (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Fetching_Rows_(FireDAC))

### Samples 


* [FireDAC Connection Definition](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC TFDMemTable Master-Detail Relationship](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.MasterDetail_Sample) sample






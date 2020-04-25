FireDAC.TFDQuery.CentralizedCachedUpdates Sample[]()
# FireDAC.TFDQuery.CentralizedCachedUpdates Sample 


This sample uses [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to create a [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets and [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) to manage the [Centralized Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)#Centralized_Cached_Updates) mode.
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

You can find the **CentralizedCachedUpdates** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\CachedUpdates\Centralized`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/CachedUpdates/Centralized](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/CachedUpdates/Centralized)

## Description 

First, the **CentralizedCachedUpdates** sample sets up range-based [master-detail relationships](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) between datasets using two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects. Then, the sample shows you how to use a [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) object to enable the [Centralized Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)#Centralized_Cached_Updates) mode. To this end, the schema adapter object is used as a central change log shared by both the master and the detail datasets. Therefore, if you modify the records of both the master and the detail datasets in run time, you can apply changes for all records in the centralized change log to the database. To apply the changes, the sample implements the **Apply updates** button, which uses the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ApplyUpdates) method.
## How to Use the Sample 


1.  Navigate to the location given above and open `Qry_SchemaAdapter.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option.

*  Modify the records of the master or the detailed datasets.
*  Click ont the **Apply updates** button.

## Files 



| File in Delphi                                 | Contains          |
|------------------------------------------------|-------------------|
|`Qry_SchemaAdapter.dproj``Qry_SchemaAdapter.dpr`|The project itself.|
|`fSchemaAdapter.pas``fSchemaAdapter.fmx`        |The main form.     |


## Implementation 

To set up a range-based [master-detail relationship](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D)) and a [central change log](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)#Centralized_Cached_Updates), the following components have to be configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  Two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects named **qMaster** and **qDetail**. These components are used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property of both components to specify the FireDAC connection object that is used to connect to a DBMS.
 In order to set up a master-detail relationship, the **SQL** properties of both components have to be set up as follows:
*  The **SQL** property of **qMaster** is set to `select * from {id FDQA_master_autoinc}` in order to select the master records.
*  The **SQL** property of **qDetail** is set to `select * from {id FDQA_details_autoinc}` in order to select the detail records.
 Finally, both objects are linked in a range-based master-detail relationship, where **qMaster** is the master dataset and **qDetail** is the detail dataset. To this end, you have to set up the following properties of **qDetail**:
* **MasterFields** is set to `id1`.
* **IndexFieldNames** is set to `fk_id1`.
* **MasterSource** is set to `dsMaster`.

*  Two [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) objects named **dsMaster** and **dsDetail**. These components provide an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the datasets and the [grids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the datasets are displayed. To this end, the following properties are set up at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)**:

*  The **DataSet** property of **dsMaster** is set to `qMaster` and the **DataSource** property of **DBGrid1** is set to `dsMaster`.
*  The **DataSet** property of **dsDetail** is set to `qDetail` and the **DataSource** property of **DBGrid2** is set to `dsDetail`.

*  A [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) object named **FDSchemaAdapter1**. This object enables the [Centralized Cached Updates](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC)) mode. The schema adapter object is used as a central change log shared by both the master and the detail datasets. To enable propagation of master dataset changes to a detail dataset, the [FetchOptions.DetailCascade](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDFetchOptions.DetailCascade) property of the detail dataset is set to **True**. Moreover, both master and detail datasets must point to the same [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter) object. Therefore, the sample sets the **SchemaAdapter** property of **qMaster** and **qDetail** to `FDSchemaAdapter1`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the [Active](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSet.Active) property of **qMaster** and **qDetail** is set to `True` in order to open the datasets and read data from the database. Then, the sample displays the master and the detail datasets using a two [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) components. The **DBGrid1** is used to display and manipulate records from the master dataset, while the **DBGrid2** is used to display and manipulate records from the detail dataset. Once the grids are filled, you can interact with the sample in the following way:
1.  Modify the datasets.
2.  Click on the **Apply updates** button. This button uses the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ApplyUpdates) method in order to apply changes for all records in the centralized change log to the database.

## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDSchemaAdapter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDSchemaAdapter)

* [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomSchemaAdapter.ApplyUpdates)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Caching Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC))
* [Overriding Posting Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Overriding_Posting_Updates_(FireDAC))

### Samples 


* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample
* [FireDAC TFDQuery OnUpdateRecord](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.OnUpdateRecord_Sample) sample






FireDAC.TFDQuery.OnUpdateRecord Sample[]()
# FireDAC.TFDQuery.OnUpdateRecord Sample 


This sample demonstrates how to use the the [OnUpdateRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.OnUpdateRecord) event of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) to apply updates on behalf of queries that cannot [post updates](http://docwiki.embarcadero.com/RADStudio/en/Changing_DataSet_Data_(FireDAC)#Posting_Updates) directly.
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

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\CachedUpdates\OnUpdateRecord`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/CachedUpdates/OnUpdateRecord](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/CachedUpdates/OnUpdateRecord)

## Description 

The **OnUpdateRecord** sample shows you how to cache the user changes when using read-only dataset and then, how to apply updates on behalf of queries that cannot post updates directly. To this end, the sample uses the [OnUpdateRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.OnUpdateRecord) event of [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) and the [TFDUpdateSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL) object.
## How to Use the Sample 


1.  Navigate to the location given above and open `Qry_CachedUpdates.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                 | Contains          |
|------------------------------------------------|-------------------|
|`Qry_CachedUpdates.dproj``Qry_CachedUpdates.dpr`|The project itself.|
|`fCachedUpdates.pas``fCachedUpdates.fmx`        |The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  A [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) object named **qryProducts**. This component is used to implement a dataset capable of executing SQL queries. The following setup is needed:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is configured to specify the FireDAC connection object that is used to connect to a DBMS.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qryProducts** is set to:

> ```
> select p.*, c.CategoryName
> from {id Products} p left outer join {id Categories} c on p.CategoryID = c.CategoryID
> order by ProductID
> 
> ```

**Note**: In the RDBMS it has one-to-many relation between **Categories** and **Products** tables.
*  The [CachedUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CachedUpdates) property is set to `True`. It means that the dataset will log data changes without immediately applying them to the database.

*  Two [TFDUpdateSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL) objects named **usProducts** and **usCategories**. Both objects are used to provide SQL statements for posting updates from [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery). To this end, the following setup is needed:

*  The [ModifySQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL.ModifySQL) property of **usProducts** is set to:

> ```
> UPDATE {id Products} SET
> ProductName = :NEW_ProductName,
> SupplierID = :NEW_SupplierID, CategoryID = :NEW_CategoryID,
> QuantityPerUnit = :NEW_QuantityPerUnit, UnitPrice = :NEW_UnitPrice,
> UnitsInStock = :NEW_UnitsInStock, UnitsOnOrder = :NEW_UnitsOnOrder,
> ReorderLevel = :NEW_ReorderLevel, Discontinued = :NEW_Discontinued
> WHERE
> ProductID = :OLD_ProductID
> 
> ```


*  The [ModifySQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL.ModifySQL) property of **usCategories** is set to:

> ```
> UPDATE {id Categories} SET
> CategoryName = :NEW_CategoryName
> WHERE
> CategoryID = :OLD_CategoryID
> 
> ```


*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) objects named **dsProducts**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and the [grid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the dataset is displayed. To this end, the following properties are set:

*  The **DataSet** property of **dsProducts** is set to `qryProducts`.
*  The **DataSource** property of **DBGrid1** is set to `dsProducts`.
When you run the application, click on the **Use Connection Definition** combo box and select an option in order to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)). When you select an item of the combo box, the sample uses the [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open) method of **qryProducts** in order to execute the SQL statement that retrieves the datasets from the database. Then, the sample displays the data from the datasets using a [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) component. Once the **DBGrid1** is filled, you can interact with the sample by clicking on the different buttons. Each button implements a on click event to do the following:
*  The **Apply Updates** button.
 This button uses the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates) method of **qryProducts** in order to applly changes for all records in the dataset change log to the database. After calling the [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates) method, the sample calls the [OnUpdateRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.OnUpdateRecord) event of **qryProducts**. This event applies the changes using the [Apply](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomUpdateObject.Apply) method of the [TFDUpdateSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL) objects in the following order:
1.  First, **usProducts** applies changes into **Products** (detail) table.
2.  Secondly, **usCategories** applies changes into **Categories** (master) table.

*  The **Cancel Updates** button.
 This button uses the [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelUpdates) method of **qryProducts** to remove all records from the change log. Then, the dataset records are restored to the state they were at the moment when the dataset was opened, cached updates were last enabled or updates were last successfully applied to the database.
*  The **Commit Updates** button.
 This button uses the [CommitUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CommitUpdates) method of **qryProducts** to clear the changes log and mark all records as not modified. 
*  The **Revert Updates** button.
 This button uses the [RevertRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.RevertRecord) method of **qryProducts** to undo changes to the current record and remove it from the dataset changes log.
*  The **Undo Last Change** button.
 This button use the [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.UndoLastChange) method of **qryProducts** to undo the last modification to the dataset records and remove the change from the dataset change log.**Note**: For proper use of the methods that are implemented by the buttons mentioned above, the [CachedUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CachedUpdates) property has to set to `True`.
## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [OnUpdateRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.OnUpdateRecord)
* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open)
* [ApplyUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.ApplyUpdates)
* [CancelUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CancelUpdates)
* [CommitUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CommitUpdates)
* [RevertRecord](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.RevertRecord)
* [UndoLastChange](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.UndoLastChange)

* [TFDUpdateSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDUpdateSQL)

* [Apply](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomUpdateObject.Apply)

* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Editing Data (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Editing_Data_(FireDAC))

* [Changing DataSet Data (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Changing_DataSet_Data_(FireDAC))
* [Caching Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_(FireDAC))
* [Update Command Generation (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Update_Command_Generation_(FireDAC))
* [Overriding Posting Updates (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Overriding_Posting_Updates_(FireDAC))

### Samples 


* [FireDAC TFDQuery Centralized Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.CentralizedCachedUpdates_Sample) sample
* [FireDAC TFDMemTable Cached Updates](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDMemTable.CachedUpdates_Sample) sample






FireDAC.Oracle CQN Sample[]()
# FireDAC.Oracle CQN Sample 


This sample demonstrates the [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) support for the [Oracle](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Oracle_Server_(FireDAC))[Continuous Query Notification (CQN)](http://docs.oracle.com/cd/B28359_01/appdev.111/b28395/oci10new.htm#CJGHFEDD) feature.**Warning**: Some versions of 11.2 client software are unable to receive change notifications, OCI Callbacks or Advanced Queuing (AQ) notifications against some versions of 11.2 database. For more information, click [here](https://support.oracle.com/epmos/faces/DocumentDisplay?id=1310859.1). 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Design Time](#Design_Time)
* [5.2 Run Time](#Run_Time)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **Oracle_CQN** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\Oracle\CQN`

* **GitHub Repository**:

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/Oracle/CQN](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/Oracle/CQN)

## Description 

The **Oracle_CQN** sample shows you how to use [Continuous Query Notification](http://docs.oracle.com/cd/B28359_01/appdev.111/b28395/oci10new.htm#CJGHFEDD) with Oracle databases using FireDAC. To this end, this sample connects a client with CHANGE NOTIFICATION privilege to an [Oracle](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Oracle_Server_(FireDAC)) database server and uses an [event alerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) to notify about database table data changes.The implementation of this sample takes into account the following considerations listed in [Oracle CQN](http://docwiki.embarcadero.com/RADStudio/en/Data_Change_Notifications_(FireDAC)#Oracle_CQN) section of the [Data Change Notifications](http://docwiki.embarcadero.com/RADStudio/en/Data_Change_Notifications_(FireDAC)) topic of FireDAC.

## How to Use the Sample 


1.  Navigate to the location given above and open `Oracle_CQN.dproj`.
2.  Click the **Params** property of **conOriginal** in the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** and adjust the connection parameters.
3.  Press **F9** or choose **Run > Run**.
4.  Interact with the sample:

*  Click **Open DB** button.
*  Modify the data in the first grid.
*  Use the comboboxes above the second grid to choose different modes.
*  Use the buttons above the third grid to merge, commit and undo the changes.

## Files 



| File in Delphi                   | Contains          |
|----------------------------------|-------------------|
|`Oracle_CQN.dproj``Oracle_CQN.dpr`|The project itself.|
|`ChangeFrm.pas``ChangeFrm.dfm`    |The main form.     |


## Implementation 


### Design Time 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  Two [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) objects named **conOriginal** and **conChanges**. These are the FireDAC connection objects that the sample use to connect to a DBMS. The sample sets the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property of **conOriginal** to `Oracle_Demo`.
**Notes**:
*  You can change the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property to connect to a different Oracle server using a valid user name and password.
*  The [Params](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection.Params) properties of **conChanges** are copied from **conOriginal** on run-time.

*  Two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects named **qOriginal** and **qChanges**. These component are used to implement datasets capable of executing SQL queries.

* **qOriginal** setup:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `conOriginal` in order to specify the FireDAC connection object.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.SQL) property contains the following SQL `SELECT` statement: `SELECT * FROM "FDQA_TransTable"`.

* **qChanges** setup:

*  The [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property is set to `conChanges` in order to specify the FireDAC connection object.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.SQL) property contains the following SQL `SELECT` statement: `SELECT t.ROWID, t.* FROM "FDQA_TransTable" t`.
*  The [ChangeAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery.ChangeAlerter) property is set to `eaChanges` in order to specify the [event alerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) that tracks this query.

*  A [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) object named **eaChanges**. This component is used to handle the database change notifications. The sample configures the following properties as follows:

*  The [Options](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.Options).[Kind](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Option.TFDEventAlerterOptions.Kind) property is set to `QueryNotifies`.
*  The [SubscriptionName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.SubscriptionName) property is set to `sub`.**Warning**: The [SubscriptionName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter.SubscriptionName) property has to be set to any value. It cannot be empty or the query will be fully refreshed instead of incrementally.

*  Three [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) objects named **dsOriginal**, **dsChanges** and **dsRemote**. These components provide interfaces between a dataset component and data-aware controls on a form. In this sample, these objects are used to provide communication between the datasets and the [grids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) where the datasets are displayed. To this end, the sample sets the following properties:

*  The **DataSet** property of **dsOriginal**, **dsChanges** and **dsRemote** is set to `qOriginal`, `qChanges` and `mtRemote`, respectively.
*  The **DataSource** property of **grdOriginal**, **grdChanges** and **grdremote** is set to `dsOriginal`, `dsChanges` and `dsRemote`, respectively.

### Run Time 

When you run the application, you see the following components:
*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) called **Open DB**. When you click this button, the sample takes the following steps:

1.  Connects **conOriginal** and activates **qOriginal**.
2.  Connects **conChanges** with the same parameters than **conOriginal**
3.  Activates the **eaChanges** event alerter.
4.  Activates **qOriginal**. **Note**: As commented in the [Description](#Description), you should activate [TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter) before executing the tracked [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery).

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) called **Start TX**. When you click this button, the sample [starts the transaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.StartTransaction).

*  A [TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) called **Commit TX**. When you click this button, the sample [commits the transaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Commit).

*  Three [TGrids](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) labeled as: **Original data**, **Change View** and **"Remote" data**. When you modify the data in the first grid, which contains the original data, it triggers a change in the second grid. The changes appear automatically on the second grid due to the [event alerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter). Moreover, the changes appear highligthed in yellow.

*  Two [TComboBoxes](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox) labeled as **Data mode** and **Refresh mode**. You can use these comboboxes to choose between different modes.

*  Four [TButtons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) above the third grid. Use these buttons to [merge](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.MergeDataSet), [commit](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CommitUpdates) and [undo](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.UndoLastChange) the changes.

*  A [TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox) labeled as **Merge using stream**. This check box allows you to emulate a remote data transfer.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.Client.TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [FireDAC.Comp.Client.TFDEventAlerter](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDEventAlerter)
* [Data.DB.TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [Vcl.StdCtrls.TButton](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton)
* [Vcl.StdCtrls.TLabel](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel)
* [Vcl.StdCtrls.TCheckBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCheckBox)
* [Vcl.StdCtrls.TComboBox](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TComboBox)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Connect to Oracle Server](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_Oracle_Server_(FireDAC))
* [Data Change Notifications](http://docwiki.embarcadero.com/RADStudio/en/Data_Change_Notifications_(FireDAC))
* [Database Alerts](http://docwiki.embarcadero.com/RADStudio/en/Database_Alerts_(FireDAC))






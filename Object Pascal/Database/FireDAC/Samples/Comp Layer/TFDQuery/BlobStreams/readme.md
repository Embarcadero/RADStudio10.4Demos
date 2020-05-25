FireDAC.TFDQuery.BlobStreams Sample[]()
# FireDAC.TFDQuery.BlobStreams Sample 


This sample demonstrates the two kinds of [BLOB streaming](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC) that FireDAC offers: [External streaming](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC#External_Streams) and [Internal streaming](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC#Internal_Streams).
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

You can find the **BlobStreams** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDQuery\BlobStreams`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/BlobStreams](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDQuery/BlobStreams)

## Description 

The **BlobStreams** sample shows you how to use the [BLOB streaming](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC) techniques of FireDAC. To this end, this sample implements both the **external streaming** and the **internal streaming**.
## How to Use the Sample 


1.  Navigate to the location given above and open `BlobStreams.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                     | Contains          |
|------------------------------------|-------------------|
|`BlobStreams.dproj``BlobStreams.dpr`|The project itself.|
|`fBlobStr.pas``fBlobStr.fmx`        |The main form.     |


## Implementation 

Before running the sample, the main components are configured at design time using the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** as follows:
*  Two [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery) objects named **qSelect** and **qInsert**. These components are used to implement the datasets capable of executing SQL queries. The following setup is needed:

*  Configure the [Connection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Connection) property of both objects to specify the FireDAC connection object that is used to connect to a DBMS. In both cases it is set to `FDConnection1`.
*  Set the [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property for both objects. It specifies the SQL statement to execute for the query.

*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qSelect** is set to `select * from {id FDQA_Blob}`.
*  The [SQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.SQL) property of **qSelect** is set to `insert into {id FDQA_Blob} (blobdata) values (:blobdata)`.

*  Configure the **qInsert.Param[0]**:

*  The **Name** property is se to `BLOBDATA`
*  The [DataType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.DataType) property is set to one of the [BLOB data types](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TBlobType). In this sample `ftBlob`.
*  The [ParamType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.ParamType) property is set to `ptInput`. It means that the stream will be read and written to a database BLOB value.
*  The [StreamMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.StreamMode) property is set to `smOpenRead`. This is the default value. It means that the stream is used to read the database BLOB value.

*  A [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource) object named **DataSource1**. This component provides an interface between a dataset component and data-aware controls on a form. In this sample, it is used to provide communication between the dataset and a [TDBMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBMemo) object named **DBMemo1**. **DBMemo1** is used to display the **blobdata** field of the dataset. To this end, the following setup is needed:

*  The **DataSet** property of **DataSource** is set to `qSelect`.
*  The **DataSource** property of **DBMemo1** to `DataSource1`.
*  The **DataField** property of **DBMemo1** to `blobdata`.
Once the main components are configured at design time you can run the application and interact with the sample in run time. To this end, the sample offers three buttons:
* **Prepare data**. This button creates an **OnClick** event that uses the [TFileStream.Create](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TFileStream.Create) method to instantiate the file stream in order to write a string into the file.
* **Insert (external stream)**. This button creates an **OnClick** event that implements an external streaming. An external stream is provided by the application to FireDAC (external to FireDAC). Then, FireDAC reads this stream. To this end, the sample does the following:

*  Set the parameter [DataType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.DataType) to `ftOraBlob`.
*  Assign a stream reference to the parameter using the [AsStream](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.AsStream) property.
*  Use the [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL) method to execute the SQL command.
 See the code below:
> ```
> procedure TfrmBlobStr.btnInsertExternalClick(Sender: TObject);
> begin
> // ...
> qInsert.SQL.Text := 'insert into {id FDQA_Blob} (blobdata) values (:blobdata)';
> // Set parameter data type to one of the BLOB types.
> qInsert.Params[0].DataType := ftOraBlob;
> // Assign external stream before ExecSQL. FireDAC takes ownership of the stream object
> qInsert.Params[0].AsStream := TFileStream.Create(C_File, fmOpenRead);
> qInsert.ExecSQL;
> // ...
> 
> ```


* **Insert (internal stream)**. This button creates an **OnClick** event that implements an internal streaming. An internal stream is provided by FireDAC to the application (internal to FireDAC). Then, the application reads this stream. To this end, the sample does the following:

*  Use the [StarTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.StartTransaction) method to start a mandatory transaction.
*  Set the parameter [DataType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.DataType) to `ftStream`.
*  Set the parameter [StreamMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.StreamMode) to `smOpenWrite` in order to write the database BLOB value.
*  Use the [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL) method to execute the SQL command. This will return the internal stream reference.
*  Write the internal stream reference.
*  Call the [CloseStreams](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDAdaptedDataSet.CloseStreams) method to flush database API buffers and close internal streams.
*  Use the [Commint](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Commit) method to finish the transaction.
 See the code below:
> ```
> procedure TfrmBlobStr.btnInsertInternalClick(Sender: TObject);
> begin
> FDConnection1.StartTransaction;
> // ...
> qInsert.SQL.Text := 'insert into {id FDQA_Blob} (blobdata) values (:blobdata)';
> // Set parameter data type ftStream and do not assign stream reference.
> qInsert.Params[0].DataType := ftOraBlob;
> qInsert.Params[0].StreamMode := smOpenWrite;
> qInsert.ExecSQL;
> 
> oFS := TFileStream.Create(C_File, fmOpenRead);
> try
> // Write to internal stream. The stream is available after ExecSQL.
> qInsert.Params[0].AsStream.CopyFrom(oFS, -1);
> finally
> oFS.Free;
> end;
> 
> // Flush/close the streams.
> qInsert.CloseStreams;
> 
> FDConnection1.Commit;
> // ...
> 
> ```


## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)

* [Open](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDRdbmsDataSet.Open)
* [DataType](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.DataType)
* [StreamMode](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Stan.Param.TFDParam.StreamMode)
* [ExecSQL](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomQuery.ExecSQL)
* [CloseStreams](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDAdaptedDataSet.CloseStreams)

* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)

* [StarTransaction](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.StartTransaction)
* [Commint](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.Commit)

* [TFileStream](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TFileStream)
* [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource)
* [TDBMemo](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBCtrls.TDBMemo)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Working with DataSets (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Working_with_DataSets_(FireDAC))
* [Navigating and Manipulating Records](http://docwiki.embarcadero.com/RADStudio/en/Navigating_and_Manipulating_Records)
* [Support for BLOB streaming in FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Support_for_Blob_Streaming_in_FireDAC)

### Samples 


* [FireDAC TFDQuery Blobs](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.TFDQuery.Blobs_Sample) sample






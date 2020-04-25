FireDAC.ConnectionDefs Sample[]()
# FireDAC.ConnectionDefs Sample 


This sample illustrates the different ways to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create connection definition on fly](#Create_connection_definition_on_fly)
* [5.2 Set connection definition file name](#Set_connection_definition_file_name)
* [5.3 Load connection definition file](#Load_connection_definition_file)
* [5.4 Add connection definition](#Add_connection_definition)
* [5.5 Clone Connection definition](#Clone_Connection_definition)
* [5.6 Forcing errors](#Forcing_errors)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **ConnectionDefs** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDConnection\ConnectionDefs`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/ConnectionDefs](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/ConnectionDefs)

## Description 

The **ConnectionDefs** sample shows different ways to [define a connection](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) to a database. To this end, the sample shows how to use different methods and properties such as: [ConnectionDefs](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefs), [AddConnectionDef](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.AddConnectionDef), [SaveConnectionDefFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.SaveConnectionDefFile), [LoadConnectionDefFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.LoadConnectionDefFile) or [DeleteConnectionDef](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.DeleteConnectionDef).
## How to Use the Sample 


1.  Navigate to the location given above and open `ConnectionDefinitions.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi                                         | Contains          |
|--------------------------------------------------------|-------------------|
|`ConnectionDefinitions.dproj``ConnectionDefinitions.dpr`|The project itself.|
|`fConnectionDefinitions.pas``fConnectionDefinitions.fmx`|The main form.     |


## Implementation 

The sample implements the following features related with the connection to a database.
### Create connection definition on fly 

To create/add a connection definition:
```
  with FDManager.ConnectionDefs.AddConnectionDef do begin
    Name := 'MyDefNew';
    DriverID := 'MSAcc';
    Database := '$(FDHOME)\DB\Data\FDDemo.mdb';  // using properties
    Params.Add('Tracing=True');                  // using Params
    AsBoolean['ReadOnly'] := True;               // using AsXXX properties
    // mark persistent to save this connection definition to file later
    MarkPersistent;
  end;
  // to make new definition persistent call following:
  FDManager.ConnectionDefs.Save;

```


Connect to database:
```
  dbMain.ConnectionDefName := 'MyDefNew';
  dbMain.Connected := True;

```


Delete connection definition:
```
  var
    oDef: IFDStanConnectionDef;
  begin
    //  ...
    //  ...
    // Delete private connection definition. Connection definition will be destroyed after this call 
    // and will be no more available.
    oDef.Delete;
  end

```



### Set connection definition file name 

Explicitly setting the [ConnectionDef file name](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefFileName).
```
  FDManager.ConnectionDefFileName := 'MyTest.ini’;

```



### Load connection definition file 

Load a connection definition file explicitly with the [LoadConnectionDefFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.LoadConnectionDefFile) method.
```
  // Disable auto load
  FDManager.ConnectionDefFileAutoLoad := False;
  // set the name of a connection definition file
  if AFileName <> '' then
    FDManager.ConnectionDefFileName := AFileName;
  // loads the connection definitions file specified by ConnectionDefFileName.
  FDManager.LoadConnectionDefFile;

```



### Add connection definition 

This is similar to **create connection definition**. The difference is that you may create connection definition after loading other connection definitions from file.
### Clone Connection definition 

To clone the connection definition you have to create the new one, assign the **Name** property and load the parameters of the cloned definition.
```
procedure TfrmConnectionDefinitions.btnTestConn5Click(Sender: TObject);
  var
    oDef: IFDStanConnectionDef;
  begin
    oDef := FDManager.ConnectionDefs.ConnectionDefByName(cbConnectionDefs5.Text);
    with FDManager.ConnectionDefs.AddConnectionDef do begin
      // Set new name
      Name := edtName.Text;
      // Clone connection definition simple assigning the parameters
      Params.AddStrings(oDef.Params);
    end;
  end;

```



### Forcing errors 

Two give some error examples, the sample force two possible errors working with connection definitions. The error examples are the following:
*  A user tries to generate connection definitions with the same name.

```
  with FDManager.ConnectionDefs.AddConnectionDef do begin
    Name := 'MyDef';
    Params.DriverID := 'MSAcc';
  end;
  with FDManager.ConnectionDefs.AddConnectionDef do begin
    Name := 'MyDef';
  end;

```



*  A user tries to load a connection definition file after creating a on fly connection.

```
  with FDManager.ConnectionDefs.AddConnectionDef do begin
    Name := 'MyOnFlyDef';
    Params.DriverID := 'MSAcc';
  end;
  FDManager.LoadConnectionDefFile;

```



## Uses 


* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [ConnectionDefs](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefs)
* [AddConnectionDef](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.AddConnectionDef)
* [LoadConnectionDefFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.LoadConnectionDefFile)
* [SaveConnectionDefFile](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.SaveConnectionDefFile)
* [DeleteConnectionDef](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.DeleteConnectionDef)
* [ConnectionDefFileLoaded](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefFileLoaded)
* [ConnectionDefFileAutoLoad](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefFileAutoLoad)
* [ConnectionDefFileName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomManager.ConnectionDefFileName)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Setting up Connections (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Setting_up_Connections_(FireDAC))
* [Database Connectivity (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Database_Connectivity_(FireDAC))

### Samples 


* [FireDAC Info Report](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InfoReport_Sample) sample
* [FireDAC Transactions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Transactions_Sample) sample






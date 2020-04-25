FireDAC.DLLSharing Sample[]()
# FireDAC.DLLSharing Sample 


This sample shows how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) in the [dynamic-link libraries](http://docwiki.embarcadero.com/RADStudio/en/DLL_Development_(FireDAC)).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Load DLL](#Load_DLL)
* [5.2 Show data](#Show_data)
* [5.3 Unload DLL](#Unload_DLL)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)

* [7.1 Samples](#Samples)


## Location 

You can find the **DLLSharing** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDConnection\DLL_Sharing`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/DLL_Sharing](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/DLL_Sharing)

## Description 

The **DLLSharing** sample shows how to use [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) in the [dynamic-link libraries](http://docwiki.embarcadero.com/RADStudio/en/DLL_Development_(FireDAC)). To this end, the sample uses the [CliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.CliHandle) and [SharedCliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.SharedCliHandle) properties of the [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) class.
## How to Use the Sample 


1.  Navigate to the location given above and open `Project1.dproj`.
2.  Press F9 or choose **Run > Run**.

## Files 



| File in Delphi               | Contains          |
|------------------------------|-------------------|
|`Project1.dproj``Project1.dpr`|The project itself.|
|`Unit1.pas``Unit1.fmx`        |The main form.     |
|`Project2.dproj``Project2.dpr`|The DLL.           |
|`Unit2.pas``Unit2.fmx`        |The DLL form.      |


## Implementation 

The sample uses FireDAC to implement a connection with a dynamic-link library. To this end, the sample implements three [buttons](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) named: **Button1**, **Button2** and **Button3**. Each button handles a [OnClick](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick) event to implement the following features:
*  Load a DLL
*  Show data
*  Unload the DLL

### Load DLL 

To transfer a connection between an application and a DLL, the sample transfers the [TFDCustomConnection.CliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.CliHandle) property value to the DLL. The handle must be assigned to the [TFDCustomConnection.SharedCliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.SharedCliHandle) property. After the [TFDCustomConnection.SharedCliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.SharedCliHandle) is assigned, the DLL connection can be activated by setting the **Connected** property to `True`. Note that there is no need to set up a [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)), including DriverID. 

```
  // Application code:
  FhDll: THandle; 
  // ...
  procedure TForm1.Button1Click(Sender: TObject);
  begin
    FhDll := LoadLibrary(PChar('Project2.dll'));
    @FpShowData := GetProcAddress(FhDll, PChar('ShowData'));
  end
 
  // DLL code:
  class procedure TForm2.ShowData(ACliHandle: Pointer);
  var
    oForm: TForm2;
  begin
    oForm := TForm2.Create(Application);
    oForm.FDConnection1.SharedCliHandle := ACliHandle;
    oForm.FDConnection1.Connected := True;
    oForm.FDQuery1.Active := True;
    oForm.Show;
  end;

```



### Show data 

Then, the connection can be used as a normal database connection: 
```
  TShowDataProc = procedure (ACliHandle: Pointer); stdcall; 
  // ...
  FpShowData: TShowDataProc;
  // ...
  procedure TForm1.Button3Click(Sender: TObject);
  begin
    FpShowData(FDConnection1.CliHandle);
  end

```



### Unload DLL 

To unload the dynimic-link library, the sample implements the following code:
```
  TShutdownProc = procedure; stdcall;
  // ... 
  FpShutdown: TShutdownProc;
  // ...
  procedure TForm1.Button2Click(Sender: TObject);
  begin
    FpShutdown();
    FreeLibrary(FhDll);
  end;

```



## Uses 


* [THandle](http://docwiki.embarcadero.com/Libraries/en/System.THandle)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDCustomConnection.CliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.CliHandle)
* [TFDCustomConnection.SharedCliHandle](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomConnection.SharedCliHandle)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC)
* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [DLL Development (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/DLL_Development_(FireDAC))

### Samples 


* [FireDAC Info Report](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.InfoReport_Sample) sample
* [FireDAC Connection Definitions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.ConnectionDefs_Sample) sample
* [FireDAC Transactions](http://docwiki.embarcadero.com/CodeExamples/en/FireDAC.Transactions_Sample) sample






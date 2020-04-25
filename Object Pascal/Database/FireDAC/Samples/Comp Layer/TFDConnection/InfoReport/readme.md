FireDAC.InfoReport Sample[]()
# FireDAC.InfoReport Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample demonstrates the functionality of the TFDConnection component to provide information about FireDAC, connection, client and database software.
## Location 

You can find the **TFDConnection\InfoReport** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to:

* **Object Pascal\DataBase\FireDAC\Samples\Comp Layer\TFDConnection\InfoReport**.

* **GitHub Repository for Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/InfoReport](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/FireDAC/Samples/Comp%20Layer/TFDConnection/InfoReport).

## Description 

This sample uses the [ConnectionDefName](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionDefName) property of the [TFDConnection](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDConnection) to specify the name of the connection definition to use. The demo calls the [GetInfoReport](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.GetInfoReport) method to provide the report. The FireDAC environment report contains detailed information including:
*  FireDAC and RAD Studio versions
*  Connection definition parameters
*  Database client software name and version
*  Database server software name and version
*  Database session information

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **FireDACConnInfo.dproj**

2.  Press **F9** or choose **Run > Run**.
3.  Select one of the following options:

*  Click **Get report**: Populates the TMemo with detailed information about the connection status.
*  Click **Get versions**: Gets the DBMS client and server versions.

## Implementation 


* **Get report** button:
It calls the [GetInfoReport](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.GetInfoReport) method of the [TFDConnection](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDConnection) component to populate the TMemo with detailed information about the connection status.
```
procedure TMainForm.Button1Click(Sender: TObject);
begin
  // Output complete connection status report
  FDConnection1.GetInfoReport(mmInfo.Lines);
end;

```



* **Get versions** button:
It uses the IFDPhysConnectionMetadata interface to get the client and server versions.See [ConnectionMetaDataIntf](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionMetaDataIntf) for more information.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDConnection)
* [FireDAC.Comp.UI.TFDGUIxWaitCursor](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.UI.TFDGUIxWaitCursor)
* [FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)
* [FireDAC.Comp.Client.TFDCustomConnection.GetInfoReport](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.GetInfoReport)
* [FireDAC.Comp.Client.TFDCustomConnection.ConnectionMetaDataIntf](http://docwiki.embarcadero.com/Libraries/Denali/en/FireDAC.Comp.Client.TFDCustomConnection.ConnectionMetaDataIntf)

## See Also 


* [FireDAC](http://docwiki.embarcadero.com/RADStudio/Denali/en/FireDAC)
* [DBMS Environment Reports (FireDAC)](http://docwiki.embarcadero.com/RADStudio/Denali/en/DBMS_Environment_Reports_(FireDAC))
* [FireDAC.SQLite Desktop Sample](http://docwiki.embarcadero.com/CodeExamples/Denali/en/FireDAC.SQLite_Desktop_Sample)






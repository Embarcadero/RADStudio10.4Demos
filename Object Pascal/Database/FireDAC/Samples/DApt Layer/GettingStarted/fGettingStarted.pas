
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fGettingStarted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS, 
  FireDAC.DApt.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmGettingStarted = class(TfrmMainLayers)
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

{$R *.dfm}

uses
  dmMainBase,
  uDatSUtils,
  FireDAC.Stan.Factory;

procedure TfrmGettingStarted.cbDBClick(Sender: TObject);
var
  oComm:     IFDPhysCommand;
  oSchAdapt: IFDDAptSchemaAdapter;
  oAdapt:    IFDDAptTableAdapter;
  oTab:      TFDDatSTable;
begin
  Console.Clear;
  inherited cbDBClick(Sender);
  // 1. create schema manager
  // It is not required, we can create standalone table adapter.
  FDCreateInterface(IFDDAptSchemaAdapter, oSchAdapt);

  // 2. create and assign DatSManager to schema adapter
  // It is not required, FireDAC will automatically allocate
  // DatSManager, if it is not assigned.
  oSchAdapt.DatSManager := TFDDatSManager.Create;

  // 3. create table adapter
  // It will handle "Shippers" result set and put it
  // into "MappedShippers" DatSTable.
  oAdapt := oSchAdapt.TableAdapters.Add(EncodeName('Shippers'), 'MappedShippers');

  // 4. map result set columns to DatSTable columns
  // It is not required, FireDAC by default will handle all
  // result set columns using they names.
  oAdapt.ColumnMappings.Add('ShipperID',   'MappedShipperID');
  oAdapt.ColumnMappings.Add('CompanyName', 'MappedCompanyName');
  oAdapt.ColumnMappings.Add('Phone',       'MappedPhone');

  // 5. create and assign command to table adapter
  FConnIntf.CreateCommand(oComm);
  oAdapt.SelectCommand := oComm;
  oAdapt.SelectCommand.Prepare('select * from {id Shippers}');

  // 6. create DatSTable to fetch result set
  oAdapt.Define;

  // 7. fetch result set
  oAdapt.Fetch(True);

  // 8. get DatSTable and print it
  oTab := oAdapt.DatSTable;
  PrintRows(oTab, Console.Lines);

  // 9. compiler here will release schema adapter, table
  // adapter and command interfaces.
end;

end.


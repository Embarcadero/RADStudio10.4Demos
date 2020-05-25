
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fCreateConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DB, ExtCtrls, ComCtrls, Buttons,
  fMainBase,
  FireDAC.Phys.MSAcc,
  FireDAC.DatS, FireDAC.Stan.Intf, FireDAC.Stan.Def,
  FireDAC.Phys.Intf;

type
  TfrmCreateConnection = class(TfrmMainBase)
    Console: TMemo;
    Panel1: TPanel;
    btnCreateConnection: TButton;
    procedure btnCreateConnectionClick(Sender: TObject);
  end;

var
  frmCreateConnection: TfrmCreateConnection;

implementation

{$R *.dfm}

procedure TfrmCreateConnection.btnCreateConnectionClick(Sender: TObject);
var
  oConn: IFDPhysConnection;
begin
  FDPhysManager.Open;

  // -----------------------------------------------------------------------
  // (1) Using existing definition "as-is"
  // Set connection definition name to Access_Demo
  FDPhysManager.CreateConnection('Access_Demo', oConn);
  oConn.Open;
  Console.Lines.Add('Connected to Access_Demo');
  oConn.Close;
  oConn := nil;

  // -----------------------------------------------------------------------
  // (2) Overriding parent definition without changing itself
  // Adding new definition
  with FDPhysManager.ConnectionDefs.AddConnectionDef do begin
    // set parent definition
    ParentDefinition := FDPhysManager.ConnectionDefs.ConnectionDefByName('Access_Demo');
    Name := 'MyDefOverride';
    AsBoolean['ReadOnly'] := True;
  end;
  // Connect through my definition
  FDPhysManager.CreateConnection('MyDefOverride', oConn);
  oConn.Open;
  Console.Lines.Add('Connected to MyDefOverride');
  oConn.Close;
  oConn := nil;

  // -----------------------------------------------------------------------
  // (3) Creating new definition "on-fly"
  // Adding new definition
  with FDPhysManager.ConnectionDefs.AddConnectionDef do begin
    Name := 'MyDefNew';
    Params.DriverID := 'MSAcc';
    Params.Database := '$(FDHOME)\DB\Data\FDDemo.mdb';
    Params.MonitorBy := mbFlatFile;
    AsBoolean['ReadOnly'] := True;
  end;
  // Connect through my definition
  FDPhysManager.CreateConnection('MyDefNew', oConn);
  oConn.Open;
  Console.Lines.Add('Connected to MyDefNew');
  oConn.Close;
  oConn := nil;
  // to make new definition persistent call following:
  // FDPhysManager.ConnectionDefs.Save;

  // -----------------------------------------------------------------------
  // (4) Creating new definition using FireDAC connection string
  FDPhysManager.CreateConnection('DriverID=MSAcc;Database=$(FDHOME)\DB\Data\FDDemo.mdb;ReadOnly=True', oConn);
  oConn.Open;
  Console.Lines.Add('Connected using connection string');
  oConn.Close;
  oConn := nil;
end;

end.





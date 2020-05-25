//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fFetchTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Phys.Intf;

type
  TfrmFetchTable = class(TfrmMainLayers)
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FTab: TFDDatSTable;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmFetchTable: TfrmFetchTable;

implementation

uses
  uDatSUtils;

{$R *.dfm}


procedure TfrmFetchTable.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('Shippers');
end;

procedure TfrmFetchTable.FormDestroy(Sender: TObject);
begin
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmFetchTable.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  // create command interface
  FConnIntf.CreateCommand(FCommIntf);

  with FCommIntf do begin
    Prepare('select * from {id Shippers}');                       // prepare a command
    Define(FTab);
    {Define(FTab, mmOverride); - if we wish redefine our table, which was defined before
     Define(FTab, mmRely); - if we want check our table definition
    }
    Open;                                                         // open command interface
    Fetch(FTab);                                                  // fetching table
  end;
  PrintRows(FTab, Console.Lines, 'Fetching a table...');
end;

end.



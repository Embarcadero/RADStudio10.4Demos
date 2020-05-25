
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fStoredProcedures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS, 
  FireDAC.DApt.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmStoredProcedures = class(TfrmMainLayers)
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStoredProcedures: TfrmStoredProcedures;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Option, FireDAC.Stan.Factory,
  uDatSUtils;

procedure TfrmStoredProcedures.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  cbDB.ItemIndex := cbDB.Items.IndexOf('Oracle_Demo');
  if cbDB.ItemIndex = -1 then
    ShowMessage('This demo requires Oracle_Demo connection definition !'#13#10 +
                'docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC)')
  else
    cbDBClick(nil);
end;

procedure TfrmStoredProcedures.cbDBClick(Sender: TObject);
var
  oComm:  IFDPhysCommand;
  oAdapt: IFDDAptTableAdapter;
begin
  inherited cbDBClick(Sender);
  // 1. create table adapter
  FDCreateInterface(IFDDAptTableAdapter, oAdapt);
  with oAdapt do begin

    // 2. assign command
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;

    // 3. set DatSTable name, where rows will be fetched
    DatSTableName := 'StoredProc';

    // 4. set up SelectCommand
    with SelectCommand do begin
      // set package name
      BaseObjectName := 'FDQA_testpack';
      // set porcedure's name
      CommandText := 'SelectShippers';
      // we have stored procedure with cursor
      CommandKind := skStoredProcWithCrs;
      Prepare;
    end;

    // 5. fetch rows
    Define;
    Fetch;

    PrintRows(DatSTable, Console.Lines, 'Fetched rows ------------------');
  end;
end;

end.


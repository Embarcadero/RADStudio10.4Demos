
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fAutoInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmAutoInc = class(TfrmMainLayers)
    btnInsert: TButton;
    edtSeed: TLabeledEdit;
    edtStep: TLabeledEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
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
  frmAutoInc: TfrmAutoInc;

implementation

uses
  uDatSUtils;

var
  glInsertedRow: Integer;

{$R *.dfm}

procedure TfrmAutoInc.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('Shippers');
  glInsertedRow := 0;

  edtSeed.Text := IntToStr(-1);
  edtStep.Text := IntToStr(-1);
end;

procedure TfrmAutoInc.FormDestroy(Sender: TObject);
begin
  FCommIntf := nil;
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmAutoInc.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  FConnIntf.CreateCommand(FCommIntf);
  with FCommIntf do begin
    Prepare('select * from {id Shippers}');
    Define(FTab);
    with FTab.Columns.ColumnByName('ShipperID') do begin   // If you wish add rows to table
      AutoIncrement := True;                               // you must set up identity column
      // All of numeric columns (dtByte/dtSByte, dtIntXX/dtUIntXX, dtDouble, dtBCD/dtFmtBCD, dtCurrency)
      // may be identity in FireDAC
      AutoIncrementSeed := StrToInt(edtSeed.Text);
      AutoIncrementStep := StrToInt(edtStep.Text);
    end;
    Open;
    Fetch(FTab);
  end;
  PrintRows(FTab, Console.Lines, 'The table...');

  btnInsert.Enabled := True;
end;

procedure TfrmAutoInc.btnInsertClick(Sender: TObject);
begin
  FTab.Rows.Add([Unassigned, 'string' + IntToStr(glInsertedRow), glInsertedRow * 3]);
  Inc(glInsertedRow);
  PrintRows(FTab, Console.Lines, 'Inserted rows...');
end;

end.



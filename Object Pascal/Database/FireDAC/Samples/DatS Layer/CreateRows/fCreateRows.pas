
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fCreateRows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf;

type
  TfrmCreateRows = class(TfrmDatSLayerBase)
    btnCreateTable: TButton;
    btnPopulate: TButton;
    btnPrint: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FTab: TFDDatSTable;
  public
    { Public declarations }
  end;

var
  frmCreateRows: TfrmCreateRows;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmCreateRows.btnCreateTableClick(Sender: TObject);
begin
  FTab := TFDDatSTable.Create('Table');
  // define table structure
  FTab.Columns.Add('id', dtInt32);
  FTab.Columns.Add('string', dtAnsiString).Size := 12;
  FTab.Columns.Add('double', dtDouble);

  btnPopulate.Enabled := True;
end;

procedure TfrmCreateRows.btnPopulateClick(Sender: TObject);
var
  oCol: TFDDatSColumn;
  oRow1, oRow2: TFDDatSRow;
begin
  // 1. create row
  oRow1 := FTab.NewRow;
  // set values
  oRow1.SetValues([1, 'first row', 14.124145]);
  // add to table
  FTab.Rows.Add(oRow1);

  // 2. create and set values
  oRow2 := FTab.NewRow([2, 'second row', 14515.1251]);
  // add to table
  FTab.Rows.Add(oRow2);

  // 3. create, set values and add to table
  FTab.Rows.Add([3, 'third row', 114.22]);

  // 4. edit row
  oRow1.BeginEdit;
  oRow1.SetData(0, 10);
  oRow1.EndEdit;

  // 5. once more
  oCol := FTab.Columns[1];
  oRow1.BeginEdit;
  oRow1.SetData(oCol, 'ten row');
  oRow1.EndEdit;

  btnPrint.Enabled := True;
end;

procedure TfrmCreateRows.FormDestroy(Sender: TObject);
begin
  FTab.Free;
end;

procedure TfrmCreateRows.btnPrintClick(Sender: TObject);
begin
  PrintRows(FTab, Console.Lines, 'Our rows...');
end;

end.

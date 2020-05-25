
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fCompareRows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf;

type
  TfrmCompareRows = class(TfrmDatSLayerBase)
    SpeedButton1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FTab: TFDDatSTable;
    FRow, FRowDiff: TFDDatSRow;
  end;

var
  frmCompareRows: TfrmCompareRows;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmCompareRows.FormCreate(Sender: TObject);
begin
  // creating and defining a table structure
  FTab := TFDDatSTable.Create('Tab');
  with FTab.Columns do begin
    Add('ID', dtInt32);
    Add('f1', dtAnsiString).Size := 5;
    Add('f2', dtAnsiString).Size := 5;
    Add('f3', dtDouble);
  end;

  // populating the table
  FRow := FTab.Rows.Add([1, 'Hello', 'world', 3.1415926535]);
  FRowDiff := FTab.NewRow;
  PrintRowVersion(FRow, Console.Lines);
end;

procedure TfrmCompareRows.FormDestroy(Sender: TObject);
begin
  FTab.Free;
end;

procedure TfrmCompareRows.SpeedButton1Click(Sender: TObject);
var
  i: TFDDatSRowVersion;
  s: String;
begin
  Console.Lines.Add('');
  // Copying data to buffer...
  FTab.Import(FRow, FRowDiff);

  // editing
  with FRow do begin
    Console.Lines.Add('Changing values...');
    BeginEdit;
    SetValues([10, 'World', 'hello', 0.5]);
    PrintRowVersion(FRow, Console.Lines);
  end;

  // Comparing
  with FRow do
   for i := Low(TFDDatSRowVersion) to High(TFDDatSRowVersion) do
    if HasVersion(i) then begin
      Console.Lines.Add(RowVersions[i]);
      case CompareRows(nil, nil, nil, -1, FRowDiff, nil, i, [], FDEmptyCC) of
      0:  s:= 'FRow = FRowDiff';
      1:  s:= 'FRow > FRowDiff';
      -1: s:= 'FRow < FRowDiff';
      end;
      Console.Lines.Add(s);
    end;
end;

end.


//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fAggregates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf;

type
  TfrmAggregates = class(TfrmDatSLayerBase)
    btnCreateTable: TButton;
    btnCreateView: TButton;
    btnInsert: TButton;
    Memo1: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure btnCreateViewClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FTab: TFDDatSTable;
    FDefaultView: TFDDatSView;
  end;

var
  frmAggregates: TfrmAggregates;

implementation

uses
  uDatSUtils;

var
  oAggreg1, oAggreg2, oAggreg3: TFDDatSAggregate;
  glInsertedRow: Integer;

{$R *.dfm}

procedure TfrmAggregates.FormCreate(Sender: TObject);
begin
  glInsertedRow := 0;

  btnCreateTable.Enabled := True;
  btnCreateView.Enabled := False;
  btnInsert.Enabled := False;
end;

procedure TfrmAggregates.FormDestroy(Sender: TObject);
begin
  FTab.Free;
end;

procedure TfrmAggregates.btnCreateTableClick(Sender: TObject);
var
  i: Integer;
begin
  FTab := TFDDatSTable.Create('Table1');
  FTab.Columns.Add('id', dtInt32);
  FTab.Columns.Add('name').Size := 13;
  FTab.Columns.Add('cnt', dtInt16);
  FTab.Columns.Add('price', dtCurrency);

  // populate the table
  for i := 0 to 4 do
    FTab.Rows.Add([i, 'string #' + IntToStr(i), i * 3, i * 1.15]);

  btnCreateTable.Enabled := False;
  btnCreateView.Enabled := True;
  btnInsert.Enabled := True;
end;

procedure TfrmAggregates.btnCreateViewClick(Sender: TObject);
begin
  FDefaultView := FTab.DefaultView;

  // create an aggregate, first way
  oAggreg1 := TFDDatSAggregate.Create;
  with oAggreg1 do begin
    Name := 'Sum';
    Expression := 'Sum(cnt * price)';
  end;
  FDefaultView.Aggregates.Add(oAggreg1);
  oAggreg1.Active := True;

  // second way
  oAggreg2 := TFDDatSAggregate.Create('Avg', 'Avg(cnt)');
  FDefaultView.Aggregates.Add(oAggreg2);

  // third way
  oAggreg3 := FDefaultView.Aggregates.Add('Max', 'Max(price)');

  btnCreateView.Enabled := False;
end;

procedure TfrmAggregates.btnInsertClick(Sender: TObject);
begin
  FTab.Rows.Add([
    FTab.Rows.Count,
    'inserted #' + IntToStr(glInsertedRow),
    glInsertedRow * 3,
    glInsertedRow * 25
  ]);
  Inc(glInsertedRow);

  PrintRows(FDefaultView, Console.Lines, 'Default view...');
  Console.Lines.Add('');
  with FDefaultView.Rows do
    Console.Lines.Add(oAggreg1.Expression + ' = ' + VarToStr(oAggreg1.Value[Count - 1]) + ' ' +
                      oAggreg2.Expression + ' = ' + VarToStr(oAggreg2.Value[Count - 1]) + ' ' +
                      oAggreg3.Expression + ' = ' + VarToStr(oAggreg3.Value[Count - 1]));
end;

end.



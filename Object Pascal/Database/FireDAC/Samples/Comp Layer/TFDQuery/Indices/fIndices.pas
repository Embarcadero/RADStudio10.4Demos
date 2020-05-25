//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions, FireDAC.VCLUI.Controls,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmIndices = class(TfrmMainQueryBase)
    qryMain: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    cbIndexes: TComboBox;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cbIndexesChange(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndices: TfrmIndices;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmIndices.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited FormCreate(Sender);
  RegisterDS(qryMain);
  for i := 0 to qryMain.Indexes.Count - 1 do
    cbIndexes.Items.Add(qryMain.Indexes[i].Name);
end;

procedure TfrmIndices.cbDBClick(Sender: TObject);
begin
  qryMain.Close;
  inherited cbDBClick(Sender);
  qryMain.Open;
end;

procedure TfrmIndices.cbIndexesChange(Sender: TObject);
begin
  // See the set of indices in design time.
  // Simple click on Indexes property of TFDQuery
  qryMain.IndexName := cbIndexes.Text;
  qryMain.First;
end;

procedure TfrmIndices.DBGrid1TitleClick(Column: TColumn);
begin
  // Dynamic sorting
  if qryMain.IndexFieldNames = Column.Field.FieldName then
    qryMain.IndexFieldNames := Column.Field.FieldName + ':D'
  else if qryMain.IndexFieldNames = Column.Field.FieldName + ':D' then
    qryMain.IndexFieldNames := ''
  else
    qryMain.IndexFieldNames := Column.Field.FieldName;
  qryMain.First;
end;

end.


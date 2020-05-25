//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fSchemaAdapter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DBCtrls, DB,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Error, FireDAC.DApt,
  FireDAC.Stan.Async;

type
  TfrmSchemaAdapter = class(TfrmMainCompBase)
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDTableAdapter1: TFDTableAdapter;
    FDTableAdapter2: TFDTableAdapter;
    FDCommand1: TFDCommand;
    FDCommand2: TFDCommand;
    FDMemTable1: TFDMemTable;
    FDMemTable2: TFDMemTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    btnSavePoint: TButton;
    btnRevertPoint: TButton;
    btnULastChange: TButton;
    btnCancelUpdates: TButton;
    btnApplyUpdates: TButton;
    procedure cbDBClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnSavePointClick(Sender: TObject);
    procedure btnRevertPointClick(Sender: TObject);
    procedure btnULastChangeClick(Sender: TObject);
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure btnApplyUpdatesClick(Sender: TObject);
  private
    FSavePoint: Int64;
  public
    { Public declarations }
  end;

var
  frmSchemaAdapter: TfrmSchemaAdapter;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmSchemaAdapter.cbDBClick(Sender: TObject);
begin
  FDSchemaAdapter1.Close;
  inherited cbDBClick(Sender);
  FDSchemaAdapter1.Open;
end;

procedure TfrmSchemaAdapter.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  StatusBar1.SimpleText := 'Change''s Count = ' + IntToStr(FDSchemaAdapter1.ChangeCount);
end;

procedure TfrmSchemaAdapter.btnSavePointClick(Sender: TObject);
begin
  FSavePoint := FDSchemaAdapter1.SavePoint;
end;

procedure TfrmSchemaAdapter.btnRevertPointClick(Sender: TObject);
begin
  FDSchemaAdapter1.SavePoint := FSavePoint;
end;

procedure TfrmSchemaAdapter.btnULastChangeClick(Sender: TObject);
begin
  FDSchemaAdapter1.UndoLastChange;
end;

procedure TfrmSchemaAdapter.btnCancelUpdatesClick(Sender: TObject);
begin
  FDSchemaAdapter1.CancelUpdates;
end;

procedure TfrmSchemaAdapter.btnApplyUpdatesClick(Sender: TObject);
begin
  FDSchemaAdapter1.ApplyUpdates;
  FDSchemaAdapter1.CommitUpdates;
end;

end.


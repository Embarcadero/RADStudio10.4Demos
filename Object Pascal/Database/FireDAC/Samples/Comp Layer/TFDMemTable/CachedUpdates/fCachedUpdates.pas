//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fCachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DBCtrls, ComCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.VCLUI.Login,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TfrmCachedUpdates = class(TfrmMainCompBase)
    cdsOrders: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnSavePoint: TButton;
    btnRevertPoint: TButton;
    btnRevertRecord: TButton;
    btnULastChange: TButton;
    btnCancelUpdates: TButton;
    btnApplyUpdates: TButton;
    FDTableAdapter1: TFDTableAdapter;
    Panel1: TPanel;
    FDCommand1: TFDCommand;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSavePointClick(Sender: TObject);
    procedure btnRevertPointClick(Sender: TObject);
    procedure btnRevertRecordClick(Sender: TObject);
    procedure btnULastChangeClick(Sender: TObject);
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FSavePoint: Integer;
  public
    { Public declarations }
  end;

var
  frmCachedUpdates: TfrmCachedUpdates;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmCachedUpdates.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
end;

procedure TfrmCachedUpdates.FormDestroy(Sender: TObject);
begin
  cdsOrders.Close;
end;

procedure TfrmCachedUpdates.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.SimpleText := 'Change''s Count = ' + IntToStr(cdsOrders.ChangeCount);
end;

procedure TfrmCachedUpdates.btnSavePointClick(Sender: TObject);
begin
  FSavePoint := cdsOrders.SavePoint;
end;

procedure TfrmCachedUpdates.btnRevertPointClick(Sender: TObject);
begin
  cdsOrders.SavePoint := FSavePoint;
end;

procedure TfrmCachedUpdates.btnRevertRecordClick(Sender: TObject);
begin
  cdsOrders.RevertRecord;
end;

procedure TfrmCachedUpdates.btnULastChangeClick(Sender: TObject);
begin
  cdsOrders.UndoLastChange(True);
end;

procedure TfrmCachedUpdates.btnCancelUpdatesClick(Sender: TObject);
begin
  cdsOrders.CancelUpdates;
end;

procedure TfrmCachedUpdates.btnApplyUpdatesClick(Sender: TObject);
begin
  cdsOrders.ApplyUpdates;
end;

procedure TfrmCachedUpdates.cbDBClick(Sender: TObject);
begin
  cdsOrders.Close;
  inherited cbDBClick(Sender);
  cdsOrders.Active := True;
end;

end.

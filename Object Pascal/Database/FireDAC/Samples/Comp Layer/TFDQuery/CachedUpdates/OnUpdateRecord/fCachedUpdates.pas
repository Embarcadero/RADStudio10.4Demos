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
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, DBCtrls,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, fMainCompBase,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
  FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.VCLUI.Controls, FireDAC.Stan.Error;

type
  TfrmCachedUpdates = class(TfrmMainQueryBase)
    qryProducts: TFDQuery;
    usProducts: TFDUpdateSQL;
    usCategories: TFDUpdateSQL;
    dsProducts: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnApply: TButton;
    btnCancel: TButton;
    btnCommit: TButton;
    btnRevert: TButton;
    btnUndoLast: TButton;
    Panel1: TPanel;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRevertClick(Sender: TObject);
    procedure btnUndoLastClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure qryProductsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  RegisterDS(qryProducts);
end;

procedure TfrmCachedUpdates.qryProductsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  // Categories and Products DB tables are related one-to-many.
  // qryProducts.SQL is a join of Products and Categories tables.
  // usProducts posts changes to Products table and usCategories
  // to Categories one. At first, we post changes to Products
  // (detail) table, at second to Categories (master) one.
  if not (ARequest in [arLock, arUnlock]) then begin
    usProducts.ConnectionName := qryProducts.ConnectionName;
    usProducts.DataSet := qryProducts;
    usProducts.Apply(ARequest, AAction, AOptions);

    if AAction = eaApplied then begin
      usCategories.ConnectionName := qryProducts.ConnectionName;
      usCategories.DataSet := qryProducts;
      usCategories.Apply(ARequest, AAction, AOptions);
    end;
  end;
  AAction := eaApplied;
end;

procedure TfrmCachedUpdates.btnApplyClick(Sender: TObject);
begin
  qryProducts.ApplyUpdates;
end;

procedure TfrmCachedUpdates.btnCancelClick(Sender: TObject);
begin
  qryProducts.CancelUpdates;
end;

procedure TfrmCachedUpdates.btnCommitClick(Sender: TObject);
begin
  qryProducts.CommitUpdates;
end;

procedure TfrmCachedUpdates.btnRevertClick(Sender: TObject);
begin
  qryProducts.RevertRecord;
end;

procedure TfrmCachedUpdates.btnUndoLastClick(Sender: TObject);
begin
  qryProducts.UndoLastChange(True);
end;

procedure TfrmCachedUpdates.cbDBClick(Sender: TObject);
begin
  qryProducts.Close;
  inherited cbDBClick(Sender);
  qryProducts.Open;
  with qryProducts.FieldByName('ProductID') do
    ProviderFlags := [pfInWhere, pfInKey];
end;

end.

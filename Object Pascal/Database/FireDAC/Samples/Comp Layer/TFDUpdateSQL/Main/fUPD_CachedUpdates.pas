//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fUPD_CachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, DBCtrls,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Controls, FireDAC.Stan.Error;

type
  TfrmCachedUpdates = class(TfrmMainQueryBase)
    qrProducts: TFDQuery;
    usProducts: TFDUpdateSQL;
    usCategories: TFDUpdateSQL;
    dsProducts: TDataSource;
    DBGrid1: TDBGrid;
    btnApply: TButton;
    btnCancel: TButton;
    btnCommit: TButton;
    btnRevert: TButton;
    btnUndoLast: TButton;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    procedure qrProductsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRevertClick(Sender: TObject);
    procedure btnUndoLastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCachedUpdates: TfrmCachedUpdates;

implementation

uses dmMainComp;

{$R *.dfm}

procedure TfrmCachedUpdates.qrProductsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
begin
  usProducts.ConnectionName := qrProducts.ConnectionName;
  usProducts.DataSet := qrProducts;
  usProducts.Apply(ARequest, AAction, AOptions);

  usCategories.ConnectionName := qrProducts.ConnectionName;
  usCategories.DataSet := qrProducts;
  usCategories.Apply(ARequest, AAction, AOptions);

  AAction := eaApplied;
end;

procedure TfrmCachedUpdates.btnApplyClick(Sender: TObject);
begin
  qrProducts.ApplyUpdates;
end;

procedure TfrmCachedUpdates.btnCancelClick(Sender: TObject);
begin
  qrProducts.CancelUpdates;
end;

procedure TfrmCachedUpdates.btnCommitClick(Sender: TObject);
begin
  qrProducts.CommitUpdates;
end;

procedure TfrmCachedUpdates.btnRevertClick(Sender: TObject);
begin
  qrProducts.RevertRecord;
end;

procedure TfrmCachedUpdates.btnUndoLastClick(Sender: TObject);
begin
  qrProducts.UndoLastChange(True);
end;

procedure TfrmCachedUpdates.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qrProducts);
end;

procedure TfrmCachedUpdates.cbDBClick(Sender: TObject);
begin
  qrProducts.Close;
  inherited cbDBClick(Sender);
  qrProducts.SQL.Clear;
  qrProducts.SQL.Add('select p.*, c.CategoryName from ');
  qrProducts.SQL.Add(dmlMainComp.dbMain.EncodeObjectName('', '', '', 'Categories'));
  qrProducts.SQL.Add(' c,');
  qrProducts.SQL.Add(dmlMainComp.dbMain.EncodeObjectName('', '', '', 'Products'));
  qrProducts.SQL.Add(' p');
  qrProducts.SQL.Add('where p.CategoryID = c.CategoryID');
  qrProducts.Open
end;

end.

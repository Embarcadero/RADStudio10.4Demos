//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fAsync;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions, FireDAC.VCLUI.Controls,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAsync = class(TfrmMainQueryBase)
    qryExecSQL: TFDQuery;
    btnExec: TButton;
    mmExample: TMemo;
    btnExecCancelDlg: TButton;
    btnAsyncExec: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnExecClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure btnExecCancelDlgClick(Sender: TObject);
    procedure btnAsyncExecClick(Sender: TObject);
    procedure qryExecSQLAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAsync: TfrmAsync;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmAsync.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qryExecSQL);

  btnExec.Enabled := False;
  btnExecCancelDlg.Enabled := False;
  btnAsyncExec.Enabled := False;
end;

procedure TfrmAsync.cbDBClick(Sender: TObject);
begin
  btnExec.Enabled := False;
  btnExecCancelDlg.Enabled := False;
  btnAsyncExec.Enabled := False;

  qryExecSQL.Close;
  inherited cbDBClick(Sender);

  btnExec.Enabled := True;
  btnExecCancelDlg.Enabled := True;
  btnAsyncExec.Enabled := True;
end;

procedure TfrmAsync.btnExecClick(Sender: TObject);
begin
  qryExecSQL.SQL.Text := 'delete from {id Orders} where OrderID > 1000000';
  qryExecSQL.ExecSQL;
  mmExample.Text := qryExecSQL.SQL.Text;
end;

procedure TfrmAsync.btnExecCancelDlgClick(Sender: TObject);
begin
  qryExecSQL.ResourceOptions.CmdExecMode := amCancelDialog;
  qryExecSQL.SQL.Text := 'select count(*) from {id Order Details} a, {id Order Details} b group by a.OrderID';
  mmExample.Text := qryExecSQL.SQL.Text;
  qryExecSQL.Open;
end;

procedure TfrmAsync.btnAsyncExecClick(Sender: TObject);
begin
  qryExecSQL.ResourceOptions.CmdExecMode := amAsync;
  qryExecSQL.SQL.Text := 'select count(*) from {id Order Details} a, {id Order Details} b group by a.OrderID';
  mmExample.Text := qryExecSQL.SQL.Text;
  // detach query from datasource, while query execution will
  // be not finished - qryExecSQLAfterOpen will restore things.
  DataSource1.DataSet := nil;
  qryExecSQL.AfterOpen := qryExecSQLAfterOpen;
  // open
  qryExecSQL.Open;
end;

procedure TfrmAsync.qryExecSQLAfterOpen(DataSet: TDataSet);
begin
  // restore things
  DataSource1.DataSet := qryExecSQL;
  qryExecSQL.AfterOpen := nil;
end;

end.

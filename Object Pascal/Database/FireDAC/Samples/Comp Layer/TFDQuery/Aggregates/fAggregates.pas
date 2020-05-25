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
    Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons,
  fMainCompBase, fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions, FireDAC.VCLUI.Controls,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, 
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAggregates = class(TfrmMainQueryBase)
    qryAggregates: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtUser: TLabeledEdit;
    edtMax: TLabeledEdit;
    edtAvg: TLabeledEdit;
    edtSum: TLabeledEdit;
    edtUsrRes: TLabeledEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAggregates: TfrmAggregates;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmAggregates.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qryAggregates);
end;

procedure TfrmAggregates.cbDBClick(Sender: TObject);
begin
  qryAggregates.Close;
  inherited cbDBClick(Sender);
  qryAggregates.Open;
end;

procedure TfrmAggregates.edtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    with qryAggregates.Aggregates.Items[3] do begin
      Expression := edtUser.Text;
      Active := True;
      edtUsrRes.Text := VarToStr(Value);
    end
end;

procedure TfrmAggregates.DataSource1DataChange(Sender: TObject; Field: TField);
var
  oAggr: TFDAggregates;
begin
  oAggr := qryAggregates.Aggregates;
  edtAvg.Text := VarToStr(oAggr.Items[0].Value);
  edtSum.Text := VarToStr(oAggr.Items[1].Value);
  edtMax.Text := VarToStr(oAggr.Items[2].Value);
  edtUsrRes.Text := VarToStr(oAggr.Items[3].Value);
end;

end.

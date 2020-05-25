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
  fMainCompBase, fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Error, FireDAC.DApt, FireDAC.Stan.Async,
  FireDAC.VCLUI.FetchOptions, FireDAC.VCLUI.FormatOptions,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.UpdateOptions, FireDAC.VCLUI.Controls;

type
  TfrmSchemaAdapter = class(TfrmMainQueryBase)
    FDSchemaAdapter1: TFDSchemaAdapter;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    Button1: TButton;
    qMaster: TFDQuery;
    qDetail: TFDQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure cbDBClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  qDetail.Active := False;
  qMaster.Active := False;
  inherited cbDBClick(Sender);
  qMaster.Active := True;
  qDetail.Active := True;
end;

procedure TfrmSchemaAdapter.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qMaster);
  RegisterDS(qDetail);
end;

procedure TfrmSchemaAdapter.Button1Click(Sender: TObject);
begin
  FDSchemaAdapter1.ApplyUpdates;
  qMaster.CommitUpdates;
  qDetail.CommitUpdates;
end;

end.


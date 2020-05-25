//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, ComCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Error;

type
  TfrmMasterDetail = class(TfrmMainCompBase)
    cdsOrders: TFDMemTable;
    cdsOrdDetails: TFDMemTable;
    dsOrders: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsOrdDetails: TDataSource;
    Splitter1: TSplitter;
    adOrders: TFDTableAdapter;
    adOrderDetails: TFDTableAdapter;
    cmOrders: TFDCommand;
    cmOrderDetails: TFDCommand;
    chbFetchOnDemand: TCheckBox;
    pnlFetchOnDemand: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure cbDBClick(Sender: TObject);
    procedure chbFetchOnDemandClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmMasterDetail.cbDBClick(Sender: TObject);
begin
  with dmlMainComp.dbMain.FetchOptions do
    Items := Items - [fiMeta];

  cdsOrders.Close;
  cdsOrdDetails.Close;
  inherited cbDBClick(Sender);
  cdsOrders.Active := True;
  cdsOrdDetails.Active := True;
end;

procedure TfrmMasterDetail.chbFetchOnDemandClick(Sender: TObject);
begin
  // In this mode the client dataset fetches additional packets of data as needed (for example,
  // as a user scrolls through data, or conducts a search).
  if chbFetchOnDemand.Checked then
    cdsOrders.FetchOptions.Mode := fmOnDemand
  else
    cdsOrders.FetchOptions.Mode := fmManual;
  if chbFetchOnDemand.Checked then
    cdsOrdDetails.FetchOptions.Mode := fmOnDemand
  else
    cdsOrdDetails.FetchOptions.Mode := fmManual;
end;

procedure TfrmMasterDetail.Button1Click(Sender: TObject);
begin
  cdsOrders.ApplyUpdates();
  cdsOrdDetails.ApplyUpdates();
end;

procedure TfrmMasterDetail.Button2Click(Sender: TObject);
begin
  cdsOrders.CancelUpdates();
  cdsOrdDetails.CancelUpdates();
  cdsOrders.Refresh;
  cdsOrdDetails.Refresh;
end;

end.

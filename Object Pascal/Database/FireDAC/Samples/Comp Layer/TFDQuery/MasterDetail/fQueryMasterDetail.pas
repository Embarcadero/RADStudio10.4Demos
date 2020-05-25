//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fQueryMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, ComCtrls,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
    FireDAC.VCLUI.Controls,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMasterDetail = class(TfrmMainQueryBase)
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    qryOrders: TFDQuery;
    qryOrdersOrderID: TFDAutoIncField;
    qryOrdersCustomerID: TStringField;
    qryOrdersEmployeeID: TIntegerField;
    qryOrdersOrderDate: TSQLTimeStampField;
    qryOrdersRequiredDate: TSQLTimeStampField;
    qryOrdersShippedDate: TSQLTimeStampField;
    qryOrdersFreight: TCurrencyField;
    qryOrdersShipVia: TIntegerField;
    qryOrdersShipName: TStringField;
    qryOrdersShipAddress: TStringField;
    qryOrdersShipCity: TStringField;
    qryOrdersShipRegion: TStringField;
    qryOrdersShipPostalCode: TStringField;
    qryOrdersShipCountry: TStringField;
    dsOrders: TDataSource;
    qryOrderDetails: TFDQuery;
    qryOrderDetailsOrderID: TIntegerField;
    qryOrderDetailsProductID: TIntegerField;
    qryOrderDetailsUnitPrice: TCurrencyField;
    qryOrderDetailsQuantity: TSmallintField;
    qryOrderDetailsDiscount: TFloatField;
    dsOrderDetails: TDataSource;
    Splitter1: TSplitter;
    mmComment: TMemo;
    Panel1: TPanel;
    cbxCacheDetails: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure cbDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxCacheDetailsClick(Sender: TObject);
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

uses dmMainComp;

{$R *.dfm}

procedure TfrmMasterDetail.cbDBClick(Sender: TObject);
begin
  Button1.Enabled := False;
  Button2.Enabled := False;
  qryOrderDetails.Close;
  qryOrders.Close;
  inherited cbDBClick(Sender);
  qryOrders.Open;
  qryOrderDetails.Open;
  Button1.Enabled := True;
  Button2.Enabled := True;
end;

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qryOrders);
  RegisterDS(qryOrderDetails);
  Button1.Enabled := False;
  Button2.Enabled := False;
end;

procedure TfrmMasterDetail.Button1Click(Sender: TObject);
begin
  qryOrders.Refresh;
end;

procedure TfrmMasterDetail.Button2Click(Sender: TObject);
begin
  qryOrderDetails.Refresh;
end;

procedure TfrmMasterDetail.cbxCacheDetailsClick(Sender: TObject);
begin
  // Set qryOrderDetails.IndexFieldName to the fields,
  // corresponding to detail paramaters. For example,
  // for query:
  //    select * from {id Order Details}
  //    where OrderID = :OrderID
  // set qryOrderDetails.IndexFieldNames to OrderID
  with qryOrderDetails.FetchOptions do
    if cbxCacheDetails.Checked then
      // cache fetched detail records and query if no detail records in cache
      Cache := Cache + [fiDetails]
    else
      // do not cache detail records and query them each time master changed
      Cache := Cache - [fiDetails];
  if qryOrderDetails.Active then begin
    qryOrderDetails.Close;
    qryOrderDetails.Open;
  end;
end;

end.

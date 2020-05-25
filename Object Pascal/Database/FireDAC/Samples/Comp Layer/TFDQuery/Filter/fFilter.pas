//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  fMainQueryBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Controls, FireDAC.Stan.Error;

type
  TfrmFilter = class(TfrmMainQueryBase)
    qryWithFilter: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edtExample: TEdit;
    btnFilter1: TButton;
    btnFilter2: TButton;
    btnFilter3: TButton;
    btnFilter4: TButton;
    btnFilter6: TButton;
    btnFilter5: TButton;
    Panel1: TPanel;
    mmInfo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure btnFilter1Click(Sender: TObject);
    procedure btnFilter2Click(Sender: TObject);
    procedure btnFilter3Click(Sender: TObject);
    procedure btnFilter4Click(Sender: TObject);
    procedure qryWithFilterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure btnFilter5Click(Sender: TObject);
    procedure btnFilter6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFilter: TfrmFilter;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  RegisterDS(qryWithFilter);
end;

procedure TfrmFilter.cbDBClick(Sender: TObject);
begin
  qryWithFilter.Close;
  inherited cbDBClick(Sender);
  qryWithFilter.Open;
end;

procedure TfrmFilter.btnFilter1Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    OnFilterRecord := nil;
    // date separator may be used any from [' ', '-', '\', '.', '/']
    Filter := 'OrderDate < TO_DATE(''1996-07-29'',''yyyy-mm-dd'')';
    Filtered := True;
  end;
  edtExample.Text := qryWithFilter.Filter;
end;

procedure TfrmFilter.btnFilter2Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    OnFilterRecord := nil;
    // date separator may be used any from [' ', '-', '\', '.', '/']
    Filter := 'OrderDate < TO_DATE(''96-08-29'',''yy-mm-dd'')';
    Filtered := True;
  end;
  edtExample.Text := qryWithFilter.Filter;
end;

procedure TfrmFilter.btnFilter3Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'OrderID BETWEEN 10270 AND 10280';
    Filtered := True;
  end;
  edtExample.Text := qryWithFilter.Filter;
end;

procedure TfrmFilter.btnFilter4Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    OnFilterRecord := nil;
    // following is equivalent to LIKE ''F%''
    // ESCAPE is used just to show it is supported
    Filter := 'CustomerID LIKE ''/F%'' ESCAPE ''/''';
    Filtered := True;
  end;
  edtExample.Text := qryWithFilter.Filter;
end;

procedure TfrmFilter.qryWithFilterFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet.FieldByName('OrderID') do
    Accept := (10270 <= AsInteger) and (AsInteger <= 10280);
end;

procedure TfrmFilter.btnFilter5Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    Filter := '';
    OnFilterRecord := qryWithFilterFilterRecord;
    Filtered := True;
  end;
  edtExample.Text := '';
end;

procedure TfrmFilter.btnFilter6Click(Sender: TObject);
begin
  with qryWithFilter do begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := edtExample.Text;
    Filtered := True;
  end;
end;

end.

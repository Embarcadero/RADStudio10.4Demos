//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fCloneCursor;

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
  TfrmCloneCursor = class(TfrmMainCompBase)
    cdsOrders: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btnClone: TButton;
    cdsClone: TFDMemTable;
    DataSource2: TDataSource;
    edtStart: TLabeledEdit;
    edtEnd: TLabeledEdit;
    btnCheck: TButton;
    mmHint: TMemo;
    btnCancelRange: TButton;
    Splitter1: TSplitter;
    Panel1: TPanel;
    FDTableAdapter1: TFDTableAdapter;
    FDCommand1: TFDCommand;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnCloneClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnCancelRangeClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCloneCursor: TfrmCloneCursor;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmCloneCursor.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
end;

procedure TfrmCloneCursor.btnCloneClick(Sender: TObject);
begin
  if not dmlMainComp.dbMain.Connected then
    exit;
  cdsClone.CloneCursor(cdsOrders, False);
  cdsClone.Active := True;
end;

procedure TfrmCloneCursor.cbDBClick(Sender: TObject);
begin
  cdsClone.Close;
  cdsOrders.Close;
  inherited cbDBClick(Sender);
  FDCommand1.Connection := dmlMainComp.dbMain;
  cdsOrders.Active := True;
end;

procedure TfrmCloneCursor.btnCheckClick(Sender: TObject);
begin
  if not cdsClone.Active then
    exit;
  with cdsClone do begin
    SetRange([edtStart.Text], [edtEnd.Text]);
    GotoCurrent(cdsOrders);
  end;
end;

procedure TfrmCloneCursor.btnCancelRangeClick(Sender: TObject);
begin
  cdsClone.CancelRange;
end;

end.

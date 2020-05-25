
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fGettingStarted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, DBCtrls, Mask,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Stan.Consts,
  FireDAC.VCLUI.Controls, FireDAC.Stan.Error, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Phys, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error, FireDAC.VCLUI.Login,
  FireDAC.Phys.MSSQL, FireDAC.Phys.ODBCBase;

type
  TfrmGettingStarted = class(TForm)
    pnlButtons: TPanel;
    pnlTitle: TPanel;
    pnlMain: TPanel;
    lblTitle: TLabel;
    imgAnyDAC: TImage;
    lblInfo: TLabel;
    imgInfo: TImage;
    bvlTitle: TBevel;
    bvlButtons: TBevel;
    qryProducts: TFDQuery;
    dsProducts: TDataSource;
    grdCategories: TDBGrid;
    pnlSubPageControl: TPanel;
    sbMain: TStatusBar;
    imgConnect: TImage;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    dbMain: TFDConnection;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    pnlConnDef: TPanel;
    Label2: TLabel;
    qryCategories: TFDQuery;
    Splitter1: TSplitter;
    grdProducts: TDBGrid;
    dsCategories: TDataSource;
    nvgCategories: TDBNavigator;
    nvgProducts: TDBNavigator;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    edtServer: TEdit;
    Label4: TLabel;
    edtDB: TEdit;
    btnConnect: TButton;
    pnlMisc: TPanel;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    procedure lblInfoClick(Sender: TObject);
    procedure imgAnyDACClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

uses
  FireDAC.Stan.Util;

{$R *.dfm}

procedure TfrmGettingStarted.btnConnectClick(Sender: TObject);
begin
  if (edtServer.Text = '') or (edtDB.Text = '') then
    Exit;
  with dbMain do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=MSSQL');
      Add('Server=' + edtServer.Text);
      Add('Database=' + edtDB.Text);
    end;
    Open;
    qryCategories.Open;
    qryProducts.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not dbMain.Connected then
    Exit;
  // Insert a record
  dbMain.ExecSQL('insert into Categories(CategoryName, Description, Picture) ' +
                 'values(:N, :D, :P)', ['New category', 'New description', $0334]);
  qryCategories.Refresh;

  // Get a scalar value from DB
  iID := dbMain.ExecSQLScalar('select MAX(CategoryID) from Categories');
  sbMain.SimpleText := 'Last CategoryID = ' + IntToStr(iID);
end;

procedure TfrmGettingStarted.btnUpdateClick(Sender: TObject);
begin
  if not dbMain.Connected then
    Exit;
  // Update records
  dbMain.ExecSQL('update Products set UnitPrice = UnitPrice * :P1 + :P2 ' +
                 'where ProductID < 3', [Random(5), Random(3)]);
  qryProducts.Refresh;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not dbMain.Connected then
    Exit;
  // Delete a record
  dbMain.ExecSQL('delete from Categories where CategoryName like :N',
    ['New category']);
  qryCategories.Refresh;
end;

procedure TfrmGettingStarted.lblInfoClick(Sender: TObject);
var
  sHtmFile: String;
begin
  sHtmFile := ChangeFileExt(Application.ExeName, '.htm');
  FDShell(sHtmFile, '');
end;

procedure TfrmGettingStarted.imgAnyDACClick(Sender: TObject);
begin
  FDShell('http://www.embarcadero.com/products/rad-studio/firedac', '');
end;

end.

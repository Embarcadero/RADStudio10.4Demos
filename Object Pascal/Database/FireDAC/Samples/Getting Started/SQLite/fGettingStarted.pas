
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
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteWrapper,
  FireDAC.Phys.SQLiteDef;

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
    dlgOpen: TOpenDialog;
    sbMain: TStatusBar;
    cbConnDefs: TComboBox;
    imgConnect: TImage;
    imgSecurity: TImage;
    edtPassword: TMaskEdit;
    Label1: TLabel;
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
    pcMain: TPageControl;
    tsMD: TTabSheet;
    tsService: TTabSheet;
    btnApply: TButton;
    Label3: TLabel;
    edtDatabase: TEdit;
    btnOpen: TSpeedButton;
    nvgProducts: TDBNavigator;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    sqlBackup: TFDSQLiteBackup;
    sqlValidate: TFDSQLiteValidate;
    sqlSecurity: TFDSQLiteSecurity;
    sqlFunction: TFDSQLiteFunction;
    edtToPassword: TMaskEdit;
    Label4: TLabel;
    pcService: TPageControl;
    tsSecurity: TTabSheet;
    tsBackup: TTabSheet;
    tsValidate: TTabSheet;
    Label6: TLabel;
    edtDestPassword: TMaskEdit;
    btnBackup: TButton;
    imgBackup: TImage;
    edtDestDatabase: TEdit;
    Label8: TLabel;
    imgValidate: TImage;
    btnValidate: TButton;
    mmLog: TMemo;
    Label11: TLabel;
    rgSecActions: TRadioGroup;
    rgValActions: TRadioGroup;
    pnlCommon: TPanel;
    imgCommon: TImage;
    pnlMisc: TPanel;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbConnDefsClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure lblInfoClick(Sender: TObject);
    procedure imgAnyDACClick(Sender: TObject);
    procedure btnValidateClick(Sender: TObject);
    procedure sqlValidateProgress(ASender: TFDPhysDriverService;
      const AMessage: String);
    procedure btnApplyClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure sqlFunctionCalculate(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

uses
  FireDAC.Stan.Util;

{$R *.dfm}

procedure TfrmGettingStarted.FormCreate(Sender: TObject);
begin
  cbConnDefs.Clear;
  cbConnDefs.Items.Add('<Open database...>');

  dlgOpen.InitialDir := FDManager.ActualConnectionDefFileName;
end;

procedure TfrmGettingStarted.cbConnDefsClick(Sender: TObject);
begin
  if not dlgOpen.Execute then
    Exit;
  with dbMain do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=SQLite');
      Add('Database=' + dlgOpen.FileName);
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

procedure TfrmGettingStarted.btnApplyClick(Sender: TObject);
var
  sDB: String;
begin
  sDB := edtDatabase.Text;
  if sDB = '' then
    Exit;
  with sqlSecurity do begin
    Database := edtDatabase.Text;
    Password := edtPassword.Text;
    ToPassword := edtToPassword.Text;
    case rgSecActions.ItemIndex of
    0: SetPassword;
    1: RemovePassword;
    2: ChangePassword;
    end;
  end;
end;

procedure TfrmGettingStarted.btnBackupClick(Sender: TObject);
var
  sDB: String;
begin
  sDB := edtDatabase.Text;
  if sDB = '' then
    Exit;
  with sqlBackup do begin
    Database := sDB;
    DestDatabase := edtDestDatabase.Text;
    Password := edtPassword.Text;
    DestPassword := edtDestPassword.Text;
    Backup;
  end;
end;

procedure TfrmGettingStarted.sqlFunctionCalculate(
  AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
  AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsCurrency := AInputs[0].AsCurrency * AInputs[1].AsInteger;
end;

procedure TfrmGettingStarted.sqlValidateProgress(
  ASender: TFDPhysDriverService; const AMessage: String);
begin
  mmLog.Lines.Add(AMessage);
end;

procedure TfrmGettingStarted.btnValidateClick(Sender: TObject);
var
  sDB: String;
begin
  sDB := edtDatabase.Text;
  if sDB = '' then
    Exit;
  mmLog.Clear;
  with sqlValidate do begin
    Database := sDb;
    Password := edtPassword.Text;
    case rgValActions.ItemIndex of
    0: Analyze;
    1: if not CheckOnly then
         mmLog.Lines.Add('Database has problems !')
       else
         mmLog.Lines.Add('Database is valid');
    2: Sweep;
    end;
  end;
end;

procedure TfrmGettingStarted.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    edtDatabase.Text := dlgOpen.FileName;
    edtDestDatabase.Text := ChangeFileExt(edtDatabase.Text, '.backup');
  end;
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

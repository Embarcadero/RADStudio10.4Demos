
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
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

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
    imgConnect: TImage;
    imgSecurity: TImage;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    dbMain: TFDConnection;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    pnlConnDef: TPanel;
    qryCategories: TFDQuery;
    Splitter1: TSplitter;
    grdProducts: TDBGrid;
    dsCategories: TDataSource;
    nvgCategories: TDBNavigator;
    pcMain: TPageControl;
    tsMD: TTabSheet;
    tsService: TTabSheet;
    btnApply: TButton;
    nvgProducts: TDBNavigator;
    edtUsrPassword: TMaskEdit;
    Label4: TLabel;
    pcService: TPageControl;
    tsSecurity: TTabSheet;
    tsBackupRestore: TTabSheet;
    tsValidate: TTabSheet;
    btnStart: TButton;
    imgBackup: TImage;
    edtBackupFile: TEdit;
    Label8: TLabel;
    imgValidate: TImage;
    btnValidate: TButton;
    rgSecActions: TRadioGroup;
    rgValActions: TRadioGroup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    ibBackup: TFDIBBackup;
    ibRestore: TFDIBRestore;
    ibValidate: TFDIBValidate;
    ibSecurity: TFDIBSecurity;
    Label14: TLabel;
    edtHost: TEdit;
    Label15: TLabel;
    edtDatabase: TEdit;
    btnOpen: TSpeedButton;
    Label16: TLabel;
    edtUser: TEdit;
    Label17: TLabel;
    edtPassword: TMaskEdit;
    edtSecUser: TEdit;
    Label1: TLabel;
    mmDetails: TMemo;
    Label3: TLabel;
    btnConnect: TButton;
    rgBackupRestore: TRadioGroup;
    Label2: TLabel;
    edtRestoreDB: TEdit;
    trnMain: TFDTransaction;
    pnlTran: TPanel;
    btnStartTran: TButton;
    btnUpdate: TButton;
    btnCommit: TButton;
    btnRollback: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure lblInfoClick(Sender: TObject);
    procedure imgAnyDACClick(Sender: TObject);
    procedure btnValidateClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnStartTranClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

uses
  FireDAC.Stan.Util;

{$R *.dfm}

procedure TfrmGettingStarted.btnConnectClick(Sender: TObject);
begin
  if (edtHost.Text = '') or (edtDatabase.Text = '') then
    Exit;
  with dbMain do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=FB');
      Add('Server=' + edtHost.Text);
      Add('Database=' + edtDatabase.Text);
      Add('User_Name=' + edtUser.Text);
      Add('Password=' + edtPassword.Text);
    end;
    Open;
    qryCategories.Open;
    qryProducts.Open;
  end;
end;

procedure TfrmGettingStarted.btnStartTranClick(Sender: TObject);
begin
  trnMain.StartTransaction;
end;

procedure TfrmGettingStarted.btnUpdateClick(Sender: TObject);
var
  dMaxPrice: Double;
begin
  // Update records
  dbMain.ExecSQL('update {id Products} set UnitPrice = UnitPrice * :P1 + :P2 ' +
                 'where ProductID < 3', [Random(5), Random(3)]);
  qryProducts.Refresh;

  // Get a scalar value from DB
  dMaxPrice := dbMain.ExecSQLScalar('select MAX(UnitPrice) from {id Products}');
  sbMain.SimpleText := Format('Max UnitPrice = %m', [dMaxPrice]);
end;

procedure TfrmGettingStarted.btnCommitClick(Sender: TObject);
begin
  trnMain.Commit;
end;

procedure TfrmGettingStarted.btnRollbackClick(Sender: TObject);
begin
  trnMain.Rollback;
  qryProducts.Refresh;
end;

procedure TfrmGettingStarted.btnApplyClick(Sender: TObject);
begin
  if (edtHost.Text = '') or (edtDatabase.Text = '') then
    Exit;
  mmDetails.Clear;
  with ibSecurity do begin
    Host := edtHost.Text;
    UserName := edtUser.Text;
    Password := edtPassword.Text;
    AUserName := edtSecUser.Text;
    case rgSecActions.ItemIndex of
    0:
      begin
        APassword := edtUsrPassword.Text;
        AddUser;
      end;
    1:
      begin
        DeleteUser;
        edtSecUser.Text := '';
        edtUsrPassword.Text := '';
      end;
    2:
      begin
        DisplayUser;
        with mmDetails.Lines do begin
          Add('First name: ' + AFirstName);
          Add('Middle name: ' + AMiddleName);
          Add('Last name: ' + ALastName);
        end;
      end;
    3:
      begin
        APassword := edtUsrPassword.Text;
        ModifyUser;
      end;
    end;
  end;
end;

procedure TfrmGettingStarted.btnStartClick(Sender: TObject);
begin
  if (edtHost.Text = '') or (edtDatabase.Text = '') then
    Exit;
  case rgBackupRestore.ItemIndex of
  0:
    with ibBackup do begin
      Host := edtHost.Text;
      Database := edtDatabase.Text;
      UserName := edtUser.Text;
      Password := edtPassword.Text;
      BackupFiles.Clear;
      BackupFiles.Add(edtBackupFile.Text);
      Backup;
    end;
  1:
    with ibRestore do begin
      Host := edtHost.Text;
      Database := edtRestoreDB.Text;
      UserName := edtUser.Text;
      Password := edtPassword.Text;
      BackupFiles.Clear;
      BackupFiles.Add(edtBackupFile.Text);
      Restore;
    end;
  end;
end;

procedure TfrmGettingStarted.btnValidateClick(Sender: TObject);
begin
  if (edtHost.Text = '') or (edtDatabase.Text = '') then
    Exit;
  with ibValidate do begin
    Host := edtHost.Text;
    Database := edtDatabase.Text;
    UserName := edtUser.Text;
    Password := edtPassword.Text;
    case rgValActions.ItemIndex of
    0: Analyze;
    1: CheckOnly;
    2: Repair;
    3: Sweep;
    end;
  end;
end;

procedure TfrmGettingStarted.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    edtDatabase.Text := dlgOpen.FileName;
    edtBackupFile.Text := ChangeFileExt(edtDatabase.Text, '.backup');
    edtRestoreDB.Text := ChangeFileExt(edtDatabase.Text, '.restore');
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

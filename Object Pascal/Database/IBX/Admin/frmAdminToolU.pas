//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit frmAdminToolU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, IBX.IBServices, StdCtrls, ActnList, Menus, Grids, ExtCtrls, DB,
  IBX.IBSQL, IBX.IBDatabase, IBX.IBDatabaseInfo, IBX.IBIntf, System.Actions,
  System.UITypes;

type
  TfrmAdminTool = class(TForm)
    PageControl1: TPageControl;
    tabUsers: TTabSheet;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    Login: TAction;
    Logout: TAction;
    tabBackup: TTabSheet;
    tabRestore: TTabSheet;
    tabValidate: TTabSheet;
    tabCertificates: TTabSheet;
    tabStatistics: TTabSheet;
    tabProperties: TTabSheet;
    lstUsers: TListView;
    srvUsers: TIBSecurityService;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    lstCertificates: TListView;
    srvProperties: TIBServerProperties;
    Button1: TButton;
    btnRemove: TButton;
    AddCertificate: TAction;
    RemoveCertificate: TAction;
    GroupBox1: TGroupBox;
    lblCertificate: TLabel;
    sgBackupOptions: TStringGrid;
    btnOK: TButton;
    sgBackupFiles: TStringGrid;
    cbBackupOptions: TComboBox;
    pnlBackupOption: TPanel;
    Backup: TAction;
    srvBackup: TIBBackupService;
    Label1: TLabel;
    edtBackupName: TEdit;
    btnDatabaseLookup: TButton;
    dlgBackupRestore: TOpenDialog;
    lblOptions: TLabel;
    Button2: TButton;
    sgRestoreOptions: TStringGrid;
    pnlRestoreOptionName: TPanel;
    cbRestoreOptions: TComboBox;
    Label2: TLabel;
    sgRestoreFiles: TStringGrid;
    sgRestore: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Restore: TAction;
    srvRestore: TIBRestoreService;
    srvValidate: TIBValidationService;
    lblDatabaseName: TLabel;
    bvlLine1: TBevel;
    Label5: TLabel;
    Panel1: TPanel;
    sgValidateOptions: TStringGrid;
    cbValidateOptions: TComboBox;
    Button3: TButton;
    edtValidate: TEdit;
    pnlValidate: TPanel;
    Validate: TAction;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    sgStats: TStringGrid;
    pnlStats: TPanel;
    cbStats: TComboBox;
    Button4: TButton;
    edtStatistics: TEdit;
    Statistics: TAction;
    srvStats: TIBStatisticalService;
    srvLog: TIBLogService;
    tabLog: TTabSheet;
    edLog: TRichEdit;
    srvConfig: TIBConfigService;
    Label8: TLabel;
    gbSummaryInfo: TGroupBox;
    lblDBOwner: TLabel;
    lblDBPages: TLabel;
    lblPageSize: TLabel;
    lvSecondaryFiles: TListView;
    stxDBOwner: TStaticText;
    stxDBPages: TStaticText;
    stxPageSize: TStaticText;
    sgProperties: TStringGrid;
    cbProperties: TComboBox;
    pnlProperties: TPanel;
    Label9: TLabel;
    edtProperties: TEdit;
    Button5: TButton;
    Button6: TButton;
    Lookup: TAction;
    Apply: TAction;
    dbProperties: TIBDatabase;
    trProperties: TIBTransaction;
    sqlFiles: TIBSQL;
    sqlOwner: TIBSQL;
    infoDB: TIBDatabaseInfo;
    tabAliases: TTabSheet;
    lstAliases: TListView;
    Label10: TLabel;
    Label11: TLabel;
    edtAlias: TEdit;
    edtPath: TEdit;
    btnAddAlias: TButton;
    btnDeleteAlias: TButton;
    actAddAlias: TAction;
    actDeleteAlias: TAction;
    procedure LogoutUpdate(Sender: TObject);
    procedure LoginExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LogoutExecute(Sender: TObject);
    procedure LoginUpdate(Sender: TObject);
    procedure AddUserExecute(Sender: TObject);
    procedure LoggedInUpdate(Sender: TObject);
    procedure EditUserExecute(Sender: TObject);
    procedure DeleteUserUpdate(Sender: TObject);
    procedure DeleteUserExecute(Sender: TObject);
    procedure EditUserUpdate(Sender: TObject);
    procedure lstCertificatesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure AddCertificateExecute(Sender: TObject);
    procedure RemoveCertificateExecute(Sender: TObject);
    procedure sgFilesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFilesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgBackupOptionsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgBackupOptionsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BackupExecute(Sender: TObject);
    procedure btnDatabaseLookupClick(Sender: TObject);
    procedure sgRestoreFilesDblClick(Sender: TObject);
    procedure sgRestoreOptionsSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure RestoreExecute(Sender: TObject);
    procedure sgValidateOptionsSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ValidateExecute(Sender: TObject);
    procedure ValidateUpdate(Sender: TObject);
    procedure StatisticsExecute(Sender: TObject);
    procedure LookupUpdate(Sender: TObject);
    procedure sgPropertiesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbPropertiesChange(Sender: TObject);
    procedure LookupExecute(Sender: TObject);
    procedure ApplyExecute(Sender: TObject);
    procedure cbPropertiesExit(Sender: TObject);
    procedure cbStatsExit(Sender: TObject);
    procedure cbValidateOptionsExit(Sender: TObject);
    procedure cbRestoreOptionsExit(Sender: TObject);
    procedure cbBackupOptionsExit(Sender: TObject);
    procedure StatisticsUpdate(Sender: TObject);
    procedure actAddAliasUpdate(Sender: TObject);
    procedure actAddAliasExecute(Sender: TObject);
    procedure lstAliasesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actDeleteAliasUpdate(Sender: TObject);
    procedure actDeleteAliasExecute(Sender: TObject);
  private
    { Private declarations }
    AdminGDSLibrary : IGDSLibrary;
    srvLicense : TIBLicensingService;
    FLoggedIn : Boolean;
    procedure UpdateListView;
    procedure UpdateServer(Server, Protocol, User, password : String);
    procedure ShowLicense;
    procedure UpdateOptions(const Grid : TStringGrid; const Panel : TPanel;
       const Combo : TComboBox; const ACol, ARow: Integer);
    procedure SetupRestoreTab;
    procedure SetupBackupTab;
    procedure SetupValidateTab;
    procedure SetupStats;
    procedure SetupProperties;
    procedure UpdateAliasList;
  public
    { Public declarations }
    constructor Create(AOwner : Tcomponent); override;
    property LoggedIn : Boolean read FLoggedIn;
  end;

var
  frmAdminTool: TfrmAdminTool;

implementation

uses frmLoginU, frmUserInformationU, typInfo, frmAddCertificateU,
  frmVerboseU;

{$R *.dfm}

const
  OPTION_NAME_COL = 0;
  OPTION_VALUE_COL = 1;
  FORMAT_ROW = 0;
  METADATA_ONLY_ROW = 1;
  GARBAGE_COLLECTION_ROW = 2;
  TRANSACTIONS_IN_LIMBO_ROW = 3;
  CHECKSUMS_ROW = 4;
  CONVERT_TO_TABLES_ROW = 5;
  VERBOSE_OUTPUT_ROW = 6;

  PAGE_SIZE_ROW = 0;
  OVERWRITE_ROW = 1;
  COMMIT_EACH_TABLE_ROW = 2;
  CREATE_SHADOW_FILES_ROW = 3;
  DEACTIVATE_INDICES_ROW = 4;
  VALIDITY_CONDITIONS_ROW = 5;
  USE_ALL_SPACE_ROW = 7;

  VALIDATE_RECORD_FRAGMENTS_ROW = 0;
  READ_ONLY_VALIDATION_ROW = 1;
  IGNORE_CHECKSUM_ERRORS_ROW = 2;

  STATISTICS_OPTION_ROW = 0;

  FORCED_WRITES_ROW = 0;
  SWEEP_INTERVAL_ROW = 1;
  READ_ONLY_ROW = 3;
  SQL_DIALECT_ROW = 2;
  FORCED_WRITES_TRUE = 'Enabled';
  FORCED_WRITES_FALSE = 'Disabled';
  READ_ONLY_TRUE = 'True';
  READ_ONLY_FALSE = 'False';
  SWEEP_INTERVAL_MIN = 0;
  SWEEP_INTERVAL_MAX = 200000;
  SQL_DIALECT1 = '1';
  SQL_DIALECT2 = '2';
  SQL_DIALECT3 = '3';

procedure TfrmAdminTool.LogoutUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FLoggedIn;
end;

procedure TfrmAdminTool.LoginExecute(Sender: TObject);
var
  i : Integer;
  User, Password : String;
begin
  with TfrmLogin.Create(self) do
  try
    { Try reading the default user name and password from the environment
      variables if they are set}
    i := GetEnvironmentVariable(PChar('ISC_USER'), PChar(User), 0);
    if i>0 then
    begin
      SetLength(User,i);
      GetEnvironmentVariable(PChar('ISC_USER'),PChar(User), i);
    end;
    i := GetEnvironmentVariable(PChar('ISC_PASSWORD'),Pchar(Password), 0);
    if i>0 then
    begin
      SetLength(Password,i);
      GetEnvironmentVariable(PChar('ISC_PASSWORD'),PChar(Password), i);
    end;
    edtUserName.Text := User;
    edtPassword.Text := Password;

    if ShowModal = mrOk then
    begin
      FLoggedIn := true;
      UpdateServer(edtServer.Text, cbxProtocol.Text, edtUserName.Text, edtPassword.Text);
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdminTool.FormCreate(Sender: TObject);
var
  sClientType : String;

begin
  sClientType := 'IBServer';
  AdminGDSLibrary := GetGDSLibrary(sClientType);
  try
    AdminGDSLibrary.CheckIBLoaded;
  except
    ShowMessage('Interbase Client not installed, aborting');
    Application.Terminate;
  end;
  if AdminGDSLibrary.GetIBClientVersion < 6 then
  begin
    ShowMessage('InterBase version less than 6 found, aborting');
    Application.Terminate;
  end;

  SetupBackupTab;
  SetupRestoreTab;
  SetupValidateTab;
  SetupStats;
  SetupProperties;
  PageControl1.ActivePage := tabUsers;
  FLoggedIn := false;
end;

procedure TfrmAdminTool.LogoutExecute(Sender: TObject);
begin
  FLoggedIn := false;
end;

procedure TfrmAdminTool.LoginUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not FLoggedIn;
end;

procedure TfrmAdminTool.AddUserExecute(Sender: TObject);
begin
  with TfrmUserInformation.Create(Self) do
  try
    SecurityService := srvUsers;
    DisplayUser('');
    if ShowModal = IDOK then
      UpdateListView;
  finally
    Free;
  end;
end;

procedure TfrmAdminTool.LoggedInUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := LoggedIn;
end;

procedure TfrmAdminTool.EditUserExecute(Sender: TObject);
begin
  with TfrmUserInformation.Create(self) do
  try
    SecurityService := srvUsers;
    DisplayUser(lstUsers.Selected.Caption);
    if ShowModal = IDOK then
      UpdateListView;
  finally
    Free;
  end;
end;

procedure TfrmAdminTool.DeleteUserUpdate(Sender: TObject);
begin
  if not LoggedIn then
    TAction(Sender).Enabled := false
  else
    if not Assigned(lstUsers.Selected) then
      TAction(Sender).Enabled := false
    else
      TAction(Sender).Enabled := not (lstUsers.Selected.Caption = 'SYSDBA');
end;

procedure TfrmAdminTool.DeleteUserExecute(Sender: TObject);
begin
  if MessageDlg('Are you certain you wish to delete this user?', mtConfirmation, [mbYes, mbNo], 0) = IDNO then
    Exit;
  srvUsers.Active := true;
  srvUsers.UserName := lstUsers.Selected.Caption;
  srvUsers.DeleteUser;
  srvUsers.Active := false;
  UpdateListView;
end;

procedure TfrmAdminTool.UpdateAliasList;
var
  laliasInfo : TIBAliasInfo;
begin
  lstAliases.Items.BeginUpdate;
  try
  lstAliases.Clear;
  for lAliasInfo in srvProperties.AliasInfos do
  begin
    with lstAliases.Items.Add do
    begin
      Caption := lAliasInfo.Alias;
      SubItems.Add(laliasInfo.DBPath);
    end;
  end;
  finally
    lstAliases.Items.EndUpdate;
  end;
end;

procedure TfrmAdminTool.UpdateListView;
var
  I : Integer;
begin
  with srvUsers do
  begin
    try
      Active := true;
      DisplayUsers;
      lstUsers.Items.BeginUpdate;
      lstUsers.Items.Clear;
      for I := 0 to UserInfoCount - 1 do
      begin
        with UserInfo[i] do
        begin
          with lstUsers.Items.Add do
          begin
            Caption := UserName;
            SubItems.Add(FirstName + ' ' + MiddleName + ' ' + LastName);
            SubItems.Add(IntToStr(UserId));
            SubItems.Add(IntToStr(GroupId));
          end;
        end;
      end;
    finally
      lstUsers.Items.EndUpdate;
      Active := false;
    end;
  end;
end;

procedure TfrmAdminTool.UpdateServer(Server, Protocol, User,
  password: String);
var
  ProtocolEnum : TProtocol;
begin
  ProtocolEnum := TProtocol(GetEnumValue(typeinfo(TProtocol), Protocol));

  srvUsers.ServerName := Server;
  srvUsers.Protocol := ProtocolEnum;
  srvUsers.Params.Clear;
  srvUsers.Params.Values['user_name'] := User;
  srvUsers.Params.Values['password'] := Password;
  UpdateListView;

  if srvProperties.Active then
    srvProperties.Active:= False;
  srvProperties.ServerName := Server;
  srvProperties.Protocol := ProtocolEnum;
  srvProperties.Params.Clear;
  srvProperties.Params.Values['user_name'] := User;
  srvProperties.Params.Values['password'] := Password;
  srvProperties.Active := true;
  srvProperties.Fetch;
  if srvProperties.VersionInfo.IsMinimumVersion('6.0') and
     not srvProperties.VersionInfo.IsMinimumVersion('8.0') then
    ShowLicense
  else
  begin
    lblCertificate.Caption := 'Cannot get licensing info for current server.  This service not available after InterBase 7.5.';
    Button1.Enabled := false;
    btnRemove.Enabled := false;
  end;

  if srvProperties.VersionInfo.IsMinimumVersion('6.0') and
     not srvProperties.VersionInfo.IsMinimumVersion('8.0') then
  begin
    if srvLicense.Active then
      srvLicense.Active:= False;
    srvLicense.ServerName := Server;
    srvLicense.Protocol := ProtocolEnum;
    srvLicense.Params.Clear;
    srvLicense.Params.Values['user_name'] := User;
    srvLicense.Params.Values['password'] := Password;
    srvLicense.Active := true;
  end;

  UpdateAliasList;
  srvBackup.ServerName := Server;
  srvBackup.Protocol := ProtocolEnum;
  srvBackup.Params.Clear;
  srvBackup.Params.Values['user_name'] := User;
  srvBackup.Params.Values['password'] := Password;

  srvRestore.ServerName := Server;
  srvRestore.Protocol := ProtocolEnum;
  srvRestore.Params.Clear;
  srvRestore.Params.Values['user_name'] := User;
  srvRestore.Params.Values['password'] := Password;

  srvValidate.ServerName := Server;
  srvValidate.Protocol := ProtocolEnum;
  srvValidate.Params.Clear;
  srvValidate.Params.Values['user_name'] := User;
  srvValidate.Params.Values['password'] := Password;

  srvStats.ServerName := Server;
  srvStats.Protocol := ProtocolEnum;
  srvStats.Params.Clear;
  srvStats.Params.Values['user_name'] := User;
  srvStats.Params.Values['password'] := Password;

  srvConfig.ServerName := Server;
  srvConfig.Protocol := ProtocolEnum;
  srvConfig.Params.Clear;
  srvConfig.Params.Values['user_name'] := User;
  srvConfig.Params.Values['password'] := Password;

  srvLog.ServerName := Server;
  srvLog.Protocol := ProtocolEnum;
  srvLog.Params.Clear;
  srvLog.Params.Values['user_name'] := User;
  srvLog.Params.Values['password'] := Password;
  srvLog.Attach;
  try
    srvLog.ServiceStart;
    edLog.Lines.Clear;
    while not srvLog.Eof do
      edLog.Lines.Add(srvLog.GetNextLine);
  finally
    srvLog.Detach;
  end;

end;

procedure TfrmAdminTool.EditUserUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(lstUsers.Selected) and LoggedIn;
end;

procedure TfrmAdminTool.lstAliasesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  edtAlias.Text := Item.Caption;
  edtPath.Text := Item.SubItems[0];
end;

procedure TfrmAdminTool.lstCertificatesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  lblCertificate.Caption := srvProperties.LicenseInfo.Desc[Item.Index];
end;

procedure TfrmAdminTool.actAddAliasExecute(Sender: TObject);
begin
  srvProperties.AddAlias(edtAlias.Text, edtPath.Text);
  srvProperties.FetchAliasInfo;
  UpdateAliasList;
end;

procedure TfrmAdminTool.actAddAliasUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (edtAlias.Text <> '') and (edtPath.Text <> '');
end;

procedure TfrmAdminTool.actDeleteAliasExecute(Sender: TObject);
begin
  srvProperties.DeleteAlias(edtAlias.Text);
  srvProperties.FetchAliasInfo;
  UpdateAliasList;
  edtAlias.Text := '';
  edtPath.Text := '';
end;

procedure TfrmAdminTool.actDeleteAliasUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := lstAliases.SelCount > 0;
end;

procedure TfrmAdminTool.AddCertificateExecute(Sender: TObject);
begin
  with TfrmAddCertificate.Create(self) do
  try
    LicensingService := srvLicense;
    if ShowModal = mrOK then
    begin
      if not srvProperties.Active then
        srvProperties.Active := True;
      ShowLicense;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdminTool.ShowLicense;
var
  counter : Integer;
begin
  try
    lstCertificates.Items.Clear;
    lblCertificate.Caption := '';
    if not srvProperties.Active then
      srvProperties.Active := true;
      //if there are no licenses, FetchLiceses fails and causes active to be false
    srvProperties.FetchLicenseInfo;
    with lstCertificates.Items do
    begin
      for counter:= 0 to High(srvProperties.LicenseInfo.Key) do
      with Add do
      begin
        Caption := srvProperties.LicenseInfo.ID[counter];
        SubItems.Add(srvProperties.LicenseInfo.Key[counter]);
      end;
    end;
    lstCertificates.Items.Item[0].Selected := True;
    lstCertificates.itemfocused := lstCertificates.Items.Item[0];
    Button1.Enabled := true;
    btnRemove.Enabled := true;
  except
    lblCertificate.Caption := 'Cannot get licensing info for current server.  This service not available after InterBase 7.5.';
    Button1.Enabled := false;
    btnRemove.Enabled := false;
  end;
end;

procedure TfrmAdminTool.RemoveCertificateExecute(Sender: TObject);
begin
  with srvLicense do
  begin
    Key := lstCertificates.Items.Item[lstCertificates.Selected.Index].SubItems[0];
    RemoveLicense;
    ShowLicense;
  end;
end;

procedure TfrmAdminTool.sgFilesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const
  INDENT = 2;
var
  lLeft: integer;
  lText: string;
  SGrid : TStringGrid;
begin
  SGrid := Sender as TStringGrid;
  with SGrid.canvas do
  begin
    if (ACol = 2) and (ARow <> 0) then
    begin
      font.color := clBlack;
      if brush.color = clHighlight then
        font.color := clWhite;
      lText := SGrid.Cells[ACol,ARow];
      lLeft := Rect.Left + INDENT;
      TextRect(Rect, lLeft, Rect.top + INDENT, lText);
    end;
  end;
end;

procedure TfrmAdminTool.sgFilesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  lKey : Word;
  SGrid : TStringGrid;
begin
  SGrid := Sender as TStringGrid;
  if (Key = VK_TAB) and (ssCtrl in Shift) then
  begin
    if SGrid.Col < sgBackupFiles.ColCount - 1 then
    begin
      SGrid.Col := sgBackupFiles.Col + 1;
    end
    else
    begin
      if SGrid.Row = SGrid.RowCount - 1 then
        SGrid.RowCount := SGrid.RowCount + 1;
      SGrid.Col := 0;
      SGrid.Row := SGrid.Row + 1;
    end;
  end;
  if (Key = VK_RETURN) and
    (SGrid.Cells[SGrid.Col,SGrid.Row] <> '') then
  begin
    lKey := VK_TAB;
    sgFilesKeyDown(Self, lKey, [ssCtrl]);
  end;
end;

procedure TfrmAdminTool.sgBackupOptionsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const
  INDENT = 2;
var
  lLeft: integer;
  lText: string;
begin
  with (Sender as TStringGrid).canvas do
  begin
    if ACol = OPTION_VALUE_COL then
    begin
      font.color := clBlue;
      if brush.color = clHighlight then
        font.color := clWhite;
      lText := (Sender as TStringGrid).Cells[ACol,ARow];
      lLeft := Rect.Left + INDENT;
      TextRect(Rect, lLeft, Rect.top + INDENT, lText);
    end;
  end;
end;

procedure TfrmAdminTool.sgBackupOptionsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  cbBackupOptions.Items.Clear;
  case ARow of
    FORMAT_ROW:
    begin
      cbBackupOptions.Items.Add('Transportable');
      cbBackupOptions.Items.Add('Non-Transportable');
    end;
    METADATA_ONLY_ROW, GARBAGE_COLLECTION_ROW, CONVERT_TO_TABLES_ROW:
    begin
      cbBackupOptions.Items.Add('True');
      cbBackupOptions.Items.Add('False');
    end;
    TRANSACTIONS_IN_LIMBO_ROW, CHECKSUMS_ROW:
    begin
      cbBackupOptions.Items.Add('Process');
      cbBackupOptions.Items.Add('Ignore');
    end;
    VERBOSE_OUTPUT_ROW:
    begin
      cbBackupOptions.Items.Add('None');
      cbBackupOptions.Items.Add('To Screen');
    end;
  end;
  UpdateOptions(sgBackupOptions, pnlBackupOption, cbBackupOptions, ACol, ARow);
end;

procedure TfrmAdminTool.BackupExecute(Sender: TObject);
var
  j: integer;
  lOptions: TBackupOptions;
  frmVerbose : TfrmVerbose;
begin
  Screen.Cursor := crHourGlass;
  try
    srvBackup.Attach();

    lOptions := [];
    if srvBackup.Active = true then
    begin
      if sgBackupOptions.Cells[OPTION_VALUE_COL,FORMAT_ROW] = 'Non-Transportable' then
      begin
        Include(lOptions, NonTransportable);
      end;
      if sgBackupOptions.Cells[OPTION_VALUE_COL,METADATA_ONLY_ROW] = 'True' then
      begin
        Include(lOptions, MetadataOnly);
      end;
      if sgBackupOptions.Cells[OPTION_VALUE_COL,GARBAGE_COLLECTION_ROW] = 'False' then
      begin
        Include(lOptions, NoGarbageCollection);
      end;
      if sgBackupOptions.Cells[OPTION_VALUE_COL,TRANSACTIONS_IN_LIMBO_ROW] = 'Ignore' then
      begin
        Include(lOptions, IgnoreLimbo);
      end;
      if sgBackupOptions.Cells[OPTION_VALUE_COL,CHECKSUMS_ROW] = 'True' then
      begin
        Include(lOptions, IgnoreChecksums);
      end;
      if sgBackupOptions.Cells[OPTION_VALUE_COL,CONVERT_TO_TABLES_ROW] = 'True' then
      begin
        Include(lOptions, ConvertExtTables);
      end;
      srvBackup.Options := lOptions;

      if (sgBackupOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] = 'To Screen') or
        (sgBackupOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] = 'To File') then
      begin
        srvBackup.Verbose := true;
      end;

      for j := 1 to sgBackupFiles.RowCount - 1 do
      begin
        if (sgBackupFiles.Cells[0,j] <> '') and (sgBackupFiles.Cells[1,j] <> '') then
        begin
          srvBackup.BackupFile.Add(Format('%s=%s',[sgBackupFiles.Cells[0,j],
            sgBackupFiles.Cells[1,j]]));
        end
        else
          if (sgBackupFiles.Cells[0,j] <> '') then
          begin
            srvBackup.BackupFile.Add(sgBackupFiles.Cells[0,j]);
          end;
      end;

      srvBackup.DatabaseName := edtBackupName.Text;
      srvBackup.ServiceStart;
      if srvBackup.Verbose then
      begin
        frmVerbose := TfrmVerbose.Create(self);
        frmVerbose.Show;
        while not srvBackup.Eof do
        begin
          Application.ProcessMessages;
          frmVerbose.edOutput.Lines.Add(srvBackup.GetNextLine)
        end;
      end
      else
        while srvBackup.IsServiceRunning do
        begin
          Application.ProcessMessages;
        end;
    end;
  finally
    if srvBackup.Active then
      srvBackup.Detach();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAdminTool.btnDatabaseLookupClick(Sender: TObject);
begin
  dlgBackupRestore.Options := [ofHideReadOnly, ofNoNetworkButton, ofEnableSizing];
  dlgBackupRestore.DefaultExt := '*.gdb';
  dlgBackupRestore.Filter := '(*.gdb) InterBase Database|*.gdb|(*.*) All Files|*.*';
  if dlgBackupRestore.Execute then
    edtBackupName.Text := dlgBackupRestore.FileName;
end;

procedure TfrmAdminTool.sgRestoreFilesDblClick(Sender: TObject);
var
  i : integer;
begin
  If srvBackup.Protocol <> LOCAL then
  begin
    ShowMessage('Can Only broswe local machine');
    Exit;
  end;
  dlgBackupRestore.Options := [ofHideReadOnly, ofNoNetworkButton, ofEnableSizing, ofAllowMultiSelect, ofFileMustExist];
  dlgBackupRestore.Filter := 'Backup files (*.gbk)|*.gbk|All files (*.*)|*.*';
  dlgBackupRestore.FilterIndex := 1;
  if dlgBackupRestore.Execute then
  begin
    if sgRestoreFiles.RowCount < dlgBackupRestore.Files.Count then
      sgRestoreFiles.RowCount := dlgBackupRestore.Files.Count;
    for i:= 0 to dlgBackupRestore.Files.Count - 1 do
      sgRestoreFiles.Cells[0, i+1] := dlgBackupRestore.Files.Strings[i];
  end;
end;

procedure TfrmAdminTool.SetupRestoreTab;
begin
  sgRestoreFiles.Cells[0,0] := 'Filename(s)';

  sgRestore.Cells[0,0] := 'Filename(s)';
  sgRestore.Cells[1,0] := 'Pages';

  sgRestoreOptions.RowCount := 8;

  sgRestoreOptions.Cells[OPTION_NAME_COL,PAGE_SIZE_ROW] := 'Page Size (Bytes)';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,PAGE_SIZE_ROW] := '4096';

  sgRestoreOptions.Cells[OPTION_NAME_COL,OVERWRITE_ROW] := 'Overwrite';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,OVERWRITE_ROW] := 'False';

  sgRestoreOptions.Cells[OPTION_NAME_COL,COMMIT_EACH_TABLE_ROW] := 'Commit After Each Table';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,COMMIT_EACH_TABLE_ROW] := 'False';

  sgRestoreOptions.Cells[OPTION_NAME_COL,CREATE_SHADOW_FILES_ROW] := 'Create Shadow Files';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,CREATE_SHADOW_FILES_ROW] := 'True';

  sgRestoreOptions.Cells[OPTION_NAME_COL,DEACTIVATE_INDICES_ROW] := 'Deactivate Indices';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,DEACTIVATE_INDICES_ROW] := 'False';

  sgRestoreOptions.Cells[OPTION_NAME_COL,VALIDITY_CONDITIONS_ROW] := 'Validity Conditions';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,VALIDITY_CONDITIONS_ROW] := 'Restore';

  sgRestoreOptions.Cells[OPTION_NAME_COL,USE_ALL_SPACE_ROW] := 'Use All Space';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,USE_ALL_SPACE_ROW] := 'False';

  sgRestoreOptions.Cells[OPTION_NAME_COL,VERBOSE_OUTPUT_ROW] := 'Verbose Output';
  sgRestoreOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] := 'To Screen';

  pnlRestoreOptionName.Caption := 'Page Size (Bytes)';
  cbRestoreOptions.Items.Add('1024');
  cbRestoreOptions.Items.Add('2048');
  cbRestoreOptions.Items.Add('4096');
  cbRestoreOptions.Items.Add('8192');
  cbRestoreOptions.ItemIndex := 2;

end;

procedure TfrmAdminTool.SetupBackupTab;
begin
  sgBackupOptions.DefaultRowHeight := cbBackupOptions.Height;
  sgBackupFiles.Cells[0,0] := 'Filename(s)';
  sgBackupFiles.Cells[1,0] := 'Size(Bytes)';

  sgBackupOptions.Cells[OPTION_NAME_COL,FORMAT_ROW] := 'Format';
  sgBackupOptions.Cells[OPTION_VALUE_COL,FORMAT_ROW] := 'Transportable';

  sgBackupOptions.Cells[OPTION_NAME_COL,METADATA_ONLY_ROW] := 'Metadata Only';
  sgBackupOptions.Cells[OPTION_VALUE_COL,METADATA_ONLY_ROW] := 'False';

  sgBackupOptions.Cells[OPTION_NAME_COL,GARBAGE_COLLECTION_ROW] := 'Garbage Collection';
  sgBackupOptions.Cells[OPTION_VALUE_COL,GARBAGE_COLLECTION_ROW] := 'True';

  sgBackupOptions.Cells[OPTION_NAME_COL,TRANSACTIONS_IN_LIMBO_ROW] := 'Transactions in Limbo';
  sgBackupOptions.Cells[OPTION_VALUE_COL,TRANSACTIONS_IN_LIMBO_ROW] := 'Process';

  sgBackupOptions.Cells[OPTION_NAME_COL,CHECKSUMS_ROW] := 'Checksums';
  sgBackupOptions.Cells[OPTION_VALUE_COL,CHECKSUMS_ROW] := 'Process';

  sgBackupOptions.Cells[OPTION_NAME_COL,CONVERT_TO_TABLES_ROW] := 'Convert to Tables';
  sgBackupOptions.Cells[OPTION_VALUE_COL,CONVERT_TO_TABLES_ROW] := 'False';

  sgBackupOptions.Cells[OPTION_NAME_COL,VERBOSE_OUTPUT_ROW] := 'Verbose Output';
  sgBackupOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] := 'To Screen';

  pnlBackupOption.Caption := 'Format';
  cbBackupOptions.Items.Add('Transportable');
  cbBackupOptions.Items.Add('Non-Transportable');
  cbBackupOptions.ItemIndex := 0;
end;

procedure TfrmAdminTool.sgRestoreOptionsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  cbRestoreOptions.Items.Clear;
  case ARow of
    PAGE_SIZE_ROW:
    begin
      cbRestoreOptions.Items.Add('1024');
      cbRestoreOptions.Items.Add('2048');
      cbRestoreOptions.Items.Add('4096');
      cbRestoreOptions.Items.Add('8192');
    end;
    OVERWRITE_ROW, COMMIT_EACH_TABLE_ROW, CREATE_SHADOW_FILES_ROW,
    DEACTIVATE_INDICES_ROW, USE_ALL_SPACE_ROW:
    begin
      cbRestoreOptions.Items.Add('True');
      cbRestoreOptions.Items.Add('False');
    end;
    VALIDITY_CONDITIONS_ROW:
    begin
      cbRestoreOptions.Items.Add('Restore');
      cbRestoreOptions.Items.Add('Ignore');
    end;
    VERBOSE_OUTPUT_ROW:
    begin
      cbRestoreOptions.Items.Add('None');
      cbRestoreOptions.Items.Add('To Screen');
    end;
  end;

  UpdateOptions(sgRestoreOptions, pnlRestoreOptionName, cbRestoreOptions,
    ACol, ARow);

end;

procedure TfrmAdminTool.RestoreExecute(Sender: TObject);
var
  j: integer;
  lOptions: TRestoreOptions;
  frmVerbose : TfrmVerbose;
begin
  Screen.Cursor := crHourglass;
  try
    lOptions := [];
    srvRestore.Attach;
    if srvRestore.Active = true then
    begin
      if sgRestoreOptions.Cells[OPTION_VALUE_COL,OVERWRITE_ROW] = 'True' then
        Include(lOptions, Replace)
      else
        Include(lOptions, CreateNewDB);
      if sgRestoreOptions.Cells[OPTION_VALUE_COL,COMMIT_EACH_TABLE_ROW] = 'True' then
        Include(lOptions, OneRelationAtATime);
      if sgRestoreOptions.Cells[OPTION_VALUE_COL,CREATE_SHADOW_FILES_ROW] = 'False' then
        Include(lOptions, NoShadow);
      if sgRestoreOptions.Cells[OPTION_VALUE_COL,DEACTIVATE_INDICES_ROW] = 'True' then
        Include(lOptions, DeactivateIndexes);
      if sgRestoreOptions.Cells[OPTION_VALUE_COL,VALIDITY_CONDITIONS_ROW] = 'False' then
        Include(lOptions, NoValidityCheck);

      srvRestore.Options := lOptions;
      srvRestore.PageSize := StrToInt(sgRestoreOptions.Cells[OPTION_VALUE_COL,PAGE_SIZE_ROW]);

      if (sgRestoreOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] = 'To Screen') or
        (sgRestoreOptions.Cells[OPTION_VALUE_COL,VERBOSE_OUTPUT_ROW] = 'To File') then
        srvRestore.Verbose := true;

      for j := 1 to sgRestoreFiles.RowCount - 1 do
        if sgRestoreFiles.Cells[0,j] <> '' then
          srvRestore.BackupFile.Add(Format('%s',[sgRestoreFiles.Cells[0,j]]));

      for j := 1 to sgRestore.RowCount - 1 do
      begin
        if (sgRestore.Cells[0,j] <> '') and (sgRestore.Cells[1,j] <> '')then
          srvRestore.DatabaseName.Add(Format('%s=%s',[sgRestore.Cells[0,j],sgRestore.Cells[1,j]]))
        else
          srvRestore.DatabaseName.Add(sgRestore.Cells[0,j]);
      end;

      srvRestore.ServiceStart;
      if srvRestore.Verbose then
      begin
        frmVerbose := TfrmVerbose.Create(self);
        frmVerbose.Show;
        while not srvRestore.Eof do
        begin
          Application.ProcessMessages;
          frmVerbose.edOutput.Lines.Add(srvRestore.GetNextLine)
        end;
      end
      else
        while srvRestore.IsServiceRunning do
        begin
          Application.ProcessMessages;
        end;
    end;
  finally
    if srvRestore.Active then
      srvRestore.Detach();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAdminTool.SetupValidateTab;
begin
  sgValidateOptions.Cells[OPTION_NAME_COL,VALIDATE_RECORD_FRAGMENTS_ROW] := 'Validate Record Fragments';
  sgValidateOptions.Cells[OPTION_VALUE_COL,VALIDATE_RECORD_FRAGMENTS_ROW] := 'False';

  sgValidateOptions.Cells[OPTION_NAME_COL,READ_ONLY_VALIDATION_ROW] := 'Read Only Validation';
  sgValidateOptions.Cells[OPTION_VALUE_COL,READ_ONLY_VALIDATION_ROW] := 'False';

  sgValidateOptions.Cells[OPTION_NAME_COL,IGNORE_CHECKSUM_ERRORS_ROW] := 'Ignore Checksum Errors';
  sgValidateOptions.Cells[OPTION_VALUE_COL,IGNORE_CHECKSUM_ERRORS_ROW] := 'False';

  pnlValidate.Caption := 'Validate Record Fragments';
  cbValidateOptions.Items.Add('True');
  cbValidateOptions.Items.Add('False');
  cbValidateOptions.ItemIndex := 1;
end;

procedure TfrmAdminTool.sgValidateOptionsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  UpdateOptions(sgValidateOptions, pnlValidate, cbValidateOptions, ACol, ARow);
end;

procedure TfrmAdminTool.UpdateOptions(const Grid: TStringGrid;
  const Panel: TPanel; const Combo: TComboBox; const ACol, ARow: Integer);
var
  lR, lName : TRect;
begin
  Panel.Caption := Grid.Cells[OPTION_NAME_COL, ARow];

  if ACol = OPTION_NAME_COL then
    Combo.ItemIndex := Combo.Items.IndexOf(Grid.Cells[ACol+1,ARow])
  else
    if ACol = OPTION_VALUE_COL then
      Combo.ItemIndex := Combo.Items.IndexOf(Grid.Cells[ACol,ARow]);

  Combo.Tag := ARow;
  if ACol = OPTION_NAME_COL then
  begin
    lName := Grid.CellRect(ACol, ARow);
    lR := Grid.CellRect(ACol + 1, ARow);
  end
  else
  begin
    lName := Grid.CellRect(ACol - 1, ARow);
    lR := Grid.CellRect(ACol, ARow);
  end;

  // lName := sgOptions.CellRect(ACol, ARow);
  lName.Left := lName.Left + Grid.Left;
  lName.Right := lName.Right + Grid.Left;
  lName.Top := lName.Top + Grid.Top;
  lName.Bottom := lName.Bottom + Grid.Top;
  Panel.Left := lName.Left + 1;
  Panel.Top := lName.Top + 1;
  Panel.Width := (lName.Right + 1) - lName.Left;
  Panel.Height := (lName.Bottom + 1) - lName.Top;

  // lR := sgOptions.CellRect(ACol, ARow);
  lR.Left := lR.Left + Grid.Left;
  lR.Right := lR.Right + Grid.Left;
  lR.Top := lR.Top + Grid.Top;
  lR.Bottom := lR.Bottom + Grid.Top;
  Combo.Left := lR.Left + 1;
  Combo.Top := lR.Top + 1;
  Combo.Width := (lR.Right + 1) - lR.Left;
  Combo.Height := (lR.Bottom + 1) - lR.Top;
  Combo.SetFocus;
end;

procedure TfrmAdminTool.ValidateExecute(Sender: TObject);
var
  lValidateOptions : TValidateOptions;
  frmVerbose : TfrmVerbose;
begin
  lValidateOptions := [];
  Screen.Cursor := crHourGlass;
  try
    srvValidate.Attach;
    // if successfully attached to server
    if srvValidate.Active = true then
    begin
      case srvValidate.Protocol of
        TCP : srvValidate.DatabaseName := Format('%s:%s',[srvValidate.ServerName,edtValidate.Text]);
        NamedPipe : srvValidate.DatabaseName := Format('\\%s\%s',[srvValidate.ServerName,edtValidate.Text]);
        SPX : srvValidate.DatabaseName := Format('%s@%s',[srvValidate.ServerName,edtValidate.Text]);
        Local : srvValidate.DatabaseName := edtValidate.Text;
      end;
        // determine which options have been selected
      Include (lValidateOptions, ValidateDB);
      if sgValidateOptions.Cells[1,VALIDATE_RECORD_FRAGMENTS_ROW] = 'True' then
        Include(lValidateOptions, ValidateFull);

      if sgValidateOptions.Cells[1,READ_ONLY_VALIDATION_ROW] = 'True' then
        Include(lValidateOptions, CheckDB);

      if sgValidateOptions.Cells[1,IGNORE_CHECKSUM_ERRORS_ROW] = 'True' then
        Include(lValidateOptions, IgnoreChecksum);
      srvValidate.Options := lValidateOptions;
      srvValidate.ServiceStart;
      Application.ProcessMessages;

      frmVerbose := TfrmVerbose.Create(self);
      frmVerbose.Show;
      frmVerbose.edOutput.Lines.Add('Database - ' + edtValidate.Text);
      while not srvValidate.Eof do
      begin
        Application.ProcessMessages;
        frmVerbose.edOutput.Lines.Add(Trim(srvValidate.GetNextLine));
      end;
      if frmVerbose.edOutput.Lines.Count = 2 then
        frmVerbose.edOutput.Lines.Add('No database validation errors were found.');
    end;
  finally
    Screen.Cursor := crDefault;
    if srvValidate.Active then
      srvValidate.Detach();
  end;
end;

procedure TfrmAdminTool.ValidateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (edtValidate.Text <> '') and LoggedIn;
end;

procedure TfrmAdminTool.SetupStats;
begin
  sgStats.DefaultRowHeight := cbStats.Height;
  sgStats.RowCount := 1;

  sgStats.Cells[OPTION_NAME_COL,STATISTICS_OPTION_ROW] := 'Show data for:';
  sgStats.Cells[OPTION_VALUE_COL,STATISTICS_OPTION_ROW] := 'All Options';

  pnlStats.Caption := 'Show data for:';
  cbStats.Items.Add('All Options');
  cbStats.Items.Add('Data Pages');
  cbStats.Items.Add('Database Log');
  cbStats.Items.Add('Header Page');
  cbStats.Items.Add('Index Pages');
  cbStats.Items.Add('System Relations');
  cbStats.ItemIndex := 0;
end;

procedure TfrmAdminTool.StatisticsExecute(Sender: TObject);
var
  lDBStatisticsOptions: TStatOptions;
  frmVerbose : TfrmVerbose;
begin
  Screen.Cursor := crHourGlass;
  srvStats.Attach;
  try
    // if successfully attached to server
    if srvStats.Active = true then
    begin
          // assign database details
      srvStats.DatabaseName := edtStatistics.Text;
      lDBStatisticsOptions := [];
      // determine which options have been selected
      case cbStats.ItemIndex of
        1: Include(lDBStatisticsOptions, DataPages);
        2: Include(lDBStatisticsOptions, DbLog);
        3: Include(lDBStatisticsOptions, HeaderPages);
        4: Include(lDBStatisticsOptions, IndexPages);
        5: Include(lDBStatisticsOptions, SystemRelations);
      end;
      // assign validation options
      srvStats.Options := lDBStatisticsOptions;
      srvStats.ServiceStart;
      frmVerbose := TfrmVerbose.Create(self);
      frmVerbose.Show;
      frmVerbose.edOutput.Lines.Add('Database Stats - ' + edtStatistics.Text);
      while not srvStats.Eof do
      begin
        Application.ProcessMessages;
        frmVerbose.edOutput.Lines.Add(Trim(srvStats.GetNextLine));
      end;
      frmVerbose.edOutput.Lines.Add('Done');

    end;
  finally
    Screen.Cursor := crDefault;
    if srvStats.Active then
      srvStats.Detach();
  end;
end;

procedure TfrmAdminTool.LookupUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (edtProperties.Text <> '') and LoggedIn;
end;

procedure TfrmAdminTool.SetupProperties;
begin
  sgProperties.Cells[OPTION_NAME_COL,FORCED_WRITES_ROW] := 'Forced Writes';
  pnlProperties.Caption := sgProperties.Cells[OPTION_NAME_COL,FORCED_WRITES_ROW];
  sgProperties.Cells[OPTION_NAME_COL,SWEEP_INTERVAL_ROW] := 'Sweep Interval';
  sgProperties.Cells[OPTION_NAME_COL,SQL_DIALECT_ROW] := 'Database Dialect';
  sgProperties.Cells[OPTION_NAME_COL,READ_ONLY_ROW] := 'Read Only';
  cbProperties.Items.Add(FORCED_WRITES_TRUE);
  cbProperties.Items.Add(FORCED_WRITES_FALSE);
  cbProperties.Tag := FORCED_WRITES_ROW;
end;

procedure TfrmAdminTool.sgPropertiesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  cbProperties.Items.Clear;
  case ARow of
    FORCED_WRITES_ROW:
    begin
      cbProperties.Style := csDropDown;
      cbProperties.Items.Add(FORCED_WRITES_TRUE);
      cbProperties.Items.Add(FORCED_WRITES_FALSE);
      cbProperties.Tag := FORCED_WRITES_ROW;
    end;
    SWEEP_INTERVAL_ROW:
    begin
      cbProperties.Style := csSimple;
      cbProperties.Text := sgProperties.Cells[OPTION_VALUE_COL,SWEEP_INTERVAL_ROW];
      cbProperties.Tag := SWEEP_INTERVAL_ROW;
    end;
    READ_ONLY_ROW:
    begin
      cbProperties.Style := csDropDown;
      cbProperties.Items.Add(READ_ONLY_TRUE);
      cbProperties.Items.Add(READ_ONLY_FALSE);
      cbProperties.Tag := READ_ONLY_ROW;
    end;
    SQL_DIALECT_ROW:
    begin
      cbProperties.Style := csDropDown;
      cbProperties.Items.Add(SQL_DIALECT1);
      cbProperties.Items.Add(SQL_DIALECT2);
      cbProperties.Items.Add(SQL_DIALECT3);
      if Lookup.Enabled then
        cbProperties.ItemIndex := StrToInt(sgProperties.Cells[OPTION_VALUE_COL,SQL_DIALECT_ROW])-1;
      cbProperties.Tag := SQL_DIALECT_ROW;
    end;
  end;
  UpdateOptions(sgProperties, pnlProperties, cbProperties, ACol, ARow);
end;

procedure TfrmAdminTool.cbPropertiesChange(Sender: TObject);
begin
  Apply.Enabled := true;
end;

procedure TfrmAdminTool.LookupExecute(Sender: TObject);
var
  lListItem: TListItem;
  dummy : Boolean;
begin
  case srvConfig.Protocol of
    TCP : dbProperties.DatabaseName := Format('%s:%s',[srvConfig.ServerName,edtProperties.Text]);
    NamedPipe : dbProperties.DatabaseName := Format('\\%s\%s',[srvConfig.ServerName,edtProperties.Text]);
    SPX : dbProperties.DatabaseName := Format('%s@%s',[srvConfig.ServerName,edtProperties.Text]);
    Local : dbProperties.DatabaseName := edtProperties.Text;
  end;

  srvConfig.DatabaseName := edtProperties.Text;
  dbProperties.Params.Clear;
  dbProperties.Params.Assign(srvConfig.Params);
  dbProperties.Connected := true;
  trProperties.StartTransaction;

  stxPageSize.Caption := IntToStr(infoDB.PageSize);  // get page size from ib info object
  stxDBPages.Caption := IntToStr(infoDB.Allocation); // get number of pages allocated
  sgProperties.Cells[OPTION_VALUE_COL,SWEEP_INTERVAL_ROW] := IntToStr(infoDB.SweepInterval);

  if infoDB.ForcedWrites <> 0 then    // True
    sgProperties.Cells[OPTION_VALUE_COL,FORCED_WRITES_ROW] := FORCED_WRITES_TRUE
  else                                   // False
    sgProperties.Cells[OPTION_VALUE_COL,FORCED_WRITES_ROW] := FORCED_WRITES_FALSE;
  if infoDB.ReadOnly <> 0 then        // True
    sgProperties.Cells[OPTION_VALUE_COL,READ_ONLY_ROW] := READ_ONLY_TRUE
  else                                   // False
    sgProperties.Cells[OPTION_VALUE_COL,READ_ONLY_ROW] := READ_ONLY_FALSE;
  sgProperties.Cells[OPTION_VALUE_COL,SQL_DIALECT_ROW] := IntToStr(infoDB.DBSQLDialect);

  sqlFiles.ExecQuery;
  while not sqlFiles.Eof do
  begin
    lListItem := lvSecondaryFiles.Items.Add;
    lListItem.Caption := sqlFiles.Fields[0].AsString;
    lListItem.SubItems.Add(sqlFiles.Fields[1].AsString);
    sqlFiles.Next;
  end;
  sqlFiles.Close;

  sqlOwner.ExecQuery;
  stxDBOwner.Caption := sqlOwner.Fields[0].AsString;
  sqlOwner.Close;
  trProperties.Commit;
  dbProperties.Close;
  sgPropertiesSelectCell(sgProperties, 1, cbProperties.Tag, Dummy);
end;

procedure TfrmAdminTool.ApplyExecute(Sender: TObject);
var
  FW, RO, SW, SD : Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    srvConfig.Attach();
    dbProperties.Connected := true;
    FW := infoDB.ForcedWrites;
    RO := infoDB.ReadOnly;
    SW := infoDB.SweepInterval;
    SD := infoDB.DBSQLDialect;
    dbProperties.Connected := false;

    if srvConfig.Active then // if attached successfully
    begin
      if (sgProperties.Cells[OPTION_VALUE_COL,READ_ONLY_ROW] = READ_ONLY_FALSE) and
       (RO = 1)   then
          srvConfig.SetReadOnly(False)
      else
        if (sgProperties.Cells[OPTION_VALUE_COL,READ_ONLY_ROW] = READ_ONLY_TRUE) and
         (RO = 0)   then
            srvConfig.SetReadOnly(true);

      while srvConfig.IsServiceRunning do
        Application.ProcessMessages;

     // Set sweep interval if changed
      if StrToInt(sgProperties.Cells[OPTION_VALUE_COL,SWEEP_INTERVAL_ROW]) <> SW then
      begin
        srvConfig.SetSweepInterval(StrToInt(sgProperties.Cells[OPTION_VALUE_COL,SWEEP_INTERVAL_ROW]));
        while srvConfig.IsServiceRunning do
          Application.ProcessMessages;
      end;

      // Set SQL Dialect if changed
      if StrToInt(sgProperties.Cells[OPTION_VALUE_COL,SQL_DIALECT_ROW]) <> SD then
      begin
        srvConfig.SetDBSqlDialect(StrToInt(sgProperties.Cells[OPTION_VALUE_COL,SQL_DIALECT_ROW]));
        while srvConfig.IsServiceRunning do
          Application.ProcessMessages;
      end;
      // Set forced writes if changed
      if (sgProperties.Cells[OPTION_VALUE_COL,FORCED_WRITES_ROW] = FORCED_WRITES_TRUE) and
         (FW = 0) then
        srvConfig.SetWriteMode(wmSync)
      else
        if (sgProperties.Cells[OPTION_VALUE_COL,FORCED_WRITES_ROW] = FORCED_WRITES_FALSE) and
           (FW = 1) then
            srvConfig.SetWriteMode(wmASync);

      while srvConfig.IsServiceRunning do
        Application.ProcessMessages;

    end;
    Apply.Enabled := false;
  finally
    if srvConfig.Active then
      srvConfig.Detach();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAdminTool.cbPropertiesExit(Sender: TObject);
begin
  sgProperties.Cells[OPTION_VALUE_COL,cbProperties.Tag] := cbProperties.Text;
end;

procedure TfrmAdminTool.cbStatsExit(Sender: TObject);
begin
  sgStats.Cells[OPTION_VALUE_COL,0] := cbStats.Text;
end;

procedure TfrmAdminTool.cbValidateOptionsExit(Sender: TObject);
begin
  sgValidateOptions.Cells[OPTION_VALUE_COL,cbValidateOptions.Tag] := cbValidateOptions.Text;
end;

constructor TfrmAdminTool.Create(AOwner: Tcomponent);
begin
  inherited;
  srvLicense := TIBLicensingService.Create(self);
end;

procedure TfrmAdminTool.cbRestoreOptionsExit(Sender: TObject);
begin
  sgRestoreOptions.Cells[OPTION_VALUE_COL,cbRestoreOptions.Tag] := cbRestoreOptions.Text;
end;

procedure TfrmAdminTool.cbBackupOptionsExit(Sender: TObject);
begin
  sgBackupOptions.Cells[OPTION_VALUE_COL,cbBackupOptions.Tag] := cbBackupOptions.Text;
end;

procedure TfrmAdminTool.StatisticsUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (edtStatistics.Text <> '') and LoggedIn;
end;

end.

//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CloudExplorerUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ExtCtrls, ImgList, pngimage, GIFImg,
  Generics.Collections, Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI, Data.Cloud.AzureAPI, CloudPopulator, Menus,
  Vcl.Grids, System.ImageList;

type

  TDelayedRefreshThread = class(TThread)
  private
    FDelayed: Boolean;
    FDelayTime: Integer;
  public
    constructor Create(DelayTime: Integer = 1000); virtual;
    destructor Destroy; override;
    procedure Execute; override;

    property Delayed: Boolean read FDelayed write FDelayed;
  end;

  TCloudUIForm = class(TForm)
    ConnectionCombo: TComboBox;
    CloudLabel: TLabel;
    ManageButton: TButton;
    Bevel1: TBevel;
    CloudTabs: TPageControl;
    TabSheet1: TTabSheet;
    OuterPanel: TPanel;
    ColumnSplitter: TSplitter;
    LeftPanel: TPanel;
    LocalNavPanel: TPanel;
    LocalHomeButton: TImage;
    LocalBackButton: TImage;
    LocalPathField: TEdit;
    RightCol: TPanel;
    CloudFilesList: TListBox;
    CloudNavPanel: TPanel;
    CloudHomeButton: TImage;
    CloudBackButton: TImage;
    CloudPathField: TEdit;
    CEImages: TImageList;
    cloudPopup: TPopupMenu;
    CloudDownloadItem: TMenuItem;
    N1: TMenuItem;
    CloudDeleteITem: TMenuItem;
    CloudCreateContainerItem: TMenuItem;
    LocalPopup: TPopupMenu;
    LocalUploadMenuItem: TMenuItem;
    LogPage: TTabSheet;
    LocalFilesList: TListBox;
    LobButtonPanel: TPanel;
    LogMemo: TMemo;
    ClearLogButton: TButton;
    AccountsPage: TTabSheet;
    AccountsListBox: TListBox;
    NewAccountPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    NewAccDisplayName: TEdit;
    Label3: TLabel;
    NewAccName: TEdit;
    Label4: TLabel;
    NewAccKey: TEdit;
    NewaccAddButton: TButton;
    ShowKeyCheck: TCheckBox;
    Label5: TLabel;
    NewAccType: TComboBox;
    AcctsPopup: TPopupMenu;
    DeletedSelectedAcct: TMenuItem;
    N2: TMenuItem;
    LocalRefreshItem: TMenuItem;
    N3: TMenuItem;
    RefreshCloudItem: TMenuItem;
    EnableErrorLoggingCheck: TCheckBox;
    EnableInfoLoggingCheck: TCheckBox;
    Bevel2: TBevel;
    UseProxyCheck: TCheckBox;
    ProxyHostLabel: TLabel;
    ProxyPortLabel: TLabel;
    ProxyHostField: TEdit;
    ProxyPortField: TEdit;
    ProxyUpdateButton: TButton;
    TransfersTab: TTabSheet;
    TransfersMainPanel: TPanel;
    TransferGrid: TStringGrid;
    Label6: TLabel;
    NewAccRegion: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure LocalFilesListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure LocalFilesListMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure LocalFilesListDblClick(Sender: TObject);
    procedure LocalHomeButtonClick(Sender: TObject);
    procedure LocalBackButtonClick(Sender: TObject);
    procedure LocalPathFieldKeyPress(Sender: TObject; var Key: Char);
    procedure ConnectionComboChange(Sender: TObject);
    procedure ManageButtonClick(Sender: TObject);
    procedure CloudFilesListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure CloudHomeButtonClick(Sender: TObject);
    procedure CloudBackButtonClick(Sender: TObject);
    procedure CloudFilesListDblClick(Sender: TObject);
    procedure CloudPathFieldKeyPress(Sender: TObject; var Key: Char);
    procedure CloudFilesListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure LocalFilesListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure CloudFilesListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LocalUploadMenuItemClick(Sender: TObject);
    procedure CloudDownloadItemClick(Sender: TObject);
    procedure CloudDeleteITemClick(Sender: TObject);
    procedure LocalFilesListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CloudCreateContainerItemClick(Sender: TObject);
    procedure ClearLogButtonClick(Sender: TObject);
    procedure ShowKeyCheckClick(Sender: TObject);
    procedure NewaccAddButtonClick(Sender: TObject);
    procedure NewAccFieldChanged(Sender: TObject);
    procedure DeletedSelectedAcctClick(Sender: TObject);
    procedure LocalRefreshItemClick(Sender: TObject);
    procedure RefreshCloudItemClick(Sender: TObject);
    procedure UseProxyCheckClick(Sender: TObject);
    procedure ProxyUpdateButtonClick(Sender: TObject);
    procedure cloudPopupPopup(Sender: TObject);
    procedure LocalPopupPopup(Sender: TObject);
  private
    FLogger: TCloudLogger;
    FLocalPath: String;
    FLocalFiles: TObjectDictionary<String,TLocalFile>;
    FCloudFiles: TObjectDictionary<String,TCloudFile>;

    FConnections: TObjectDictionary<String,TCloudConnection>;

    FPopulator: TCloudPopulator;

    FDelayThread: TDelayedRefreshThread;

    procedure LogHook(Msg: String; MsgType: TCloudLoggerType);

    procedure InitConnections(const DoImport: Boolean = True);

    function GetSelectedAccount: TCloudConnection;

    procedure UpdateLocalFileList;
    procedure LoadLocalDrives;

    procedure UpdateCloudFileList;

    function GetSelectedLocalFile(out LocalFile: TLocalFile): Boolean;
    function GetSelectedCloudFile(out CloudFile: TCloudFile): Boolean;

    procedure SetCurrentLocalDirectory(Path: String);
    procedure SetCurrentCloudPath(Container, Path: String);

    function GetLocalFileImageIndex(LocalFileType: TLocalFileType): Integer;
    function GetCloudFileImageIndex(CloudFileType: TCloudFileType): Integer;

    function GetSelectedLocalFiles: TList<TLocalFile>;
    function GetSelectedCloudFiles: TList<TCloudFile>;

    procedure RefreshCloud;
    procedure RefreshLocal;

    procedure UploadSelectedLocalFiles;
    procedure DownloadSelectedCloudFiles;

    procedure UpdateProxySetting;

    procedure InitTransferTable;

    procedure HandleTransferJobUpdate(Job: TCloudTransferJob);
  end;

var
  CloudUIForm: TCloudUIForm;

implementation

uses StrUtils, CloudAccountsIO;

{$R *.dfm}

procedure TCloudUIForm.LocalFilesListDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  DownloadSelectedCloudFiles;
end;

procedure TCloudUIForm.LocalFilesListDragOver(Sender, Source: TObject; X, Y: Integer;
                                              State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = CloudFilesList) and Assigned(FPopulator);
end;

procedure TCloudUIForm.LocalFilesListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
                                              State: TOwnerDrawState);
var
  CenterText : integer;
  Val: String;
  LF: TLocalFile;
  ImgIndex: Integer;
begin
  ImgIndex := -1;

  Val := LocalFilesList.Items.Strings[index];

  if FLocalFiles.TryGetValue(Val, LF) then
    ImgIndex := GetLocalFileImageIndex(LF.FileType);

  LocalFilesList.Canvas.FillRect(Rect);
  CEImages.Draw(LocalFilesList.Canvas, rect.Left + 4, rect.Top -1, ImgIndex);

  CenterText := ( rect.Bottom - rect.Top - LocalFilesList.Canvas.TextHeight(text)) div 2 ;

  LocalFilesList.Canvas.TextOut(rect.left + CEImages.Width + 8 , rect.Top + CenterText, Val);
end;

procedure TCloudUIForm.LocalFilesListMeasureItem(Control: TWinControl; Index: Integer;
                                                 var Height: Integer);
begin
  Height := CEImages.Height + 4;
end;

procedure TCloudUIForm.LocalHomeButtonClick(Sender: TObject);
begin
  LoadLocalDrives;
end;

procedure TCloudUIForm.LocalPathFieldKeyPress(Sender: TObject; var Key: Char);
var
  ProposedDir: String;
begin
  if Key = #13 then
  begin
    ProposedDir := LocalPathField.Text;
    StringReplace(ProposedDir, '/', '\', [rfReplaceAll]);

    if SysUtils.DirectoryExists(ProposedDir) then
    begin
      SetCurrentLocalDirectory(ProposedDir);
    end;
  end;
end;

procedure TCloudUIForm.LocalPopupPopup(Sender: TObject);
var
  LocalFile: TLocalFile;
  HasSelection: boolean;
begin
  HasSelection := GetSelectedLocalFile(LocalFile);

  LocalUploadMenuItem.Enabled := Assigned(FPopulator) and HasSelection and
   (LocalPathField.Text <> EmptyStr) and (CloudPathField.Text <> EmptyStr);
end;

procedure TCloudUIForm.LogHook(Msg: String; MsgType: TCloudLoggerType);
var
  MessageTypeStr: String;
  FormattedMsg: String;
begin
  if (MsgType = cltError) and (not EnableErrorLoggingCheck.Checked) then
    Exit;

  if (MsgType = cltInfo) and (not EnableInfoLoggingCheck.Checked) then
    Exit;

  case MsgType of
    cltInfo: MessageTypeStr := 'INFO';
    else
      MessageTypeStr := 'ERROR';
  end;
  FormattedMsg := Format('[%s][%s]: %s', [DateTimeToStr(Now), MessageTypeStr, Msg]);
  TThread.Queue(nil, procedure begin LogMemo.Lines.Add(FormattedMsg) end);
end;

procedure TCloudUIForm.ManageButtonClick(Sender: TObject);
begin
  RefreshCloud;
  RefreshLocal;
end;

procedure TCloudUIForm.NewaccAddButtonClick(Sender: TObject);
var
  LDispName, LName, LKey, LType, LRegion: String;
  LTypeInst: TCloudConnectionType;
  LConn: TCloudConnection;
begin
  LDispName := NewAccDisplayName.Text;
  LName := NewAccName.Text;
  LKey := NewAccKey.Text;
  LType := NewAccType.Text;
  LRegion := NewAccRegion.Text;

  if (LDispName <> EmptyStr) and (LName <> EmptyStr) and
     (LKey <> EmptyStr) and (LType <> EmptyStr) then
  begin
    LTypeInst := GetCloudTypeFromName(LType);

    if not FConnections.ContainsKey(AnsiUpperCase(LDispName)) then
    begin
      LConn := TCloudConnection.Create(LDispName, LName, LKey, LRegion, LTypeInst);
      FConnections.Add(AnsiUpperCase(LDispName), LConn);

      NewAccDisplayName.Text := EmptyStr;
      NewAccName.Text := EmptyStr;
      NewAccKey.Text := EmptyStr;
      NewAccRegion.Text := EmptyStr;

      ExportConnections(FConnections);
      InitConnections(False);
    end;
  end;
end;

procedure TCloudUIForm.NewAccFieldChanged(Sender: TObject);
var
  LDispName, LName, LKey, LType: String;
begin
  LDispName := NewAccDisplayName.Text;
  LName := NewAccName.Text;
  LKey := NewAccKey.Text;
  LType := NewAccType.Text;


  if (LDispName <> EmptyStr) and (LName <> EmptyStr) and (LKey <> EmptyStr) and (LType <> EmptyStr)then
  begin
    NewaccAddButton.Enabled := not FConnections.ContainsKey(AnsiUpperCase(LDispName));
  end
  else
    NewaccAddButton.Enabled := False;
end;

procedure TCloudUIForm.ProxyUpdateButtonClick(Sender: TObject);
begin
  UpdateProxySetting;
end;

procedure TCloudUIForm.LocalRefreshItemClick(Sender: TObject);
begin
  RefreshLocal;
end;

procedure TCloudUIForm.RefreshCloud;
begin
  if Assigned(FPopulator) then
    FPopulator.GetCurrentFiles(FCloudFiles)
  else
    FCloudFiles.Clear;

  UpdateCloudFileList;
end;

procedure TCloudUIForm.RefreshCloudItemClick(Sender: TObject);
begin
  RefreshCloud;
end;

procedure TCloudUIForm.RefreshLocal;
begin
  SetCurrentLocalDirectory(FLocalPath);
end;

procedure TCloudUIForm.FormDestroy(Sender: TObject);
begin
  TCloudTransferManager.Instance.RemoveListener(HandleTransferJobUpdate);
  FreeAndNil(FLogger);
  FreeAndNil(FLocalFiles);
  FreeAndNil(FCloudFiles);
  FreeAndNil(FConnections);
  FreeAndNil(FPopulator);
end;

function TCloudUIForm.GetCloudFileImageIndex(CloudFileType: TCloudFileType): Integer;
begin
  Result := -1;
  case CloudFileType of
    cftBucket: Result := 5;
    cftContainer: Result := 8;
    cftFolder: Result := 4;
    cftFile: Result := 0;
  end;
end;

function TCloudUIForm.GetLocalFileImageIndex(LocalFileType: TLocalFileType): Integer;
begin
  Result := -1;
  case LocalFileType of
    lftDrive: Result := 9;
    lftDirectory: Result := 4;
    lftFile: Result := 0;
  end;
end;

function TCloudUIForm.GetSelectedAccount: TCloudConnection;
var
  I, Count: Integer;
  Obj: TObject;
begin
  Result := nil;

  Count := AccountsListBox.Count - 1;

  for I := 0 to Count do
  begin
    if AccountsListBox.Selected[I] then
    begin
      Obj := AccountsListBox.Items.Objects[I];
      if Obj Is TCloudConnection then
        Exit(TCloudConnection(Obj));
    end;
  end;
end;

function TCloudUIForm.GetSelectedCloudFile(out CloudFile: TCloudFile): Boolean;
var
  I, Count: Integer;
begin
  Result := False;

  Count := CloudFilesList.Count - 1;

  for I := 0 to Count do
  begin
    if CloudFilesList.Selected[I] then
    begin
      if FCloudFiles.TryGetValue(CloudFilesList.Items.Strings[I], CloudFile) then
        Exit(True);
      Exit(False);
    end;
  end;
end;

function TCloudUIForm.GetSelectedCloudFiles: TList<TCloudFile>;
var
  I, Count: Integer;
  CF: TCloudFile;
begin
  Result := TList<TCloudFile>.Create;
  Count := CloudFilesList.Count - 1;
  for I := 0 to Count do
  begin
    if CloudFilesList.Selected[I] then
    begin
      if FCloudFiles.TryGetValue(CloudFilesList.Items.Strings[I], CF) then
        Result.Add(CF);
    end;
  end;
end;

function TCloudUIForm.GetSelectedLocalFile(out LocalFile: TLocalFile): Boolean;
var
  I, Count: Integer;
begin
  Result := False;

  Count := LocalFilesList.Count - 1;

  for I := 0 to Count do
  begin
    if LocalFilesList.Selected[I] then
    begin
      if FLocalFiles.TryGetValue(LocalFilesList.Items.Strings[I], LocalFile) then
        Exit(True);
      Exit(False);
    end;
  end;
end;

function TCloudUIForm.GetSelectedLocalFiles: TList<TLocalFile>;
var
  I, Count: Integer;
  LF: TLocalFile;
begin
  Result := TList<TLocalFile>.Create;
  Count := LocalFilesList.Count - 1;
  for I := 0 to Count do
  begin
    if LocalFilesList.Selected[I] then
    begin
      if FLocalFiles.TryGetValue(LocalFilesList.Items.Strings[I], LF) then
        Result.Add(LF);
    end;
  end;
end;

procedure TCloudUIForm.HandleTransferJobUpdate(Job: TCloudTransferJob);
begin
  if Job = nil then
    Exit;

  if Job.JobStatus = tjsFINISHED then
  begin
    //delay refreshing in case many refresh requests happen close together
    if (FDelayThread = nil) then
    begin
      FDelayThread := TDelayedRefreshThread.Create;
    end
    else
      FDelayThread.Delayed := True;
  end;
  InitTransferTable;
end;

procedure TCloudUIForm.InitConnections(const DoImport: Boolean);
var
  Conn: String;
  ConnObj: TCloudConnection;
begin
  if DoImport then
    ImportConnections(FConnections);

  ConnectionCombo.Clear;
  AccountsListBox.Clear;

  for Conn In FConnections.Keys do
  begin
    ConnObj := FConnections.Items[Conn];
    ConnectionCombo.Items.Add(ConnObj.DisplayName);
    AccountsListBox.AddItem(Format('%s (%s)', [ConnObj.DisplayName, ConnObj.Connection.AccountName]), ConnObj);
  end;

  UpdateProxySetting;
end;

procedure TCloudUIForm.InitTransferTable;
begin
  TThread.Queue(nil,
    procedure
    var
      Size, Count, I: Integer;
    begin
      Size := TCloudTransferManager.Instance.Size + 1;
      if Size < 2 then
        Count := 2
      else
        Count := Size;

      System.TMonitor.Enter(TransferGrid);
      try
        I := 0;
        TransferGrid.RowCount := Count;
        TransferGrid.Cells[0,I] := 'Type';
        TransferGrid.Cells[1,I] := 'Cloud File';
        TransferGrid.Cells[2,I] := 'Local File';
        Inc(I);
        if Size <> Count then
        begin
          TransferGrid.Cells[0,I] := EmptyStr;
          TransferGrid.Cells[1,I] := EmptyStr;
          TransferGrid.Cells[2,I] := EmptyStr;
        end
        else
        begin
          TCloudTransferManager.Instance.ForEachJob(
            procedure(const Job: TCloudTransferJob)
            begin
              if Job.JobType = tjtUPLOAD then
                TransferGrid.Cells[0,I] := 'UPLOAD'
              else
                TransferGrid.Cells[0,I] := 'DOWNLOAD';
              TransferGrid.Cells[1,I] := Job.ContainerName + '/' + Job.FileName;
              TransferGrid.Cells[2,I] := Job.LocalFilePath;
              Inc(I);
            end);
        end;
      finally
        System.TMonitor.Exit(TransferGrid);
      end;
    end);
end;

procedure TCloudUIForm.ClearLogButtonClick(Sender: TObject);
begin
  LogMemo.Clear;
end;

procedure TCloudUIForm.CloudBackButtonClick(Sender: TObject);
var
  CurrPath: String;
  LastIndexOf: Integer;
begin
  if not Assigned(FPopulator) then
   Exit;

  if (FPopulator.GetPath = EmptyStr) then
  begin
    if (FPopulator.GetContainer <> EmptyStr) then
    begin
      FPopulator.LoadRootFiles(FCloudFiles);
      UpdateCloudFileList;
    end;
  end
  else
  begin
    CurrPath := FPopulator.GetPath;

    if AnsiEndsStr('/', CurrPath) then
      CurrPath := Copy(CurrPath, 1, Length(CurrPath) - 1);

    LastIndexOf := LastDelimiter('/', CurrPath);

    if LastIndexOf > 0 then
      CurrPath := Copy(FPopulator.GetPath, 1, LastIndexOf)
    else
      CurrPath := EmptyStr;

    SetCurrentCloudPath(FPopulator.GetContainer, CurrPath);
  end;
end;

procedure TCloudUIForm.CloudFilesListDblClick(Sender: TObject);
var
  CloudFile: TCloudFile;
begin
  if GetSelectedCloudFile(CloudFile) then
  begin
    if (CloudFile.FileType = cftBucket) or (CloudFile.FileType = cftContainer) then
    begin
      SetCurrentCloudPath(CloudFile.Name, EmptyStr);
    end
    else if (CloudFile.FileType = cftFolder) then
    begin
      SetCurrentCloudPath(CloudFile.Container, CloudFile.Path + CloudFile.Name);
    end;
  end;
end;

procedure TCloudUIForm.CloudFilesListDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  UploadSelectedLocalFiles;
end;

procedure TCloudUIForm.CloudFilesListDragOver(Sender, Source: TObject; X, Y: Integer;
                                              State: TDragState; var Accept: Boolean);
var
  Files: TList<TLocalFile>;
  AFile: TLocalFile;
begin
  Accept := False;

  if (Source = LocalFilesList) and Assigned(FPopulator) and (FLocalPath <> EmptyStr) then
  begin
    Accept := True;
    if FPopulator.GetContainer = EmptyStr then
    begin
      //Azure can have files outside of containers, but the files can't be in
      //a virtual directory structure
      if FPopulator.CloudType = cctAzure then
      begin
        Files := GetSelectedLocalFiles;
        try
          //only files can be dropped into the root container
          for AFile In Files do
            if AFile.FileType <> lftFile then
            begin
              Accept := False;
              Exit;
            end;
        finally
          FreeAndNil(Files);
        end;
      end
      //Amazon only allows files in the containers (buckets) not outside.
      else if FPopulator.CloudType = cctAmazon then
      begin
        Accept := False;
      end;
    end;
  end;
end;

procedure TCloudUIForm.CloudFilesListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  CenterText : integer;
  Val: String;
  CF: TCloudFile;
  ImgIndex: Integer;
begin
  ImgIndex := -1;

  Val := CloudFilesList.Items.Strings[index];

  if FCloudFiles.TryGetValue(Val, CF) then
    ImgIndex := GetCloudFileImageIndex(CF.FileType);

  CloudFilesList.Canvas.FillRect(Rect);
  CEImages.Draw(CloudFilesList.Canvas, rect.Left + 4, rect.Top -1, ImgIndex);

  CenterText := ( rect.Bottom - rect.Top - CloudFilesList.Canvas.TextHeight(text)) div 2 ;

  CloudFilesList.Canvas.TextOut(rect.left + CEImages.Width + 8 , rect.Top + CenterText, Val);
end;

procedure TCloudUIForm.CloudHomeButtonClick(Sender: TObject);
begin
  if Assigned(FPopulator) then
  begin
    FPopulator.LoadRootFiles(FCloudFiles);
    UpdateCloudFileList;
  end;
end;

procedure TCloudUIForm.CloudPathFieldKeyPress(Sender: TObject; var Key: Char);
var
  ProposedFull: String;
  Container: String;
  Path: String;
  Handled: Boolean;
  I: Integer;
begin
  if Key = #13 then
  begin
    Handled := False;
    Container := EmptyStr;
    Path := EmptyStr;

    ProposedFull := CloudPathField.Text;

    if AnsiStartsStr('[', ProposedFull) then
    begin
      I := AnsiPos(']', ProposedFull);
      if I > 0 then
      begin
        Handled := True;
        Container := Copy(ProposedFull, 2, I - 2);
        Path := Copy(ProposedFull, I + 1);
      end;
    end;

    if not Handled then
      Path := ProposedFull;

    SetCurrentCloudPath(Container, Path);
  end;
end;

procedure TCloudUIForm.cloudPopupPopup(Sender: TObject);
var
  CloudFile: TCloudFile;
  HasSelection: boolean;
begin
  HasSelection := GetSelectedCloudFile(CloudFile);

  RefreshCloudItem.Enabled := Assigned(FPopulator);
  CloudCreateContainerItem.Enabled := Assigned(FPopulator) and (CloudPathField.Text = EmptyStr);
  CloudDownloadItem.Enabled := Assigned(FPopulator) and HasSelection and (LocalPathField.Text <> EmptyStr);
  CloudDeleteITem.Enabled := Assigned(FPopulator) and HasSelection;
end;

procedure TCloudUIForm.ConnectionComboChange(Sender: TObject);
var
  CC: TCloudConnection;
begin
  //Check if it is a valid connection object display name
  if FConnections.TryGetValue(AnsiUpperCase(ConnectionCombo.Text), CC) then
  begin
    //don't clear the files or populator if the one being switched to is the same as current one
    if (not Assigned(FPopulator)) or (not AnsiSameText(CC.DisplayName, FPopulator.ConnectionId)) then
    begin
      //Clear the cloud file list
      FCloudFiles.Clear;
      CloudFilesList.Clear;

      FreeAndNil(FPopulator);

      //If it is, set the connection to the current connection (create a new instance of a populator)
      FPopulator := GetPopulator(CC);
      FPopulator.Logger := FLogger;

      //Load the root content (path stored in populator)
      if Assigned(FPopulator) then
      begin
        FPopulator.LoadRootFiles(FCloudFiles);
        UpdateCloudFileList;
      end;
    end;
  end;
end;

procedure TCloudUIForm.CloudCreateContainerItemClick(Sender: TObject);
var
  CMsg: String;
  CTitle: String;
  CName: String;
begin
  if Assigned(FPopulator) and (FPopulator.GetContainer = EmptyStr) and (FPopulator.GetPath = EmptyStr) then
  begin
    if FPopulator.CloudType = cctAmazon then
    begin
      CTitle := 'Create Bucket';
      CMsg := 'Enter the bucket name';
    end
    else
    begin
      CTitle := 'Create Container';
      CMsg := 'Enter the container name';
    end;
    CName := InputBox(CTitle, CMsg, '');

    if CName <> EmptyStr then
      if FPopulator.CreateContainer(CName) then
        RefreshCloud
      else
        ShowMessage('Failed to create container.');
  end;
end;

procedure TCloudUIForm.CloudDeleteITemClick(Sender: TObject);
var
  Files: TList<TCloudFile>;
  AFile: TCloudFile;
  FMsg: String;
  Count: Integer;
begin
  if (FPopulator <> nil) then
  begin
    Files := GetSelectedCloudFiles;

    try
      Count := Files.Count;

      if Count <= 0 then
        Exit;

      if Count = 1 then
        FMsg := 'Are you sure you want to delete this file from the cloud?'
      else
        FMsg := 'Are you sure you want to delete these files from the cloud?';

      if MessageDlg(FMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        for AFile In Files do
        begin
          FPopulator.DeleteFile(AFile);
        end;
        RefreshCloud;
      end;
    finally
      FreeAndNil(Files);
    end;
  end;
end;

procedure TCloudUIForm.CloudDownloadItemClick(Sender: TObject);
begin
  DownloadSelectedCloudFiles;
end;

procedure TCloudUIForm.DeletedSelectedAcctClick(Sender: TObject);
var
  Acct: TCloudConnection;
begin
  Acct := GetSelectedAccount;

  if Acct <> nil then
  begin
    //delete the selected account if it is currently in the list
    if FConnections.ContainsKey(AnsiUpperCase(Acct.DisplayName)) then
    begin
      //check to see if the account being deleted is currently in use
      if Assigned(FPopulator) then
      begin
        //free the populator using the account, and then refresh the cloud tree to clear it
        if AnsiSameText(FPopulator.ConnectionId, Acct.DisplayName) then
        begin
          FreeAndNil(FPopulator);
          RefreshCloud;
        end;
      end;

      //TODO:: don't remove the text value of the accounts dropdown (ConnectionCombo)
      FConnections.Remove(AnsiUpperCase(Acct.DisplayName));
      ExportConnections(FConnections);
      InitConnections(False);

      //restore populator's Account ID in dropdown
      if Assigned(FPopulator) then
      begin
        ConnectionCombo.Text := FPopulator.ConnectionId;
      end;
    end
    //should never be needed, but free the account if it wasn't in the FConnections list
    else
      FreeAndNil(Acct);
  end;
end;

procedure TCloudUIForm.DownloadSelectedCloudFiles;
const
  ReplaceMsg = '%s already exists. Replace it?';
  DirReplaceMsg = 'The directory ''%s'' already exists. Any files which already exist in it will be replaced. Continue?';
var
  Files: TList<TCloudFile>;
  AFile: TCloudFile;
  Directory: String;
  FilePath: String;
  ReplaceAnswer: Integer;
begin
  ReplaceAnswer := mrNo;
  Directory := FLocalPath;

  if (Directory <> EmptyStr) and (SysUtils.DirectoryExists(Directory)) then
  begin
    Files := GetSelectedCloudFiles;

    try
      if Assigned(Files) and (Files.Count > 0) then
      begin
        Directory := AnsiReplaceStr(Directory, '\', '/');
        if not AnsiEndsStr('/', Directory) then
          Directory := Directory + '/';

        for AFile In Files do
        begin
          //TODO:: Handle downloading directories?
          if AFile.FileType = cftFile then
          begin
            FilePath := Directory + AFile.Name;
            if FileExists(FilePath) then
            begin
              if ReplaceAnswer <> mrNoToAll then
              begin
                if (ReplaceAnswer = mrYesToAll) then
                  FPopulator.DownloadFile(AFile, Directory)
                else
                begin
                  ReplaceAnswer := MessageDlg(Format(ReplaceMsg, [AFile.Name]), mtConfirmation,
                                              [mbYes, mbYesToAll, mbNoToAll, mbNo], 0);
                  if (ReplaceAnswer = mrYes) or (ReplaceAnswer = mrYesToAll) then
                    FPopulator.DownloadFile(AFile, Directory);
                end;
              end;
            end
            else
              FPopulator.DownloadFile(AFile, Directory);
          end
          else if (AFile.FileType = cftContainer) or
                  (AFile.FileType = cftBucket) or
                  (AFile.FileType = cftFolder) then
          begin
            FilePath := Directory + AFile.Name;
            if SysUtils.DirectoryExists(FilePath) then
            begin
              if ReplaceAnswer <> mrNoToAll then
              begin
                if (ReplaceAnswer = mrYesToAll) then
                  FPopulator.DownloadFile(AFile, Directory)
                else
                begin
                  ReplaceAnswer := MessageDlg(Format(DirReplaceMsg, [AFile.Name]), mtConfirmation,
                                              [mbYes, mbYesToAll, mbNoToAll, mbNo], 0);
                  if (ReplaceAnswer = mrYes) or (ReplaceAnswer = mrYesToAll) then
                    FPopulator.DownloadFile(AFile, Directory);
                end;
              end;
            end
            else
              FPopulator.DownloadFile(AFile, Directory);
          end;
        end;
        RefreshLocal;
      end;
    finally
      FreeAndNil(Files);
    end;
  end;
end;

procedure TCloudUIForm.FormActivate(Sender: TObject);
begin
  FDelayThread := nil;
  FLogger := TCloudLogger.Create(LogHook);

  FLocalFiles := TObjectDictionary<String,TLocalFile>.Create;
  FCloudFiles := TObjectDictionary<String,TCloudFile>.Create;

  FConnections := TObjectDictionary<String,TCloudConnection>.Create([doOwnsValues]);

  FLocalPath := EmptyStr;

  FPopulator := nil;

  LoadLocalDrives;

  InitConnections;
  InitTransferTable;

  TCloudTransferManager.Instance.AddListener(HandleTransferJobUpdate);
end;

procedure TCloudUIForm.UpdateCloudFileList;
var
  CF: TCloudFile;
  Dirs: TStringList;
  Fils: TStringList;
begin
  if FPopulator = nil then
    CloudPathField.Text := EmptyStr
  else if FPopulator.GetContainer = EmptyStr then
    CloudPathField.Text := FPopulator.GetPath
  else
    CloudPathField.Text := Format('[%s]/%s', [FPopulator.GetContainer, FPopulator.GetPath]);

  Dirs := TStringList.Create;
  Fils := TStringList.Create;

  for CF In FCloudFiles.Values do
  begin
    if (CF.FileType = cftContainer) or
       (CF.FileType = cftBucket) or (CF.FileType = cftFolder) then
      Dirs.Add(CF.Name)
    else
      Fils.Add(CF.Name);
  end;

  Dirs.Sort;
  Fils.Sort;

  CloudFilesList.Items.BeginUpdate;
  try
    CloudFilesList.Items.Clear;

    CloudFilesList.Items.AddStrings(Dirs);
    CloudFilesList.Items.AddStrings(Fils);
  finally
    CloudFilesList.Items.EndUpdate;
    FreeAndNil(Dirs);
    FreeAndNil(Fils);
  end;
end;

procedure TCloudUIForm.UpdateLocalFileList;
var
  LF: TLocalFile;
  Dirs: TStringList;
  Fils: TStringList;
begin
  LocalPathField.Text := FLocalPath;

  Dirs := TStringList.Create;
  Fils := TStringList.Create;

  for LF In FLocalFiles.Values do
  begin
    if (LF.FileType = lftDrive) or (LF.FileType = lftDirectory) then
      Dirs.Add(LF.Name)
    else
      Fils.Add(LF.Name);
  end;

  Dirs.Sort;
  Fils.Sort;

  LocalFilesList.Items.BeginUpdate;
  try
    LocalFilesList.Items.Clear;

    LocalFilesList.Items.AddStrings(Dirs);
    LocalFilesList.Items.AddStrings(Fils);
  finally
    LocalFilesList.Items.EndUpdate;
    FreeAndNil(Dirs);
    FreeAndNil(Fils);
  end;
end;

procedure TCloudUIForm.UpdateProxySetting;
var
  LHost: String;
  LPort: Integer;
  LConn: TCloudConnection;
begin
  //TODO:: take in the proxy host and port and update it
  if UseProxyCheck.Checked then
  begin
    LHost := ProxyHostField.Text;
    LPort := StrToInt(ProxyPortField.Text);
  end
  else
  begin
    LHost := EmptyStr;
    LPort := 0;
  end;

  for LConn In FConnections.Values do
  begin
    LConn.Connection.RequestProxyHost := LHost;
    LConn.Connection.RequestProxyPort := LPort;
  end;
end;

procedure TCloudUIForm.LocalUploadMenuItemClick(Sender: TObject);
begin
  UploadSelectedLocalFiles;
end;

procedure TCloudUIForm.UploadSelectedLocalFiles;
var
  Files: TList<TLocalFile>;
  LFile: TLocalFile;
begin
  Files := GetSelectedLocalFiles;
  try
    if Assigned(Files) and (Files.Count > 0) then
    begin
      //TODO:: Make this better
      for LFile In Files do
        FPopulator.UploadFile(LFile);
      RefreshCloud;
    end;
  finally
    FreeAndNil(Files);
  end;
end;

procedure TCloudUIForm.UseProxyCheckClick(Sender: TObject);
begin
  ProxyHostLabel.Enabled := UseProxyCheck.Checked;
  ProxyHostField.Enabled := UseProxyCheck.Checked;
  ProxyPortLabel.Enabled := UseProxyCheck.Checked;
  ProxyPortField.Enabled := UseProxyCheck.Checked;
  ProxyUpdateButton.Enabled := UseProxyCheck.Checked;

  UpdateProxySetting;
end;

procedure TCloudUIForm.LoadLocalDrives;
var
  r: LongWord;
  Drives: array[0..128] of char;
  pDrive: pchar;
begin
  FLocalPath := EmptyStr;
  FLocalFiles.Clear;

  r := GetLogicalDriveStrings(sizeof(Drives), Drives);

  if (r > 0) and (r <= sizeof(Drives)) then
  begin
    pDrive := Drives;
    while pDrive^ <> #0 do begin
      if GetDriveType(pDrive) <> DRIVE_CDROM then
        FLocalFiles.Add(pDrive, TLocalFile.Create(pDrive, EmptyStr, lftDrive));
      inc(pDrive, 4);  // Point to the next drive
    end;
  end;

  UpdateLocalFileList;
end;

procedure TCloudUIForm.LocalBackButtonClick(Sender: TObject);
var
  Parent: String;
begin
  if (FLocalPath <> EmptyStr) and (FLocalPath <> '\') then
  begin
    Parent := ExpandFileName(FLocalPath + '\..');

    if Parent = FLocalPath then
      LoadLocalDrives
    else
    begin
      SetCurrentLocalDirectory(Parent);
    end;
  end;
end;

procedure TCloudUIForm.LocalFilesListDblClick(Sender: TObject);
var
  LocalFile: TLocalFile;
begin
  if GetSelectedLocalFile(LocalFile) then
  begin
    if (LocalFile.FileType = lftDrive) then
    begin
      SetCurrentLocalDirectory(LocalFile.Name);
    end
    else if (LocalFile.FileType = lftDirectory) then
    begin
      SetCurrentLocalDirectory(LocalFile.Path + LocalFile.Name + '\');
    end;
  end;
end;

procedure TCloudUIForm.SetCurrentCloudPath(Container, Path: String);
begin
  if FPopulator <> nil then
  begin
    FPopulator.SetPath(Container, Path, FCloudFiles);
    UpdateCloudFileList;
  end;
end;

procedure TCloudUIForm.SetCurrentLocalDirectory(Path: String);
var
  SR: TSearchRec;
  IsFound: Boolean;
begin
  if (Path <> EmptyStr) and (not AnsiEndsStr('\', Path)) then
    Path := Path + '\';

  FLocalPath := Path;

  if (Path = EmptyStr) or (Path = '/') or (Path = '\') then
    LoadLocalDrives
  else
  begin
    FLocalFiles.Clear;

    IsFound := FindFirst(Path + '*', faAnyFile - faDirectory, SR) = 0;
    while IsFound do begin
      FLocalFiles.Add(SR.Name, TLocalFile.Create(SR.Name, Path, lftFile));
      IsFound := FindNext(SR) = 0;
    end;
    FindClose(SR);

    IsFound := FindFirst(Path + '*.*', faAnyFile, SR) = 0;
    while IsFound do begin
      if ((SR.Attr and faDirectory) <> 0) and (SR.Name[1] <> '.') and (not AnsiSameText(SR.Name, '$Recycle.Bin')) then
        FLocalFiles.Add(SR.Name, TLocalFile.Create(SR.Name, Path, lftDirectory));
      IsFound := FindNext(SR) = 0;
    end;
    FindClose(SR);

    UpdateLocalFileList;
  end;
end;

procedure TCloudUIForm.ShowKeyCheckClick(Sender: TObject);
begin
  if ShowKeyCheck.Checked then
    NewAccKey.PasswordChar := #0
  else
    NewAccKey.PasswordChar := '*';
end;

{ TDelayedRefreshThread }

constructor TDelayedRefreshThread.Create(DelayTime: Integer);
begin
  inherited Create;
  FDelayTime := DelayTime;
  if (FDelayTime < 1) then
    FDelayTime := 500
  else if (FDelayTime > 60000) then
    FDelayTime := 2000;
end;

destructor TDelayedRefreshThread.Destroy;
begin
  if CloudUIForm.FDelayThread = Self then
    CloudUIForm.FDelayThread := nil;
  inherited;
end;

procedure TDelayedRefreshThread.Execute;
begin
  inherited;
  FreeOnTerminate := True;

  FDelayed := True;
  while (FDelayed) and (FDelayTime > 0) and (FDelayTime < 60000) do
  begin
    FDelayed := False;
    Sleep(FDelayTime);
  end;

  TThread.Queue(nil,
    procedure
    begin
      CloudUIForm.RefreshCloud;
      CloudUIForm.RefreshLocal;
    end);
end;

end.

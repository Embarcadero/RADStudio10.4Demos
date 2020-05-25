//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CloudRefactorUI;

interface

uses
  System.SysUtils, System.Classes,
  System.Generics.Collections, System.StrUtils, System.DateUtils,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Dialogs, Vcl.ExtCtrls,
  Data.Cloud.CloudAPI, Data.Cloud.AzureAPI, Data.Cloud.AmazonAPI,
  CloudPopulator, System.ImageList, Vcl.ImgList;

type
  TCloudUIForm = class(TForm)
    AmazonOutputMemo: TMemo;
    ServiceTabs: TPageControl;
    Azure: TTabSheet;
    AzureSTabs: TPageControl;
    Tables: TTabSheet;
    azGetTables: TButton;
    azDeleteRow: TButton;
    azGetRows: TButton;
    azCreateRow: TButton;
    azUpdateRow: TButton;
    azMergeRow: TButton;
    azCreateTable: TButton;
    azDeleteTable: TButton;
    Queues: TTabSheet;
    azListQueues: TButton;
    azCreateQueue: TButton;
    azDeleteQueue: TButton;
    azGetQueueMetadata: TButton;
    azAddQueueMetadata: TButton;
    azAddQueueMessage: TButton;
    azGetQueueMessages: TButton;
    azDeleteQueueMessages: TButton;
    azClearQueueMessages: TButton;
    Blobs: TTabSheet;
    PageControl1: TPageControl;
    Containers: TTabSheet;
    azListContainers: TButton;
    azCreateContainer: TButton;
    azDeleteContainer: TButton;
    azGetContainerProperties: TButton;
    azSetContainerMetadata: TButton;
    azGetContainerACL: TButton;
    azSetContainerACL: TButton;
    BlobsSub: TTabSheet;
    azListBlobs: TButton;
    azPutBlobBlock: TButton;
    azPutPageBlob: TButton;
    azLeaseBlob: TButton;
    azGetBlobMetadata: TButton;
    azSetBlobMetadata: TButton;
    azGetBlobProperties: TButton;
    azSetBlobProperties: TButton;
    azDeleteBlob: TButton;
    azDownloadBlob: TButton;
    azCopyBlob: TButton;
    azSnapshotBlob: TButton;
    azUploadBlock: TButton;
    azUploadPage: TButton;
    azGetBlockList: TButton;
    azPubBlockList: TButton;
    azGetPageRegions: TButton;
    Amazon: TTabSheet;
    AmazonSTabs: TPageControl;
    AmBlobs: TTabSheet;
    amQueues: TTabSheet;
    amTables: TTabSheet;
    amListQueues: TButton;
    amCreateQueue: TButton;
    amDeleteQueue: TButton;
    amGetQueueProperties: TButton;
    amSetQueueProperties: TButton;
    amAddQueuePermissions: TButton;
    amDeleteQueuePermissions: TButton;
    amAddQueueMessage: TButton;
    amGetMessages: TButton;
    amDeleteMessage: TButton;
    amChangeMessageVisibility: TButton;
    amGetTables: TButton;
    amCreateTable: TButton;
    amDeleteTable: TButton;
    amGetTableMetadata: TButton;
    amCreateRow: TButton;
    amBatchCreateRows: TButton;
    amGetRows: TButton;
    amDeleteColumn: TButton;
    amDeleteRow: TButton;
    AmazonBlobTab: TPageControl;
    BucketTab: TTabSheet;
    ObjectTab: TTabSheet;
    amDeleteObject: TButton;
    amGetObjectACL: TButton;
    amUploadObject: TButton;
    amButtObjCopy: TButton;
    amUploadPart: TButton;
    amAbortMultipartUpload: TButton;
    amListParts: TButton;
    amInitiateMultipartUpload: TButton;
    amPutObjectACL: TButton;
    amGetObjectMetadata: TButton;
    amGetObjectTorrent: TButton;
    amGetObject: TButton;
    amSetObjectMetadata: TButton;
    AccountsPage: TTabSheet;
    AccountsListBox: TListBox;
    NewAccountPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NewAccDisplayName: TEdit;
    NewAccName: TEdit;
    NewAccKey: TEdit;
    NewaccAddButton: TButton;
    ShowKeyCheck: TCheckBox;
    NewAccType: TComboBox;
    AzureOutputMemo: TMemo;
    azTableNameLabel: TLabel;
    azTableName: TEdit;
    AzureConnPanel: TPanel;
    lbCloud: TLabel;
    cbConnection: TComboBox;
    azQueueName: TEdit;
    azQueueNameLabel: TLabel;
    azPeekQueueMessages: TButton;
    azGetContainerMetadata: TButton;
    azContainerNameLabel: TLabel;
    azContainerName: TEdit;
    blobspanel: TPanel;
    amTableName: TEdit;
    amTableNameLabel: TLabel;
    amGetRowsID: TButton;
    amQueueName: TEdit;
    amQueueNameLabel: TLabel;
    amPeekMessages: TButton;
    amBucketNamePanel: TPanel;
    amBucketNameLabel: TLabel;
    amBucketName: TEdit;
    amListBuckets: TButton;
    amCreateBucket: TButton;
    amGenerateBucketName: TButton;
    amDeleteBucket: TButton;
    amGetBucket: TButton;
    amSetBucketPolicy: TButton;
    amGetBucketPolicy: TButton;
    amDeleteBucketPolicy: TButton;
    amGetBucketVersionInfo: TButton;
    amSetBucketACL: TButton;
    amGetBucketACL: TButton;
    amSetBucketLogging: TButton;
    amGetBucketLogging: TButton;
    amSetBucketNotification: TButton;
    amGetBucketNotification: TButton;
    amGetBucketPayer: TButton;
    amSetBucketPayer: TButton;
    amGetBucketVersioning: TButton;
    amSetBucketVersioning: TButton;
    amGetBucketLocation: TButton;
    amCompleteMultipartUpload: TButton;
    UserIDLabel: TLabel;
    UserID: TEdit;
    UserName: TEdit;
    UserNameLabel: TLabel;
    UserPrincipal: TEdit;
    UserPrincipalLabel: TLabel;
    amSendMessageBatch: TButton;
    amChangeMessageVisibilityBatch: TButton;
    amDeleteMessageBatch: TButton;
    procedure azGetTablesClick(Sender: TObject);
    procedure azCreateRowClick(Sender: TObject);
    procedure azGetRowsClick(Sender: TObject);
    procedure azUpdateRowClick(Sender: TObject);
    procedure azMergeRowClick(Sender: TObject);
    procedure azDeleteRowClick(Sender: TObject);
    procedure azListQueuesClick(Sender: TObject);
    procedure azCreateQueueClick(Sender: TObject);
    procedure azDeleteQueueClick(Sender: TObject);
    procedure azGetQueueMetadataClick(Sender: TObject);
    procedure azAddQueueMetadataClick(Sender: TObject);
    procedure azAddQueueMessageClick(Sender: TObject);
    procedure azGetQueueMessagesClick(Sender: TObject);
    procedure azDeleteQueueMessagesClick(Sender: TObject);
    procedure azClearQueueMessagesClick(Sender: TObject);
    procedure azCreateTableClick(Sender: TObject);
    procedure azDeleteTableClick(Sender: TObject);
    procedure azListContainersClick(Sender: TObject);
    procedure azCreateContainerClick(Sender: TObject);
    procedure azDeleteContainerClick(Sender: TObject);
    procedure azGetContainerPropertiesClick(Sender: TObject);
    procedure azSetContainerMetadataClick(Sender: TObject);
    procedure azGetContainerACLClick(Sender: TObject);
    procedure azSetContainerACLClick(Sender: TObject);
    procedure azListBlobsClick(Sender: TObject);
    procedure azPutBlobBlockClick(Sender: TObject);
    procedure azPutPageBlobClick(Sender: TObject);
    procedure azLeaseBlobClick(Sender: TObject);
    procedure azGetBlobMetadataClick(Sender: TObject);
    procedure azSetBlobMetadataClick(Sender: TObject);
    procedure azGetBlobPropertiesClick(Sender: TObject);
    procedure azSetBlobPropertiesClick(Sender: TObject);
    procedure azDeleteBlobClick(Sender: TObject);
    procedure azDownloadBlobClick(Sender: TObject);
    procedure azCopyBlobClick(Sender: TObject);
    procedure azSnapshotBlobClick(Sender: TObject);
    procedure azUploadBlockClick(Sender: TObject);
    procedure azUploadPageClick(Sender: TObject);
    procedure azGetBlockListClick(Sender: TObject);
    procedure azPubBlockListClick(Sender: TObject);
    procedure azGetPageRegionsClick(Sender: TObject);
    procedure amListQueuesClick(Sender: TObject);
    procedure amCreateQueueClick(Sender: TObject);
    procedure amDeleteQueueClick(Sender: TObject);
    procedure amGetQueuePropertiesClick(Sender: TObject);
    procedure amSetQueuePropertiesClick(Sender: TObject);
    procedure amAddQueuePermissionsClick(Sender: TObject);
    procedure amDeleteQueuePermissionsClick(Sender: TObject);
    procedure amAddQueueMessageClick(Sender: TObject);
    procedure amGetMessagesClick(Sender: TObject);
    procedure amDeleteMessageClick(Sender: TObject);
    procedure amChangeMessageVisibilityClick(Sender: TObject);
    procedure amGetTablesClick(Sender: TObject);
    procedure amCreateTableClick(Sender: TObject);
    procedure amDeleteTableClick(Sender: TObject);
    procedure amGetTableMetadataClick(Sender: TObject);
    procedure amCreateRowClick(Sender: TObject);
    procedure amBatchCreateRowsClick(Sender: TObject);
    procedure amGetRowsClick(Sender: TObject);
    procedure amDeleteColumnClick(Sender: TObject);
    procedure amDeleteRowClick(Sender: TObject);
    procedure amCreateBucketClick(Sender: TObject);
    procedure amListBucketsClick(Sender: TObject);
    procedure amDeleteBucketClick(Sender: TObject);
    procedure amGetBucketClick(Sender: TObject);
    procedure amGetBucketACLClick(Sender: TObject);
    procedure amGetBucketPolicyClick(Sender: TObject);
    procedure amGetBucketLocationClick(Sender: TObject);
    procedure amGetBucketLoggingClick(Sender: TObject);
    procedure amGetBucketNotificationClick(Sender: TObject);
    procedure amGetBucketPayerClick(Sender: TObject);
    procedure amGetBucketVersioningClick(Sender: TObject);
    procedure amDeleteBucketPolicyClick(Sender: TObject);
    procedure amSetBucketACLClick(Sender: TObject);
    procedure amSetBucketPolicyClick(Sender: TObject);
    procedure amSetBucketLoggingClick(Sender: TObject);
    procedure amSetBucketNotificationClick(Sender: TObject);
    procedure amSetBucketPayerClick(Sender: TObject);
    procedure amSetBucketVersioningClick(Sender: TObject);
    procedure amGetObjectClick(Sender: TObject);
    procedure amGetObjectACLClick(Sender: TObject);
    procedure amGetObjectTorrentClick(Sender: TObject);
    procedure amDeleteObjectClick(Sender: TObject);
    procedure amGetObjectMetadataClick(Sender: TObject);
    procedure amUploadObjectClick(Sender: TObject);
    procedure amPutObjectACLClick(Sender: TObject);
    procedure amButtObjCopyClick(Sender: TObject);
    procedure amInitiateMultipartUploadClick(Sender: TObject);
    procedure amUploadPartClick(Sender: TObject);
    procedure amAbortMultipartUploadClick(Sender: TObject);
    procedure amListPartsClick(Sender: TObject);
    procedure amSetObjectMetadataClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShowKeyCheckClick(Sender: TObject);
    procedure NewAccFieldChanged(Sender: TObject);
    procedure NewaccAddButtonClick(Sender: TObject);
    procedure cbConnectionChange(Sender: TObject);
    procedure azPeekQueueMessagesClick(Sender: TObject);
    procedure azGetContainerMetadataClick(Sender: TObject);
    procedure amGetRowsIDClick(Sender: TObject);
    procedure amPeekMessagesClick(Sender: TObject);
    procedure amGenerateBucketNameClick(Sender: TObject);
    procedure amGetBucketVersionInfoClick(Sender: TObject);
    procedure amCompleteMultipartUploadClick(Sender: TObject);
    procedure amSendMessageBatchClick(Sender: TObject);
    procedure amChangeMessageVisibilityBatchClick(Sender: TObject);
    procedure amDeleteMessageBatchClick(Sender: TObject);
  private
    LastMultipartUploadId: String;

    FConnections: TObjectDictionary<String,TCloudConnection>;
    FPopulator: TCloudPopulator;
    FLogger: TCloudLogger;

    function CheckConnectionAvailable(ConnType: TCloudConnectionType): Boolean;

    procedure LogHook(Msg: String; MsgType: TCloudLoggerType; ConnType: TCloudConnectionType);

    procedure InitConnections(const DoImport: Boolean = True);

    function GetRandomString(const Length: Integer): String;
    function GetFileName: String;
  end;

var
  CloudUIForm: TCloudUIForm;

implementation

uses
  System.JSON, System.NetEncoding, System.TypInfo, System.UITypes,
  Xml.XMLDoc,
  CloudAccountsIO;

{$R *.dfm}

procedure TCloudUIForm.LogHook(Msg: String; MsgType: TCloudLoggerType; ConnType: TCloudConnectionType);
var
  MessageTypeStr: String;
  FormattedMsg: String;
begin
  case MsgType of
    cltInfo: MessageTypeStr := 'INFO';
    else
      MessageTypeStr := 'ERROR';
  end;
  FormattedMsg := Format('[%s][%s]: %s', [DateTimeToStr(Now), MessageTypeStr, Msg]);

  if ConnType = TCloudConnectionType.cctAmazon then
    TThread.Queue(nil, procedure begin AmazonOutputMemo.Text := FormattedMsg end)
  else
    TThread.Queue(nil, procedure begin AzureOutputMemo.Text := FormattedMsg end)
end;

procedure TCloudUIForm.InitConnections(const DoImport: Boolean);
var
  Conn: String;
  ConnObj: TCloudConnection;
begin
  if DoImport then
    ImportConnections(FConnections);

  cbConnection.Clear;
  AccountsListBox.Clear;

  for Conn In FConnections.Keys do
  begin
    ConnObj := FConnections.Items[Conn];
    cbConnection.Items.Add(ConnObj.DisplayName);
    AccountsListBox.AddItem(Format('%s (%s)', [ConnObj.DisplayName, ConnObj.Connection.AccountName]), ConnObj);
  end;
end;

procedure TCloudUIForm.NewaccAddButtonClick(Sender: TObject);
var
  LDispName, LName, LKey, LType,
  LUserID, LUserDisplayName, LUserPrincipal: String;
  LTypeInst: TCloudConnectionType;
  LConn: TCloudConnection;
begin
  LDispName := NewAccDisplayName.Text;
  LName := NewAccName.Text;
  LKey := NewAccKey.Text;
  LType := NewAccType.Text;
  if LType = 'Amazon' then
  begin
    LUserID := UserID.Text;
    LUserDisplayName := UserName.Text;
    LUserPrincipal := UserPrincipal.Text;
  end;

  if (LDispName <> EmptyStr) and (LName <> EmptyStr) and
     (LKey <> EmptyStr) and (LType <> EmptyStr) then
  begin
    LTypeInst := GetCloudTypeFromName(LType);

    if not FConnections.ContainsKey(AnsiUpperCase(LDispName)) then
    begin
      LConn := TCloudConnection.Create(LDispName, LName, LKey, LUserID, LUserDisplayName, LUserPrincipal, LTypeInst);
      FConnections.Add(AnsiUpperCase(LDispName), LConn);

      NewAccDisplayName.Text := EmptyStr;
      NewAccName.Text := EmptyStr;
      NewAccKey.Text := EmptyStr;

      ExportConnections(FConnections);
      InitConnections(False);
    end;
  end;
end;

procedure TCloudUIForm.NewAccFieldChanged(Sender: TObject);
var
  LDispName, LName, LKey, LType, LUserID, LUserName, LUserPrincipal: String;
begin
  UserIDLabel.Visible := NewAccType.Text = 'Amazon';
  UserID.Visible := NewAccType.Text = 'Amazon';
  UserNameLabel.Visible := NewAccType.Text = 'Amazon';
  UserName.Visible := NewAccType.Text = 'Amazon';
  UserPrincipalLabel.Visible := NewAccType.Text = 'Amazon';
  UserPrincipal.Visible := NewAccType.Text = 'Amazon';

  LDispName := NewAccDisplayName.Text;
  LName := NewAccName.Text;
  LKey := NewAccKey.Text;
  LType := NewAccType.Text;
  LUserID := UserID.Text;
  LUserName := UserName.Text;
  LUserPrincipal := UserPrincipal.Text;

  NewaccAddButton.Enabled := (not LDispName.IsEmpty) and
                             (not LName.IsEmpty) and
                             (not LKey.IsEmpty) and
                             (not LType.IsEmpty) and
                             (not FConnections.ContainsKey(AnsiUpperCase(LDispName)));
  if NewAccType.Text = 'Amazon' then
    NewaccAddButton.Enabled := NewaccAddButton.Enabled and
                               (not LUserID.IsEmpty) and
                               (not LUserName.IsEmpty) and
                               (not LUserPrincipal.IsEmpty);
end;

procedure TCloudUIForm.ShowKeyCheckClick(Sender: TObject);
begin
  if ShowKeyCheck.Checked then
    NewAccKey.PasswordChar := #0
  else
    NewAccKey.PasswordChar := '*';
end;

procedure TCloudUIForm.azGetTablesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).QueryTablesXML
  else
    TAzurePopulator(FPopulator).QueryTables;
end;

procedure TCloudUIForm.amAddQueueMessageClick(Sender: TObject);
var
  MsgVal: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  MsgVal := InputBox('Message Text', 'Enter the text of the message', '');
  if MsgVal = EmptyStr then
    Exit;

  TAmazonPopulator(FPopulator).SendMessage(amQueueName.Text, MsgVal);
end;

procedure TCloudUIForm.amAddQueuePermissionsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).AddQueuePermissions(amQueueName.Text);
end;

procedure TCloudUIForm.amBatchCreateRowsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).InsertRows(amTableName.Text);
end;

procedure TCloudUIForm.amChangeMessageVisibilityBatchClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).ChangeMessageVisibilityBatch(amQueueName.Text);
end;

procedure TCloudUIForm.amChangeMessageVisibilityClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).ChangeMessageVisibility(amQueueName.Text);
end;

procedure TCloudUIForm.amCompleteMultipartUploadClick(Sender: TObject);
var
  UploadId: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    Exit;

  UploadId := InputBox('UploadId', 'Enter the multipart UploadId', LastMultipartUploadId);
  if UploadId = EmptyStr then
    Exit;

  LastMultipartUploadId := UploadID;
  TAmazonPopulator(FPopulator).CompleteMultipartUpload(amBucketName.Text, UploadID);
end;

procedure TCloudUIForm.amCreateQueueClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).CreateQueue(amQueueName.Text);
end;

procedure TCloudUIForm.amDeleteRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteRow(amTableName.Text);
end;

procedure TCloudUIForm.amDeleteColumnClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteColumn(amTableName.Text);
end;

procedure TCloudUIForm.amSendMessageBatchClick(Sender: TObject);
var
  MsgVal: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  MsgVal := InputBox('Message Text', 'Enter the text of the message', '');
  if MsgVal = EmptyStr then
    Exit;

  TAmazonPopulator(FPopulator).SendMessageBatch(amQueueName.Text, MsgVal);
end;

procedure TCloudUIForm.amDeleteMessageBatchClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteMessageBatch(amQueueName.Text);
end;

procedure TCloudUIForm.amDeleteMessageClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteMessage(amQueueName.Text);
end;

procedure TCloudUIForm.amDeleteQueueClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteQueue(amQueueName.Text);
end;

procedure TCloudUIForm.amDeleteQueuePermissionsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).RemovePermission(amQueueName.Text);
end;

procedure TCloudUIForm.amCreateBucketClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).CreateBucket(amBucketName.Text);
end;

procedure TCloudUIForm.amDeleteBucketClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteBucket(amBucketName.Text);
end;

procedure TCloudUIForm.amDeleteBucketPolicyClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteBucketPolicy(amBucketName.Text);
end;

procedure TCloudUIForm.amListBucketsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).ListBucketsXML
  else
    TAmazonPopulator(FPopulator).ListBuckets;
end;

procedure TCloudUIForm.amGetBucketACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketACLXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketACL(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucket(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketLocationClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketLocationXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketLocation(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketLoggingClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketLoggingXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketLogging(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketNotificationClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketNotificationXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketNotification(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketPayerClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketPayerXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketPayer(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketPolicyClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As JSON String?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketPolicyJSON(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketPolicy(amBucketName.Text);
end;

procedure TCloudUIForm.amGetBucketVersioningClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketVersioningXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetBucketVersioning(amBucketName.Text);
end;

procedure TCloudUIForm.amGenerateBucketNameClick(Sender: TObject);
begin
  amBucketName.Text := LowerCase(GetRandomString(4) + '-testbucket');
end;

procedure TCloudUIForm.amGetBucketVersionInfoClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetBucketXML(amBucketName.Text, True)
  else
    TAmazonPopulator(FPopulator).GetBucket(amBucketName.Text, True);
end;

procedure TCloudUIForm.amGetMessagesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetMessagesXML(amQueueName.Text)
  else
    TAmazonPopulator(FPopulator).GetMessages(amQueueName.Text);
end;

procedure TCloudUIForm.amGetQueuePropertiesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetQueueAttributesXML(amQueueName.Text)
  else
    TAmazonPopulator(FPopulator).GetQueueAttributes(amQueueName.Text);
end;

procedure TCloudUIForm.amInitiateMultipartUploadClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).InitiateMultipartUploadXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).InitiateMultipartUpload(amBucketName.Text)
end;

procedure TCloudUIForm.amSetBucketACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketACL(amBucketName.Text);
end;

procedure TCloudUIForm.amSetBucketLoggingClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketLogging(amBucketName.Text);
end;

procedure TCloudUIForm.amSetBucketNotificationClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketNotification(amBucketName.Text);
end;

procedure TCloudUIForm.amSetQueuePropertiesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetQueueAttributes(amQueueName.Text);
end;

procedure TCloudUIForm.amCreateTableClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).CreateTable(amTableName.Text);
end;

procedure TCloudUIForm.amDeleteTableClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteTable(amTableName.Text);
end;

procedure TCloudUIForm.amGetRowsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetRowsXML(amTableName.Text)
  else
    TAmazonPopulator(FPopulator).GetRows(amTableName.Text);
end;

procedure TCloudUIForm.amGetRowsIDClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetRowsXML(amTableName.Text, True)
  else
    TAmazonPopulator(FPopulator).GetRowIDs(amTableName.Text);

  exit;
end;

procedure TCloudUIForm.amCreateRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).InsertRow(amTableName.Text);
end;

procedure TCloudUIForm.amGetTableMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetTableMetadataXML(amTableName.Text)
  else
    TAmazonPopulator(FPopulator).GetTableMetadata(amTableName.Text);
end;

procedure TCloudUIForm.amGetTablesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).QueryTablesXML
  else
    TAmazonPopulator(FPopulator).QueryTables;
end;

procedure TCloudUIForm.amListQueuesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).ListQueuesXML
  else
    TAmazonPopulator(FPopulator).ListQueues;
end;

procedure TCloudUIForm.amPeekMessagesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).PeekMessagesXML(amQueueName.Text)
  else
    TAmazonPopulator(FPopulator).PeekMessages(amQueueName.Text);
end;

procedure TCloudUIForm.amAbortMultipartUploadClick(Sender: TObject);
var
  UploadId: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    Exit;

  UploadId := InputBox('UploadId', 'Enter the multipart UploadId', LastMultipartUploadId);
  if UploadId = EmptyStr then
    Exit;

  LastMultipartUploadId := UploadID;
  TAmazonPopulator(FPopulator).AbortMultipartUpload(amBucketName.Text, UploadID);
end;

procedure TCloudUIForm.amButtObjCopyClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).CopyObject(amBucketName.Text);
end;

procedure TCloudUIForm.amDeleteObjectClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).DeleteObjects(amBucketName.Text);
end;

procedure TCloudUIForm.amGetObjectACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).GetObjectACLXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).GetObjectACL(amBucketName.Text);
end;

procedure TCloudUIForm.amGetObjectClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  if FileExists(FileName) then
  begin
    if MessageDlg(Format('Are you sure you want to change the content of %s?', [FileName]),
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      TAmazonPopulator(FPopulator).GetObject(amBucketName.Text, FileName, fmOpenWrite)
    else
      exit;
  end else
    TAmazonPopulator(FPopulator).GetObject(amBucketName.Text, FileName, fmCreate);
end;

procedure TCloudUIForm.amGetObjectTorrentClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  if FileExists(FileName) then
  begin
    if MessageDlg(Format('Are you sure you want to change the content of %s?', [FileName]),
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      TAmazonPopulator(FPopulator).GetObjectTorrent(amBucketName.Text, FileName, fmOpenWrite)
    else
      exit;
  end else
    TAmazonPopulator(FPopulator).GetObjectTorrent(amBucketName.Text, FileName, fmCreate);
end;

procedure TCloudUIForm.amGetObjectMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).GetObjectMetadata(amBucketName.Text);
end;

procedure TCloudUIForm.amListPartsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAmazonPopulator(FPopulator).ListPartsXML(amBucketName.Text)
  else
    TAmazonPopulator(FPopulator).ListParts(amBucketName.Text);
end;

procedure TCloudUIForm.amPutObjectACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetObjectACL(amBucketName.Text);
end;

procedure TCloudUIForm.amUploadObjectClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).UploadObject(amBucketName.Text);
end;

procedure TCloudUIForm.amUploadPartClick(Sender: TObject);
var
  UploadId: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    Exit;

  UploadId := InputBox('UploadId', 'Enter the multipart UploadId', LastMultipartUploadId);
  if UploadId = EmptyStr then
    Exit;

  LastMultipartUploadId := UploadID;
  TAmazonPopulator(FPopulator).UploadPart(amBucketName.Text, UploadID);
end;

procedure TCloudUIForm.azPutPageBlobClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).PutPageBlock(azContainerName.Text);
end;

procedure TCloudUIForm.azCreateContainerClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('Root Container?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).CreateRootContainer
  else
    TAzurePopulator(FPopulator).CreateContainer(azContainerName.Text);
end;

procedure TCloudUIForm.azDeleteContainerClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('Root Container?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).DeleteRootContainer
  else
    TAzurePopulator(FPopulator).DeleteContainer(azContainerName.Text);
end;

procedure TCloudUIForm.azSetContainerMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SetContainerMetadata(azContainerName.Text);
end;

procedure TCloudUIForm.azCopyBlobClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).CopyBlob(azContainerName.Text);
end;

procedure TCloudUIForm.azPutBlobBlockClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  TAzurePopulator(FPopulator).PutBlobBlock(azContainerName.Text, FileName);
end;

procedure TCloudUIForm.azSnapshotBlobClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SnapshotBlob(azContainerName.Text);
end;

procedure TCloudUIForm.azDeleteBlobClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).DeleteBlob(azContainerName.Text);
end;

procedure TCloudUIForm.azDownloadBlobClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  if FileExists(FileName) then
  begin
    if MessageDlg(Format('Are you sure you want to change the content of %s?', [FileName]),
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      TAzurePopulator(FPopulator).GetBlob(azContainerName.Text, FileName, fmOpenWrite)
    else
      exit;
  end else
    TAzurePopulator(FPopulator).GetBlob(azContainerName.Text, FileName, fmCreate);
end;

procedure TCloudUIForm.azGetContainerACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).GetContainerACLXML(azContainerName.Text)
  else
    TAzurePopulator(FPopulator).GetContainerACL(azContainerName.Text);
end;

procedure TCloudUIForm.azGetBlobMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).GetBlobMetadata(azContainerName.Text);
end;

procedure TCloudUIForm.azGetBlobPropertiesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).GetBlobProperties(azContainerName.Text);
end;

procedure TCloudUIForm.azGetBlockListClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).GetBlockListXML(azContainerName.Text)
  else
    TAzurePopulator(FPopulator).GetBlockList(azContainerName.Text);
end;

procedure TCloudUIForm.azLeaseBlobClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).AcquireBlobLease(azContainerName.Text);
end;

procedure TCloudUIForm.azPubBlockListClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).PutBlockList(azContainerName.Text);
end;

procedure TCloudUIForm.azSetContainerACLClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SetContainerACL(azContainerName.Text);
end;

procedure TCloudUIForm.azSetBlobMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SetBlobMetadata(azContainerName.Text);
end;

procedure TCloudUIForm.azListBlobsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).ListBlobsXML(azContainerName.Text)
  else
    TAzurePopulator(FPopulator).ListBlobs(azContainerName.Text);
end;

procedure TCloudUIForm.azListContainersClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).ListContainersXML
  else
    TAzurePopulator(FPopulator).ListContainers;
end;

procedure TCloudUIForm.azUploadBlockClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  TAzurePopulator(FPopulator).PutBlock(azContainerName.Text, FileName);
end;

procedure TCloudUIForm.azUploadPageClick(Sender: TObject);
var
  FileName: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  FileName := GetFileName;
  if FileName = EmptyStr then
    Exit;

  TAzurePopulator(FPopulator).PutPage(azContainerName.Text, FileName);
end;

procedure TCloudUIForm.amSetBucketPayerClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketPayer(amBucketName.Text);
end;

procedure TCloudUIForm.amSetBucketPolicyClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketPolicy(amBucketName.Text);
end;

procedure TCloudUIForm.amSetBucketVersioningClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetBucketVersioning(amBucketName.Text);
end;

procedure TCloudUIForm.amSetObjectMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAmazon) then
    exit;

  TAmazonPopulator(FPopulator).SetObjectMetadata(amBucketName.Text);
end;

procedure TCloudUIForm.azGetContainerMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).GetContainerMetadata(azContainerName.Text);
end;

procedure TCloudUIForm.azGetContainerPropertiesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).GetContainerProperties(azContainerName.Text);
end;

procedure TCloudUIForm.azGetPageRegionsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).GetPageRegionsXML(azContainerName.Text)
  else
    TAzurePopulator(FPopulator).GetPageRegions(azContainerName.Text);
end;

procedure TCloudUIForm.azSetBlobPropertiesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SetBlobProperties(azContainerName.Text);
end;

procedure TCloudUIForm.azAddQueueMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).SetQueueMetadata(azQueueName.Text);
end;

procedure TCloudUIForm.azAddQueueMessageClick(Sender: TObject);
var
  Msg: String;
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  Msg := InputBox('Message Text', 'Enter the text of the message', 'Test Message');
  if Msg = EmptyStr then
    Exit;

  TAzurePopulator(FPopulator).AddMessage(azQueueName.Text, Msg);
end;

procedure TCloudUIForm.azClearQueueMessagesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).ClearMessages(azQueueName.Text);
end;

procedure TCloudUIForm.azCreateQueueClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).CreateQueue(azQueueName.Text);
end;

procedure TCloudUIForm.azDeleteQueueClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).DeleteQueue(azQueueName.Text);
end;

procedure TCloudUIForm.azDeleteQueueMessagesClick(Sender: TObject);

begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).DeleteMessage(azQueueName.Text);
end;

procedure TCloudUIForm.azGetQueueMessagesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).GetMessagesXML(azQueueName.Text)
  else
    TAzurePopulator(FPopulator).GetMessages(azQueueName.Text);
end;

procedure TCloudUIForm.azListQueuesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).ListQueuesXML
  else
    TAzurePopulator(FPopulator).ListQueues;
end;

procedure TCloudUIForm.azGetQueueMetadataClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).GetQueueMetadata(azQueueName.Text);
end;

procedure TCloudUIForm.azCreateRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).InsertEntity(azTableName.Text);
end;

procedure TCloudUIForm.azGetRowsClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).QueryEntitiesXML(azTableName.Text)
  else
    TAzurePopulator(FPopulator).QueryEntities(azTableName.Text);
end;

procedure TCloudUIForm.azUpdateRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).UpdateEntity(azTableName.Text);
end;

procedure TCloudUIForm.cbConnectionChange(Sender: TObject);
var
  CC: TCloudConnection;
begin
  //Check if it is a valid connection object display name
  if FConnections.TryGetValue(AnsiUpperCase(TComboBox(Sender).Text), CC) then
  begin
    if (not Assigned(FPopulator)) or (not AnsiSameText(CC.DisplayName, FPopulator.ConnectionId)) then
    begin
      FreeAndNil(FPopulator);

      FPopulator := GetPopulator(CC);
      FPopulator.Logger := FLogger;
    end;
  end;
end;

function TCloudUIForm.CheckConnectionAvailable(ConnType: TCloudConnectionType): Boolean;
begin
  Result := (FPopulator <> nil) and (FPopulator.CloudType = ConnType);

  if not Result then
    MessageDlg('Invalid connection', TMsgDlgType.mtError, [mbOK], 0);
end;

procedure TCloudUIForm.FormActivate(Sender: TObject);
begin
  FLogger := TCloudLogger.Create(LogHook);
  FConnections := TObjectDictionary<String,TCloudConnection>.Create([doOwnsValues]);

  InitConnections;

  if FConnections.Count = 0 then
    ServiceTabs.ActivePage := AccountsPage;
end;

procedure TCloudUIForm.FormDestroy(Sender: TObject);
begin
  FLogger.Free;
  FPopulator.Free;
  FConnections.Free;
end;

procedure TCloudUIForm.azMergeRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).MergeEntity(azTableName.Text);
end;

procedure TCloudUIForm.azPeekQueueMessagesClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  if MessageDlg('As XML?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    TAzurePopulator(FPopulator).PeekMessagesXML(azQueueName.Text)
  else
    TAzurePopulator(FPopulator).PeekMessages(azQueueName.Text);
end;

procedure TCloudUIForm.azCreateTableClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).CreateTable(azTableName.Text);
end;

procedure TCloudUIForm.azDeleteTableClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).DeleteTable(azTableName.Text);
end;

procedure TCloudUIForm.azDeleteRowClick(Sender: TObject);
begin
  if not CheckConnectionAvailable(TCloudConnectionType.cctAzure) then
    exit;

  TAzurePopulator(FPopulator).DeleteEntity(azTableName.Text);
end;

function TCloudUIForm.GetFileName: String;
var
  foDlg: TFileOpenDialog;
begin
  foDlg := TFileOpenDialog.Create(self);
  if foDlg.Execute(Handle) then
    Result := foDlg.FileName;
  foDlg.Free;
end;

function TCloudUIForm.GetRandomString(const Length: Integer): String;
const
  Chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
var
  CharsLength, i, N: integer;
begin
  Randomize;
  Result := '';
  CharsLength := 62; //Length(Chars); //---Internal error: we can't call non procedures
  for i := 1 to Length do
  begin
    N := Random(CharsLength) + 1;
    Result := Result + Chars[N];
  end;
end;

end.

//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CloudPopulator;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI, Data.Cloud.AzureAPI;

type
  TCloudConnectionType = (cctAmazon, cctAzure);

  TCloudLoggerType = (cltError, cltInfo);

  TCloudLoggerHook = procedure(Msg: String; MsgType: TCloudLoggerType; ConnType: TCloudConnectionType) of object;

  TCloudLogger = class
  private
    FHook: TCloudLoggerHook;
  public
    constructor Create(Hook: TCloudLoggerHook); virtual;
    property Hook: TCloudLoggerHook read FHook;
  end;

  TCloudConnection = class
  private
    FCloudType: TCloudConnectionType;
    FDisplayName: String;
    FConnection: TCloudConnectionInfo;
    FUserID: String;
    FUserDisplayName: String;
    FUserPrincipal: String;
  public
    constructor Create(const DisplayName, AccountName, AccountPass, UserID, UserDisplayName, UserPrincipal: String;
                       CloudType: TCloudConnectionType); virtual;
    destructor Destroy; override;
    property CloudType: TCloudConnectionType read FCloudType;
    property DisplayName: String read FDisplayName;
    property Connection: TCloudConnectionInfo read FConnection;
    property UserID: String read FUserID;
    property UserDisplayName: String read FUserDisplayName;
    property UserPrincipal: String read FUserPrincipal;
  end;

  TCloudPopulator = class abstract
  protected
    FLogger: TCloudLogger;
    FConnectionId: String;
    FUserID: String;
    FUserDisplayName: String;
    FUserPrincipal: String;

    function GetCloudType: TCloudConnectionType; virtual; abstract;
    procedure Log(Msg: String; MsgType: TCloudLoggerType; ConnType: TCloudConnectionType);
  public
    property CloudType: TCloudConnectionType read GetCloudType;
    property Logger: TCloudLogger read FLogger write FLogger;
    property ConnectionId: String read FConnectionId write FConnectionId;
    property UserID: String read FUserID write FUserID;
    property UserDisplayName: String read FUserDisplayName write FUserDisplayName;
    property UserPrincipal: String read FUserPrincipal write FUserPrincipal;
  end;

  TAmazonPopulator = class(TCloudPopulator)
  private
    FConnection: TAmazonConnectionInfo;
    FTableService: TAmazonTableService;
    FQueueService: TAmazonQueueService;
    FStorageService: TAmazonStorageService;

    function GetAmazonQueueURL(const QueueName: String): String;
    function GetAmazonMessage(const QueueURL: String): TCloudQueueMessageItem;
    function GetAmazonMessages(const QueueURL: String): TArray<TCloudQueueMessageItem>;
  protected
    function GetCloudType: TCloudConnectionType; override;
  public
    constructor Create(Conn: TAmazonConnectionInfo);overload;
    constructor Create(Conn: TCloudConnection);overload;
    destructor Destroy; override;

    procedure QueryTablesXML;
    procedure QueryTables;
    procedure CreateTable(const TableName: String);
    procedure DeleteTable(const TableName: String);
    procedure GetTableMetadataXML(const TableName: String);
    procedure GetTableMetadata(const TableName: String);
    procedure GetRowsXML(const TableName: String; ItemIdOnly: Boolean = False);
    procedure GetRows(const TableName: String);
    procedure GetRowIDs(const TableName: String);
    procedure InsertRow(const TableName: String);
    procedure InsertRows(const TableName: String);
    procedure DeleteColumn(const TableName: String);
    procedure DeleteRow(const TableName: String);

    procedure ListQueuesXML;
    procedure ListQueues;
    procedure CreateQueue(const QueueName: String);
    procedure DeleteQueue(const QueueName: String);
    procedure GetQueueAttributesXML(const QueueName: String);
    procedure GetQueueAttributes(const QueueName: String);
    procedure SetQueueAttributes(const QueueName: String);
    procedure AddQueuePermissions(const QueueName: String);
    procedure RemovePermission(const QueueName: String);
    procedure SendMessage(const QueueName, Msg: String);
    procedure SendMessageBatch(const QueueName, Msg: String);
    procedure GetMessagesXML(const QueueName: String);
    procedure GetMessages(const QueueName: String);
    procedure PeekMessagesXML(const QueueName: String);
    procedure PeekMessages(const QueueName: String);
    procedure DeleteMessage(const QueueName: String);
    procedure DeleteMessageBatch(const QueueName: String);
    procedure ChangeMessageVisibility(const QueueName: String);
    procedure ChangeMessageVisibilityBatch(const QueueName: String);

    procedure ListBucketsXML;
    procedure ListBuckets;
    procedure CreateBucket(const BucketName: String);
    procedure DeleteBucket(const BucketName: String);
    procedure GetBucketXML(const BucketName: String; VersionInfo: Boolean = False);
    procedure GetBucket(const BucketName: String; VersionInfo: Boolean = False);
    procedure SetBucketPolicy(const BucketName: String);
    procedure GetBucketPolicyJSON(const BucketName: String);
    procedure GetBucketPolicy(const BucketName: String);
    procedure DeleteBucketPolicy(const BucketName: String);
    procedure SetBucketACL(const BucketName: String);
    procedure GetBucketACLXML(const BucketName: String);
    procedure GetBucketACL(const BucketName: String);
    procedure SetBucketLogging(const BucketName: String);
    procedure GetBucketLoggingXML(const BucketName: String);
    procedure GetBucketLogging(const BucketName: String);
    procedure SetBucketNotification(const BucketName: String);
    procedure GetBucketNotificationXML(const BucketName: String);
    procedure GetBucketNotification(const BucketName: String);
    procedure SetBucketPayer(const BucketName: String);
    procedure GetBucketPayerXML(const BucketName: String);
    procedure GetBucketPayer(const BucketName: String);
    procedure SetBucketVersioning(const BucketName: String);
    procedure GetBucketVersioningXML(const BucketName: String);
    procedure GetBucketVersioning(const BucketName: String);
    procedure GetBucketLocationXML(const BucketName: String);
    procedure GetBucketLocation(const BucketName: String);
    procedure ListMultipartUploadsXML(const BucketName: String);
    procedure ListMultipartUploads(const BucketName: String);

    procedure UploadObject(const BucketName: String);
    procedure DeleteObjects(const BucketName: String);
    procedure GetObject(const BucketName: String; const FileName: String; OpenMode: Integer);
    procedure GetObjectACLXML(const BucketName: String);
    procedure GetObjectACL(const BucketName: String);
    procedure SetObjectACL(const BucketName: String);
    procedure GetObjectTorrent(const BucketName: String; const FileName: String; OpenMode: Integer);
    procedure GetObjectMetadata(const BucketName: String);
    procedure SetObjectMetadata(const BucketName: String);
    procedure CopyObject(const BucketName: String);
    procedure InitiateMultipartUploadXML(const BucketName: String);
    procedure InitiateMultipartUpload(const BucketName: String);
    procedure UploadPart(const BucketName: String; const UploadID: String);
    procedure CompleteMultipartUpload(const BucketName: String; const UploadID: String);
    procedure AbortMultipartUpload(const BucketName: String; const UploadID: String);
    procedure ListPartsXML(const BucketName: String);
    procedure ListParts(const BucketName: String);
  end;

  TAzurePopulator = class(TCloudPopulator)
  private
    FConnection: TAzureConnectionInfo;
    FTableService: TAzureTableService;
    FQueueService: TAzureQueueService;
    FBlobService: TAzureBlobService;
  protected
    function GetCloudType: TCloudConnectionType; override;
  public
    constructor Create(Conn: TAzureConnectionInfo);
    destructor Destroy; override;

    procedure QueryTablesXML;
    procedure QueryTables;
    procedure CreateTable(const TableName: String);
    procedure DeleteTable(const TableName: String);
    procedure QueryEntitiesXML(const TableName: String);
    procedure QueryEntities(const TableName: String);
    procedure InsertEntity(const TableName: String);
    procedure UpdateEntity(const TableName: String);
    procedure MergeEntity(const TableName: String);
    procedure DeleteEntity(const TableName: String);

    procedure ListQueuesXML;
    procedure ListQueues;
    procedure CreateQueue(const QueueName: String);
    procedure DeleteQueue(const QueueName: String);
    procedure GetQueueMetadata(const QueueName: String);
    procedure SetQueueMetadata(const QueueName: String);
    procedure AddMessage(const QueueName, Msg: String);
    procedure GetMessagesXML(const QueueName: String);
    procedure GetMessages(const QueueName: String);
    procedure PeekMessagesXML(const QueueName: String);
    procedure PeekMessages(const QueueName: String);
    procedure DeleteMessage(const QueueName: String);
    procedure ClearMessages(const QueueName: String);

    procedure ListContainersXML;
    procedure ListContainers;
    procedure CreateRootContainer;
    procedure CreateContainer(const ContainerName: String);
    procedure DeleteRootContainer;
    procedure DeleteContainer(const ContainerName: String);
    procedure GetContainerProperties(const ContainerName: String);
    procedure SetContainerMetadata(const ContainerName: String);
    procedure GetContainerMetadata(const ContainerName: String);
    procedure GetContainerACLXML(const ContainerName: String);
    procedure GetContainerACL(const ContainerName: String);
    procedure SetContainerACL(const ContainerName: String);
    procedure ListBlobsXML(const ContainerName: String);
    procedure ListBlobs(const ContainerName: String);
    procedure PutBlobBlock(const ContainerName, FileName: String);
    procedure PutPageBlock(const ContainerName: String);
    procedure AcquireBlobLease(const ContainerName: String);
    procedure SetBlobMetadata(const ContainerName: String);
    procedure GetBlobMetadata(const ContainerName: String);
    procedure SetBlobProperties(const ContainerName: String);
    procedure GetBlobProperties(const ContainerName: String);
    procedure DeleteBlob(const ContainerName: String);
    procedure GetBlob(const ContainerName: String; const FileName: String; OpenMode: Integer);
    procedure CopyBlob(const ContainerName: String);
    procedure SnapshotBlob(const ContainerName: String);
    procedure PutBlock(const ContainerName, FileName: String);
    procedure PutPage(const ContainerName, FileName: String);
    procedure GetBlockListXML(const ContainerName: String);
    procedure GetBlockList(const ContainerName: String);
    procedure PutBlockList(const ContainerName: String);
    procedure GetPageRegionsXML(const ContainerName: String);
    procedure GetPageRegions(const ContainerName: String);
  end;

  //returns a new instance of a populator, depending on connection type
  function GetPopulator(Conn: TCloudConnection): TCloudPopulator;

  function GetCloudTypeName(AType: TCloudConnectionType): String;
  function GetCloudTypeFromName(AType: String): TCloudConnectionType;

implementation

uses
  System.StrUtils, System.TypInfo, System.NetEncoding, System.JSON, System.DateUtils,
  Xml.XMLDoc;

function ContentOf(const FileName: String; RequiredSizeMod: Integer = 0): TBytes; overload;
var
  fs: TFileStream;
begin
  if FileName <> EmptyStr then
  begin
    fs := TFileStream.Create(FileName, fmOpenRead);
    try
      if RequiredSizeMod < 1 then
        SetLength(Result, fs.Size)
      else
        SetLength(Result, ((fs.Size div RequiredSizeMod) + 1) * RequiredSizeMod);
      fs.ReadBuffer(Result[0], fs.Size);
    finally
      fs.Free;
    end;
  end else
    SetLength(Result, 0);
end;

function ContentOf(const AStream: TMemoryStream; RequiredSizeMod: Integer = 0): TBytes; overload;
begin
  if RequiredSizeMod < 1 then
    SetLength(Result, AStream.Size)
  else
    SetLength(Result, ((AStream.Size div RequiredSizeMod) + 1) * RequiredSizeMod);
  AStream.ReadBuffer(Result[0], AStream.Size);
end;

function GetRandomString(const Length: Integer): String;
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

function GetPopulator(Conn: TCloudConnection): TCloudPopulator;
begin
  Result := nil;

  if Conn = nil then
    Exit;

  if Conn.FCloudType = cctAmazon then
//    Result := TAmazonPopulator.Create(TAmazonConnectionInfo(Conn.Connection))
    Result := TAmazonPopulator.Create(Conn)
  else if Conn.FCloudType = cctAzure then
    Result := TAzurePopulator.Create(TAzureConnectionInfo(Conn.Connection));

  if Result <> nil then
    Result.ConnectionId := Conn.DisplayName;
end;

function GetCloudTypeName(AType: TCloudConnectionType): String;
begin
  case AType of
    cctAmazon : Exit('Amazon');
    cctAzure : Exit('Azure');
    else
      Exit('Unknown');
  end;
end;

function GetCloudTypeFromName(AType: String): TCloudConnectionType;
begin
  Result := cctAzure; //Default to azure

  if AnsiSameText('Amazon', AType) then
    Exit(cctAmazon);

  if AnsiSameText('Azure', AType) then
    Exit(cctAzure);
end;

function ByteContent(DataStream: TStream): TBytes;
var
  Buffer: TBytes;
begin
  if not Assigned(DataStream) then
    exit(nil);

  SetLength(Buffer, DataStream.Size);
  // the content may have been read
  DataStream.Position := 0;
  if DataStream.Size > 0 then
    DataStream.Read(Buffer[0], DataStream.Size);

  Result := Buffer;
end;

{ TCloudLogger }

constructor TCloudLogger.Create(Hook: TCloudLoggerHook);
begin
  FHook := Hook;
end;

{ TCloudConnection }

constructor TCloudConnection.Create(const DisplayName, AccountName, AccountPass, UserID, UserDisplayName, UserPrincipal: String;
                                    CloudType: TCloudConnectionType);
begin
  FDisplayName := DisplayName;
  FCloudType := CloudType;
  FUserID := UserID;
  FUserDisplayName := UserDisplayName;
  FUserPrincipal := UserPrincipal;

  if CloudType = cctAmazon then
  begin
    FConnection := TAmazonConnectionInfo.Create(nil);
    TAmazonConnectionInfo(FConnection).AutoDetectBucketRegion := True;
  end
  else
    FConnection := TAzureConnectionInfo.Create(nil);

  FConnection.AccountName := AccountName;
  FConnection.AccountKey := AccountPass;
end;

destructor TCloudConnection.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

{ TLocalFile }

//class function TLocalFile.Create(const Name, Path: String; FileType: TLocalFileType): TLocalFile;
//begin
//  Result.Path := Path;
//  Result.Name := Name;
//  Result.FileType := FileType;
//end;

{ TCloudFile }

//class function TCloudFile.Create(const Name, Container, Path: String; FileType: TCloudFileType): TCloudFile;
//begin
//  Result.Container := Container;
//  Result.Path := Path;
//  Result.Name := Name;
//  Result.FileType := FileType;
//end;

{ TCloudPopulator }

procedure TCloudPopulator.Log(Msg: String; MsgType: TCloudLoggerType; ConnType: TCloudConnectionType);
begin
  if Assigned(FLogger) then
    FLogger.Hook(Msg, MsgType, ConnType);
end;

{ TAmazonPopulator }

constructor TAmazonPopulator.Create(Conn: TAmazonConnectionInfo);
begin
  FConnection := Conn;
  FTableService := TAmazonTableService.Create(Conn);
  FQueueService := TAmazonQueueService.Create(Conn);
  FStorageService := TAmazonStorageService.Create(Conn);
end;

constructor TAmazonPopulator.Create(Conn: TCloudConnection);
begin
  FConnection := TAmazonConnectionInfo(Conn);
  FUserID := Conn.UserID;
  FUserDisplayName := Conn.UserDisplayName;
  FUserPrincipal := Conn.UserPrincipal;
  FTableService := TAmazonTableService.Create(TAmazonConnectionInfo(Conn.Connection));
  FQueueService := TAmazonQueueService.Create(TAmazonConnectionInfo(Conn.Connection));
  FStorageService := TAmazonStorageService.Create(TAmazonConnectionInfo(Conn.Connection));
end;

destructor TAmazonPopulator.Destroy;
begin
  FTableService.Free;
  FQueueService.Free;
  FStorageService.Free;

  inherited;
end;

function TAmazonPopulator.GetAmazonQueueURL(const QueueName: String): String;
var
  QueueList: TList<TCloudQueue>;
  Item: TCloudQueue;
begin
  Result := EmptyStr;

  QueueList := FQueueService.ListQueues;
  try
    if QueueList <> nil then
    begin
      for Item in QueueList do
        if Item.Name = QueueName then
        begin
          Result := Item.URL;
          Break;
        end;
    end;
  finally
    QueueList.Free;
  end;
end;

function TAmazonPopulator.GetAmazonMessage(const QueueURL: String): TCloudQueueMessageItem;
var
  ResponseXML: string;
  ResponseList: TArray<TCloudQueueMessageItem>;
begin
  ResponseList := FQueueService.ReceiveMessage(QueueURL, 1, 30, ResponseXML, nil);

  if Length(ResponseList) > 0 then
    Result := ResponseList[Length(ResponseList)-1];
end;

function TAmazonPopulator.GetAmazonMessages(const QueueURL: String): TArray<TCloudQueueMessageItem>;
var
  ResponseXML: string;
begin
  Result := FQueueService.ReceiveMessage(QueueURL, 1, 30, ResponseXML, nil);
end;

procedure TAmazonPopulator.QueryTables;
var
  ResponseList: TStrings;
begin
  ResponseList := FTableService.QueryTables;
  try
    try
      Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get tables', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.QueryTablesXML;
var
  Response: String;
begin
  try
    Response := FTableService.QueryTablesXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get tables', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.CreateTable(const TableName: String);
begin
  try
    if FTableService.CreateTable(TableName) then
      Log('Table ' + TableName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to create table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to create table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.DeleteTable(const TableName: String);
begin
  try
    if FTableService.DeleteTable(TableName) then
      Log('Table ' + TableName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to delete table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to delete table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetTableMetadataXML(const TableName: String);
var
  Response: String;
begin
  try
    Response := FTableService.GetTableMetadataXML(TableName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get table metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetTableMetadata(const TableName: String);
var
  ResponseList: TStrings;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FTableService.GetTableMetadata(TableName);
      Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get table metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.GetRowsXML(const TableName: String; ItemIdOnly: Boolean);
var
  Response: String;
begin
  try
    Response := FTableService.GetRowsXML(TableName, 0, ItemIdOnly);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get table rows', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetRows(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Row: TCloudTableRow;
  Col: TCloudTableColumn;
  Msg, ALine: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FTableService.GetRows(TableName);

      if responseList <> nil then
      begin
        for Row in ResponseList do
        begin
          ALine := EmptyStr;

          for Col in Row.Columns do
            ALine := Format('%s(%s:%s) ', [ALine, Col.Name, Col.Value]);

          Row.Free;
          Msg := Msg + ALine + #13#10;
        end;
      end;

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get table rows', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.GetRowIDs(const TableName: String);
var
  ResponseList: TStrings;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FTableService.GetRowIDs(TableName);
      if ResponseList <> nil then
        Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error tryint to get rowlist', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error tryint to get rowlist', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.InsertRow(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
  Count, RowId: String;
begin
  ResponseList := nil;
  Entity := nil;

  try
    try
      RowId := GetRandomString(8);

      ResponseList := FTableService.GetRows(TableName);
      if ResponseList <> nil then
        Count := IntToStr(ResponseList.Count + 1)
      else
        Count := '1';

      Entity := TCloudTableRow.Create;
      Entity.SetColumn('Somecolumn', 'foo' + Count);
      Entity.SetColumn('SomeOtherColumn', 'any value ' + Count);
      Entity.SetColumn('ANumber', Count + '.0');

      if FTableService.InsertRow(TableName, RowId, Entity, nil) then
        Log(' Row ' + Count + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to create row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to create row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
  end;
end;

procedure TAmazonPopulator.InsertRows(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
  Rows: TList<TAmazonBatchRow>;
  I, Count: Integer;
  ICount, RowId: String;
begin
  ResponseList := nil;
  Entity := nil;
  Rows := nil;

  try
    try
      RowId := GetRandomString(8);

      ResponseList := FTableService.GetRows(TableName);
      if ResponseList <> nil then
        Count := ResponseList.Count + 1
      else
        Count := 1;

      Rows := TList<TAmazonBatchRow>.Create;

      for I := 0 to 4 do
      begin
        ICount := IntToStr(Count + I);
        Entity := TCloudTableRow.Create;
        Entity.SetColumn('Somecolumn', 'foo' + ICount);
        Entity.SetColumn('SomeOtherColumn', 'any value ' + ICount);
        Entity.SetColumn('ANumber', ICount + '.0');
        Rows.Add(TAmazonBatchRow.Create(GetRandomString(8), Entity, True));
      end;

      if FTableService.InsertRows(TableName, Rows) then
        Log('5 rows created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to create batchrows', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to create batchrows', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
    Rows.Free;
  end;
end;

procedure TAmazonPopulator.DeleteColumn(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Row: TCloudTableRow;
  RowId: String;
  Columns: TStringList;
  Count: Integer;
begin
  ResponseList := nil;
  Columns := nil;
  Row := nil;

  try
    try
      ResponseList := FTableService.GetRows(TableName, 1);

      if (ResponseList <> nil) and (ResponseList.Count > 0) then
      begin
        Row := ResponseList[0];

        //the first column is the 'ItemName()' column. It is a fake column.
        if Row.GetColumnValue('itemName()', RowId) then
        begin
          Columns := TStringList.Create;

          Count := Row.Columns.Count;
          Columns.Add(Row.Columns.Items[1].Name);

          if Count > 2 then
            Columns.Values[Row.Columns.Items[2].Name] := Row.Columns.Items[2].Value;

          if FTableService.DeleteColumns(TableName, RowId, Columns) then
            Log(' Column deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
          else
            Log('Error trying to delete column', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
        end;
      end
      else
        Log('Error trying to delete column', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to delete column', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
    Columns.Free;
    Row.Free;
  end;
end;

procedure TAmazonPopulator.DeleteRow(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Row: TCloudTableRow;
  RowId: String;
begin
  ResponseList := nil;
  Row := nil;

  try
    try
      ResponseList := FTableService.GetRows(TableName);

      if (ResponseList <> nil) and (ResponseList.Count > 0) then
      begin
        Row := ResponseList.Last;

        //the first column is the 'ItemName()' column. It is a fake column.
        if Row.GetColumnValue('itemName()', RowId) then
        begin
          if FTableService.DeleteColumns(TableName, RowId, nil) then
            Log('Columns deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
          else
            Log('Error trying to delete row', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
        end;
      end
      else
        Log('Error trying to delete row', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to delete row', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
    Row.Free;
  end;
end;

procedure TAmazonPopulator.ListQueuesXML;
var
  Response: String;
begin
  try
    Response := FQueueService.ListQueuesXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
  except
    Log('Error tryint to get queues', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ListQueues;
var
  ResponseList: TList<TCloudQueue>;
  Item: TCloudQueue;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FQueueService.ListQueues;

      for Item in ResponseList do
        Msg := Msg + #13#10 + Format('%s  (URL: %s)', [Item.Name, Item.URL]);

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get queues', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.CreateQueue(const QueueName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
  QueueURL: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FQueueService.CreateQueue(QueueName, QueueURL, -1, ResponseInfo) then
        Log('Queue ' + QueueName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
      begin
        msg := ' Error tryint to create queue ' + QueueName + '.';
        if ResponseInfo.StatusCode = 204 then
          msg := msg + ' Queue already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
      end;
    except
      Log('Error tryint to create queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAmazonPopulator.DeleteQueue(const QueueName: String);
var
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      if FQueueService.DeleteQueue(QueueURL) then
        Log('Queue ' + QueueName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to delete queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to delete queue ' + QueueName + '. Queue does not exists', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to delete queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetQueueAttributesXML(const QueueName: String);
var
  ResponseXML: String;
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      FQueueService.GetQueueAttributes(QueueURL, [TAmazonQueueAttribute.aqaAll], ResponseXML, nil);
      Log(#13#10 + FormatXMLData(ResponseXML), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to get queue ' + QueueName + ' properties. Queue does not exists', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get queue ' + QueueName + ' properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

function GetQueueAttributeName(const Attribute: TAmazonQueueAttribute): string;
begin
  case Attribute of
    aqaAll:                                   Exit('All');
    aqaApproximateNumberOfMessages:           Exit('ApproximateNumberOfMessages');
    aqaApproximateNumberOfMessagesNotVisible: Exit('ApproximateNumberOfMessagesNotVisible');
    aqaVisibilityTimeout:                     Exit('VisibilityTimeout');
    aqaCreatedTimestamp:                      Exit('CreatedTimestamp');
    aqaLastModifiedTimestamp:                 Exit('LastModifiedTimestamp');
    aqaPolicy:                                Exit('Policy');
    aqaMaximumMessageSize:                    Exit('MaximumMessageSize');
    aqaMessageRetentionPeriod:                Exit('MessageRetentionPeriod');
    aqaQueueArn:                              Exit('QueueArn');
    aqaApproximateNumberOfMessagesDelayed:    Exit('ApproximateNumberOfMessagesDelayed');
    aqaDelaySeconds:                          Exit('DelaySeconds');
    aqaReceiveMessageWaitTimeSeconds:         Exit('ReceiveMessageWaitTimeSeconds');
    aqaRedrivePolicy:                         Exit('RedrivePolicy');
  end;
end;

procedure TAmazonPopulator.GetQueueAttributes(const QueueName: String);
var
  ResponseXML, ResponseText: string;
  ResponseList: TArray<TPair<TAmazonQueueAttribute, string>>;
  ResponseItem: TPair<TAmazonQueueAttribute, string>;
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      ResponseList := FQueueService.GetQueueAttributes(QueueURL, [TAmazonQueueAttribute.aqaAll], ResponseXML, nil);
      for ResponseItem in ResponseList do
        ResponseText := ResponseText + GetQueueAttributeName(ResponseItem.Key) + ': ' + ResponseItem.Value + #13#10;

      Log(#13#10 + ResponseText, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to get queue ' + QueueName + ' properties. Queue does not exists', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get queue ' + QueueName + ' properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.SetQueueAttributes(const QueueName: String);
var
  QueueURL: String;
  LPair: TPair<TAmazonQueueAttribute, string>;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      LPair.Key := TAmazonQueueAttribute.aqaMaximumMessageSize;
      LPair.Value := '32768';
      if FQueueService.SetQueueAttributes(QueueURL, [LPair], nil) then
        Log('Queue property set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set queue property', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to set queue property', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to set queue property', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.AddQueuePermissions(const QueueName: String);
var
  ResponseList: TArray<TPair<TAmazonQueueAttribute, string>>;
  Attr: TPair<TAmazonQueueAttribute, string>;
  ResponseXML: string;
  QueueURL, accountID: String;
  Perm1, Perm2: TAmazonQueuePermission;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      ResponseList := FQueueService.GetQueueAttributes(QueueURL, [TAmazonQueueAttribute.aqaAll], ResponseXML, nil);
      // Get account ID
      for Attr in ResponseList do
        if Attr.Key = TAmazonQueueAttribute.aqaQueueArn then
          accountID := SplitString(Attr.Value, ':')[4];

      Perm1 := TAmazonQueuePermission.Create(accountID, aqacSendMessage);
      Perm2 := TAmazonQueuePermission.Create(accountID, aqacAll);

      if FQueueService.AddPermission(QueueURL, 'testpermid', [Perm1, Perm2], nil) then
        Log('Queue permissions set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to set queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to set queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.RemovePermission(const QueueName: String);
var
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      if FQueueService.RemovePermission(QueueURL, 'testpermid', nil) then
        Log('Queue permissions removed succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to remove queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to remove queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to remove queue permissions', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.SendMessage(const QueueName, Msg: String);
var
  QueueURL: String;
  MessageId: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      if FQueueService.SendMessage(QueueURL, Msg, MessageID, nil) then
        Log('Queue message set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.SendMessageBatch(const QueueName, Msg: String);
var
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      if Length(FQueueService.SendMessageBatch(QueueURL, [Msg+'1', Msg+'2', Msg+'3'], nil)) = 3 then
        Log('Queue message set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end else
      Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.GetMessagesXML(const QueueName: String);
var
  ResponseXML: String;
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      FQueueService.ReceiveMessage(QueueURL, FQueueService.GetMaxMessageReturnCount, 10, ResponseXML, nil);
      Log(#13#10 + FormatXMLData(ResponseXML), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetMessages(const QueueName: String);
var
  QueueURL: String;
  ResponseList: TArray<TCloudQueueMessageItem>;
  ResponseXML: string;
  Item: TCloudQueueMessageItem;
  Msg: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      ResponseList := FQueueService.ReceiveMessage(QueueURL, FQueueService.GetMaxMessageReturnCount, 10, ResponseXML, nil);

      for Item in ResponseList do
        Msg := Msg + #13#10 + Item.MessageText;

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.PeekMessagesXML(const QueueName: String);
var
  ResponseXML: String;
  QueueURL: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      FQueueService.ReceiveMessage(QueueURL, FQueueService.GetMaxMessageReturnCount, 0, ResponseXML, nil);
      Log(#13#10 + FormatXMLData(ResponseXML), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.PeekMessages(const QueueName: String);
var
  QueueURL: String;
  ResponseList: TArray<TCloudQueueMessageItem>;
  ResponseXML: String;
  Item: TCloudQueueMessageItem;
  Msg: String;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      ResponseList := FQueueService.ReceiveMessage(QueueURL, FQueueService.GetMaxMessageReturnCount, 0, ResponseXML, nil);

      for Item in ResponseList do
        Msg := Msg + #13#10 + Item.MessageText;

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.DeleteMessage(const QueueName: String);
var
  QueueURL: String;
  Msg: TCloudQueueMessageItem;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      Msg := GetAmazonMessage(QueueURL);
      if not Msg.PopReceipt.Equals('') then
      begin
        if FQueueService.DeleteMessage(QueueURL, Msg.PopReceipt) then
          Log('Message ' + Msg.MessageText + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
      end
      else
        Log('No messages in queue', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to delete message', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to delete message', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.DeleteMessageBatch(const QueueName: String);
var
  QueueURL: String;
  QueueMessages: TArray<TCloudQueueMessageItem>;
  QueueMessage: TCloudQueueMessageItem;
  PopReceiptList: TArray<string>;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if not QueueURL.IsEmpty then
    begin
      QueueMessages := GetAmazonMessages(QueueURL);
      for QueueMessage in QueueMessages do
        PopReceiptList := PopReceiptList + [QueueMessage.PopReceipt];

      if Length(QueueMessages) > 0 then
      begin
        if FQueueService.DeleteMessageBatch(QueueURL, PopReceiptList, nil) then
          Log('Message deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
      end
      else
        Log('No messages in queue', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to delete message', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to delete message', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ChangeMessageVisibility(const QueueName: String);
var
  QueueURL: String;
  Msg: TCloudQueueMessageItem;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      Msg := GetAmazonMessage(QueueURL);
      if not Msg.PopReceipt.Equals('') then
      begin
        if FQueueService.ChangeMessageVisibility(QueueURL, Msg.PopReceipt, 0) then
          Log('Message ' + Msg.MessageText + ' visibility changed succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
      end
      else
        Log('No messages in queue', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to change message visibility', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to change message visibility', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ChangeMessageVisibilityBatch(const QueueName: String);
var
  QueueURL: String;
  QueueMessages: TArray<TCloudQueueMessageItem>;
  QueueMessage: TCloudQueueMessageItem;
  MessageInfoList: TArray<TPair<string, integer>>;
begin
  try
    QueueURL := GetAmazonQueueURL(QueueName);

    if QueueURL <> EmptyStr then
    begin
      QueueMessages := GetAmazonMessages(QueueURL);
      for QueueMessage in QueueMessages do
        MessageInfoList := MessageInfoList + [TPair<string, Integer>.Create(QueueMessage.PopReceipt, 100)];

      if Length(MessageInfoList) > 0 then
      begin
        if FQueueService.ChangeMessageVisibilityBatch(QueueURL, MessageInfoList, nil) then
          Log('Messages visibility changed succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
      end
      else
        Log('No messages in queue', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end else
      Log('Error trying to change message visibility', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to change message visibility', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ListBucketsXML;
var
  Response: String;
begin
  try
    Response := FStorageService.ListBucketsXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get buckets', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ListBuckets;
var
  ResponseList: TStrings;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FStorageService.ListBuckets;
      Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get buckets', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.CreateBucket(const BucketName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FStorageService.CreateBucket(BucketName, amzbaNotSpecified, amzrUSEast1, ResponseInfo) then
        Log('Bucket ' + BucketName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
      begin
        msg := ' Error creating bucket ' + BucketName + '.';
        if ResponseInfo.StatusCode = 409 then
          msg := msg + ' Bucket already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
      end;
    except
      Log('Error trying to create bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAmazonPopulator.DeleteBucket(const BucketName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FStorageService.DeleteBucket(BucketName, ResponseInfo) then
        Log('Bucket ' + BucketName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
      begin
        msg := ' Error deleting bucket ' + BucketName + '.';
        if ResponseInfo.StatusCode = 404 then
          msg := msg + ' Bucket not exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
      end;
    except
      Log('Error trying to delete bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAmazonPopulator.GetBucketXML(const BucketName: String; VersionInfo: Boolean);
var
  Response: String;
begin
  try
    if VersionInfo then
      Response := FStorageService.GetBucketObjectVersionsXML(BucketName, nil)
    else
      Response := FStorageService.GetBucketXML(BucketName, nil);

    if Response <> EmptyStr then
      Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Bucket not exists', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucket(const BucketName: String; VersionInfo: Boolean);
var
  Response: TAmazonBucketResult;
  Msg: String;
begin
  Response := nil;
  try
    try
      if VersionInfo then
        Response := FStorageService.GetBucketObjectVersions(BucketName, nil)
      else
        Response := FStorageService.GetBucket(BucketName, nil);

      if Response <> nil then
      begin
        Msg := Msg + 'Name=' + Response.Name + #13#10;
        Msg := Msg + 'Prefix=' + Response.Prefixes.Text + #13#10;
        Msg := Msg + 'KeyMarker=' + Response.Marker + #13#10;
        if VersionInfo then
          Msg := Msg + 'VersionIDMarker=' + Response.VersionIdMarker + #13#10;
        Msg := Msg + 'MaxKeys=' + Response.RequestMaxKeys.ToString + #13#10;
        Msg := Msg + 'IsTruncated=' + Response.IsTruncated.ToString(TUseBoolStrs.True) + #13#10;
        Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      end
      else
        Log('Bucket not exists', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Response.Free;
  end;
end;

procedure TAmazonPopulator.SetBucketPolicy(const BucketName: String);
var
  Policy: TJSONObject;
  StatementObj: TJSONObject;
begin
  Policy := nil;

  try
    try
      Policy := TJSONObject.Create;
      Policy.AddPair('Version', '2012-10-17');
      Policy.AddPair('Id', GetRandomString(4) + '-bbbb-cccc-' + GetRandomString(4));

      StatementObj := TJSONObject.Create;
      StatementObj.AddPair('Effect', 'Allow');
      StatementObj.AddPair('Sid', '1');
      StatementObj.AddPair('Principal', TJSONObject.Create(TJSONPair.Create('AWS', UserPrincipal)));
      StatementObj.AddPair('Action', TJSONArray.Create(TJSONString.Create('s3:*')));
      StatementObj.AddPair('Resource', 'arn:aws:s3:::' + BucketName + '/*');

      Policy.AddPair('Statement', TJSONArray.Create(StatementObj));

      if FStorageService.SetBucketPolicy(BucketName, Policy, nil) then
        Log('Bucket ' + BucketName + ' policy sets succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set bucket policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to set bucket policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Policy.Free;
  end;
end;

procedure TAmazonPopulator.GetBucketPolicyJSON(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketPolicyJSON(BucketName);
    Log(#13#10 + Response, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketPolicy(const BucketName: String);
var
  Response: TJSONObject;
  I: Integer;
  Msg: String;
begin
  Response := nil;
  try
    try
      Response := FStorageService.GetBucketPolicy(BucketName);
      if Response <> nil then
      begin
        for I := 0 to Response.Count-1 do
          Msg := Msg + Response.Pairs[I].ToString + #13#10;

        Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      end else
        Log('Error trying to get bucket policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get bucket policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Response.Free;
  end;
end;

procedure TAmazonPopulator.DeleteBucketPolicy(const BucketName: String);
begin
  try
    if FStorageService.DeleteBucketPolicy(BucketName) then
      Log('Bucket ' + BucketName + ' policy deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to delete bucket ' + BucketName + ' policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to delete bucket ' + BucketName + ' policy', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.SetBucketACL(const BucketName: String);
var
  ACP: TAmazonAccessControlPolicy;
  Grant: TAmazonGrant;
begin
  ACP := nil;

  try
    try
      ACP := TAmazonAccessControlPolicy.Create(UserID, UserDisplayName, nil);
      Grant := TAmazonGrant.Create(amgpFullControl);
      Grant.GranteeID := UserID;
      Grant.GranteeDisplayName := UserDisplayName;
      ACP.Grants.Add(Grant);

      if FStorageService.SetBucketACL(BucketName, ACP, nil) then
        Log('Bucket ' + BucketName + ' ACL sets succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to set bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ACP.Free;
  end;
end;

procedure TAmazonPopulator.GetBucketACLXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketACLXML(BucketName, nil);

    if Response <> EmptyStr then
      Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to get bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to get bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketACL(const BucketName: String);
var
  Response: TList<TAmazonGrant>;
  Item: TAmazonGrant;
  Msg: String;
begin
  Response := nil;
  try
    try
      Response := FStorageService.GetBucketACL(BucketName);
      if Response <> nil then
      begin
        for Item in Response do
        begin
          case Item.GranteeType of
            agtCanonicalUser:
              Msg := Msg + Format('GRANTEE ID: %s' + #13#10 + 'GRANTEE DISPLAY NAME: %s' + #13#10 + 'PERMISSION: %s',
                                  [Item.GranteeID, Item.GranteeDisplayName, Item.PermissionString]);
            agtGroup:
              Msg := Msg + Format('URI: %s' + #13#10 + 'PERMISSION: %s', [Item.GranteeURI, Item.PermissionString]);
            agtCustomerByEmail:
              Msg := Msg + Format('Email: %s' + #13#10 + 'PERMISSION: %s', [Item.GranteeEmailAddress, Item.PermissionString]);
          end;
          Msg := Msg + #13#10;
        end;

        Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      end else
        Log('Error trying to get bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Response.Free;
  end;
end;

procedure TAmazonPopulator.SetBucketLogging(const BucketName: String);
var
  ResponseInfo: TCloudResponseInfo;
  LoggingInfo: TAmazonBucketLoggingInfo;
  GrantList: TList<TAmazonGrant>;
  Grant: TAmazonGrant;
  ACP: TAmazonAccessControlPolicy;
begin
  LoggingInfo := nil;
  GrantList := nil;
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      GrantList := TList<TAmazonGrant>.Create;
      Grant := TAmazonGrant.Create(amgpReadACP);
      Grant.GranteeURI := LOG_DELIVERY_GROUP;
      GrantList.Add(grant);

      Grant := TAmazonGrant.Create(amgpWrite);
      Grant.GranteeURI := LOG_DELIVERY_GROUP;
      GrantList.Add(Grant);

      ACP := TAmazonAccessControlPolicy.Create(UserID, UserDisplayName, GrantList);
      LoggingInfo := TAmazonBucketLoggingInfo.Create(BucketName, BucketName + 'prefixus/');

      FStorageService.SetBucketACL(BucketName, ACP, ResponseInfo);
      if FStorageService.SetBucketLogging(BucketName, LoggingInfo, ResponseInfo) then
        Log('Bucket ' + BucketName + ' logging enabled succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to set bucket ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseInfo.Free;
    LoggingInfo.Free;
    GrantList.Free;
  end;
end;

procedure TAmazonPopulator.GetBucketLoggingXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketLoggingXML(BucketName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket logging', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.SetBucketNotification(const BucketName: String);
var
  NotificationList: TList<TAmazonNotificationEvent>;
  Notification: TAmazonNotificationEvent;
begin
  NotificationList := nil;

  try
    try
      NotificationList := TList<TAmazonNotificationEvent>.Create;
      Notification := TAmazonNotificationEvent.Create('arn:aws:sns:us-east-1:215774939934:rowrmi-notificationtopic', 's3:ReducedRedundancyLostObject');
      NotificationList.Add(Notification);

      if FStorageService.SetBucketNotification(BucketName, NotificationList, nil) then
        Log('Bucket ' + BucketName + ' notification enabled succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set bucket notification', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to set bucket notification', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    NotificationList.Free;
  end;
end;

procedure TAmazonPopulator.GetBucketNotificationXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketNotificationXML(BucketName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket notification', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketNotification(const BucketName: String);
var
  ResponseList: TList<TAmazonNotificationEvent>;
  Event: TAmazonNotificationEvent;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FStorageService.GetBucketNotification(BucketName);

      if ResponseList <> nil then
      begin
        for Event In responseList do
          Msg := Msg + Event.Topic + #13#10;
      end;
      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to get bucket notification', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.SetBucketPayer(const BucketName: String);
begin
  try
    if FStorageService.SetBucketRequestPayment(BucketName, TAmazonPayer.ampRequester) then
      Log('Bucket ' + BucketName + ' payer set to requester succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to set bucket payer', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to set bucket payer', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketPayerXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetRequestPaymentXML(BucketName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket payer', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketPayer(const BucketName: String);
var
  Response: TAmazonPayer;
begin
  try
    Response := FStorageService.GetRequestPayment(BucketName);

    if Response = ampRequester then
      Log('Person who pays for bucket ' + BucketName + ': Requester', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else if Response = ampBucketOwner then
      Log('Person who pays for bucket ' + BucketName + ': BucketOwner', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Unable to load Payer information', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket payer', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.SetBucketVersioning(const BucketName: String);
begin
  try
    if FStorageService.SetBucketVersioning(BucketName, True) then
      Log('Bucket ' + BucketName + ' versioning enabled succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to set bucket versioning', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to set bucket versioning', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketVersioningXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketVersioningXML(BucketName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket versioning', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketVersioning(const BucketName: String);
begin
  try
    if FStorageService.GetBucketVersioning(BucketName) then
      Log('Bucket ' + BucketName + ' versioning enabled', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Bucket ' + BucketName + ' versioning disabled', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket versioning', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketLocationXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetBucketLocationXML(BucketName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket location', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketLocation(const BucketName: String);
var
  Response: String;
  Region: TAmazonRegion;
begin
  try
    Region := FStorageService.GetBucketLocation(BucketName);
    if SameText(Region, amzrNotSpecified) then Response := 'US Standard'
    else if SameText(Region, amzrEUWest1) then Response := 'EU (Ireland)'
    else if SameText(Region, amzrEUWest2) then Response := 'EU (London)'
    else if SameText(Region, amzrEUWest3) then Response := 'EU (Paris)'
    else if SameText(Region, amzrEUCentral1) then Response := 'EU (Frankfurt)'
    else if SameText(Region, amzrUSEast1) then Response := 'US Standard'
    else if SameText(Region, amzrUSWest1) then Response := 'US West (N. California)'
    else if SameText(Region, amzrUSWest2) then Response := 'US West (Oregon)'
    else if SameText(Region, amzrAPSoutheast1) then Response := 'Asia Pacific (Singapore)'
    else if SameText(Region, amzrAPSoutheast2) then Response := 'Asia Pacific (Sydney)'
    else if SameText(Region, amzrAPNortheast1) then Response := 'Asia Pacific (Tokyo)'
    else if SameText(Region, amzrAPNortheast2) then Response := 'Asia Pacific (Seoul)'
    else if SameText(Region, amzrAPNortheast3) then Response := 'Asia Pacific (Osaka-Local)'
    else if SameText(Region, amzrSAEast1) then Response := 'South America (Sao Paulo)'
    else if SameText(Region, amzrUSClassic) then Response := 'US Standard'
    else if SameText(Region, amzrEU) then Response := 'EU (Ireland)'
    else if SameText(Region, amzrCNNorth1) then Response := 'China (Beijing)'
    else if SameText(Region, amzrCNNorthwest1) then Response := 'China (Ningxia)'
    else Response := Region;
    Log(Response, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon) ;
  except
    Log('Error trying to get bucket location', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ListMultipartUploadsXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.ListMultipartUploadsXML(BucketName, nil);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get bucket uploads', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.ListMultipartUploads(const BucketName: String);
var
  Response: TAmazonMultipartUploadsResult;
  Item: TAmazonMultipartUploadItem;
  Msg: String;
begin
  try
    Response := FStorageService.ListMultipartUploads(BucketName, nil);
    if Response <> nil then
    begin
      Msg := 'Bucket: ' + Response.Bucket + #13#10 +
             'KeyMarker: ' + Response.KeyMarker + #13#10 +
             'UploadIdMarker: ' + Response.UploadIdMarker + #13#10 +
             'NextKeyMarker: ' + Response.NextKeyMarker + #13#10 +
             'NextUploadIdMarker: ' + Response.NextUploadIdMarker + #13#10 +
             'MaxUploads: ' + Response.MaxUploads.ToString + #13#10 +
             'IsTruncated: ' + BoolToStr(Response.IsTruncated, True) + #13#10;

      for Item In Response.UploadItems do
        Msg := Msg + (Format('%s (%s)', [Item.Key, Item.UploadId])) + #13#10;
    end;
    Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon) ;
  except
    Log('Error trying to get bucket uploads', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetBucketLogging(const BucketName: String);
var
  Response: TAmazonBucketLoggingInfo;
begin
  Response := nil;

  try
    try
      Response := FStorageService.GetBucketLogging(BucketName);
      if Response <> nil then
      begin
        if Response.IsLoggingEnabled then
          Log('Bucket ' + BucketName + ' logging enabled', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
        else
          Log('Bucket ' + BucketName + ' logging disabled', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      end else
        Log('Error trying to get bucket logging', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to get bucket logging', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Response.Free;
  end;
end;

procedure TAmazonPopulator.UploadObject(const BucketName: String);
var
  Metadata: TStrings;
  Content: TBytes;
  ResponseInfo: TCloudResponseInfo;
  Msg: String;
begin
  Metadata := nil;
  ResponseInfo := nil;

  try
    try
      Metadata := TStringList.Create;
      Metadata.Values['SomeMetaKey'] := 'some metadata value';
      Metadata.Values['SomeOtherMetaKey'] := 'some other metadata value';

      Content := TEncoding.UTF8.GetBytes('This is a string for test.');

      ResponseInfo := TCloudResponseInfo.Create;
      if FStorageService.UploadObject(BucketName, 'testobject', Content, false, nil, nil, amzbaPublicRead, ResponseInfo) then
        Log('Object testfile uploaded sucessfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
      begin
        Msg := 'Error trying to upload object testobject into bucket ' + BucketName;
        if ResponseInfo.StatusCode = 404 then
          Msg := Msg + ' The bucket does not exists';
        Log(Msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);;
      end;
    except
      Log('Error trying to upload object testobject into bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
    end;
  finally
    Metadata.Free;
    ResponseInfo.Free;
  end;
end;

procedure TAmazonPopulator.DeleteObjects(const BucketName: String);
begin
  try
    if FStorageService.DeleteObject(BucketName, 'testobject') and FStorageService.DeleteObject(BucketName, 'testobjectcopy') then
      Log('objects deleted sucessfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to delete objects into bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  except
    Log('Error trying to delete objects into bucket ' + BucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon);
  end;
end;

procedure TAmazonPopulator.GetObject(const BucketName: String; const FileName: String; OpenMode: Integer);
var
  stream: TFileStream;
begin
  stream := nil;

  try
    try
      stream := TFileStream.Create(FileName, OpenMode);
      if FStorageService.GetObject(BucketName, 'testobject', stream) then
        Log('Object testobject downloaded succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to download object testobject', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to download object testobject', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    stream.Free;
  end;
end;

procedure TAmazonPopulator.GetObjectACLXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.GetObjectACLXML(BucketName, 'testobject');
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get object ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.GetObjectACL(const BucketName: String);
var
  ResponseList: TList<TAmazonGrant>;
  Item: TAmazonGrant;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FStorageService.GetObjectACL(BucketName, 'testobject');

      if ResponseList <> nil then
      begin
        for Item in ResponseList do
        begin
          case Item.GranteeType of
            agtCanonicalUser:
              Msg := Msg + Format('GRANTEE ID: %s' + #13#10 + 'GRANTEE DISPLAY NAME: %s' + #13#10 + 'PERMISSION: %s',
                                  [Item.GranteeID, Item.GranteeDisplayName, Item.PermissionString]);
            agtGroup:
              Msg := Msg + Format('URI: %s' + #13#10 + 'PERMISSION: %s', [Item.GranteeURI, Item.PermissionString]);
            agtCustomerByEmail:
              Msg := Msg + Format('Email: %s' + #13#10 + 'PERMISSION: %s', [Item.GranteeEmailAddress, Item.PermissionString]);
          end;
          Msg := Msg + #13#10;
        end;
      end;
      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to get object ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.SetObjectACL(const BucketName: String);
begin
  try
    if FStorageService.SetObjectACL(BucketName, 'testobject', TAmazonACLType.amzbaPublicReadWrite) then
      Log('Object testobject ACL changed succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to set object testobject ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to set object testobject ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.GetObjectTorrent(const BucketName: String; const FileName: String; OpenMode: Integer);
var
  stream: TFileStream;
begin
  stream := nil;

  try
    try
      stream := TFileStream.Create(FileName, OpenMode);
      if FStorageService.GetObjectTorrent(BucketName, 'testobject', stream) then
        Log('Torrent object testobject downloaded succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to download torrent object testobject', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to download torrent object testobject', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    stream.Free;
  end;
end;

procedure TAmazonPopulator.GetObjectMetadata(const BucketName: String);
var
  ResponseList: TStrings;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FStorageService.GetObjectMetadata(BucketName, 'testobject');
      Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to get object testobject metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAmazonPopulator.SetObjectMetadata(const BucketName: String);
var
  Metadata: TStrings;
begin
  Metadata := nil;

  try
    try
      Metadata := TStringList.Create;
      Metadata.Values['SomeMetaKey'] := 'some metadata value';
      Metadata.Values['SomeOtherMetaKey'] := 'some other metadata value';
      Metadata.Values['MetadataUpdateTime'] := FormatDateTime('yyyy-mm-dd hh:nn:ss', TTimeZone.Local.ToUniversalTime(Now),
                                                              TFormatSettings.Create('en-US'));

      if FStorageService.SetObjectMetadata(BucketName, 'testobject', Metadata) then
        Log('Object testobject metadata changed succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to set object testobject metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to set object testobject metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    Metadata.Free;
  end;
end;

procedure TAmazonPopulator.CopyObject(const BucketName: String);
begin
  try
    if FStorageService.CopyObject(BucketName, 'testobjectcopy', BucketName, 'testobject') then
      Log('Object testobject copied succesfully into object testobjectcopy', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to copy object testobject ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to copy object testobject ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.InitiateMultipartUploadXML(const BucketName: String);
var
  Metadata: TStrings;
  Response: String;
begin
  Metadata := nil;

  try
    try
      Metadata := TStringList.Create;
      Metadata.Values['Description'] := 'Multipart upload test result';

      Response := FStorageService.InitiateMultipartUploadXML(BucketName, 'testobject', Metadata);
      Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon);
    except
      Log('Error trying to start multipart upload', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    Metadata.Free;
  end;
end;

procedure TAmazonPopulator.InitiateMultipartUpload(const BucketName: String);
var
  Metadata: TStrings;
  Response: String;
begin
  Metadata := nil;

  try
    try
      Metadata := TStringList.Create;
      Metadata.Values['Description'] := 'Multipart upload test result';

      Response := FStorageService.InitiateMultipartUpload(BucketName, 'testobject', Metadata);
      if Response <> EmptyStr then
        Log('Upload ID: ' + Response, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to start multipart upload', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to start multipart upload', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    Metadata.Free;
  end;
end;

procedure TAmazonPopulator.UploadPart(const BucketName: String; const UploadID: String);
var
  Content: TBytes;
  LastUploadedPart: TAmazonMultipartPart;
begin
  try
    Content := TEncoding.UTF8.GetBytes('This is a upload part.');

    if FStorageService.UploadPart(BucketName, 'testobject', UploadId, 1, Content, LastUploadedPart) then
      Log('Part uploaded into testoject sucessfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to upload part for object testobject into bucket ' + bucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to upload part for object testobject into bucket ' + bucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.CompleteMultipartUpload(const BucketName: String; const UploadID: String);
var
  Content: TBytes;
  Parts: TList<TAmazonMultipartPart>;
  LastUploadedPart: TAmazonMultipartPart;
begin
  Parts := nil;

  try
    try
      Content := TEncoding.UTF8.GetBytes('This is a upload part.');

      FStorageService.UploadPart(BucketName, 'testobject', UploadId, 1, Content, LastUploadedPart);
      Parts := TList<TAmazonMultipartPart>.Create;
      Parts.Add(LastUploadedPart);

      if FStorageService.CompleteMultipartUpload(BucketName, 'testobject', UploadId, Parts) then
        Log('Part uploaded into testoject sucessfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
      else
        Log('Error trying to upload part for object testobject into bucket ' + bucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to upload part for object testobject into bucket ' + bucketName, TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    Parts.Free;
  end;
end;

procedure TAmazonPopulator.AbortMultipartUpload(const BucketName: String; const UploadID: String);
begin
  try
    if FStorageService.AbortMultipartUpload(BucketName, 'testobject', UploadId) then
      Log('Part upload aborted sucessfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    else
      Log('Error trying to abourt upload part', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to abourt upload part', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.ListPartsXML(const BucketName: String);
var
  Response: String;
begin
  try
    Response := FStorageService.ListMultipartUploadsXML(BucketName, nil);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
  except
    Log('Error trying to get upload parts', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
  end;
end;

procedure TAmazonPopulator.ListParts(const BucketName: String);
var
  ResponseList: TAmazonMultipartUploadsResult;
  Item: TAmazonMultipartUploadItem;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FStorageService.ListMultipartUploads(BucketName, nil);

      Msg := #13#10;
      for Item in ResponseList.UploadItems do
        Msg := Msg + 'UploadID: ' + Item.UploadId + #13#10;

      Log(Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAmazon)
    except
      Log('Error trying to get multipart uploads', TCloudLoggerType.cltError, TCloudConnectionType.cctAmazon)
    end;
  finally
    ResponseList.Free;
  end;
end;

function TAmazonPopulator.GetCloudType: TCloudConnectionType;
begin
  Result := cctAmazon;
end;

{ TAzurePopulator }

constructor TAzurePopulator.Create(Conn: TAzureConnectionInfo);
begin
  FConnection := Conn;
  FTableService := TAzureTableService.Create(Conn);
  FQueueService := TAzureQueueService.Create(Conn);
  FBlobService := TAzureBlobService.Create(Conn);
end;

destructor TAzurePopulator.Destroy;
begin
  FTableService.Free;
  FQueueService.Free;
  FBlobService.Free;

  inherited;
end;

procedure TAzurePopulator.QueryTables;
var
  ResponseList: TStrings;
begin
  ResponseList := FTableService.QueryTables;
  try
    try
      Log(#13#10 + ResponseList.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
    except
      Log('Error trying to get tables', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.QueryTablesXML;
var
  Response: String;
begin
  try
    Response := FTableService.QueryTablesXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get tables', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.CreateTable(const TableName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := TCloudResponseInfo.Create;
  try
    try
      if FTableService.CreateTable(TableName, ResponseInfo) then
        Log('Table ' + TableName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error creating table ' + TableName + '.';
        if ResponseInfo.StatusCode = 409 then
          msg := msg + ' Table already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to create table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.DeleteTable(const TableName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := TCloudResponseInfo.Create;
  try
    try
      if FTableService.DeleteTable(TableName, ResponseInfo) then
        Log('Table ' + TableName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := 'Error deleting table ' + TableName + '.';
        if ResponseInfo.StatusCode = 404 then
          msg := msg + ' Table does not exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to delete table ' + TableName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.QueryEntities(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Msg, ALine: String;
  I, Count: Integer;
  Row: TCloudTableRow;
  columnList: TList<TCloudTableColumn>;
  Z, ZCount: Integer;
  Col: TCloudTableColumn;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FTableService.QueryEntities(TableName);
      if ResponseList <> nil then
      begin
        Count := responseList.Count;
        for I := 0 to Count - 1 do
        begin
          Row := responseList[I];
          columnList := Row.Columns;

          ALine := EmptyStr;

          ZCount := columnList.Count;
          for Z := 0 to ZCount - 1 do
          begin
            Col := columnList[Z];
            ALine := Format('%s(%s:%s) ', [ALine, Col.Name, Col.Value]);
          end;

          Row.Free;
          Msg := Msg + ALine + #13#10;
        end;
      end;
      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
    except
      Log('Error trying to get rowlist', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.QueryEntitiesXML(const TableName: String);
var
  Response: String;
begin
  try
    Response := FTableService.QueryEntitiesXML(TableName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get rowlist', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.InsertEntity(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
  Count: String;
begin
  ResponseList := nil;
  Entity := nil;

  try
    try
      ResponseList := FTableService.QueryEntities(TableName);
      if ResponseList <> nil then
        Count := IntToStr(ResponseList.Count + 1)
      else
        Count := '1';

      Entity := TCloudTableRow.Create;
      Entity.SetColumn('PartitionKey', 'added' + Count);
      Entity.SetColumn('RowKey', 'banana' + Count);
      Entity.SetColumn('SomeOtherColumn', 'any value ' + Count);
      Entity.SetColumn('DataTypeTest', Count + '.0', 'Edm.Double');

      if FTableService.InsertEntity(TableName, Entity) then
        Log('Row ' + Count + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to create row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to create row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
  end;
end;

procedure TAzurePopulator.UpdateEntity(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
begin
  ResponseList := nil;
  Entity := nil;

  try
    try
      ResponseList := FTableService.QueryEntities(TableName);
      if (ResponseList = nil) or (ResponseList.Count = 0) then
      begin
        Log('First create a row to update', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
        exit;
      end;

      Entity := TCloudTableRow.Create;
      Entity.SetColumn('PartitionKey', 'added1');
      Entity.SetColumn('RowKey', 'banana1');
      Entity.SetColumn('DataTypeTest', '1.1', 'Edm.Double');

      if FTableService.UpdateEntity(TableName, Entity) then
        Log('Row 1 updated succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to update row 1', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to update row 1', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
  end;
end;

procedure TAzurePopulator.MergeEntity(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
begin
  ResponseList := nil;
  Entity := nil;

  try
    try
      ResponseList := FTableService.QueryEntities(TableName);
      if (ResponseList = nil) or (ResponseList.Count = 0) then
      begin
        Log('First create a row to merge', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
        exit;
      end;

      Entity := TCloudTableRow.Create;
      Entity.SetColumn('PartitionKey', 'added1');
      Entity.SetColumn('RowKey', 'banana1');
      Entity.SetColumn('DataTypeTest2', '1.2', 'Edm.Double');

      if FTableService.MergeEntity(TableName, Entity) then
        Log('Row 1 merged succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to merge row 1', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to merge row 1', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
  end;
end;

procedure TAzurePopulator.DeleteEntity(const TableName: String);
var
  ResponseList: TList<TCloudTableRow>;
  Entity: TCloudTableRow;
  Count: String;
begin
  ResponseList := nil;
  Entity := nil;

  try
    try
      ResponseList := FTableService.QueryEntities(TableName);
      if (ResponseList = nil) or (ResponseList.Count = 0) then
      begin
        Log(' First create a row to delete', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
        exit;
      end;

      Count := ResponseList.Count.ToString;

      Entity := TCloudTableRow.Create;
      Entity.SetColumn('PartitionKey', 'added' + Count);
      Entity.SetColumn('RowKey', 'banana' + Count);

      if FTableService.DeleteEntity(TableName, Entity) then
        Log(' Row ' + Count + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to delete row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to delete row ' + Count, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
    Entity.Free;
  end;
end;

procedure TAzurePopulator.ListQueuesXML;
var
  Response: String;
begin
  try
    Response := FQueueService.ListQueuesXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get queues', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.ListQueues;
var
  ResponseList: TList<TCloudQueue>;
  Item: TCloudQueue;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FQueueService.ListQueues;

      for Item in ResponseList do
        Msg := Msg + #13#10 + Format('%s  (URL: %s)', [Item.Name, Item.URL]);

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
    except
      Log('Error trying to get queues', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.CreateQueue(const QueueName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FQueueService.CreateQueue(QueueName, nil, ResponseInfo) then
        Log('Queue ' + QueueName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error creating queue ' + QueueName + '.';
        if ResponseInfo.StatusCode = 204 then
          msg := msg + ' Queue already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log(' Error trying to create queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.DeleteQueue(const QueueName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;
  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FQueueService.DeleteQueue(QueueName, ResponseInfo) then
        Log('Queue ' + QueueName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := 'Error deleting queue ' + QueueName + '.';
        if ResponseInfo.StatusCode = 404 then
          msg := msg + ' Queue does not exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to delete queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.GetQueueMetadata(const QueueName: String);
var
  ResponseInfo: TCloudResponseInfo;
  MetaData: TStrings;
begin
  ResponseInfo := nil;
  Metadata := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FQueueService.GetQueueMetadata(QueueName, Metadata, ResponseInfo) then
        Log(#13#10 + Metadata.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to get metadata on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to get metadata on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseInfo.Free;
    Metadata.Free;
  end;
end;

procedure TAzurePopulator.SetQueueMetadata(const QueueName: String);
var
  ResponseInfo: TCloudResponseInfo;
  MetaData: TStrings;
begin
  ResponseInfo := nil;
  Metadata := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;
      MetaData := TStringList.Create;
      MetaData.Values['SomeNewMetaData'] := 'InsertionOfMetaDataworked';

      if FQueueService.SetQueueMetadata(QueueName, Metadata, ResponseInfo) then
        Log('Queue metadata set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to set metadata on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to set metadata on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseInfo.Free;
    Metadata.Free;
  end;
end;

procedure TAzurePopulator.AddMessage(const QueueName, Msg: String);
begin
  try
    if FQueueService.AddMessage(QueueName, Msg) then
      Log('Queue message set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to set message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetMessagesXML(const QueueName: String);
var
  Response: String;
begin
  try
    Response := FQueueService.GetMessagesXML(QueueName, FQueueService.GetMaxMessageReturnCount, 5);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.GetMessages(const QueueName: String);
var
  ResponseList: TList<TCloudQueueMessage>;
  Item: TCloudQueueMessage;
  Msg: String;
begin
  try
    ResponseList := FQueueService.GetMessages(QueueName, FQueueService.GetMaxMessageReturnCount, 5);

    if ResponseList <> nil then
      for Item in ResponseList do
        Msg := Msg + #13#10 + Item.MessageText;

    Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.PeekMessagesXML(const QueueName: String);
var
  Response: String;
begin
  try
    Response := FQueueService.PeekMessagesXML(QueueName, FQueueService.GetMaxMessageReturnCount);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.PeekMessages(const QueueName: String);
var
  ResponseList: TList<TCloudQueueMessage>;
  Item: TCloudQueueMessage;
  Msg: String;
begin
  try
    ResponseList := FQueueService.PeekMessages(QueueName, FQueueService.GetMaxMessageReturnCount);

    if ResponseList <> nil then
      for Item in ResponseList do
        Msg := Msg + #13#10 + Item.MessageText;

    Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get messages', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.DeleteMessage(const QueueName: String);
var
  ResponseList: TList<TCloudQueueMessage>;
begin
  try
    ResponseList := FQueueService.PeekMessages(QueueName, 1);

    if ResponseList = nil then
    begin
      Log('Failed to load message to delete', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
      Exit;
    end;

    if FQueueService.DeleteMessage(QueueName, ResponseList[0]) then
      Log('Queue message deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error deleting message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error deleting message on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.ClearMessages(const QueueName: String);
begin
  try
    if FQueueService.ClearMessages(QueueName) then
      Log('Queue messages cleared succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to delete messages on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to delete messages on queue ' + QueueName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.ListContainersXML;
var
  Response: String;
begin
  try
    Response := FBlobService.ListContainersXML;
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get containers', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.ListContainers;
var
  ResponseList: TList<TAzureContainer>;
  Item: TAzureContainer;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.ListContainers;

      for Item in ResponseList do
        Msg := Msg + #13#10 + Item.Name;

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
    except
      Log('Error trying to get containers', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.CreateRootContainer;
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FBlobService.CreateRootContainer then
        Log('Root container created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error creating root container.';
        if ResponseInfo.StatusCode = 0 then
          msg := msg + ' Container already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to create root container', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.CreateContainer(const ContainerName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FBlobService.CreateContainer(ContainerName, nil, TBlobPublicAccess.bpaContainer, ResponseInfo) then
        Log('Container ' + ContainerName + ' created succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error creating container ' + ContainerName + '.';
        if ResponseInfo.StatusCode = 409 then
          msg := msg + ' Container already exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to create container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.DeleteRootContainer;
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FBlobService.DeleteRootContainer(ResponseInfo) then
        Log('Root container deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error deleting root container.';
        if ResponseInfo.StatusCode = 0 then
          msg := msg + ' Container not exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to delete root container', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.DeleteContainer(const ContainerName: String);
var
  ResponseInfo: TCloudResponseInfo;
  msg: String;
begin
  ResponseInfo := nil;

  try
    try
      ResponseInfo := TCloudResponseInfo.Create;

      if FBlobService.DeleteContainer(ContainerName, ResponseInfo) then
        Log('Container ' + ContainerName + ' deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
      begin
        msg := ' Error deleting container ' + ContainerName + '.';
        if ResponseInfo.StatusCode = 409 then
          msg := msg + ' Container not exists';
        Log(msg, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to delete container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseInfo.Free;
  end;
end;

procedure TAzurePopulator.GetContainerProperties(const ContainerName: String);
var
  Properties: TStrings;
begin
  try
    if FBlobService.GetContainerProperties(ContainerName, Properties) then
      Log(#13#10 + Properties.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to get properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.SetContainerMetadata(const ContainerName: String);
var
  MetaData: TStrings;
begin
  Metadata := nil;

  try
    try
      MetaData := TStringList.Create;
      Metadata.Values['somenewvalue'] := 'value of some new value';

      if FBlobService.SetContainerMetadata(ContainerName, Metadata) then
        Log('Container metadata set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to set metadata on container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to set metadata on container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    Metadata.Free;
  end;
end;

procedure TAzurePopulator.GetContainerMetadata(const ContainerName: String);
var
  Metadata: TStrings;
begin
  try
    if FBlobService.GetContainerMetadata(ContainerName, Metadata) then
      Log(#13#10 + Metadata.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to get metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetContainerACLXML(const ContainerName: String);
var
  PublicAccess: TBlobPublicAccess;
  Response: String;
begin
  try
    Response := FBlobService.GetContainerACLXML(ContainerName, PublicAccess);
    Response := 'PUBLIC ACCESS: ' + GetEnumName(TypeInfo(TBlobPublicAccess), integer(PublicAccess)) + #13#10 + FormatXMLData(Response);
    Log(#13#10 + Response, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetContainerACL(const ContainerName: String);
var
  PublicAccess: TBlobPublicAccess;
  ResponseList: TList<TSignedIdentifier>;
  Item: TSignedIdentifier;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.GetContainerACL(ContainerName, PublicAccess);
      Msg := 'PUBLIC ACCESS: ' + GetEnumName(TypeInfo(TBlobPublicAccess), integer(PublicAccess));

      if ResponseList <> nil then
      begin
        for Item in ResponseList do
        begin
          Msg := Msg + #13#10 + FormatXMLData(Item.AccessPolicy.AsXML);
          Item.Free;
        end;
      end;
      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to get ACL', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.SetContainerACL(const ContainerName: String);
var
  aclList: TList<TSignedIdentifier>;
  sid: TSignedIdentifier;
begin
  aclList := nil;

  try
    try
      aclList := TList<TSignedIdentifier>.Create;

      sid := TSignedIdentifier.Create(ContainerName);
      sid.Id := 'AHyReTyUxDfGhUp';
      sid.AccessPolicy.Expiry := '2010-12-23';
      sid.AccessPolicy.SetPermission('rl');
      aclList.Add(sid);

      sid := TSignedIdentifier.Create(ContainerName);
      sid.Id := 'pUhGfDxUyTeRyHA';
      sid.AccessPolicy.Start := '2010-12-24';
      sid.AccessPolicy.Expiry := '2010-12-27';
      sid.AccessPolicy.SetPermission('rwd');
      aclList.Add(sid);

      sid := TSignedIdentifier.Create(ContainerName);
      sid.Id := 'pUhGfDxUyTeRyHABB';
      sid.AccessPolicy.Start := '2010-12-28';
      sid.AccessPolicy.Expiry := '2010-12-29';
      sid.AccessPolicy.SetPermission('rwdl');
      aclList.Add(sid);

      if FBlobService.SetContainerACL(ContainerName, aclList, TBlobPublicAccess.bpaBlob, nil) then
        Log('Container ACL set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to set ACL on container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to set ACL on container ' + ContainerName, TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    for sid in aclList do
      sid.Free;
    aclList.Free;
  end;
end;

procedure TAzurePopulator.ListBlobsXML(const ContainerName: String);
var
  Response: String;
begin
  try
    Response := FBlobService.ListBlobsXML(ContainerName);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get bloblist', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.ListBlobs(const ContainerName: String);
var
  ResponseList: TList<TAzureBlob>;
  Item: TAzureBlob;
  Msg: String;
  TypeName: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.ListBlobs(ContainerName);

      for Item in ResponseList do
      begin
        TypeName := GetEnumName(TypeInfo(TAzureBlobType), integer(Item.BlobType));
        Msg := Msg + Format('%s (%s)', [Item.Name, TypeName]) + #13#10;
        Item.Free;
      end;

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure);
    except
      Log('Error trying to get bloblist', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.PutBlobBlock(const ContainerName, FileName: String);
var
  Content: TBytes;
begin
  try
    Content := ContentOf(FileName);

    if FBlobService.PutBlockBlob(ContainerName, 'testblockblob', Content) then
      Log('Block blob set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to set block blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to set block blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.PutPageBlock(const ContainerName: String);
begin
  try
    if FBlobService.PutPageBlob(ContainerName, 'testpageblob', 1024) then
      Log('Page blob set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to set page blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to set page blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.AcquireBlobLease(const ContainerName: String);
var
  LeaseId: String;
begin
  try
    if FBlobService.AcquireBlobLease(ContainerName, 'testblockblob', LeaseId, nil, 15) then
      Log('Lease ' + LeaseId + ' get succesfully on blob testblockblob for 15 seconds', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to get blob lease. Be sure that testblockblob exists.', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  except
    Log('Error trying to get blob lease. Be sure that testblockblob exists.', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure);
  end;
end;

procedure TAzurePopulator.SetBlobMetadata(const ContainerName: String);
var
  MetaData: TStrings;
begin
  Metadata := nil;

  try
    try
      MetaData := TStringList.Create;
      Metadata.Values['somenewblobvalue'] := 'value of some new value';
      Metadata.Values['somenewblobvalue2'] := 'another new value';

      if FBlobService.SetBlobMetadata(ContainerName, 'testblockblob', Metadata) then
        Log('testblockblob metadata set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to set metadata on testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to set metadata on testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    Metadata.Free;
  end;
end;

procedure TAzurePopulator.GetBlobMetadata(const ContainerName: String);
var
  Metadata: TStrings;
begin
  try
    if FBlobService.GetBlobMetadata(ContainerName, 'testblockblob', Metadata) then
      Log(#13#10 + Metadata.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to get metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get metadata', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.SetBlobProperties(const ContainerName: String);
var
  Properties: TStrings;
begin
  Properties := nil;

  try
    try
      Properties := TStringList.Create;
      Properties.Values['Content-Type'] := 'application/xml';
      Properties.Values['x-ms-blob-cache-control'] := 'some value';

      if FBlobService.SetBlobProperties(ContainerName, 'testblockblob', Properties) then
        Log('testblockblob properties set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to set properties on testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to set properties on testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    Properties.Free;
  end;
end;

procedure TAzurePopulator.GetBlobProperties(const ContainerName: String);
var
  Properties: TStrings;
begin
  try
    if FBlobService.GetBlobProperties(ContainerName, 'testblockblob', Properties) then
      Log(#13#10 + Properties.Text, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to get properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get properties', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.DeleteBlob(const ContainerName: String);
begin
  try
    if FBlobService.DeleteBlob(ContainerName, 'testblockblob') then
      Log('Blob testblockblob deleted succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to delete blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to delete blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetBlob(const ContainerName: String; const FileName: String;OpenMode: Integer);
var
  stream: TFileStream;
begin
  stream := nil;

  try
    try
      stream := TFileStream.Create(FileName, OpenMode);
      if FBlobService.GetBlob(ContainerName, 'testblockblob', stream) then
        Log('Blob testblockblob downloaded succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
      else
        Log('Error trying to download blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to download blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    stream.Free;
  end;
end;

procedure TAzurePopulator.CopyBlob(const ContainerName: String);
begin
  try
    if FBlobService.CopyBlob(ContainerName, 'testblockblob-copy', ContainerName, 'testblockblob') then
      Log('Blob testblockblob copied succesfully on testblockblob-copy', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to copy blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to copy blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.SnapshotBlob(const ContainerName: String);
var
  Snapshot: String;
begin
  try
    if FBlobService.SnapshotBlob(ContainerName, 'testblockblob', Snapshot) then
      Log(Snapshot, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to create testblockblob snapshot', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to create testblockblob snapshot', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.PutBlock(const ContainerName, FileName: String);
var
  Content: TBytes;
  BlockId: String;
begin
  try
    BlockId := TNetEncoding.Base64.Encode(GetRandomString(20));     //Encode64
    Content := ContentOf(FileName);

    if FBlobService.PutBlock(ContainerName, 'testblockblob', BlockId, Content) then
      Log('Block blob set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to set block blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to set block blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.PutPage(const ContainerName, FileName: String);
var
  Content: TBytes;
  BlockId: String;
begin
  try
    BlockId := TNetEncoding.Base64.Encode(GetRandomString(20));     //Encode64
    Content := ContentOf(FileName);

    if FBlobService.PutPage(ContainerName, 'testpageblob', Content, 0) then
      Log('Page blob set succesfully', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    else
      Log('Error trying to set page blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to set page blob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetBlockListXML(const ContainerName: String);
var
  Response: String;
begin
  try
    Response := FBlobService.GetBlockListXML(ContainerName, 'testblockblob', aqbtAll);
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get blocklist', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetBlockList(const ContainerName: String);
var
  ResponseList: TList<TAzureBlockListItem>;
  Item: TAzureBlockListItem;
  TypeName, Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.GetBlockList(ContainerName, 'testblockblob', aqbtAll);

      if ResponseList <> nil then
      begin
        for Item In ResponseList do
        begin
          TypeName := GetEnumName(TypeInfo(TAzureBlockType), integer(Item.BlockType));
          Msg := Msg + Format('(%s) %s', [TypeName, Item.BlockId]) + #13#10;
        end;
      end;
      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to get blocklist on blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.PutBlockList(const ContainerName: String);
var
  ResponseList: TList<TAzureBlockListItem>;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.GetBlockList(ContainerName, 'testblockblob', aqbtAll);

      if ResponseList <> nil then
      begin
        if FBlobService.PutBlockList(ContainerName, 'testblockblob', ResponseList) then
          Log('Blocklist set succesfully on blob testblockblob', TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
        else
          Log('Error trying to set blocklist on blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
      end;
    except
      Log('Error trying to set blocklist on blob testblockblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
  end;
end;

procedure TAzurePopulator.GetPageRegionsXML(const ContainerName: String);
var
  Response: String;
begin
  try
    Response := FBlobService.GetPageRegionsXML(ContainerName, 'testpageblob');
    Log(#13#10 + FormatXMLData(Response), TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
  except
    Log('Error trying to get page regions on testpageblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
  end;
end;

procedure TAzurePopulator.GetPageRegions(const ContainerName: String);
var
  ResponseList: TList<TAzureBlobPageRange>;
  Item: TAzureBlobPageRange;
  Msg: String;
begin
  ResponseList := nil;

  try
    try
      ResponseList := FBlobService.GetPageRegions(ContainerName, 'testpageblob');

      if ResponseList <> nil then
        for Item In ResponseList do
          Msg := Msg + Format('Start Page: %d - Page Count: %d', [Item.GetStartPage, Item.GetPageCount]);

      Log(#13#10 + Msg, TCloudLoggerType.cltInfo, TCloudConnectionType.cctAzure)
    except
      Log('Error trying to get page regions on testpageblob', TCloudLoggerType.cltError, TCloudConnectionType.cctAzure)
    end;
  finally
    ResponseList.Free;
  end;
end;

function TAzurePopulator.GetCloudType: TCloudConnectionType;
begin
  Result := cctAzure;
end;

end.




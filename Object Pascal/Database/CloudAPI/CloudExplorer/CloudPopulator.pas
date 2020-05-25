//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable, 
// as such term is defined thereunder. Your use of this software constitutes 
// your acknowledgement of your agreement to the foregoing software license 
// and support agreement. 
//---------------------------------------------------------------------------
unit CloudPopulator;

interface

uses
  SysUtils, Classes, Generics.Collections, Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI, Data.Cloud.AzureAPI;

type
  TCloudLoggerType = (cltError, cltInfo);

  TCloudLoggerHook = procedure(Msg: String; MsgType: TCloudLoggerType) of object;

  TCloudLogger = class
  private
    FHook: TCloudLoggerHook;
  public
    constructor Create(Hook: TCloudLoggerHook); virtual;
    property Hook: TCloudLoggerHook read FHook;
  end;

  TLocalFileType = (lftDrive, lftDirectory, lftFile);

  TCloudFileType = (cftBucket, cftContainer, cftFolder, cftFile);

  TCloudConnectionType = (cctAmazon, cctAzure);

  TCloudConnection = class
  private
    FCloudType: TCloudConnectionType;
    FDisplayName: String;
    FConnection: TCloudConnectionInfo;
    function GetAccountKey: String;
    function GetAccountName: String;
    function GetRegion: String;
  public
    constructor Create(const DisplayName, AccountName, AccountPass, Region: String;
                       CloudType: TCloudConnectionType); virtual;
    destructor Destroy; override;
    property CloudType: TCloudConnectionType read FCloudType;
    property DisplayName: String read FDisplayName;
    property AccountName: String read GetAccountName;
    property AccountKey: String read GetAccountKey;
    property Region: String read GetRegion;
    property Connection: TCloudConnectionInfo read FConnection;
  end;

  TLocalFile = record
    Path: String;
    Name: String;
    FileType: TLocalFileType;

    class function Create(const Name, Path: String; FileType: TLocalFileType): TLocalFile; static;
  end;

  TCloudFile = record
    Container: String;
    Path: String;
    Name: String;
    FileType: TCloudFileType;

    class function Create(const Name, Container, Path: String; FileType: TCloudFileType): TCloudFile; static;
  end;

  TCloudPopulator = class abstract
  protected
    FLogger: TCloudLogger;
    FConnectionId: String;
    function GetCloudType: TCloudConnectionType; virtual; abstract;
    procedure Log(Msg: String; MsgType: TCloudLoggerType);
  public
    procedure LoadRootFiles(var Files: TObjectDictionary<String,TCloudFile>); virtual; abstract;
    function GetPath: String; virtual; abstract;
    function GetContainer: String; virtual; abstract;
    procedure SetPath(Container, Path: String; var Files: TObjectDictionary<String,TCloudFile>); virtual; abstract;
    procedure GetCurrentFiles(var Files: TObjectDictionary<String,TCloudFile>); virtual; abstract;
    function UploadFile(LocalFile: TLocalFile; BasePath: String = ''): Boolean; virtual; abstract;
    function DeleteFile(CloudFile: TCloudFile): Boolean; virtual; abstract;
    function DownloadFile(CloudFile: TCloudFile; Directory: String): Boolean; virtual; abstract;
    function CreateContainer(ContainerName: String): Boolean; virtual; abstract;

    property CloudType: TCloudConnectionType read GetCloudType;
    property Logger: TCloudLogger read FLogger write FLogger;
    property ConnectionId: String read FConnectionId write FConnectionId;
  end;

  TAmazonPopulator = class(TCloudPopulator)
  private
    FPath: String;
    FContainer: String;
    FConnection: TAmazonConnectionInfo;
    FService: TAmazonStorageService;
    procedure GetFiles(Container, Path: String; var Files: TObjectDictionary<String,TCloudFile>; Flatten: Boolean = false);
  protected
    function GetCloudType: TCloudConnectionType; override;
  public
    constructor Create(Conn: TAmazonConnectionInfo);
    destructor Destroy; override;

    procedure LoadRootFiles(var Files: TObjectDictionary<String,TCloudFile>); override;
    function GetPath: String; override;
    function GetContainer: String; override;
    procedure SetPath(Container, Path: String; var Files: TObjectDictionary<String,TCloudFile>); override;
    procedure GetCurrentFiles(var Files: TObjectDictionary<String,TCloudFile>); override;
    function UploadFile(LocalFile: TLocalFile; BasePath: String = ''): Boolean; override;
    function DeleteFile(CloudFile: TCloudFile): Boolean; override;
    function DownloadFile(CloudFile: TCloudFile; Directory: String): Boolean; override;
    function CreateContainer(ContainerName: String): Boolean; override;
  end;

  TAzurePopulator = class(TCloudPopulator)
  private
    FPath: String;
    FContainer: String;
    FConnection: TAzureConnectionInfo;
    FService: TAzureBlobService;

    function GetContainerName(SpecifiedContainer: String): String;
    function IsInRootContainer: Boolean;
    procedure GetFiles(Container, Path: String; var Files: TObjectDictionary<String,TCloudFile>; Flatten: Boolean = false);
  protected
    function GetCloudType: TCloudConnectionType; override;
  public
    constructor Create(Conn: TAzureConnectionInfo);
    destructor Destroy; override;

    procedure LoadRootFiles(var Files: TObjectDictionary<String,TCloudFile>); override;
    function GetPath: String; override;
    function GetContainer: String; override;
    procedure SetPath(Container, Path: String; var Files: TObjectDictionary<String,TCloudFile>); override;
    procedure GetCurrentFiles(var Files: TObjectDictionary<String,TCloudFile>); override;
    function UploadFile(LocalFile: TLocalFile; BasePath: String = ''): Boolean; override;
    function DeleteFile(CloudFile: TCloudFile): Boolean; override;
    function DownloadFile(CloudFile: TCloudFile; Directory: String): Boolean; override;
    function CreateContainer(ContainerName: String): Boolean; override;
  end;

  TTransferJobStatus = (tjsWAITING, tjsRUNNING, tjsFINISHED);
  TTransferJobType = (tjtUPLOAD, tjtDOWNLOAD);

  TCloudTransferJob = class abstract(TThread)
  protected
    FLocalFilePath: String;
    FContainerName: String;
    FFileName: String;
    FJobType: TTransferJobType;
    FJobStatus: TTransferJobStatus;
  public
    property JobType: TTransferJobType read FJobType write FJobType;
    property FileName: String read FFileName write FFileName;
    property ContainerName: String read FContainerName write FContainerName;
    property LocalFilePath: String read FLocalFilePath write FLocalFilePath;
    property JobStatus: TTransferJobStatus read FJobStatus write FJobStatus;
  end;

  TAmazonTransferJob = class(TCloudTransferJob)
  private
    FService: TAmazonStorageService;
    FPopulator: TCloudPopulator;
  public
    constructor Create(Service: TAmazonStorageService; JobType: TTransferJobType;
                       FileName, ContainerName, LocalFilePath: String;
                       Populator: TCloudPopulator); virtual;
    destructor Destroy; override;
    procedure Execute; override;
  end;

  TAzureTransferJob = class(TCloudTransferJob)
  private
    FService: TAzureBlobService;
    FPopulator: TCloudPopulator;
  public
    constructor Create(Service: TAzureBlobService; JobType: TTransferJobType;
                       FileName, ContainerName, LocalFilePath: String;
                       Populator: TCloudPopulator); virtual;
    destructor Destroy; override;
    procedure Execute; override;
  end;

  TTransferJobUpdateListener = reference to procedure(Job: TCloudTransferJob);
  TTransferJobVisitor = reference to procedure(const Job: TCloudTransferJob);

  TCloudTransferManager = class
  private
    class var FInstance: TCloudTransferManager;
    FJobs: TList<TCloudTransferJob>;
    FListeners: TList<TTransferJobUpdateListener>;

    procedure NotifyListeners(Job: TCloudTransferJob);
    function GetSize: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    ///  <summary> Iterates over all jobs and invokes the TTransferJobVisitor for each.
    ///  </summary>
    procedure ForEachJob(AVisitor: TTransferJobVisitor);

    function AddJob(Job: TCloudTransferJob): boolean;

    procedure RemoveJob(Job: TCloudTransferJob);

    procedure AddListener(Listener: TTransferJobUpdateListener);
    procedure RemoveListener(Listener: TTransferJobUpdateListener);

    property Size: Integer read GetSize;

      ///  <summary> Returns the singleton instance of this class.</summary>
    class property Instance: TCloudTransferManager read FInstance;
  end;

  //returns a new instance of a populator, depending on connection type
  function GetPopulator(Conn: TCloudConnection): TCloudPopulator;

  function GetCloudTypeName(AType: TCloudConnectionType): String;
  function GetCloudTypeFromName(AType: String): TCloudConnectionType;

implementation

uses StrUtils;

function GetPopulator(Conn: TCloudConnection): TCloudPopulator;
begin
  Result := nil;

  if Conn = nil then
    Exit;

  if Conn.FCloudType = cctAmazon then
    Result := TAmazonPopulator.Create(TAmazonConnectionInfo(Conn.Connection))
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

procedure GetNestedLocalFiles(LocalFile: TLocalFile; var FileList: TList<TLocalFile>; Flatten: Boolean);
var
  SR: TSearchRec;
  IsFound: Boolean;
  Path: String;
  LF: TLocalFile;
begin
  if (LocalFile.FileType = lftDirectory) or (LocalFile.FileType = lftDrive) then
  begin
    Path := LocalFile.Path + LocalFile.Name;

    if (Path <> EmptyStr) and (not AnsiEndsStr('\', Path)) then
      Path := Path + '\';

    //Find all the files of the directory
    IsFound := FindFirst(Path + '*', faAnyFile - faDirectory, SR) = 0;
    while IsFound do begin
      FileList.Add(TLocalFile.Create(SR.Name, Path, lftFile));
      IsFound := FindNext(SR) = 0;
    end;
    FindClose(SR);

    //find all the directories
    IsFound := FindFirst(Path + '*.*', faAnyFile, SR) = 0;
    while IsFound do begin
      if ((SR.Attr and faDirectory) <> 0) and (SR.Name[1] <> '.') and (not AnsiSameText(SR.Name, '$Recycle.Bin')) then
      begin
        LF := TLocalFile.Create(SR.Name, Path, lftDirectory);
        //if flatten is true, recursivly get the files under each directory
        if Flatten then
          GetNestedLocalFiles(LF, FileList, Flatten)
        //otherwise, just return the list of directories
        else
          FileList.Add(LF);
      end;
      IsFound := FindNext(SR) = 0;
    end;
    FindClose(SR);
  end;
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

constructor TCloudConnection.Create(const DisplayName, AccountName, AccountPass, Region: String;
                                    CloudType: TCloudConnectionType);
begin
  FDisplayName := DisplayName;
  FCloudType := CloudType;

  if CloudType = cctAmazon then
  begin
    FConnection := TAmazonConnectionInfo.Create(nil);
    TAmazonConnectionInfo(FConnection).Region := TAmazonConnectionInfo.GetRegionFromString(Region);
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

function TCloudConnection.GetAccountKey: String;
begin
  Result := Connection.AccountKey;
end;

function TCloudConnection.GetAccountName: String;
begin
  Result := Connection.AccountName;
end;

function TCloudConnection.GetRegion: String;
begin
  if Connection is TAmazonConnectionInfo then
    Result := TAmazonConnectionInfo.GetRegionString(TAmazonConnectionInfo(Connection).Region)
  else
    Result := '';
end;

{ TLocalFile }

class function TLocalFile.Create(const Name, Path: String; FileType: TLocalFileType): TLocalFile;
begin
  Result.Path := Path;
  Result.Name := Name;
  Result.FileType := FileType;
end;

{ TCloudFile }

class function TCloudFile.Create(const Name, Container, Path: String; FileType: TCloudFileType): TCloudFile;
begin
  Result.Container := Container;
  Result.Path := Path;
  Result.Name := Name;
  Result.FileType := FileType;
end;

{ TCloudPopulator }

procedure TCloudPopulator.Log(Msg: String; MsgType: TCloudLoggerType);
begin
  if Assigned(FLogger) then
    FLogger.Hook(Msg, MsgType);
end;

{ TAmazonPopulator }

constructor TAmazonPopulator.Create(Conn: TAmazonConnectionInfo);
begin
  FPath := EmptyStr;
  FContainer := EmptyStr;
  FConnection := Conn;
  FService := TAmazonStorageService.Create(Conn);
end;

function TAmazonPopulator.CreateContainer(ContainerName: String): Boolean;
var
  RespInfo: TCloudResponseInfo;
begin
  Result := False;
  if FService <> nil then
  begin
    Log('Creating Amazon Bucket: ' + ContainerName, cltInfo);
    RespInfo := TCloudResponseInfo.Create;
    try
      Result := FService.CreateBucket(AnsiLowerCase(ContainerName), amzbaNotSpecified, amzrNotSpecified, RespInfo);
      if not Result then
        Log(RespInfo.StatusMessage, cltError);
    finally
      FreeAndNil(RespInfo);
    end;
  end;
end;

function TAmazonPopulator.DeleteFile(CloudFile: TCloudFile): Boolean;
var
  RespInfo: TCloudResponseInfo;
  FilePath: String;
  Params: TStrings;
  BR: TAmazonBucketResult;
  ObjR: TAmazonObjectResult;
begin
  Result := False;
  if FService <> nil then
  begin
    RespInfo := TCloudResponseInfo.Create;
    try
      if CloudFile.FileType = cftBucket then
      begin
        Log('Deleting Amazon Bucket: ' + CloudFile.Name, cltInfo);
        Result := FService.DeleteBucket(CloudFile.Name);
      end
      else if CloudFile.FileType = cftFolder then
      begin
        Params := TStringList.Create;
        Params.Values['prefix'] := CloudFile.Path + CloudFile.Name;
        BR := nil;
        try
          Log('Deleting Amazon Virtual Folder: ' + CloudFile.Path + CloudFile.Name, cltInfo);
          BR := FService.GetBucket(CloudFile.Container, Params, RespInfo);
          for ObjR In BR.Objects do
          begin
            if not FService.DeleteObject(CloudFile.Container, ObjR.Name, RespInfo) then
            begin
              Log(RespInfo.StatusMessage, cltError);
              Result := False;
            end;
          end;
        finally
          FreeAndNil(BR);
          FreeAndNil(Params);
        end;
      end
      else if CloudFile.FileType = cftFile then
      begin
        Log('Deleting Amazon Object: ' + FilePath, cltInfo);
        FilePath := CloudFile.Path + CloudFile.Name;
        Result := FService.DeleteObject(CloudFile.Container, FilePath, RespInfo);
        if not Result then
          Log(RespInfo.StatusMessage, cltError);
      end;
    finally
      FreeAndNil(RespInfo);
    end;
  end;
end;

destructor TAmazonPopulator.Destroy;
begin
  FreeAndNil(FService);
  inherited;
end;

function TAmazonPopulator.DownloadFile(CloudFile: TCloudFile; Directory: String): Boolean;
var
  FileName: String;
  LocalFilePath: String;
  LFiles: TObjectDictionary<String,TCloudFile>;
  AFile: TCloudFile;
  VirtualPath, TruncPath: String;
begin
  Result := false;
  LFiles := nil;

  if FService <> nil then
  begin
    Directory := AnsiReplaceStr(Directory, '/', '\');

    if not ForceDirectories(Directory) then
    begin
      Log('Failed to make directories: ' + IntToStr(GetLastError) + ' (' + Directory + ')', cltError);
      Exit(False);
    end;

    Directory := AnsiReplaceStr(Directory, '\', '/');
    if not AnsiEndsStr('/', Directory) then
      Directory := Directory + '/';

    if CloudFile.FileType = cftBucket then
    begin
      GetFiles(CloudFile.Name, EmptyStr, LFiles, True);
      try
        for AFile In LFiles.Values do
          DownloadFile(AFile, Directory + CloudFile.Name + '/' + AFile.Path);
      finally
        FreeAndNil(LFiles);
      end;
    end
    else if CloudFile.FileType = cftFolder then
    begin
      VirtualPath := CloudFile.Path + CloudFile.Name;
      GetFiles(CloudFile.Container, VirtualPath, LFiles, True);
      try
        for AFile In LFiles.Values do
        begin
          //Make the full path based on the parent folder's name, and the relative path
          //from the parent folder to this folder. The files retuned are flattened,
          //so a file may be nested several virtual folders deep.
          TruncPath := Copy(AFile.Path, Length(VirtualPath) + 1);
          TruncPath := Directory + VirtualPath + TruncPath;
          DownloadFile(AFile, TruncPath);
        end;
      finally
        FreeAndNil(LFiles);
      end;
    end
    else if CloudFile.FileType = cftFile then
    begin
      FileName := Cloudfile.Path + CloudFile.Name;
      Directory := AnsiReplaceStr(Directory, '\', '/');
      if not AnsiEndsStr('/', Directory) then
        Directory := Directory + '/';
      LocalFilePath := Directory + CloudFile.Name;

      Log('Downloading Amazon From: ' + FileName + ', to: ' + LocalFilePath, cltInfo);
      TAmazonTransferJob.Create(FService, tjtDOWNLOAD, FileName, CloudFile.Container, LocalFilePath, Self);
    end;
  end;
end;

function TAmazonPopulator.GetCloudType: TCloudConnectionType;
begin
  Result := cctAmazon;
end;

function TAmazonPopulator.GetContainer: String;
begin
  Result := FContainer;
end;

function TAmazonPopulator.GetPath: String;
begin
  Result := FPath;
end;

procedure TAmazonPopulator.LoadRootFiles(var Files: TObjectDictionary<String, TCloudFile>);
begin
  FPath := EmptyStr;
  FContainer := EmptyStr;
  GetCurrentFiles(Files);
end;

procedure TAmazonPopulator.SetPath(Container, Path: String; var Files: TObjectDictionary<String, TCloudFile>);
begin
  FContainer := Container;
  FPath := Path;

  if (FPath <> EmptyStr) and (not AnsiEndsStr('/', FPath)) then
    FPath := FPath + '/';

  if AnsiStartsStr('/', FPath) then
    FPath := Copy(FPath, 2);

  GetCurrentFiles(Files);
end;

function TAmazonPopulator.UploadFile(LocalFile: TLocalFile; BasePath: String): Boolean;
var
  ObjName: String;
  FileName: String;
  LocalFiles: TList<TLocalFile>;
  InnerLF: TLocalFile;
begin
  Result := False;
  if (LocalFile.Name <> EmptyStr) and (FContainer <> EmptyStr) then
  begin
    if LocalFile.FileType = lftDirectory then
    begin
      LocalFiles := TList<TLocalFile>.Create;
      GetNestedLocalFiles(LocalFile, LocalFiles, True);
      try
        Result := True;
        for InnerLF In LocalFiles do
        begin
          BasePath := AnsiReplaceStr(Copy(InnerLF.Path, Length(LocalFile.Path) + 1), '\', '/');
          if not UploadFile(InnerLF, BasePath) then
          begin
            Result := False;
          end;
        end;
      finally
        FreeAndNil(LocalFiles);
      end;
    end
    else if LocalFile.FileType = lftFile then
    begin
      FileName := LocalFile.Path + LocalFile.Name;

      if FileExists(FileName) then
      begin
        ObjName := FPath + BasePath + LocalFile.Name;

        Log('Uploading File to Amazon. From: ' + FileName + ', To: ' + ObjName, cltInfo);
        TAmazonTransferJob.Create(FService, tjtUPLOAD, ObjName, FContainer, FileName, Self);
      end;
    end;
  end;
end;

procedure TAmazonPopulator.GetCurrentFiles(var Files: TObjectDictionary<String, TCloudFile>);
begin
  GetFiles(FContainer, FPath, Files);
end;

procedure TAmazonPopulator.GetFiles(Container, Path: String;
                                    var Files: TObjectDictionary<String,TCloudFile>; Flatten: Boolean);
var
  Aux: String;
  Results: TStrings;
  RespInfo: TCloudResponseInfo;
  Params: TStrings;
  BResult: TAmazonBucketResult;
  OResult: TAmazonObjectResult;
  I, Count, Index: Integer;
  TrimmedName, TrimmedPath, UniqueId: String;
begin
  if not Assigned(Files) then
    Files := TObjectDictionary<String,TCloudFile>.Create
  else
    Files.Clear;

  RespInfo := TCloudResponseInfo.Create;

  try
    //load either buckets, or files of a bucket. Container = Bucket
    if (Container = EmptyStr) then
    begin
      Results := FService.ListBuckets(RespInfo);

      if Assigned(Results) then
      begin
        try
          Count := Results.Count - 1;
          for I := 0 to Count do
          begin
            Aux := Results.Names[I];
            Files.Add(Aux, TCloudFile.Create(Aux, EmptyStr, EmptyStr, cftBucket));
          end;
        finally
          FreeAndNil(Results);
        end;
      end
      else
        Log(RespInfo.StatusMessage, cltError);
    end
    //load files from a bucket
    else
    begin
      Params := TStringList.Create;
      if not Flatten then
        Params.Values['delimiter'] := '/';
      Params.Values['prefix'] := Path;
      try
        BResult := FService.GetBucket(Container, Params, RespInfo);
        if BResult <> nil then
        begin
          try
            //Populate folders
            if (not Flatten) and Assigned(BResult.Prefixes) then
            begin
              for Aux In BResult.Prefixes do
              begin
                Count := Length(Path);
                if AnsiEndsStr('/', Aux) then
                  TrimmedName := Copy(Aux, Count + 1, (Length(Aux) - Count) - 1)
                else
                  TrimmedName := Copy(Aux, Count + 1);
                Files.Add(TrimmedName, TCloudFile.Create(TrimmedName, Container, Path, cftFolder));
              end;
            end
            else
              Log(RespInfo.StatusMessage, cltError);

            //Populate files
            if Assigned(BResult.Objects) then
            begin
              for OResult In BResult.Objects do
                //TODO:: If it ends in '_$folder$' then make a folder
                if (not OResult.IsDeleted) and (not AnsiEndsStr('_$folder$', OResult.Name)) then
                begin
                  if Flatten then
                    TrimmedPath := EmptyStr;
                    TrimmedName := OResult.Name;

                    if AnsiEndsText('/', TrimmedName) then
                      TrimmedName := Copy(TrimmedName, 1, Length(TrimmedName));

                    Index := LastDelimiter('/', TrimmedName);
                    if (Index > 0) and (Index < Length(TrimmedName)) then
                    begin
                      TrimmedPath := Copy(TrimmedName, 1, Index);
                      TrimmedName := Copy(TrimmedName, Index + 1);
                    end
                  else
                  begin
                    TrimmedPath := Path;
                    TrimmedName := Copy(OResult.Name, Length(Path) + 1);
                  end;

                  if TrimmedName.IsEmpty then
                    continue;

                  //If flattening, then you need to make sure the dictionary Keys are all unique
                  //add container to path because you can have a blob in the root container
                  //and a blob directly under some container, where the blob has the same name as the one
                  //in the root container. (This would cause a name conflict.)
                  if Flatten then
                    UniqueId := Container + '/' + TrimmedPath + TrimmedName
                  else
                    UniqueId := TrimmedName;

                  Files.Add(UniqueId, TCloudFile.Create(TrimmedName, Container, TrimmedPath, cftFile));
                end;
            end;
          finally
            FreeAndNil(BResult);
          end;
        end;
      finally
        FreeAndNil(Params);
      end;
    end;
  finally
    FreeAndNil(RespInfo);
  end;
end;

{ TAzurePopulator }

constructor TAzurePopulator.Create(Conn: TAzureConnectionInfo);
begin
  FPath := EmptyStr;
  FContainer := EmptyStr;
  FConnection := Conn;
  FService := TAzureBlobService.Create(Conn);
end;

function TAzurePopulator.CreateContainer(ContainerName: String): Boolean;
var
  RespInfo: TCloudResponseInfo;
begin
  Result := False;
  if FService <> nil then
  begin
    Log('Creating Azure Container: ' + ContainerName, cltInfo);
    RespInfo := TCloudResponseInfo.Create;
    try
      //TODO:: Control visibility
      Result := FService.CreateContainer(AnsiLowerCase(ContainerName), nil, bpaPrivate, RespInfo);
      if not Result then
        Log(RespInfo.StatusMessage, cltError);
    finally
      FreeAndNil(RespInfo);
    end;
  end;
end;

function TAzurePopulator.DeleteFile(CloudFile: TCloudFile): Boolean;
var
  RespInfo: TCloudResponseInfo;
  FilePath: String;
  ContainerName: String;
  Params: TStrings;
  Blobs: TList<TAzureBlob>;
  Blob: TAzureBlob;
begin
  Result := False;
  if FService <> nil then
  begin
    RespInfo := TCloudResponseInfo.Create;
    try
      //delete a container
      if CloudFile.FileType = cftContainer then
      begin
        if (CloudFile.Name <> EmptyStr) and (CloudFile.Name <> '$root') then
        begin
          Log('Deleting Azure Container: ' + CloudFile.Name, cltInfo);
          Result := FService.DeleteContainer(CloudFile.Name, RespInfo);
          if not Result then
            Log(RespInfo.StatusMessage, cltError);
        end;
      end
      //delete a folder
      else if CloudFile.FileType = cftFolder then
      begin
        Params := TStringList.Create;
        Params.Values['prefix'] := CloudFile.Path + CloudFile.Name;

        try
          Blobs := FService.ListBlobs(CloudFile.Container, Params, RespInfo);
          if Blobs <> nil then
          begin
            Log('Deleting Azure Virtual Folder: ' + CloudFile.Path + CloudFile.Name, cltInfo);
            Result := True;
            for Blob In Blobs do
            begin
              try
                if not FService.DeleteBlob(CloudFile.Container, Blob.Name, False, EmptyStr, RespInfo) then
                begin
                  Log(RespInfo.StatusMessage, cltError);
                  Result := False;
                end;
              finally
                Blob.Free;
              end;
            end;
          end;
        finally
          FreeAndNil(Params);
          FreeAndNil(Blobs);
        end;
      end
      //delete a file
      else
      begin
        FilePath := CloudFile.Path + CloudFile.Name;
        ContainerName := GetContainerName(CloudFile.Container);

        Log('Deleting Azure Object: ' + FilePath, cltInfo);
        Result := FService.DeleteBlob(ContainerName, FilePath, false, '', RespInfo);
        if not Result then
          Log(RespInfo.StatusMessage, cltError);
      end;
    finally
      FreeAndNil(RespInfo);
    end;
  end;
end;

destructor TAzurePopulator.Destroy;
begin
  FreeAndNil(FService);
  inherited;
end;

function TAzurePopulator.DownloadFile(CloudFile: TCloudFile; Directory: String): Boolean;
var
  FileName: String;
  LocalFilePath: String;
  ContainerName: String;
  LFiles: TObjectDictionary<String,TCloudFile>;
  AFile: TCloudFile;
  VirtualPath, TruncPath: String;
begin
  Result := false;
  LFiles := nil;
  if FService <> nil then
  begin
    Directory := AnsiReplaceStr(Directory, '/', '\');

    if not ForceDirectories(Directory) then
    begin
      Log('Failed to make directories: ' + IntToStr(GetLastError) + ' (' + Directory + ')', cltError);
      Exit(False);
    end;

    Directory := AnsiReplaceStr(Directory, '\', '/');
    if not AnsiEndsStr('/', Directory) then
      Directory := Directory + '/';

    //Handle downloading a container
    if CloudFile.FileType = cftContainer then
    begin
      GetFiles(CloudFile.Name, EmptyStr, LFiles, True);
      try
        for AFile In LFiles.Values do
          DownloadFile(AFile, Directory + CloudFile.Name + '/' + AFile.Path);
      finally
        FreeAndNil(LFiles);
      end;
    end
    //Handle downloading a virtual folder structure
    else if CloudFile.FileType = cftFolder then
    begin
      VirtualPath := CloudFile.Path + CloudFile.Name;
      GetFiles(CloudFile.Container, VirtualPath, LFiles, True);
      try
        for AFile In LFiles.Values do
        begin
          //Make the full path based on the parent folder's name, and the relative path
          //from the parent folder to this folder. The files retuned are flattened,
          //so a file may be nested several virtual folders deep.
          TruncPath := Copy(AFile.Path, Length(VirtualPath) + 1);
          TruncPath := Directory + VirtualPath + TruncPath;
          DownloadFile(AFile, TruncPath);
        end;
      finally
        FreeAndNil(LFiles);
      end;
    end
    //Handle downloading a file
    else if CloudFile.FileType = cftFile then
    begin
      FileName := Cloudfile.Path + CloudFile.Name;
      LocalFilePath := Directory + CloudFile.Name;
      ContainerName := GetContainerName(CloudFile.Container);

      Log('Downloading Azure From: ' + FileName + ', to: ' + LocalFilePath, cltInfo);
      TAzureTransferJob.Create(FService, tjtDOWNLOAD, FileName, ContainerName, LocalFilePath, Self);
    end;
  end;
end;

function TAzurePopulator.GetCloudType: TCloudConnectionType;
begin
  Result := cctAzure;
end;

function TAzurePopulator.GetContainer: String;
begin
  Result := FContainer;
end;

function TAzurePopulator.GetContainerName(SpecifiedContainer: String): String;
begin
  if SpecifiedContainer = EmptyStr then
    Result := '$root'
  else
    Result := SpecifiedContainer;
end;

function TAzurePopulator.GetPath: String;
begin
  Result := FPath;
end;

function TAzurePopulator.IsInRootContainer: Boolean;
begin
  Result := (FContainer = EmptyStr) or (FContainer = '$root');
end;

procedure TAzurePopulator.LoadRootFiles(var Files: TObjectDictionary<String, TCloudFile>);
begin
  FPath := EmptyStr;
  FContainer := EmptyStr;
  GetCurrentFiles(Files);
end;

procedure TAzurePopulator.SetPath(Container, Path: String;
                                  var Files: TObjectDictionary<String, TCloudFile>);
begin
  FContainer := Container;
  FPath := Path;

  if (FPath <> EmptyStr) and (not AnsiEndsStr('/', FPath)) then
    FPath := FPath + '/';

  if AnsiStartsStr('/', FPath) then
    FPath := Copy(FPath, 2);

  GetCurrentFiles(Files);
end;

function TAzurePopulator.UploadFile(LocalFile: TLocalFile; BasePath: String): Boolean;
var
  ObjName: String;
  FileName: String;
  ContainerName: String;
  LocalFiles: TList<TLocalFile>;
  InnerLF: TLocalFile;
begin
  Result := False;
  if (LocalFile.Name <> EmptyStr) then
  begin
    if LocalFile.FileType = lftDirectory then
    begin
      if not IsInRootContainer then
      begin
        LocalFiles := TList<TLocalFile>.Create;
        GetNestedLocalFiles(LocalFile, LocalFiles, True);
        try
          for InnerLF In LocalFiles do
          begin
            BasePath := AnsiReplaceStr(Copy(InnerLF.Path, Length(LocalFile.Path) + 1), '\', '/');
            Result := UploadFile(InnerLF, BasePath) and Result;
          end;
        finally
          FreeAndNil(LocalFiles);
        end;
      end
      else
        Result := False;
    end
    else if LocalFile.FileType = lftFile then
    begin
      FileName := LocalFile.Path + LocalFile.Name;

      //upload a file
      if FileExists(FileName) then
      begin
        ObjName := FPath + BasePath + LocalFile.Name;
        ContainerName := GetContainerName(FContainer);

        Log('Uploading File to Azure. From: ' + FileName + ', To: ' + ObjName, cltInfo);
        TAzureTransferJob.Create(FService, tjtUPLOAD, ObjName, ContainerName, FileName, Self);
      end;
    end;
  end;
end;

procedure TAzurePopulator.GetCurrentFiles(var Files: TObjectDictionary<String, TCloudFile>);
begin
  GetFiles(FContainer, FPath, Files);
end;

procedure TAzurePopulator.GetFiles(Container, Path: String;
                                   var Files: TObjectDictionary<String,TCloudFile>; Flatten: Boolean);
var
  Aux: String;
  Containers: TList<TAzureContainer>;
  LContainer: TAzureContainer;
  HasRootContainer: Boolean;
  Blobs: TList<TAzureBlob>;
  Blob: TAzureBlob;

  RespInfo: TCloudResponseInfo;
  Params: TStrings;
  Count, Index: Integer;
  TrimmedName, TrimmedPath, UniqueId: String;
begin
  HasRootContainer := False;
  Blobs := nil;

  if not Assigned(Files) then
    Files := TObjectDictionary<String,TCloudFile>.Create
  else
    Files.Clear;

  RespInfo := TCloudResponseInfo.Create;

  try
    //load either buckets, or files of a bucket. Container = Bucket
    if (Container = EmptyStr) then
    begin
      Containers := FService.ListContainers(nil, RespInfo);

      if Assigned(Containers) then
      begin
        try
          for LContainer In Containers do
          begin
            if not LContainer.IsRoot then
            begin
              Files.Add(LContainer.Name, TCloudFile.Create(LContainer.Name, EmptyStr, EmptyStr, cftContainer));
            end
            else
              HasRootContainer := True;

            //free the container. not needed anymore.
            LContainer.Free;
          end;
        finally
          FreeAndNil(Containers);
        end;
      end
      else
        Log(RespInfo.StatusMessage, cltError);

      if HasRootContainer then
      begin
        Blobs := FService.ListBlobs('$root', nil, RespInfo);

        if Assigned(Blobs) then
        begin
          try
            for Blob In Blobs do
            begin
              try
                if Flatten then
                  UniqueId := '$root/' + Blob.Name
                else
                  UniqueId := Blob.Name;
                //NOTE: Blobs in the $root container can't have a virtual folder structure
                Files.Add(UniqueId, TCloudFile.Create(Blob.Name, EmptyStr, EmptyStr, cftFile));
              finally
                Blob.Free;
              end;
            end;
          finally
            FreeAndNil(Blobs);
          end;
        end
        else
          Log(RespInfo.StatusMessage, cltError);
      end;
    end
    //load files from a container
    else
    begin
      Params := TStringList.Create;
      if not Flatten then
        Params.Values['delimiter'] := '/';
      Params.Values['prefix'] := Path;
      try
        Blobs := FService.ListBlobs(Container, Params, RespInfo);
        if Blobs <> nil then
        begin
          for Blob In Blobs do
          begin
            try
              Aux := Blob.Name;
              if not Flatten then
              begin
                TrimmedPath := Path;
                Count := Length(Path);
                if AnsiEndsStr('/', Aux) then
                  TrimmedName := Copy(Aux, Count + 1, (Length(Aux) - Count) - 1)
                else
                  TrimmedName := Copy(Aux, Count + 1);
              end
              else
              begin
                TrimmedPath := EmptyStr;
                TrimmedName := Blob.Name;

                if AnsiEndsText('/', TrimmedName) then
                  TrimmedName := Copy(TrimmedName, 1, Length(TrimmedName));

                Index := LastDelimiter('/', TrimmedName);
                if (Index > 0) and (Index < Length(TrimmedName)) then
                begin
                  TrimmedPath := Copy(TrimmedName, 1, Index);
                  TrimmedName := Copy(TrimmedName, Index + 1);
                end
              end;

              //If flattening, then you need to make sure the dictionary Keys are all unique
              //add container to path because you can have a blob in the root container
              //and a blob directly under some container, where the blob has the same name as the one
              //in the root container. (This would cause a name conflict.)
              if Flatten then
                UniqueId := Container + '/' + TrimmedPath + TrimmedName
              else
                UniqueId := TrimmedName;

              if Blob.BlobType = abtPrefix then
                Files.Add(UniqueId, TCloudFile.Create(TrimmedName, Container, TrimmedPath, cftFolder))
              else
                Files.Add(UniqueId, TCloudFile.Create(TrimmedName, Container, TrimmedPath, cftFile));
            finally
              Blob.Free;
            end;
          end;
        end
        else
          Log(RespInfo.StatusMessage, cltError);
      finally
        FreeAndNil(Params);
        FreeAndNil(Blobs);
      end;
    end;
  finally
    FreeAndNil(RespInfo);
  end;
end;

{ TCloudTransferManager }

constructor TCloudTransferManager.Create;
begin
  FJobs := TList<TCloudTransferJob>.Create;
  FListeners := TList<TTransferJobUpdateListener>.Create;
end;

destructor TCloudTransferManager.Destroy;
begin
  FreeAndNil(FListeners);
  ForEachJob(procedure(const Job: TCloudTransferJob)
    begin
      Job.Terminate;
    end);
  FreeAndNil(FJobs);
  inherited;
end;

procedure TCloudTransferManager.ForEachJob(AVisitor: TTransferJobVisitor);
var
  Job: TCloudTransferJob;
begin
  if (FJobs = nil) then
    Exit;

  TMonitor.Enter(FJobs);
  try
    for Job In FJobs do
      AVisitor(Job);
  finally
    TMonitor.Exit(FJobs);
  end;
end;

function TCloudTransferManager.GetSize: Integer;
begin
  Result := FJobs.Count;
end;

procedure TCloudTransferManager.NotifyListeners(Job: TCloudTransferJob);
var
  Event: TTransferJobUpdateListener;
begin
  if (FListeners = nil) or (Job = nil) then
    Exit;
  TMonitor.Enter(FListeners);
  try
    if Assigned(FListeners) then
    begin
      for Event in FListeners do
      begin
        try
          Event(Job);
        except
        end;
      end;
    end;
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TCloudTransferManager.RemoveJob(Job: TCloudTransferJob);
begin
  if (Job <> nil) and FJobs.Contains(Job) then
  begin
    TMonitor.Enter(FJobs);
    try
      FJobs.Remove(Job);
    finally
      TMonitor.Exit(FJobs);
    end;
    NotifyListeners(Job);
  end;
end;

function TCloudTransferManager.AddJob(Job: TCloudTransferJob): boolean;
begin
  Result := true;
  //TODO:: validate that the job won't cause conflicts, like uploading a file
  //which is currently being downloaded
  if (Job <> nil) and (not FJobs.Contains(Job)) then
  begin
    TMonitor.Enter(FJobs);
    try
      FJobs.Add(Job);
    finally
      TMonitor.Exit(FJobs);
    end;
    NotifyListeners(Job);
  end;
end;

procedure TCloudTransferManager.AddListener(Listener: TTransferJobUpdateListener);
begin
  TMonitor.Enter(FListeners);
  try
    if not FListeners.Contains(Listener) then
      FListeners.Add(Listener);
  finally
    TMonitor.Exit(FListeners);
  end;
end;

procedure TCloudTransferManager.RemoveListener(Listener: TTransferJobUpdateListener);
begin
  TMonitor.Enter(FListeners);
  try
    if Assigned(FListeners) then
      FListeners.Remove(Listener);
  finally
    TMonitor.Exit(FListeners);
  end;
end;

{ TAzureTransferJob }

constructor TAzureTransferJob.Create(Service: TAzureBlobService; JobType: TTransferJobType;
  FileName, ContainerName, LocalFilePath: String; Populator: TCloudPopulator);
begin
  inherited Create;
  FService := Service;
  FJobType := JobType;
  FFileName := FileName;
  FContainerName := ContainerName;
  FLocalFilePath := LocalFilePath;
  FPopulator := Populator;
  FJobStatus := tjsWAITING;

  //TODO:: Handle case when job fails to get added
  TCloudTransferManager.Instance.AddJob(Self);
end;

destructor TAzureTransferJob.Destroy;
begin
  TCloudTransferManager.Instance.RemoveJob(Self);
  inherited;
end;

procedure TAzureTransferJob.Execute;
var
  FS: TFileStream;
  Content: TBytes;
  Success: Boolean;
  RespInfo: TCloudResponseInfo;
begin
  inherited;
  FreeOnTerminate := True;

  FJobStatus := tjsRUNNING;

  RespInfo := TCloudResponseInfo.Create;

  Success := True;
  FS := nil;

  try
    if JobType = tjtUPLOAD then
    begin
      if FileExists(LocalFilePath) then
      begin
        FS := TFileStream.Create(LocalFilePath, fmOpenRead);
        Content := ByteContent(fs);
        Success := FService.PutBlockBlob(ContainerName, FileName, Content, EmptyStr, nil, nil, RespInfo);
      end;
    end
    else
    begin
      if FileExists(LocalFilePath) then
        FS := TFileStream.Create(LocalFilePath, fmOpenWrite)
      else
        FS := TFileStream.Create(LocalFilePath, fmCreate);

      Success := FService.GetBlob(ContainerName, FileName, FS, '', RespInfo);
    end;
  finally
    if not Success then
      FPopulator.Log(RespInfo.StatusMessage, cltError);
    FreeAndNil(FS);
    FreeAndNil(RespInfo);

    FJobStatus := tjsFINISHED;
  end;
end;

{ TAmazonTransferJob }

constructor TAmazonTransferJob.Create(Service: TAmazonStorageService; JobType: TTransferJobType;
  FileName, ContainerName, LocalFilePath: String; Populator: TCloudPopulator);
begin
  inherited Create;
  FService := Service;
  FJobType := JobType;
  FFileName := FileName;
  FContainerName := ContainerName;
  FLocalFilePath := LocalFilePath;
  FPopulator := Populator;
  FJobStatus := tjsWAITING;

  //TODO:: Handle case when job fails to get added
  TCloudTransferManager.Instance.AddJob(Self);
end;

destructor TAmazonTransferJob.Destroy;
begin
  TCloudTransferManager.Instance.RemoveJob(Self);
  inherited;
end;

procedure TAmazonTransferJob.Execute;
var
  FS: TFileStream;
  Content: TBytes;
  Success: Boolean;
  RespInfo: TCloudResponseInfo;
begin
  inherited;
  FreeOnTerminate := True;

  FJobStatus := tjsRUNNING;

  RespInfo := TCloudResponseInfo.Create;

  Success := True;
  FS := nil;

  try
    if JobType = tjtUPLOAD then
    begin
      if FileExists(LocalFilePath) then
      begin
        FS := TFileStream.Create(LocalFilePath, fmOpenRead);
        Content := ByteContent(fs);
        Success := FService.UploadObject(ContainerName, FileName, Content, false, nil, nil, amzbaNotSpecified, RespInfo);
      end;
    end
    else
    begin
      if FileExists(LocalFilePath) then
        FS := TFileStream.Create(LocalFilePath, fmOpenWrite)
      else
        FS := TFileStream.Create(LocalFilePath, fmCreate);

      Success := FService.GetObject(ContainerName, FileName, FS, RespInfo);
    end;
  finally
    if not Success then
      FPopulator.Log(RespInfo.StatusMessage, cltError);
    FreeAndNil(FS);
    FreeAndNil(RespInfo);

    FJobStatus := tjsFINISHED;
  end;
end;

initialization
  TCloudTransferManager.FInstance := TCloudTransferManager.Create;

finalization
  TCloudTransferManager.FInstance.Free;
  TCloudTransferManager.FInstance := nil;

end.

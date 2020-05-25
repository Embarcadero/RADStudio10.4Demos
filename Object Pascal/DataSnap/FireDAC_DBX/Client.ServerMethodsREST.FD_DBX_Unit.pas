//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Client.ServerMethodsREST.FD_DBX_Unit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerRESTMethodsClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FStreamGetCommand: TDSRestCommand;
    FStreamGetCommand_Cache: TDSRestCommand;
    FStreamPostCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function StreamGet(const ARequestFilter: string = ''): TStream;
    function StreamGet_Cache(const ARequestFilter: string = ''): IDSRestCachedStream;
    function StreamPost(AStream: TStream; const ARequestFilter: string = ''): string;
  end;

const
  TServerRESTMethodsClient_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerRESTMethodsClient_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerRESTMethodsClient_StreamGet: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TServerRESTMethodsClient_StreamGet_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerRESTMethodsClient_StreamPost: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AStream'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TServerRESTMethodsClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare(TServerRESTMethodsClient_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerRESTMethodsClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare(TServerRESTMethodsClient_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerRESTMethodsClient.StreamGet(const ARequestFilter: string): TStream;
begin
  if FStreamGetCommand = nil then
  begin
    FStreamGetCommand := FConnection.CreateCommand;
    FStreamGetCommand.RequestType := 'GET';
    FStreamGetCommand.Text := 'TServerMethods.StreamGet';
    FStreamGetCommand.Prepare(TServerRESTMethodsClient_StreamGet);
  end;
  FStreamGetCommand.Execute(ARequestFilter);
  Result := FStreamGetCommand.Parameters[0].Value.GetStream(FInstanceOwner);
end;

function TServerRESTMethodsClient.StreamGet_Cache(const ARequestFilter: string): IDSRestCachedStream;
begin
  if FStreamGetCommand_Cache = nil then
  begin
    FStreamGetCommand_Cache := FConnection.CreateCommand;
    FStreamGetCommand_Cache.RequestType := 'GET';
    FStreamGetCommand_Cache.Text := 'TServerMethods.StreamGet';
    FStreamGetCommand_Cache.Prepare(TServerRESTMethodsClient_StreamGet_Cache);
  end;
  FStreamGetCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedStream.Create(FStreamGetCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerRESTMethodsClient.StreamPost(AStream: TStream; const ARequestFilter: string): string;
begin
  if FStreamPostCommand = nil then
  begin
    FStreamPostCommand := FConnection.CreateCommand;
    FStreamPostCommand.RequestType := 'POST';
    FStreamPostCommand.Text := 'TServerMethods."StreamPost"';
    FStreamPostCommand.Prepare(TServerRESTMethodsClient_StreamPost);
  end;
  FStreamPostCommand.Parameters[0].Value.SetStream(AStream, FInstanceOwner);
  FStreamPostCommand.Execute(ARequestFilter);
  Result := FStreamPostCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerRESTMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerRESTMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerRESTMethodsClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FStreamGetCommand.DisposeOf;
  FStreamGetCommand_Cache.DisposeOf;
  FStreamPostCommand.DisposeOf;
  inherited;
end;

end.

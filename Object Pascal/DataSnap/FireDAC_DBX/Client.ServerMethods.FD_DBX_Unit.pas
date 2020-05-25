//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Client.ServerMethods.FD_DBX_Unit;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethodsClient = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FStreamGetCommand: TDBXCommand;
    FStreamPostCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function StreamGet: TStream;
    function StreamPost(AStream: TStream): string;
  end;

implementation

function TServerMethodsClient.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.StreamGet: TStream;
begin
  if FStreamGetCommand = nil then
  begin
    FStreamGetCommand := FDBXConnection.CreateCommand;
    FStreamGetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStreamGetCommand.Text := 'TServerMethods.StreamGet';
    FStreamGetCommand.Prepare;
  end;
  FStreamGetCommand.ExecuteUpdate;
  Result := FStreamGetCommand.Parameters[0].Value.GetStream(FInstanceOwner);
end;

function TServerMethodsClient.StreamPost(AStream: TStream): string;
begin
  if FStreamPostCommand = nil then
  begin
    FStreamPostCommand := FDBXConnection.CreateCommand;
    FStreamPostCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStreamPostCommand.Text := 'TServerMethods.StreamPost';
    FStreamPostCommand.Prepare;
  end;
  FStreamPostCommand.Parameters[0].Value.SetStream(AStream, FInstanceOwner);
  FStreamPostCommand.ExecuteUpdate;
  Result := FStreamPostCommand.Parameters[1].Value.GetWideString;
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethodsClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FStreamGetCommand.DisposeOf;
  FStreamPostCommand.DisposeOf;
  inherited;
end;

end.

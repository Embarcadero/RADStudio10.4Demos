//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientProxy;

interface

uses DBXCommon, DBXClient, System.JSON, DSProxy, Classes, SysUtils, DB, SqlExpr, DBXDBReaders,
     Data.DBXJSON, DBXJSONReflect;

type
  TServerMethodsClient = class(TDSAdminClient)
  private
    FReverseStringCommand: TDBXCommand;
    FTransformStringCommand: TDBXCommand;
    FReverseWordsInStreamCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ReverseString(AValue: string): string;
    function TransformString(AValue: string): TJSONObject;
    function ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
  end;

implementation

function TServerMethodsClient.ReverseString(AValue: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(AValue);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.TransformString(AValue: string): TJSONObject;
begin
  if FTransformStringCommand = nil then
  begin
    FTransformStringCommand := FDBXConnection.CreateCommand;
    FTransformStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTransformStringCommand.Text := 'TServerMethods.TransformString';
    FTransformStringCommand.Prepare;
  end;
  FTransformStringCommand.Parameters[0].Value.SetWideString(AValue);
  FTransformStringCommand.ExecuteUpdate;
  Result := TJSONObject(FTransformStringCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethodsClient.ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
begin
  if FReverseWordsInStreamCommand = nil then
  begin
    FReverseWordsInStreamCommand := FDBXConnection.CreateCommand;
    FReverseWordsInStreamCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseWordsInStreamCommand.Text := 'TServerMethods.ReverseWordsInStream';
    FReverseWordsInStreamCommand.Prepare;
  end;
  FReverseWordsInStreamCommand.Parameters[0].Value.SetCallbackValue(ACallback);
  FReverseWordsInStreamCommand.Parameters[1].Value.SetStream(AStream, FInstanceOwner);
  FReverseWordsInStreamCommand.ExecuteUpdate;
  Result := FReverseWordsInStreamCommand.Parameters[2].Value.GetStream(FInstanceOwner);
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
  FreeAndNil(FReverseStringCommand);
  FreeAndNil(FTransformStringCommand);
  FreeAndNil(FReverseWordsInStreamCommand);
  inherited;
end;

end.


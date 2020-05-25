//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientClasses;

interface

uses DBXCommon, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TServerModule1Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FHelloCommand: TDBXCommand;
    FParamsReaderCommand: TDBXCommand;
    FGetEmployeeCommand: TDBXCommand;
    FVariantMethodCommand: TDBXCommand;
    FGetConnectionCommand: TDBXCommand;
    FEmptyMethodCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Hello(IncomingMessage: string): string;
    function ParamsReader: TDBXReader;
    function GetEmployee(ID: string): TDataSet;
    function VariantMethod(Value: OleVariant): OleVariant;
    function GetConnection: TDBXConnection;
    procedure EmptyMethod;
  end;

  TParametersServerModule1Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FDataSetMethodCommand: TDBXCommand;
    FParamsMethodCommand: TDBXCommand;
    FStreamMethodCommand: TDBXCommand;
    FDBXReaderMethodCommand: TDBXCommand;
    FVariantMethodCommand: TDBXCommand;
    FStringMethodCommand: TDBXCommand;
    FInt32MethodCommand: TDBXCommand;
    FNoparametersMethodCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DataSetMethod(InDataSet: TDataSet; out OutDataSet: TDataSet; var VarDataSet: TDataSet): TDataSet;
    function ParamsMethod(InParams: TParams; out OutParams: TParams; var VarParams: TParams): TParams;
    function StreamMethod(InStream: TStream; out OutStream: TStream; var VarStream: TStream): TStream;
    function DBXReaderMethod(InDBXReader: TDBXReader; out OutDBXReader: TDBXReader; var VarDBXReader: TDBXReader): TDBXReader;
    function VariantMethod(InVariant: OleVariant; out OutVariant: OleVariant; var VarVariant: OleVariant): OleVariant;
    function StringMethod(InString: string; out OutString: OleVariant; var VarString: OleVariant): string;
    function Int32Method(InInt32: Int32; out OutInt32: Int32; var VarInt32: Int32): Int32;
    procedure NoparametersMethod;
  end;

  TDSServerModule2Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

implementation

function TServerModule1Client.Hello(IncomingMessage: string): string;
begin
  if FHelloCommand = nil then
  begin
    FHelloCommand := FDBXConnection.CreateCommand;
    FHelloCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHelloCommand.Text := 'TServerModule1.Hello';
    FHelloCommand.Prepare;
  end;
  FHelloCommand.Parameters[0].Value.SetWideString(IncomingMessage);
  FHelloCommand.ExecuteUpdate;
  Result := FHelloCommand.Parameters[1].Value.GetWideString;
end;

function TServerModule1Client.ParamsReader: TDBXReader;
begin
  if FParamsReaderCommand = nil then
  begin
    FParamsReaderCommand := FDBXConnection.CreateCommand;
    FParamsReaderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParamsReaderCommand.Text := 'TServerModule1.ParamsReader';
    FParamsReaderCommand.Prepare;
  end;
  FParamsReaderCommand.ExecuteUpdate;
  Result := FParamsReaderCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TServerModule1Client.GetEmployee(ID: string): TDataSet;
begin
  if FGetEmployeeCommand = nil then
  begin
    FGetEmployeeCommand := FDBXConnection.CreateCommand;
    FGetEmployeeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetEmployeeCommand.Text := 'TServerModule1.GetEmployee';
    FGetEmployeeCommand.Prepare;
  end;
  FGetEmployeeCommand.Parameters[0].Value.SetWideString(ID);
  FGetEmployeeCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetEmployeeCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetEmployeeCommand.FreeOnExecute(Result);
end;

function TServerModule1Client.VariantMethod(Value: OleVariant): OleVariant;
begin
  if FVariantMethodCommand = nil then
  begin
    FVariantMethodCommand := FDBXConnection.CreateCommand;
    FVariantMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVariantMethodCommand.Text := 'TServerModule1.VariantMethod';
    FVariantMethodCommand.Prepare;
  end;
  FVariantMethodCommand.Parameters[0].Value.AsVariant := Value;
  FVariantMethodCommand.ExecuteUpdate;
  Result := FVariantMethodCommand.Parameters[1].Value.AsVariant;
end;

function TServerModule1Client.GetConnection: TDBXConnection;
begin
  if FGetConnectionCommand = nil then
  begin
    FGetConnectionCommand := FDBXConnection.CreateCommand;
    FGetConnectionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetConnectionCommand.Text := 'TServerModule1.GetConnection';
    FGetConnectionCommand.Prepare;
  end;
  FGetConnectionCommand.ExecuteUpdate;
  Result := FDBXConnection
end;

procedure TServerModule1Client.EmptyMethod;
begin
  if FEmptyMethodCommand = nil then
  begin
    FEmptyMethodCommand := FDBXConnection.CreateCommand;
    FEmptyMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmptyMethodCommand.Text := 'TServerModule1.EmptyMethod';
    FEmptyMethodCommand.Prepare;
  end;
  FEmptyMethodCommand.ExecuteUpdate;
end;


constructor TServerModule1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TServerModule1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


destructor TServerModule1Client.Destroy;
begin
  FreeAndNil(FHelloCommand);
  FreeAndNil(FParamsReaderCommand);
  FreeAndNil(FGetEmployeeCommand);
  FreeAndNil(FVariantMethodCommand);
  FreeAndNil(FGetConnectionCommand);
  FreeAndNil(FEmptyMethodCommand);
  inherited;
end;

function TParametersServerModule1Client.DataSetMethod(InDataSet: TDataSet; out OutDataSet: TDataSet; var VarDataSet: TDataSet): TDataSet;
begin
  if FDataSetMethodCommand = nil then
  begin
    FDataSetMethodCommand := FDBXConnection.CreateCommand;
    FDataSetMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDataSetMethodCommand.Text := 'TParametersServerModule1.DataSetMethod';
    FDataSetMethodCommand.Prepare;
  end;
  FDataSetMethodCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(InDataSet, FInstanceOwner), True);
  FDataSetMethodCommand.Parameters[2].Value.SetDBXReader(TDBXDataSetReader.Create(VarDataSet, FInstanceOwner), True);
  FDataSetMethodCommand.ExecuteUpdate;
  OutDataSet := TCustomSQLDataSet.Create(nil, FDataSetMethodCommand.Parameters[1].Value.GetDBXReader(False), True);
  OutDataSet.Open;
  if FInstanceOwner then
    FDataSetMethodCommand.FreeOnExecute(OutDataSet);
  VarDataSet := TCustomSQLDataSet.Create(nil, FDataSetMethodCommand.Parameters[2].Value.GetDBXReader(False), True);
  VarDataSet.Open;
  if FInstanceOwner then
    FDataSetMethodCommand.FreeOnExecute(VarDataSet);
  Result := TCustomSQLDataSet.Create(nil, FDataSetMethodCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FDataSetMethodCommand.FreeOnExecute(Result);
end;

function TParametersServerModule1Client.ParamsMethod(InParams: TParams; out OutParams: TParams; var VarParams: TParams): TParams;
begin
  if FParamsMethodCommand = nil then
  begin
    FParamsMethodCommand := FDBXConnection.CreateCommand;
    FParamsMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParamsMethodCommand.Text := 'TParametersServerModule1.ParamsMethod';
    FParamsMethodCommand.Prepare;
  end;
  FParamsMethodCommand.Parameters[0].Value.SetDBXReader(TDBXParamsReader.Create(InParams, FInstanceOwner), True);
  FParamsMethodCommand.Parameters[2].Value.SetDBXReader(TDBXParamsReader.Create(VarParams, FInstanceOwner), True);
  FParamsMethodCommand.ExecuteUpdate;
  OutParams := TDBXParamsReader.ToParams(nil, FParamsMethodCommand.Parameters[1].Value.GetDBXReader(False), True);
  if FInstanceOwner then
    FParamsMethodCommand.FreeOnExecute(OutParams);
  VarParams := TDBXParamsReader.ToParams(nil, FParamsMethodCommand.Parameters[2].Value.GetDBXReader(False), True);
  if FInstanceOwner then
    FParamsMethodCommand.FreeOnExecute(VarParams);
  Result := TDBXParamsReader.ToParams(nil, FParamsMethodCommand.Parameters[3].Value.GetDBXReader(False), True);
  if FInstanceOwner then
    FParamsMethodCommand.FreeOnExecute(Result);
end;

function TParametersServerModule1Client.StreamMethod(InStream: TStream; out OutStream: TStream; var VarStream: TStream): TStream;
begin
  if FStreamMethodCommand = nil then
  begin
    FStreamMethodCommand := FDBXConnection.CreateCommand;
    FStreamMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStreamMethodCommand.Text := 'TParametersServerModule1.StreamMethod';
    FStreamMethodCommand.Prepare;
  end;
  FStreamMethodCommand.Parameters[0].Value.SetStream(InStream, FInstanceOwner);
  FStreamMethodCommand.Parameters[2].Value.SetStream(VarStream, FInstanceOwner);
  FStreamMethodCommand.ExecuteUpdate;
  OutStream := FStreamMethodCommand.Parameters[1].Value.GetStream(FInstanceOwner);
  VarStream := FStreamMethodCommand.Parameters[2].Value.GetStream(FInstanceOwner);
  Result := FStreamMethodCommand.Parameters[3].Value.GetStream(FInstanceOwner);
end;

function TParametersServerModule1Client.DBXReaderMethod(InDBXReader: TDBXReader; out OutDBXReader: TDBXReader; var VarDBXReader: TDBXReader): TDBXReader;
begin
  if FDBXReaderMethodCommand = nil then
  begin
    FDBXReaderMethodCommand := FDBXConnection.CreateCommand;
    FDBXReaderMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDBXReaderMethodCommand.Text := 'TParametersServerModule1.DBXReaderMethod';
    FDBXReaderMethodCommand.Prepare;
  end;
  FDBXReaderMethodCommand.Parameters[0].Value.SetDBXReader(InDBXReader, FInstanceOwner);
  FDBXReaderMethodCommand.Parameters[2].Value.SetDBXReader(VarDBXReader, FInstanceOwner);
  FDBXReaderMethodCommand.ExecuteUpdate;
  OutDBXReader := FDBXReaderMethodCommand.Parameters[1].Value.GetDBXReader(FInstanceOwner);
  VarDBXReader := FDBXReaderMethodCommand.Parameters[2].Value.GetDBXReader(FInstanceOwner);
  Result := FDBXReaderMethodCommand.Parameters[3].Value.GetDBXReader(FInstanceOwner);
end;

function TParametersServerModule1Client.VariantMethod(InVariant: OleVariant; out OutVariant: OleVariant; var VarVariant: OleVariant): OleVariant;
begin
  if FVariantMethodCommand = nil then
  begin
    FVariantMethodCommand := FDBXConnection.CreateCommand;
    FVariantMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVariantMethodCommand.Text := 'TParametersServerModule1.VariantMethod';
    FVariantMethodCommand.Prepare;
  end;
  FVariantMethodCommand.Parameters[0].Value.AsVariant := InVariant;
  FVariantMethodCommand.Parameters[2].Value.AsVariant := VarVariant;
  FVariantMethodCommand.ExecuteUpdate;
  OutVariant := FVariantMethodCommand.Parameters[1].Value.AsVariant;
  VarVariant := FVariantMethodCommand.Parameters[2].Value.AsVariant;
  Result := FVariantMethodCommand.Parameters[3].Value.AsVariant;
end;

function TParametersServerModule1Client.StringMethod(InString: string; out OutString: OleVariant; var VarString: OleVariant): string;
begin
  if FStringMethodCommand = nil then
  begin
    FStringMethodCommand := FDBXConnection.CreateCommand;
    FStringMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStringMethodCommand.Text := 'TParametersServerModule1.StringMethod';
    FStringMethodCommand.Prepare;
  end;
  FStringMethodCommand.Parameters[0].Value.SetWideString(InString);
  FStringMethodCommand.Parameters[2].Value.AsVariant := VarString;
  FStringMethodCommand.ExecuteUpdate;
  OutString := FStringMethodCommand.Parameters[1].Value.AsVariant;
  VarString := FStringMethodCommand.Parameters[2].Value.AsVariant;
  Result := FStringMethodCommand.Parameters[3].Value.GetWideString;
end;

function TParametersServerModule1Client.Int32Method(InInt32: Int32; out OutInt32: Int32; var VarInt32: Int32): Int32;
begin
  if FInt32MethodCommand = nil then
  begin
    FInt32MethodCommand := FDBXConnection.CreateCommand;
    FInt32MethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInt32MethodCommand.Text := 'TParametersServerModule1.Int32Method';
    FInt32MethodCommand.Prepare;
  end;
  FInt32MethodCommand.Parameters[0].Value.SetInt32(InInt32);
  FInt32MethodCommand.Parameters[2].Value.SetInt32(VarInt32);
  FInt32MethodCommand.ExecuteUpdate;
  OutInt32 := FInt32MethodCommand.Parameters[1].Value.GetInt32;
  VarInt32 := FInt32MethodCommand.Parameters[2].Value.GetInt32;
  Result := FInt32MethodCommand.Parameters[3].Value.GetInt32;
end;

procedure TParametersServerModule1Client.NoparametersMethod;
begin
  if FNoparametersMethodCommand = nil then
  begin
    FNoparametersMethodCommand := FDBXConnection.CreateCommand;
    FNoparametersMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNoparametersMethodCommand.Text := 'TParametersServerModule1.NoparametersMethod';
    FNoparametersMethodCommand.Prepare;
  end;
  FNoparametersMethodCommand.ExecuteUpdate;
end;


constructor TParametersServerModule1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TParametersServerModule1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


destructor TParametersServerModule1Client.Destroy;
begin
  FreeAndNil(FDataSetMethodCommand);
  FreeAndNil(FParamsMethodCommand);
  FreeAndNil(FStreamMethodCommand);
  FreeAndNil(FDBXReaderMethodCommand);
  FreeAndNil(FVariantMethodCommand);
  FreeAndNil(FStringMethodCommand);
  FreeAndNil(FInt32MethodCommand);
  FreeAndNil(FNoparametersMethodCommand);
  inherited;
end;


constructor TDSServerModule2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDSServerModule2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


destructor TDSServerModule2Client.Destroy;
begin
  inherited;
end;

end.


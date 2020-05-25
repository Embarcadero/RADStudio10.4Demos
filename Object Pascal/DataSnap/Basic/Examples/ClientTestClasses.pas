//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientTestClasses;

interface

uses Data.DBXCommon, System.Classes, System.SysUtils;

type
  DSAdminClient = class
  private
    FDBXConnection: TDBXConnection;
    FGetPlatformNameCommand: TDBXCommand;
    FFindPackagesCommand: TDBXCommand;
    FFindClassesCommand: TDBXCommand;
    FFindMethodsCommand: TDBXCommand;
    FCreateServerClassesCommand: TDBXCommand;
    FDropServerClassesCommand: TDBXCommand;
    FCreateServerMethodsCommand: TDBXCommand;
    FDropServerMethodsCommand: TDBXCommand;
    FGetServerClassesCommand: TDBXCommand;
    FGetServerMethodsCommand: TDBXCommand;
    FGetServerMethodParametersCommand: TDBXCommand;
    FGetConnectionCommand: TDBXCommand;
    FGetDatabaseConnectionPropertiesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection);
    destructor Destroy; override;
    function GetPlatformName: String;
    function FindPackages: TDBXReader;
    function FindClasses(PackageName: String; ClassPattern: String): TDBXReader;
    function FindMethods(PackageName: String; ClassPattern: String; MethodPattern: String): TDBXReader;
    function CreateServerClasses(ClassReader: TDBXReader): TDBXReader;
    function DropServerClasses(ClassReader: TDBXReader): TDBXReader;
    function CreateServerMethods(MethodReader: TDBXReader): TDBXReader;
    function DropServerMethods(MethodReader: TDBXReader): TDBXReader;
    function GetServerClasses: TDBXReader;
    function GetServerMethods: TDBXReader;
    function GetServerMethodParameters: TDBXReader;
    function GetConnection(NewConName: String): TDBXConnection;
    function GetDatabaseConnectionProperties: TDBXReader;
  end;

  DSMetadataClient = class
  private
    FDBXConnection: TDBXConnection;
    FGetProceduresCommand: TDBXCommand;
    FGetProcedureParametersCommand: TDBXCommand;
    FGetDatabaseCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection);
    destructor Destroy; override;
    function GetProcedures(ProcedureNamePattern: String; ProcedureType: String): TDBXReader;
    function GetProcedureParameters(ProcedureNamePattern: String): TDBXReader;
    function GetDatabase: TDBXReader;
  end;

  TSimpleServerModuleClient = class
  private
    FDBXConnection: TDBXConnection;
    FEchoDataSetCommand: TDBXCommand;
    FEchoParamsCommand: TDBXCommand;
    FEchoStreamCommand: TDBXCommand;
    FGetServerConnectionCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection);
    destructor Destroy; override;
    function EchoDataSet(DataSet: TDBXReader): TDBXReader;
    function EchoParams(Params: TDBXReader): TDBXReader;
    function EchoStream(Stream: TStream): TStream;
    function GetServerConnection: TDBXConnection;
  end;

implementation

function DSAdminClient.GetPlatformName: String;
begin
  if FGetPlatformNameCommand = nil then
  begin
    FGetPlatformNameCommand := FDBXConnection.CreateCommand;
    FGetPlatformNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetPlatformNameCommand.Text := 'DSAdmin.GetPlatformName';
    FGetPlatformNameCommand.Prepare;
  end;
  FGetPlatformNameCommand.ExecuteUpdate;
  Result := FGetPlatformNameCommand.Parameters[0].Value.GetWideString;
end;

function DSAdminClient.FindPackages: TDBXReader;
begin
  if FFindPackagesCommand = nil then
  begin
    FFindPackagesCommand := FDBXConnection.CreateCommand;
    FFindPackagesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFindPackagesCommand.Text := 'DSAdmin.FindPackages';
    FFindPackagesCommand.Prepare;
  end;
  FFindPackagesCommand.ExecuteUpdate;
  Result := FFindPackagesCommand.Parameters[0].Value.GetDBXReader(False);
end;

function DSAdminClient.FindClasses(PackageName: String; ClassPattern: String): TDBXReader;
begin
  if FFindClassesCommand = nil then
  begin
    FFindClassesCommand := FDBXConnection.CreateCommand;
    FFindClassesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFindClassesCommand.Text := 'DSAdmin.FindClasses';
    FFindClassesCommand.Prepare;
  end;
  FFindClassesCommand.Parameters[0].Value.SetWideString(PackageName);
  FFindClassesCommand.Parameters[1].Value.SetWideString(ClassPattern);
  FFindClassesCommand.ExecuteUpdate;
  Result := FFindClassesCommand.Parameters[2].Value.GetDBXReader(False);
end;

function DSAdminClient.FindMethods(PackageName: String; ClassPattern: String; MethodPattern: String): TDBXReader;
begin
  if FFindMethodsCommand = nil then
  begin
    FFindMethodsCommand := FDBXConnection.CreateCommand;
    FFindMethodsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFindMethodsCommand.Text := 'DSAdmin.FindMethods';
    FFindMethodsCommand.Prepare;
  end;
  FFindMethodsCommand.Parameters[0].Value.SetWideString(PackageName);
  FFindMethodsCommand.Parameters[1].Value.SetWideString(ClassPattern);
  FFindMethodsCommand.Parameters[2].Value.SetWideString(MethodPattern);
  FFindMethodsCommand.ExecuteUpdate;
  Result := FFindMethodsCommand.Parameters[3].Value.GetDBXReader(False);
end;

function DSAdminClient.CreateServerClasses(ClassReader: TDBXReader): TDBXReader;
begin
  if FCreateServerClassesCommand = nil then
  begin
    FCreateServerClassesCommand := FDBXConnection.CreateCommand;
    FCreateServerClassesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCreateServerClassesCommand.Text := 'DSAdmin.CreateServerClasses';
    FCreateServerClassesCommand.Prepare;
  end;
  FCreateServerClassesCommand.Parameters[0].Value.SetDBXReader(ClassReader, false);
  FCreateServerClassesCommand.ExecuteUpdate;
  Result := FCreateServerClassesCommand.Parameters[1].Value.GetDBXReader(False);
end;

function DSAdminClient.DropServerClasses(ClassReader: TDBXReader): TDBXReader;
begin
  if FDropServerClassesCommand = nil then
  begin
    FDropServerClassesCommand := FDBXConnection.CreateCommand;
    FDropServerClassesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDropServerClassesCommand.Text := 'DSAdmin.DropServerClasses';
    FDropServerClassesCommand.Prepare;
  end;
  FDropServerClassesCommand.Parameters[0].Value.SetDBXReader(ClassReader, false);
  FDropServerClassesCommand.ExecuteUpdate;
  Result := FDropServerClassesCommand.Parameters[1].Value.GetDBXReader(False);
end;

function DSAdminClient.CreateServerMethods(MethodReader: TDBXReader): TDBXReader;
begin
  if FCreateServerMethodsCommand = nil then
  begin
    FCreateServerMethodsCommand := FDBXConnection.CreateCommand;
    FCreateServerMethodsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCreateServerMethodsCommand.Text := 'DSAdmin.CreateServerMethods';
    FCreateServerMethodsCommand.Prepare;
  end;
  FCreateServerMethodsCommand.Parameters[0].Value.SetDBXReader(MethodReader, false);
  FCreateServerMethodsCommand.ExecuteUpdate;
  Result := FCreateServerMethodsCommand.Parameters[1].Value.GetDBXReader(False);
end;

function DSAdminClient.DropServerMethods(MethodReader: TDBXReader): TDBXReader;
begin
  if FDropServerMethodsCommand = nil then
  begin
    FDropServerMethodsCommand := FDBXConnection.CreateCommand;
    FDropServerMethodsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDropServerMethodsCommand.Text := 'DSAdmin.DropServerMethods';
    FDropServerMethodsCommand.Prepare;
  end;
  FDropServerMethodsCommand.Parameters[0].Value.SetDBXReader(MethodReader, false);
  FDropServerMethodsCommand.ExecuteUpdate;
  Result := FDropServerMethodsCommand.Parameters[1].Value.GetDBXReader(False);
end;

function DSAdminClient.GetServerClasses: TDBXReader;
begin
  if FGetServerClassesCommand = nil then
  begin
    FGetServerClassesCommand := FDBXConnection.CreateCommand;
    FGetServerClassesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerClassesCommand.Text := 'DSAdmin.GetServerClasses';
    FGetServerClassesCommand.Prepare;
  end;
  FGetServerClassesCommand.ExecuteUpdate;
  Result := FGetServerClassesCommand.Parameters[0].Value.GetDBXReader(False);
end;

function DSAdminClient.GetServerMethods: TDBXReader;
begin
  if FGetServerMethodsCommand = nil then
  begin
    FGetServerMethodsCommand := FDBXConnection.CreateCommand;
    FGetServerMethodsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerMethodsCommand.Text := 'DSAdmin.GetServerMethods';
    FGetServerMethodsCommand.Prepare;
  end;
  FGetServerMethodsCommand.ExecuteUpdate;
  Result := FGetServerMethodsCommand.Parameters[0].Value.GetDBXReader(False);
end;

function DSAdminClient.GetServerMethodParameters: TDBXReader;
begin
  if FGetServerMethodParametersCommand = nil then
  begin
    FGetServerMethodParametersCommand := FDBXConnection.CreateCommand;
    FGetServerMethodParametersCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerMethodParametersCommand.Text := 'DSAdmin.GetServerMethodParameters';
    FGetServerMethodParametersCommand.Prepare;
  end;
  FGetServerMethodParametersCommand.ExecuteUpdate;
  Result := FGetServerMethodParametersCommand.Parameters[0].Value.GetDBXReader(False);
end;

function DSAdminClient.GetConnection(NewConName: String): TDBXConnection;
begin
  if FGetConnectionCommand = nil then
  begin
    FGetConnectionCommand := FDBXConnection.CreateCommand;
    FGetConnectionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetConnectionCommand.Text := 'DSAdmin.GetConnection';
    FGetConnectionCommand.Prepare;
  end;
  FGetConnectionCommand.Parameters[0].Value.SetWideString(NewConName);
  FGetConnectionCommand.ExecuteUpdate;
  Result := FDBXConnection
end;

function DSAdminClient.GetDatabaseConnectionProperties: TDBXReader;
begin
  if FGetDatabaseConnectionPropertiesCommand = nil then
  begin
    FGetDatabaseConnectionPropertiesCommand := FDBXConnection.CreateCommand;
    FGetDatabaseConnectionPropertiesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDatabaseConnectionPropertiesCommand.Text := 'DSAdmin.GetDatabaseConnectionProperties';
    FGetDatabaseConnectionPropertiesCommand.Prepare;
  end;
  FGetDatabaseConnectionPropertiesCommand.ExecuteUpdate;
  Result := FGetDatabaseConnectionPropertiesCommand.Parameters[0].Value.GetDBXReader(False);
end;


constructor DSAdminClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
end;


destructor DSAdminClient.Destroy;
begin
  FreeAndNil(FGetPlatformNameCommand);
  FreeAndNil(FFindPackagesCommand);
  FreeAndNil(FFindClassesCommand);
  FreeAndNil(FFindMethodsCommand);
  FreeAndNil(FCreateServerClassesCommand);
  FreeAndNil(FDropServerClassesCommand);
  FreeAndNil(FCreateServerMethodsCommand);
  FreeAndNil(FDropServerMethodsCommand);
  FreeAndNil(FGetServerClassesCommand);
  FreeAndNil(FGetServerMethodsCommand);
  FreeAndNil(FGetServerMethodParametersCommand);
  FreeAndNil(FGetConnectionCommand);
  FreeAndNil(FGetDatabaseConnectionPropertiesCommand);
  inherited;
end;

function DSMetadataClient.GetProcedures(ProcedureNamePattern: String; ProcedureType: String): TDBXReader;
begin
  if FGetProceduresCommand = nil then
  begin
    FGetProceduresCommand := FDBXConnection.CreateCommand;
    FGetProceduresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetProceduresCommand.Text := 'DSMetadata.GetProcedures';
    FGetProceduresCommand.Prepare;
  end;
  FGetProceduresCommand.Parameters[0].Value.SetWideString(ProcedureNamePattern);
  FGetProceduresCommand.Parameters[1].Value.SetWideString(ProcedureType);
  FGetProceduresCommand.ExecuteUpdate;
  Result := FGetProceduresCommand.Parameters[2].Value.GetDBXReader(False);
end;

function DSMetadataClient.GetProcedureParameters(ProcedureNamePattern: String): TDBXReader;
begin
  if FGetProcedureParametersCommand = nil then
  begin
    FGetProcedureParametersCommand := FDBXConnection.CreateCommand;
    FGetProcedureParametersCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetProcedureParametersCommand.Text := 'DSMetadata.GetProcedureParameters';
    FGetProcedureParametersCommand.Prepare;
  end;
  FGetProcedureParametersCommand.Parameters[0].Value.SetWideString(ProcedureNamePattern);
  FGetProcedureParametersCommand.ExecuteUpdate;
  Result := FGetProcedureParametersCommand.Parameters[1].Value.GetDBXReader(False);
end;

function DSMetadataClient.GetDatabase: TDBXReader;
begin
  if FGetDatabaseCommand = nil then
  begin
    FGetDatabaseCommand := FDBXConnection.CreateCommand;
    FGetDatabaseCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDatabaseCommand.Text := 'DSMetadata.GetDatabase';
    FGetDatabaseCommand.Prepare;
  end;
  FGetDatabaseCommand.ExecuteUpdate;
  Result := FGetDatabaseCommand.Parameters[0].Value.GetDBXReader(False);
end;


constructor DSMetadataClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
end;


destructor DSMetadataClient.Destroy;
begin
  FreeAndNil(FGetProceduresCommand);
  FreeAndNil(FGetProcedureParametersCommand);
  FreeAndNil(FGetDatabaseCommand);
  inherited;
end;

function TSimpleServerModuleClient.EchoDataSet(DataSet: TDBXReader): TDBXReader;
begin
  if FEchoDataSetCommand = nil then
  begin
    FEchoDataSetCommand := FDBXConnection.CreateCommand;
    FEchoDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoDataSetCommand.Text := 'TSimpleServerModule.EchoDataSet';
    FEchoDataSetCommand.Prepare;
  end;
  FEchoDataSetCommand.Parameters[0].Value.SetDBXReader(DataSet, false);
  FEchoDataSetCommand.ExecuteUpdate;
  Result := FEchoDataSetCommand.Parameters[1].Value.GetDBXReader(False);
end;

function TSimpleServerModuleClient.EchoParams(Params: TDBXReader): TDBXReader;
begin
  if FEchoParamsCommand = nil then
  begin
    FEchoParamsCommand := FDBXConnection.CreateCommand;
    FEchoParamsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoParamsCommand.Text := 'TSimpleServerModule.EchoParams';
    FEchoParamsCommand.Prepare;
  end;
  FEchoParamsCommand.Parameters[0].Value.SetDBXReader(Params, false);
  FEchoParamsCommand.ExecuteUpdate;
  Result := FEchoParamsCommand.Parameters[1].Value.GetDBXReader(False);
end;

function TSimpleServerModuleClient.EchoStream(Stream: TStream): TStream;
begin
  if FEchoStreamCommand = nil then
  begin
    FEchoStreamCommand := FDBXConnection.CreateCommand;
    FEchoStreamCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStreamCommand.Text := 'TSimpleServerModule.EchoStream';
    FEchoStreamCommand.Prepare;
  end;
  FEchoStreamCommand.Parameters[0].Value.SetStream(Stream, false);
  FEchoStreamCommand.ExecuteUpdate;
  Result := FEchoStreamCommand.Parameters[1].Value.GetStream(False);
end;

function TSimpleServerModuleClient.GetServerConnection: TDBXConnection;
begin
  if FGetServerConnectionCommand = nil then
  begin
    FGetServerConnectionCommand := FDBXConnection.CreateCommand;
    FGetServerConnectionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerConnectionCommand.Text := 'TSimpleServerModule.GetServerConnection';
    FGetServerConnectionCommand.Prepare;
  end;
  FGetServerConnectionCommand.ExecuteUpdate;
  Result := FDBXConnection
end;


constructor TSimpleServerModuleClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
end;


destructor TSimpleServerModuleClient.Destroy;
begin
  FreeAndNil(FEchoDataSetCommand);
  FreeAndNil(FEchoParamsCommand);
  FreeAndNil(FEchoStreamCommand);
  FreeAndNil(FGetServerConnectionCommand);
  inherited;
end;

end.

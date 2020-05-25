//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ParametersServerModule;

interface

uses
  SysUtils, Classes, DSServer, db, WideStrings, SqlExpr,
  DataSnapTestData, DBXCommon, Datasnap.dsproviderDataModuleAdapter, FMTBcd, DBXInterbase;

type
  TParametersServerModule1 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    ReturnSqlQuery: TSQLQuery;
    OutSqlQuery: TSQLQuery;
    VarSqlQuery: TSQLQuery;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FDataSnapTestData: TDataSnapTestData;
    FReturnCommand: TDBXCommand;
    FOutCommand: TDBXCommand;
    FVarCommand: TDBXCommand;
  public
    { Public declarations }
    function DataSetMethod(InDataSet: TDataSet; out OutDataSet: TDataSet; var VarDataSet: TDataSet): TDataSet;
    function ParamsMethod(InParams: TParams; out OutParams: TParams; var VarParams: TParams): TParams;
    function StreamMethod(InStream: TStream; out OutStream: TStream; var VarStream: TStream): TStream;
    function DBXReaderMethod(InDBXReader: TDBXReader; out OutDBXReader: TDBXReader; var VarDBXReader: TDBXReader): TDBXReader;
    function VariantMethod(InVariant: OleVariant; out OutVariant: OleVariant; var VarVariant: OleVariant): OleVariant;
    function StringMethod(InString: String;  out OutString: OleVariant; var VarString: OleVariant): String;
    function Int32Method(InInt32: Int32; out OutInt32: Int32; var VarInt32: Int32): Int32;
    procedure NoparametersMethod;
  end;

var
  ParametersServerModule1: TParametersServerModule1;

implementation

{$R *.dfm}

var
  TableCreated: Boolean;

{ TDSServerModule1 }


procedure TParametersServerModule1.DSServerModuleCreate(Sender: TObject);
begin
  SQLConnection1.Open;

  FDataSnapTestData := TDataSnapTestData.Create(SQLConnection1.DBXConnection);
  if not TableCreated then
  begin
    TableCreated := True;
    FDataSnapTestData.CreateTestTable;
  end;
  FOutCommand := SQLConnection1.DBXConnection.CreateCommand;
  FOutCommand.Text := 'select * from DATASNAP_TEST_DATA';
  FVarCommand := SQLConnection1.DBXConnection.CreateCommand;
  FVarCommand.Text := 'select * from DATASNAP_TEST_DATA';
  FReturnCommand := SQLConnection1.DBXConnection.CreateCommand;
  FReturnCommand.Text := 'select * from DATASNAP_TEST_DATA';
end;

procedure TParametersServerModule1.DSServerModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FDataSnapTestData);
  FreeAndNil(FOutCommand);
  FreeAndNil(FVarCommand);
  FreeAndNil(FReturnCommand);
end;

function TParametersServerModule1.Int32Method(InInt32: Int32;
  out OutInt32: Int32; var VarInt32: Int32): Int32;
begin
  FDataSnapTestData.ValidateInt32(InInt32);
  FDataSnapTestData.ValidateInt32(VarInt32);

  FDataSnapTestData.PopulateInt32(OutInt32);
  FDataSnapTestData.PopulateInt32(VarInt32);
  FDataSnapTestData.PopulateInt32(Result);
end;

procedure TParametersServerModule1.NoparametersMethod;
begin
end;
function TParametersServerModule1.DBXReaderMethod(InDBXReader: TDBXReader;
  out OutDBXReader: TDBXReader; var VarDBXReader: TDBXReader): TDBXReader;
begin
  FDataSnapTestData.ValidateReader(InDBXReader);
  FDataSnapTestData.ValidateReader(VarDBXReader);

  OutDBXReader := FOutCommand.ExecuteQuery;
  VarDBXReader := FVarCommand.ExecuteQuery;
  Result       := FReturnCommand.ExecuteQuery;
end;

function TParametersServerModule1.VariantMethod(InVariant: OleVariant;
  out OutVariant: OleVariant; var VarVariant: OleVariant): OleVariant;
begin
  FDataSnapTestData.ValidateVariant(InVariant);
  FDataSnapTestData.ValidateVariant(VarVariant);

  FDataSnapTestData.PopulateVariant(VarVariant);
  FDataSnapTestData.PopulateVariant(OutVariant);
  FDataSnapTestData.PopulateVariant(Result);
end;

function TParametersServerModule1.DataSetMethod(InDataSet: TDataSet;
  out OutDataSet: TDataSet; var VarDataSet: TDataSet): TDataSet;
begin
  // Validate the contents of the incoming DataSets
  // Incomming DataSets are automatically freed.
  //
  FDataSnapTestData.ValidateDataSet(InDataSet);
  FDataSnapTestData.ValidateDataSet(VarDataSet);

  // None of the outgoing DataSets will be automatically freed because their
  // component owner is not nil.
  //
  OutSqlQuery.Open;
  OutSqlQuery.Refresh;
  OutDataSet := OutSqlQuery;

  VarSqlQuery.Open;
  VarSqlQuery.Refresh;
  VarDataSet := VarSqlQuery;

  ReturnSqlQuery.Open;
  ReturnSqlQuery.Refresh;
  Result := ReturnSqlQuery;
end;

function TParametersServerModule1.ParamsMethod(InParams: TParams;
  out OutParams: TParams; var VarParams: TParams): TParams;
begin
  // Validate the contents of the incoming DataSets.
  //
  FDataSnapTestData.ValidateParams(InParams);
  FDataSnapTestData.ValidateParams(VarParams);

  // All of these outgoing return values will be automatically freed.
  //
  OutParams := FDataSnapTestData.CreateTestParams;
  VarParams := FDataSnapTestData.CreateTestParams;
  Result    := FDataSnapTestData.CreateTestParams;
end;


function TParametersServerModule1.StreamMethod(InStream: TStream;
  out OutStream: TStream; var VarStream: TStream): TStream;
begin
  // Validate the contents of the incoming Streams.
  //
  FDataSnapTestData.ValidateStream(InStream);
  FDataSnapTestData.ValidateStream(VarStream);

  // All of these outgoing values will be automatically freed.
  //
  OutStream := FDataSnapTestData.CreateTestStream;
  VarStream := FDataSnapTestData.CreateTestStream;
  Result    := FDataSnapTestData.CreateTestStream;

end;

function TParametersServerModule1.StringMethod(InString: String; out OutString: OleVariant;
  var VarString: OleVariant): String;
begin
  FDataSnapTestData.ValidateString(InString);
  FDataSnapTestData.ValidateString(VarString);

  FDataSnapTestData.PopulateString(Result);
  OutString := Result;
  VarString := Result;

end;

end.

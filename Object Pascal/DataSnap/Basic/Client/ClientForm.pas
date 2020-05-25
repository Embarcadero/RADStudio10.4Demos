//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, DBXDatasnap, DBClient, DSConnect, StdCtrls,
  ClientClasses, Grids, DBGrids, FMTBcd, DataSnapTestData, DBXTrace,
  DBXCommon, DBXInterbase, DBCtrls;

type
  TForm13 = class(TForm)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SqlServerMethod1: TSqlServerMethod;
    SQLConnection2: TSQLConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDataSnapTestData: TDataSnapTestData;
    FParametersTest: TParametersServerModule1Client;
    FDBXReaderMethodCommand: TDBXCommand;
    FInCommand: TDBXCommand;
    FVarCommand: TDBXCommand;
    procedure CreateCommands;
    procedure DestroyCommands;

    procedure TestComponentParams;
    procedure TestClassParams;

    procedure TestComponentDataSet;
    procedure TestClassDataSet;

    procedure TestComponentStream;
    procedure TestClassStream;

    procedure TestComponentDBXReader;
    procedure TestClassDBXReader;

    procedure TestComponentVariant;
    procedure TestClassVariant;

    procedure TestComponentString;
    procedure TestClassString;

    procedure TestComponentInt32;
    procedure TestClassInt32;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.FormCreate(Sender: TObject);
begin
  FDataSnapTestData := TDataSnapTestData.Create(nil);
end;

procedure TForm13.CreateCommands;
begin
  SQLConnection2.Open;
  FInCommand := SQLConnection2.DBXConnection.CreateCommand;
  FInCommand.Text := 'select * from DATASNAP_TEST_DATA';
  FVarCommand := SQLConnection2.DBXConnection.CreateCommand;
  FVarCommand.Text := 'select * from DATASNAP_TEST_DATA';
  SQLConnection1.Open;
  FDBXReaderMethodCommand := SQLConnection1.DBXConnection.CreateCommand;

end;

procedure TForm13.DestroyCommands;
begin
  FreeAndNil(FInCommand);
  FreeAndNil(FVarCommand);
  FreeAndNil(FDBXReaderMethodCommand);
end;

procedure TForm13.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDataSnapTestData);
  DestroyCommands;
end;

procedure TForm13.TestClassDataSet;
var
  InDataSet: TDataSet;
  VarDataSet: TDataSet;
  OutDataSet: TDataSet;
  ReturnDataSet: TDataSet;
begin
  InDataset     := FDataSnapTestData.CreateTestDataSet;
  VarDataSet    := FDataSnapTestData.CreateTestDataSet;

  // By default, the command used inside the implementation of DataSetMethod
  // will maintain ownership of all parameters.  They will be freed when the
  // method is called again or when FParametersTest instance is freed.
  //
  ReturnDataSet := FParametersTest.DataSetMethod(InDataSet, OutDataSet, VarDataSet);

  FDataSnapTestData.ValidateDataSet(OutDataSet);
  FDataSnapTestData.ValidateDataSet(VarDataSet);
  FDataSnapTestData.ValidateDataSet(ReturnDataSet);
end;

procedure TForm13.TestComponentDataSet;
begin
  SqlServerMethod1.CommandText := 'TParametersServerModule1.DataSetMethod';

  // Second boolean parameter indicates the TParam to free the TParams object
  // when it is no longer needed.  Otherwise it is the client's responsibility
  // to free the TParams.
  //
  SqlServerMethod1.Params[0].AsDataSet := FDataSnapTestData.CreateTestDataSet;
  // This has the same affect as the line above.  Ownership is implicit.
  // Second boolean parameter indicates the TParam to free the TParams object
  // when it is no longer needed.
  //
  SqlServerMethod1.Params[2].SetDataSet(FDataSnapTestData.CreateTestDataSet, True);

  SqlServerMethod1.Open;

  // Return value is in the SQLServerMethod1 component.
  //
  FDataSnapTestData.ValidateDataSet(SqlServerMethod1);
  FDataSnapTestData.ValidateDataSet(SqlServerMethod1.Params[1].AsDataSet);
  FDataSnapTestData.ValidateDataSet(SqlServerMethod1.Params[2].AsDataSet);

  SqlServerMethod1.Close;
end;

procedure TForm13.TestClassParams;
var
  InParams: TParams;
  VarParams: TParams;
  OutParams: TParams;
  ReturnParams: TParams;
begin
    InParams    := FDataSnapTestData.CreateTestParams;
    VarParams   := FDataSnapTestData.CreateTestParams;



    ReturnParams := FParametersTest.ParamsMethod(InParams, OutParams, VarParams);

    FDataSnapTestData.ValidateParams(OutParams);
    FDataSnapTestData.ValidateParams(VarParams);
    FDataSnapTestData.ValidateParams(ReturnParams);
end;


procedure TForm13.TestComponentParams;
begin
    SqlServerMethod1.CommandText := 'TParametersServerModule1.ParamsMethod';

    // By default the VCL treats outgoing TParams as ftDataSet.  Force them to
    // ftParams.
    //
    SqlServerMethod1.Params[1].DataType := ftParams;
    SqlServerMethod1.Params[2].DataType := ftParams;
    SqlServerMethod1.Params[3].DataType := ftParams;

    SqlServerMethod1.Params[0].AsParams := FDataSnapTestData.CreateTestParams;
    // This has the same affect as the line above.  Ownership is implicit.
    // Second boolean parameter indicates the TParam to free the TParams object
    // when it is no longer needed.
    //
    SqlServerMethod1.Params[2].SetParams(FDataSnapTestData.CreateTestParams, True);

    SqlServerMethod1.ExecuteMethod;

    FDataSnapTestData.ValidateParams(SqlServerMethod1.Params[1].AsParams);
    FDataSnapTestData.ValidateParams(SqlServerMethod1.Params[3].AsParams);
    FDataSnapTestData.ValidateParams(SqlServerMethod1.Params[2].AsParams);
end;

procedure TForm13.TestClassInt32;
var
  InInt32: Int32;
  VarInt32: Int32;
  OutInt32: Int32;
  ReturnInt32: Int32;
begin

  FDataSnapTestData.PopulateInt32(InInt32);
  FDataSnapTestData.PopulateInt32(VarInt32);

  ReturnInt32 := FParametersTest.Int32Method(InInt32, OutInt32, VarInt32);

  FDataSnapTestData.ValidateInt32(VarInt32);
  FDataSnapTestData.ValidateInt32(OutInt32);
  FDataSnapTestData.ValidateInt32(ReturnInt32);
end;

procedure TForm13.TestComponentInt32;
var
  InInt32: Int32;
  VarInt32: Int32;
begin
  SqlServerMethod1.CommandText := 'TParametersServerModule1.Int32Method';

  FDataSnapTestData.PopulateInt32(InInt32);
  FDataSnapTestData.PopulateInt32(VarInt32);

  SqlServerMethod1.Params[0].AsLargeInt := InInt32;
  SqlServerMethod1.Params[2].AsLargeInt := VarInt32;

  SqlServerMethod1.ExecuteMethod;

  FDataSnapTestData.ValidateInt32(SqlServerMethod1.Params[1].AsLargeInt);
  FDataSnapTestData.ValidateInt32(SqlServerMethod1.Params[3].AsLargeInt);
  FDataSnapTestData.ValidateInt32(SqlServerMethod1.Params[2].AsLargeInt);

end;

procedure TForm13.TestClassDBXReader;
var
  InReader: TDBXReader;
  VarReader: TDBXReader;
  OutReader: TDBXReader;
  ReturnReader: TDBXReader;
begin
  InReader := FInCommand.ExecuteQuery;
  VarReader := FVarCommand.ExecuteQuery;

  ReturnReader := FParametersTest.DBXReaderMethod(InReader, OutReader, VarReader);

  FDataSnapTestData.ValidateReader(VarReader);
  FDataSnapTestData.ValidateReader(OutReader);
  FDataSnapTestData.ValidateReader(ReturnReader);
end;

procedure TForm13.TestComponentDBXReader;
var
  InReader: TDBXReader;
  VarReader: TDBXReader;
begin
  InReader := FInCommand.ExecuteQuery;
  VarReader := FVarCommand.ExecuteQuery;

  FDBXReaderMethodCommand.Text := 'TParametersServerModule1.DBXReaderMethod';
  FDBXReaderMethodCommand.CommandType := TDBXCommandTypes.DSServerMethod;
  FDBXReaderMethodCommand.Prepare;

  FDBXReaderMethodCommand.Parameters[0].Value.AsDBXReader := InReader;
  FDBXReaderMethodCommand.Parameters[2].Value.AsDBXReader := VarReader;

  FDBXReaderMethodCommand.ExecuteQuery;

  FDataSnapTestData.ValidateReader(FDBXReaderMethodCommand.Parameters[1].Value.AsDBXReader);
  FDataSnapTestData.ValidateReader(FDBXReaderMethodCommand.Parameters[2].Value.AsDBXReader);
  FDataSnapTestData.ValidateReader(FDBXReaderMethodCommand.Parameters[3].Value.AsDBXReader);
end;

procedure TForm13.TestClassStream;
var
  InStream: TStream;
  VarStream: TStream;
  OutStream: TStream;
  ReturnStream: TStream;
begin
  InStream    := FDataSnapTestData.CreateTestStream;
  VarStream   := FDataSnapTestData.CreateTestStream;

  ReturnStream := FParametersTest.StreamMethod(InStream, OutStream, VarStream);

  FDataSnapTestData.ValidateStream(OutStream);
  FDataSnapTestData.ValidateStream(VarStream);
  FDataSnapTestData.ValidateStream(ReturnStream);
end;


procedure TForm13.TestComponentStream;
begin
    SqlServerMethod1.CommandText := 'TParametersServerModule1.StreamMethod';
    SqlServerMethod1.Prepared := True;

    // Second boolean parameter indicates the TParam to free the TStream object
    // when it is no longer needed.  Otherwise it is the client's responsibility
    // to free the TStream.
    //
    SqlServerMethod1.Params[0].AsStream := FDataSnapTestData.CreateTestStream;
    // This has the same affect as the line above.  Ownership is implicit.
    // Second boolean parameter indicates the TParam to free the TStream object
    // when it is no longer needed.
    //
    SqlServerMethod1.Params[2].SetStream(FDataSnapTestData.CreateTestStream, True);

    SqlServerMethod1.ExecuteMethod;

    FDataSnapTestData.ValidateStream(SqlServerMethod1.Params[1].AsStream);
    FDataSnapTestData.ValidateStream(SqlServerMethod1.Params[3].AsStream);
    FDataSnapTestData.ValidateStream(SqlServerMethod1.Params[2].AsStream);

    SqlServerMethod1.Close;
end;

procedure TForm13.TestComponentString;
var
  InString: String;
  VarString: OleVariant;
begin
  SqlServerMethod1.CommandText := 'TParametersServerModule1.StringMethod';

  FDataSnapTestData.PopulateString(InString);
  VarString := InString;

  SqlServerMethod1.Params[0].AsString := InString;
  SqlServerMethod1.Params[2].Value := VarString;

  SqlServerMethod1.ExecuteMethod;

  FDataSnapTestData.ValidateString(SqlServerMethod1.Params[1].AsString);
  FDataSnapTestData.ValidateString(SqlServerMethod1.Params[3].AsString);
  FDataSnapTestData.ValidateString(SqlServerMethod1.Params[2].AsString);

end;

procedure TForm13.TestClassString;
var
  InString: String;
  VarString: OleVariant;
  OutString: OleVariant;
  ReturnString: String;
begin

  FDataSnapTestData.PopulateString(InString);
  VarString := InString;

  ReturnString := FParametersTest.StringMethod(InString, OutString, VarString);

  FDataSnapTestData.ValidateString(VarString);
  FDataSnapTestData.ValidateString(OutString);
  FDataSnapTestData.ValidateString(ReturnString);
end;

procedure TForm13.TestClassVariant;
var
  InValue: OleVariant;
  VarValue: OleVariant;
  OutValue: OleVariant;
  ReturnValue: OleVariant;
begin

    FDataSnapTestData.PopulateVariant(InValue);
    FDataSnapTestData.PopulateVariant(VarValue);

    ReturnValue := FParametersTest.VariantMethod(InValue, OutValue, VarValue);

    FDataSnapTestData.ValidateVariant(OutValue);
    FDataSnapTestData.ValidateVariant(VarValue);
    FDataSnapTestData.ValidateVariant(ReturnValue);

end;

procedure TForm13.TestComponentVariant;
var
  InValue: OleVariant;
  VarValue: OleVariant;
begin
    SqlServerMethod1.CommandText := 'TParametersServerModule1.VariantMethod';
    SqlServerMethod1.Prepared := True;

    FDataSnapTestData.PopulateVariant(InValue);
    FDataSnapTestData.PopulateVariant(VarValue);

    SqlServerMethod1.Params[0].Value := InValue;
    SqlServerMethod1.Params[2].Value := VarValue;

    SqlServerMethod1.ExecuteMethod;

    FDataSnapTestData.ValidateVariant(SqlServerMethod1.Params[1].Value);
    FDataSnapTestData.ValidateVariant(SqlServerMethod1.Params[3].Value);
    FDataSnapTestData.ValidateVariant(SqlServerMethod1.Params[2].Value);

    SqlServerMethod1.Close;

end;

procedure TForm13.Button1Click(Sender: TObject);
begin
  SQLConnection1.Open;
  try
    DSProviderConnection1.Open;
    ClientDataSet1.Open;
  finally
    SQLConnection1.Close;
  end;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  SQLConnection1.Open;
  CreateCommands;
  FParametersTest := TParametersServerModule1Client.Create(SQLConnection1.DBXConnection);
  try
    TestClassString;
    TestClassInt32;
    TestClassVariant;
    TestClassDBXReader;
    TestClassStream;
    TestClassParams;
    TestClassDataSet;
  finally
    FreeAndNil(FParametersTest);
    DestroyCommands;
    SQLConnection1.Close;
  end;

end;

procedure TForm13.Button3Click(Sender: TObject);
begin
  SQLConnection1.Open;
  CreateCommands;
  try
    TestComponentString;
    TestComponentInt32;
    TestComponentVariant;
    TestComponentDBXReader;
    TestComponentStream;
    TestComponentParams;
    TestComponentDataSet;
  finally
    DestroyCommands;
    SQLConnection1.Close
  end;
end;

end.

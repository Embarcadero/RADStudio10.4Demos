//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit DataSnapTestData;

interface

uses System.Classes, System.SysUtils, Data.Db, Datasnap.DbClient, Data.SqlExpr,
  Data.DBXDataExpressMetaDataProvider, Data.DbxMetaDataProvider, DBXDataGenerator, DBXCustomDataGenerator,
  DBXDbMetaData, Data.DBXCommon, Data.FMTBcd, Data.DBXInterbase;


const

  TestStreamSize  = 1024;
  StringValue     = '999999999999999999999999';
  Int32Value      = $55FFFFFF;

type

  TDataSnapTestData = class
  private
    FConnection:        TDBXConnection;
    FMetaDataProvider:  TDBXDataExpressMetaDataProvider;
    FMetaDataTable:     TDBXMetaDataTable;
    FDataGenerator:     TDbxDataGenerator;
    FRowCount:          Integer;
  public
    constructor Create(DBXConnection: TDBXConnection);
    destructor Destroy; override;
    class procedure Check(Success: Boolean); static;
    procedure ValidateParams(Params: TParams);
    procedure ValidateDataSet(DataSet: TDataSet);
    procedure ValidateStream(Stream: TStream);
    procedure ValidateReader(Reader: TDBXReader);
    procedure ValidateVariant(Value: OleVariant);
    procedure ValidateString(Value: String);
    procedure ValidateInt32(Value: Int32);

    procedure PopulateDataSet(DataSet: TClientDataSet);
    procedure PopulateBytes(var Bytes: TBytes);
    procedure PopulateMemoryStream(Stream: TMemoryStream);
    procedure PopulateParams(Params: TParams);
    procedure PopulateVariant(var Value: OleVariant);
    procedure PopulateString(var Value: String);
    procedure PopulateInt32(var Value: Int32);

    function CreateTestParams: TParams;
    function CreateTestDataSet: TDataSet;
    function CreateTestStream: TStream;

    procedure CreateTestTable;
  end;

implementation

constructor TDataSnapTestData.Create(DBXConnection: TDBXConnection);
begin
  FRowCount := 100;
  FConnection := DBXConnection;
  if FConnection <> nil then
  begin
    FMetaDataProvider := TDBXDataExpressMetaDataProvider.Create;
    FMetaDataProvider.Connection := DBXConnection;
    FMetaDataProvider.Open;
  end;

  FMetaDataTable := TDBXMetaDataTable.Create;
  FMetaDataTable.TableName := 'DATASNAP_TEST_DATA';
  FMetaDataTable.AddColumn(TDBXInt32Column.Create('CINT32'));
  FMetaDataTable.AddColumn(TDBXUnicodeVarCharColumn.Create('CVARCHAR', 16));
  FMetaDataTable.AddColumn(TDBXBinaryLongColumn.Create('CSTREAM'));

  FDataGenerator := TDBXDataGenerator.Create;
  FDataGenerator.TableName := FMetaDataTable.TableName;
  FDataGenerator.MetaDataProvider := FMetaDataProvider;
  FDataGenerator.AddColumn(TDBXInt32SequenceGenerator.Create(FMetaDataTable.getColumn(0)));
  FDataGenerator.AddColumn(TDBXWideStringSequenceGenerator.Create(FMetaDataTable.getColumn(1)));
  FDataGenerator.AddColumn(TDBXBlobSequenceGenerator.Create(FMetaDataTable.getColumn(2)));
end;

destructor TDataSnapTestData.Destroy;
begin
  FreeAndNil(FDataGenerator);
  FreeAndNil(FMetaDataTable);
  FreeAndNil(FMetaDataProvider);
  inherited;
end;

procedure TDataSnapTestData.PopulateParams(Params: TParams);
begin
    FDataGenerator.PopulateParams(Params);
end;

procedure TDataSnapTestData.PopulateString(var Value: String);
begin
  Value := StringValue;
end;

procedure TDataSnapTestData.PopulateVariant(var Value: OleVariant);
var
  Bytes: TBytes;
begin
  PopulateBytes(Bytes);
  Value := Bytes;
end;

function TDataSnapTestData.CreateTestDataSet: TDataSet;
var
  ClientDataSet: TClientDataSet;
begin
  ClientDataSet := TClientDataSet.Create(nil);
  TDBXDBMetaData.AddClientDataSetFields(ClientDataSet, FMetaDataTable);
  PopulateDataSet(ClientDataSet);
  Result := ClientDataSet;
end;

function TDataSnapTestData.CreateTestParams: TParams;
begin
  Result := TParams.Create(nil);
  TDBXDBMetaData.AddParams(Result, FMetaDataTable);
  PopulateParams(Result);
end;


function TDataSnapTestData.CreateTestStream: TStream;
var
  MemoryStream: TMemoryStream;
begin
  MemoryStream := TMemoryStream.Create;
  PopulateMemoryStream(MemoryStream);
  Result := MemoryStream;
end;

class procedure TDataSnapTestData.Check(Success: Boolean);
begin
  if not Success then
    raise Exception.Create('Operation failed');
end;


procedure TDataSnapTestData.CreateTestTable;
var
  Command:          TDBXCommand;
  Row:              Integer;
  Transaction:      TDBXTransaction;
begin
  Command := nil;
  Transaction := nil;
  try
    Command := FConnection.CreateCommand;
    Transaction := FConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      FMetaDataProvider.DropTable(FMetaDataTable.TableName);
      FMetaDataProvider.CreateTable(FMetaDataTable);
    finally
      FConnection.CommitFreeAndNil(Transaction);
    end;

    Transaction := FConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      Command.Text := FDataGenerator.CreateParameterizedInsertStatement;
      FDataGenerator.AddParameters(Command);
      for Row := 0 to FRowCount - 1 do
      begin
        FDataGenerator.SetInsertParameters(Command, Row);
        Command.ExecuteUpdate;
      end;
    finally
      FConnection.CommitFreeAndNil(Transaction);
    end;
  finally
    Command.Free;
  end;
end;

procedure TDataSnapTestData.PopulateDataSet(DataSet: TClientDataSet);
begin
  if DataSet.Active then
    DataSet.EmptyDataSet;
  FDataGenerator.PopulateDataset(DataSet, FRowCount);
end;


procedure TDataSnapTestData.PopulateInt32(var Value: Int32);
begin
  Value := Int32Value;
end;

procedure TDataSnapTestData.PopulateBytes(var Bytes: TBytes);
var
  Index: Integer;
  Count: Integer;
begin
  Count := TestStreamSize;
  SetLength(Bytes, Count);
  for Index := 0 to Count-1 do
    Bytes[Index] := Byte(Index * 3);

end;

procedure TDataSnapTestData.PopulateMemoryStream(Stream: TMemoryStream);
var
  Count: Integer;
  Bytes: TBytes;
begin
  Count := TestStreamSize;
  PopulateBytes(Bytes);

  Stream.Size := Count;
  Stream.Write(Bytes[0], Count);
  Stream.Seek(0, TSeekOrigin.soBeginning);
end;



procedure TDataSnapTestData.ValidateDataSet(DataSet: TDataSet);
var
  Row: Integer;
begin
  Check(Assigned(DataSet));
  Row := 0;
  DataSet.First;
  while not DataSet.Eof do
  begin
    FDataGenerator.ValidateRow(DataSet, Row);
    DataSet.Next;
    inc(row);
  end;
  Check(Row = FRowCount);
end;

procedure TDataSnapTestData.ValidateInt32(Value: Int32);
begin
  Check(Value = Int32Value);
end;

procedure TDataSnapTestData.ValidateParams(Params: TParams);
begin
  FDataGenerator.ValidateParams(Params);
end;

procedure TDataSnapTestData.ValidateReader(Reader: TDBXReader);
var
  Row: Integer;
begin
  Check(Assigned(Reader));
  Row := 0;
  while Reader.Next do
  begin
    FDataGenerator.ValidateRow(Reader, Row);
    inc(Row);
  end;
end;

procedure TDataSnapTestData.ValidateStream(Stream: TStream);
var
  Index: Integer;
  Count: Integer;
  ByteValue: Byte;
begin
  Check(Assigned(Stream));
  Count := TestStreamSize - 1;
  for Index := 0 to Count do
  begin
    Check(Stream.Read(ByteValue, 1) = 1);
    Check(ByteValue = Byte(Index *3));
  end;
  Check(Stream.Read(ByteValue, 1) < 1);
end;

procedure TDataSnapTestData.ValidateString(Value: String);
begin
  Check(Value = StringValue);
end;

procedure TDataSnapTestData.ValidateVariant(Value: OleVariant);
var
  Index: Integer;
  Count: Integer;
  Bytes: TBytes;
begin
  Bytes := Value;
  Count := TestStreamSize;
  Check(Length(Bytes) = TestStreamSize);
  for Index := 0 to Count-1 do
  begin
    Check(Bytes[Index] = Byte(Index *3));
  end;
end;

end.

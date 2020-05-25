//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestServerModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.DBXCommon, DataSnapTestData, Datasnap.DBClient, System.WideStrings, Data.DBXMsSql,
  Data.SqlExpr, DBXInterbase;

type
/// SERVER SIDE CLASS.
/// For Delphi applications, a TDataModule would be a logical container for
/// server methods because most server methods will need access to components.
/// Howerver this example shows that there are only two requirements for a
/// server methods class:  1) The class must be a descendent of TPersistent,
/// and 2) MethodInfo must be enabled.
///
{$MethodInfo on}
  TSimpleServerModule = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    function EchoDataSet(DataSet: TDataSet): TDataSet;
    function EchoParams(Params: TParams): TParams;
    function EchoStream(Stream: TStream): TStream;
    function GetServerConnection: TDBXConnection;
  end;
{$MethodInfo off}

var
  SimpleServerModule: TSimpleServerModule;

implementation

{$R *.dfm}




constructor TSimpleServerModule.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TSimpleServerModule.Destroy;
begin
  inherited;
end;


function TSimpleServerModule.EchoDataSet(DataSet: TDataSet): TDataSet;
var
  TestData: TDataSnapTestData;
begin
  SQLConnection1.Open;
  TestData := TDataSnapTestData.Create(SQLConnection1.DBXConnection);
  try
    // Input parameter will be freed by the caller who created it.
    //
    DataSet.First;
    TestData.ValidateDataSet(DataSet);

    //Return same dataset
    Result := TestData.CreateTestDataSet;
  finally
    TestData.Free;
  end;
end;

function TSimpleServerModule.EchoParams(Params: TParams): TParams;
var
  TestData: TDataSnapTestData;
begin
  SQLConnection1.Open;
  TestData := TDataSnapTestData.Create(SQLConnection1.DBXConnection);
  try
    // Input parameter will be freed by the caller who created it.
    //
    TestData.ValidateParams(Params);

    //Return same dataset
    Result := TestData.CreateTestParams;
  finally
    TestData.Free;
  end;
end;


function TSimpleServerModule.EchoStream(Stream: TStream): TStream;
var
  TestData: TDataSnapTestData;
begin
  SQLConnection1.Open;
  TestData := TDataSnapTestData.Create(SQLConnection1.DBXConnection);
  try
    // Input parameter will be freed by the caller who created it.
    // Maintain a reference to the returned value because it is not possible
    // to specify that a return value should be freed.
    //
    TestData.ValidateStream(Stream);

    //Return same dataset
    Result := TestData.CreateTestStream;
  finally
    TestData.Free;
  end;
end;


function TSimpleServerModule.GetServerConnection: TDBXConnection;
begin
  // A client application can share this server side connection by setting
  // the client TDBXPropertyNames.ServerConnection connection property
  // to this string:
  //
  // ServerConnection=ServerMethodsDataModule.GetServerConnection
  //
  SQLConnection1.Open;
  Result := SQLConnection1.DBXConnection;
end;

end.

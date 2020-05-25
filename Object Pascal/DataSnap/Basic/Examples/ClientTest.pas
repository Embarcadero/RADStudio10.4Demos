//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientTest;
{ *********************************************************************** }
{                                                                         }
{ DataSnap ServerMethod example.                                          }
{                                                                         }
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
{                                                                         }
{ *********************************************************************** }
///
///  This unit provides examples of basic DataSnap 2008 usage for server methods.
///  The server and client included in this project.  Normally these would be in
///  separate projects and executed in separate processes.  In this example, the
///  client and server are combined into the same project and execute in
///  the same process to provide a concise single executable example of usage.
///  Units that would normally execute in a server process have "Server" in their
///  name. Units that would normall execute in a client process have "Client" in
///  their name.
///
///  This client is a collection of dunit tests.  These are not rigorous tests.
///  They are made simple to provide easy to read examples of how to use the
///  new DataSnap 2008 features.
///
interface

uses
  Data.DB,
  System.Classes,
  DataSnapTestData,
  TestFramework,
  DBXTest,
  Data.DBXCommon,
  Data.DBXCommonTable,
  Datasnap.DSPlatform,
  Data.DBXDBReaders,
  Datasnap.DSServer,
  Datasnap.DSCommonServer,
  Datasnap.DataBkr,
  Datasnap.DSTCPServerTransport,
  Data.FmtBcd,
  Data.SqlTimSt,
  System.SysUtils,
  Datasnap.DbClient,
  System.WideStrings,
  Data.SqlExpr,
  Datasnap.DSProxy,
  Datasnap.DSProxyDelphi,
  Datasnap.DSClientMetadata;


type


  /// CLIENT SIDE TEST
  ///
  TServerMethodTests = class(TDBXTestCase)
  private
    procedure SetConnectionParams(SQLConnection: TSQLConnection);
  published
    {$IFDEF CLR}[test]{$endif}
    procedure TestCreateClientProxies; virtual;
    {$IFDEF CLR}[test]{$endif}
    procedure TestEchoDataSet; virtual;
    {$IFDEF CLR}[test]{$endif}
    procedure TestEchoParams; virtual;
    {$IFDEF CLR}[test]{$endif}
    procedure TestEchoStream; virtual;
    {$IFDEF CLR}[test]{$endif}
    procedure TestServerConnection; virtual;
  end;



implementation

uses
  Data.DBXDataSnap,
  Data.DBXPlatform,
  Data.DBXTableFactory,
  Datasnap.DSCommonTable,
  Datasnap.DSNames
  , TestServerContainer, TestServerModule;



procedure TServerMethodTests.SetConnectionParams(SQLConnection: TSQLConnection);
var
  Params: TStrings;
begin
  Params := SQLConnection.Params;
  // Connect to DataSnap server using DataSnap driver.  This is in the
  // DBXClientDriver package that is also used for the Blackfish SQL
  // server.
  //
  SQLConnection.DriverName := 'Datasnap';
  Params.Add(TDBXPropertyNames.DriverName+'=DataSnap');
  Params.Add(TDBXPropertyNames.HostName+'=localhost');
  Params.Add(TDBXPropertyNames.Port+'=211');
  Params.Add(TDBXPropertyNames.UserName+'=sysdba');
  Params.Add(TDBXPropertyNames.Password+'=masterkey');
end;



procedure TServerMethodTests.TestEchoParams;
var
  SQLConnection: TSQLConnection;
  SQLServerMethod: TSqlServerMethod;
  TestData: TDataSnapTestData;
begin
  SQLServerMethod := nil;
  SQLConnection   := nil;
  try
    SQLConnection := TSQLConnection.Create(nil);
    SetConnectionParams(SQLConnection);
    SQLConnection.Open;

    TestData := TDataSnapTestData.Create(SimpleServerModule.SQLConnection1.DBXConnection);
    try
      SQLServerMethod := TSqlServerMethod.Create(nil);
      SQLServerMethod.SQLConnection := SQLConnection;
      // Omit the preceeding 'T' in the class name.
      //
      SQLServerMethod.CommandText := 'TSimpleServerModule.EchoParams';
      SQLServerMethod.Params[0].AsParams := TestData.CreateTestParams;
      // Internal call to prepare will automatically add parameters of the correct type.
      // Return value is always available as the last parameter.
      // By default DataType for a TParams return value is ftDataSet.
      // Force it to ftParams.
      //
      SQLServerMethod.Params[1].DataType := ftParams;
      SQLServerMethod.ExecuteMethod;

      // After execution, SQLServerMethod DataSet should have same contents as the
      // params we sent as an input parameter.
      //
  //    Check(TDataGenerator.ParamsEqual(SQLServerMethod.Params[1].AsParams, Params));

      // Return parameter is always sent as last parameter.
      //
      Check(SQLServerMethod.Params.Count = 2);
    finally
      TestData.Free;
    end;
  finally
    FreeAndNil(SQLServerMethod);
    FreeAndNil(SQLConnection);
  end;

end;


procedure TServerMethodTests.TestEchoStream;
var
  SQLConnection: TSQLConnection;
  SQLServerMethod: TSqlServerMethod;
  TestData: TDataSnapTestData;
begin
  SQLServerMethod := nil;
  SQLConnection   := nil;
  try
    SQLConnection := TSQLConnection.Create(nil);
    SetConnectionParams(SQLConnection);
    SQLConnection.Open;

    TestData := TDataSnapTestData.Create(SimpleServerModule.SQLConnection1.DBXConnection);
    try
      SQLServerMethod := TSqlServerMethod.Create(nil);
      SQLServerMethod.SQLConnection := SQLConnection;
      // Omit the preceeding 'T' in the class name.
      //
      SQLServerMethod.CommandText := 'TSimpleServerModule.EchoStream';
      SQLServerMethod.Params[0].AsStream := TestData.CreateTestStream;

      // Internal call to prepare will automatically add parameters of the correct type.
      // Return value is always available as the last parameter.
      //
      SQLServerMethod.ExecuteMethod;

      // After execution, SQLServerMethod Stream should have same contents as the
      // Stream we sent as an input parameter.
      //
      TestData.ValidateStream(SQLServerMethod.Params[1].AsStream);

      // Return parameter is always sent as last parameter.
      //
      Check(SQLServerMethod.Params.Count = 2);
    finally
      TestData.Free;
    end;
  finally
    FreeAndNil(SQLServerMethod);
    FreeAndNil(SQLConnection);
  end;
end;



procedure TServerMethodTests.TestCreateClientProxies;
begin
  // Normally this would be performed by invoking the DSProxyGen.exe utility.
  //
  DSServerContainer.DSProxyGenerator1.TargetUnitName := 'ClientTestClasses.pas';
  DSServerContainer.DSProxyGenerator1.Write;
end;

procedure TServerMethodTests.TestEchoDataSet;
var
  SQLConnection: TSQLConnection;
  SQLServerMethod: TSqlServerMethod;
  TestData: TDataSnapTestData;
begin
  SQLServerMethod := nil;
  SQLConnection   := nil;
  try
    SQLConnection := TSQLConnection.Create(nil);
    SetConnectionParams(SQLConnection);
    SQLConnection.Open;

    TestData := TDataSnapTestData.Create(SimpleServerModule.SQLConnection1.DBXConnection);
    try
      SQLServerMethod := TSqlServerMethod.Create(nil);
      SQLServerMethod.SQLConnection := SQLConnection;
      // Omit the preceeding 'T' in the class name.
      //
      SQLServerMethod.CommandText := 'TSimpleServerModule.EchoDataSet';
      SQLServerMethod.Params[0].AsDataSet := TestData.CreateTestDataSet;

      // Internal call to prepare will automatically add parameters of the correct
      // type.  Return value is always available as the last parameter.
      //
      SQLServerMethod.Open;

      // After execution, SQLServerMethod DataSet should have same contents as the
      // DataSet we sent as an input parameter.
      //
  //    Check(TDataGenerator.DataSetEqual(SQLServerMethod, DataSet));

      // Return parameter is always sent as last parameter.
      //
      Check(SQLServerMethod.Params.Count = 2);
      // TSQLServerMethod populates itself with the result.
      //
      Check(SQLServerMethod.Params[1].AsDataSet = SQLServerMethod);
      TestData.ValidateDataSet(SQLServerMethod.Params[1].AsDataSet);
    finally
      TestData.Free;
    end;
  finally
    FreeAndNil(SQLServerMethod);
    FreeAndNil(SQLConnection);
  end;
end;

procedure TServerMethodTests.TestServerConnection;
var
  SQLConnection: TSQLConnection;
  SQLQuery: TSqlQuery;
begin
  SQLQuery      := nil;
  SQLConnection := nil;
  try
    SQLConnection := TSQLConnection.Create(nil);
    SetConnectionParams(SQLConnection);
    SQLConnection.Params.Add(
      TDBXPropertyNames.ServerConnection+'=TSimpleServerModule.GetServerConnection');
    SQLConnection.Open;

    SQLQuery := TSqlQuery.Create(nil);
    SQLQuery.SQLConnection := SQLConnection;
    SQLQuery.CommandText := 'select * from employee';
    SQLQuery.Open;

  finally
    FreeAndNil(SQLQuery);
    FreeAndNil(SQLConnection);
  end;
end;



initialization
  RegisterTest(TServerMethodTests.Suite);
end.

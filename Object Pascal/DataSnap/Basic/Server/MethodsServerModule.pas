//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MethodsServerModule;

interface

uses
  SysUtils, Classes, DBXCommon, Db, WideStrings, FMTBcd, SqlExpr, DBXDBReaders, DSServer,
  DBXClient, DBXInterbase, Datasnap.dsproviderDataModuleAdapter;

type
{$MethodInfo ON}
  TServerModule1 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FParams: TParams;
  public
    function Hello(IncomingMessage: String): String;
    function ParamsReader: TDBXReader;
    function GetEmployee(ID: String): TDataSet;
    function VariantMethod(Value: OleVariant): OleVariant;
    function GetConnection: TDBXConnection;
    procedure EmptyMethod;
  end;
{$MethodInfo OFF}

var
  ServerModule1: TServerModule1;

implementation

{$R *.dfm}

function TServerModule1.Hello(IncomingMessage: String): String;
begin
  Result := 'You say:  '+IncomingMessage+'.  I say Goodbye';
end;

function TServerModule1.ParamsReader: TDBXReader;
begin
  FParams[0].Value := 1;
  FParams[1].Value := 'Frank';
  FParams[2].Value := 'Embarcadero';
  // The returned TDBXParamsReader will be freed, but not the Params itself.
  // because the second parameter to the constructor is False.
  //
  Result := TDBXParamsReader.Create(FParams, False);
end;

function TServerModule1.VariantMethod(Value: OleVariant): OleVariant;
begin
  Result := Value;
end;

function TServerModule1.GetEmployee(ID: String): TDataSet;
begin
  SQLDataSet1.Close;
  SQLDataSet1.Params[0].Value := StrToInt(ID);
  SQLDataSet1.Open;
  // Returned instance will not be freed because the component's owner
  // is non-nil.
  //
  Result := SQLDataSet1;
end;

procedure TServerModule1.DSServerModuleCreate(Sender: TObject);
var
  Param: TParam;
begin
    FParams := TParams.Create(nil);

    Param := TParam.Create(FParams);
    Param.DataType := ftInteger;
    Param.Precision := 9;
    Param.Name := 'CustId';
    Param.ParamType := ptInput;
    FParams.AddParam(Param);

    Param := TParam.Create(FParams);
    Param.DataType := ftString;
    Param.Precision := 20;
    Param.Name := 'FirstName';
    Param.ParamType := ptInput;
    FParams.AddParam(Param);

    Param := TParam.Create(FParams);
    Param.DataType := ftString;
    Param.Precision := 20;
    Param.Name := 'LastName';
    Param.ParamType := ptInput;
    FParams.AddParam(Param);
end;

procedure TServerModule1.DSServerModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FParams);
end;

procedure TServerModule1.EmptyMethod;
begin

end;

function TServerModule1.GetConnection: TDBXConnection;
begin
  SQLConnection1.Open;
  Result := SQLConnection1.DBXConnection;
end;

end.

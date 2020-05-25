//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ProviderServerModule;

interface

uses
  SysUtils, Classes, DSServer, WideStrings, FMTBcd, DB,
  SqlExpr, Provider, Datasnap.dsproviderDataModuleAdapter, DBXInterbase;

type
  TDSServerModule2 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    DataSnapTestData: TDataSetProvider;
    DataSnapTestDataQuery: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DSServerModule2: TDSServerModule2;

implementation

{$R *.dfm}

end.

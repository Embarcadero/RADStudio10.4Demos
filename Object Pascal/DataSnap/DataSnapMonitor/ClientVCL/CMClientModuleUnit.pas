//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit CMClientModuleUnit;

interface

uses
  SysUtils, Classes, CMClientClassesUnit, DbxDataSnap, DBXCommon, DB, SqlExpr;

type
  TCMClientModule = class(TDataModule)
    CMCSQLConnection: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FServerConnMonitorMethodsClient: TServerConnMonitorMethodsClient;
    function GetServerConnMonitorMethodsClient: TServerConnMonitorMethodsClient;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseCMClient;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerConnMonitorMethodsClient: TServerConnMonitorMethodsClient
                                              read GetServerConnMonitorMethodsClient
                                              write FServerConnMonitorMethodsClient;

  end;

var
  CMClientModule: TCMClientModule;

implementation

{$R *.dfm}


procedure TCMClientModule.CloseCMClient;
begin
  FreeAndNil(FServerConnMonitorMethodsClient);
  CMCSQLConnection.Close;
end;

constructor TCMClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TCMClientModule.Destroy;
begin
  FServerConnMonitorMethodsClient.Free;
  inherited;
end;

function TCMClientModule.GetServerConnMonitorMethodsClient: TServerConnMonitorMethodsClient;
begin
  if FServerConnMonitorMethodsClient = nil then
  begin
    CMCSQLConnection.Open;
    FServerConnMonitorMethodsClient :=
        TServerConnMonitorMethodsClient.Create(CMCSQLConnection.DBXConnection, FInstanceOwner);
  end;
  Result := FServerConnMonitorMethodsClient;
end;

end.

//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit EchoToChannelServerContainerUnit3;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer, DSAuth, IPPeerServer, IndyPeerImpl;

type
  TServerContainer3 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSHTTPService1: TDSHTTPService;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1CreateInstance(
      DSCreateInstanceEventObject: TDSCreateInstanceEventObject);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer3: TServerContainer3;

implementation

uses Windows, EchoToChannelServerMethodsUnit1;

{$R *.dfm}

procedure TServerContainer3.DataModuleDestroy(Sender: TObject);
begin
  DSServer1.Stop;  // Work around possible hang when
  // clients remain running.
end;

procedure TServerContainer3.DSServerClass1CreateInstance(
  DSCreateInstanceEventObject: TDSCreateInstanceEventObject);
begin
  DSCreateInstanceEventObject.ServerClassInstance :=
    TServerMethods1.Create(DSServer1);
end;

procedure TServerContainer3.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerMethods1;
end;

end.


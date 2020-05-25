//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestServerContainer;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSCommonServer, Datasnap.DSServer, Datasnap.DSTransport, Datasnap.DSTCPServerTransport,
  TestServerModule, Datasnap.DSProxyDelphi, Datasnap.DSClientMetadata, IPPeerServer, IndyPeerImpl,
  Datasnap.DSMetadata, Datasnap.DSServerMetadata, Datasnap.DSProxyDelphiNative;

type
  TDSServerContainer = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  DSServerContainer: TDSServerContainer;

implementation

{$R *.dfm}


destructor TDSServerContainer.Destroy;
begin
  DSServer1.Stop;
  inherited;
end;

procedure TDSServerContainer.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TSimpleServerModule;
end;

end.

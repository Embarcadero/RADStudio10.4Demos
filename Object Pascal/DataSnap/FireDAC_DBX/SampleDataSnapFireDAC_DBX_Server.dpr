//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SampleDataSnapFireDAC_DBX_Server;

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Server.FD_DBX_Unit in 'Server.FD_DBX_Unit.pas' {ServerForm},
  ServerMethods.FD_DBX_Unit in 'ServerMethods.FD_DBX_Unit.pas' {ServerMethods: TDSServerModule},
  ServerContainer_FD_DBX_Unit in 'ServerContainer_FD_DBX_Unit.pas' {ServerContainer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.Run;
end.


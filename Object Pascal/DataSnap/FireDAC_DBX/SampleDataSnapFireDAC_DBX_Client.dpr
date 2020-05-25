//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SampleDataSnapFireDAC_DBX_Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  Client.FD_DBX_Unit in 'Client.FD_DBX_Unit.pas' {ClientForm},
  ClientModule.FD_DBX_Unit in 'ClientModule.FD_DBX_Unit.pas' {DataModuleFDClient: TDataModule},
  Client.ServerMethods.FD_DBX_Unit in 'Client.ServerMethods.FD_DBX_Unit.pas',
  Client.ServerMethodsREST.FD_DBX_Unit in 'Client.ServerMethodsREST.FD_DBX_Unit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TDataModuleFDClient, DataModuleFDClient);
  Application.Run;
end.

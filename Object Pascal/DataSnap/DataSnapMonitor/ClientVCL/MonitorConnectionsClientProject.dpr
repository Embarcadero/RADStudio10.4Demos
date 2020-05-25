//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program MonitorConnectionsClientProject;

uses
  Forms,
  IPPeerClient,
  MonitorClientUI in 'MonitorClientUI.pas' {ClientUIForm},
  CMClientClassesUnit in 'CMClientClassesUnit.pas',
  CMClientModuleUnit in 'CMClientModuleUnit.pas' {CMClientModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientUIForm, ClientUIForm);
  Application.CreateForm(TCMClientModule, CMClientModule);
  Application.Run;
end.

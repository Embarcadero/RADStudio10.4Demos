//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program MonitorConnectionsServerProject;

uses
  Forms,
  MonitorServerUI in 'MonitorServerUI.pas' {CMServerForm},
  MonitorServerMethods in 'MonitorServerMethods.pas',
  MonitorServerContainer in 'MonitorServerContainer.pas' {CMServerContainer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCMServerForm, CMServerForm);
  Application.CreateForm(TCMServerContainer, CMServerContainer);
  Application.Run;
end.

